import { RequestHandler } from "express";
import { Departamento } from "../models/departamento";
import { Division } from "../models/division";
import excelJS from 'exceljs';

export const crearDepartamento: RequestHandler = async (req, res) => {
    const division = await Division.findByPk(req.body.idDivisiones);
    if (!division) {
        return res.status(404).json({ message: "Esa división no existe" });
    }

    try {
        const departamento = await Departamento.create({
            nombre: req.body.nombre,
            Divisiones_idDivisiones: division.idDivisiones
        });
        return res.status(200).json({ message: "Departamento creado exitosamente", data: departamento });
    } catch (error) {
        return res.status(500).json({ message: "Error al crear el departamento", error: error.message });
    }
};

export const actualizarDepartamento: RequestHandler = async (req, res) => {
    const { id } = req.params;
    const departamento = await Departamento.findByPk(id);
    if (!departamento) {
        return res.status(404).json({ message: "Departamento no encontrado" });
    }

    try {
        await Departamento.update({
            nombre: req.body.nombre,
            Divisiones_idDivisiones: req.body.idDivisiones
        }, { where: { idDepartamentos: id } });
        return res.status(200).json({ message: "Departamento actualizado" });
    } catch (error) {
        return res.status(500).json({ message: "Error al actualizar el departamento", error: error.message });
    }
};

export const listarDepartamentos: RequestHandler = async (req, res) => {
    try {
        const departamentos = await Departamento.findAll();
        return res.status(200).json(departamentos);
    } catch (error) {
        return res.status(500).json({ message: "Error al obtener los departamentos", error: error.message });
    }
};

export const eliminarDepartamento: RequestHandler = async (req, res) => {
    const { id } = req.params;
    const departamento = await Departamento.findByPk(id);
    if (!departamento) {
        return res.status(404).json({ message: "El departamento no existe" });
    }

    try {
        await Departamento.destroy({ where: { idDepartamentos: id } });
        return res.status(200).json({ message: "Departamento eliminado" });
    } catch (error) {
        return res.status(500).json({ message: "Error al eliminar el departamento", error: error.message });
    }
};

export const exportarDepartamentos: RequestHandler = async (req, res) => {
    try {
        const departamentos = await Departamento.findAll();
        const workbook = new excelJS.Workbook();
        const workSheet = workbook.addWorksheet("Departamentos");

        workSheet.columns = [
            { header: "ID", key: "idDepartamentos" },
            { header: "Nombre", key: "nombre" },
            { header: "ID de la División", key: "Divisiones_idDivisiones" }
        ];

        departamentos.forEach(departamento => {
            workSheet.addRow(departamento.toJSON());
        });

        res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.setHeader('Content-Disposition', 'attachment; filename=departamentos.xlsx');
        return workbook.xlsx.write(res).then(() => {
            res.status(200).end();
        });
    } catch (error) {
        return res.status(500).json({ message: "Error al exportar los departamentos", error: error.message });
    }
};
