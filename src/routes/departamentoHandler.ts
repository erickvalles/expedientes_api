import express from "express";
import { crearDepartamento, actualizarDepartamento, listarDepartamentos, eliminarDepartamento, exportarDepartamentos } from "../controllers/departamentosController";

const router = express.Router();

router.post("/departamentos", crearDepartamento);
router.put("/departamentos/:id", actualizarDepartamento);
router.get("/departamentos", listarDepartamentos);
router.delete("/departamentos/:id", eliminarDepartamento);
router.get("/departamentos/exportar", exportarDepartamentos);

export default router;
