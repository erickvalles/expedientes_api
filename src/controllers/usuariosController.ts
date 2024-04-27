import { RequestHandler } from "express";
import { Usuario } from "../models/usuario";
import bcrypt from 'bcrypt';

export const crearUsuario:RequestHandler = async (req,res)=>{
    const usuario = await Usuario.findOne({where:{correo:req.body.correo}});

    if(usuario){
        return res.status(400).json({message:"El correo ya está en uso"});
    }

    await Usuario.create({
        correo: req.body.correo,
        nombre: req.body.nombre,
        password: await bcrypt.hash(req.body.password,10)
    }).then((usuario)=>{
        return res.status(200).json(usuario);
    }).catch((error)=>{
        return res.status(500).json({message:"Error al crear el usuario",error:error});
    });

};


export const actualizarUsuario:RequestHandler = async (req,res)=>{
    const {id} = req.params;
    const usuario  = await Usuario.findByPk(id);
    if(!usuario){
        return res.status(404).json({message:"Usuario no encontrado"});
    }
    await Usuario.update({
        nombre: req.body.nombre,
        correo: req.body.correo,
        password: await bcrypt.hash(req.body.password,10) 
    },{where:{idUsuarios:id}}).then(()=>{
        return res.status(200).json({message:"Usuario actualizado"});
    }).catch((error)=>{
        return res.status(500).json({message:"Error al actualizar el usuario",error:error.message});
    });

};

export const listarUsuarios:RequestHandler = async (req,res)=>{
    await Usuario.findAll({attributes:{exclude:["password"]}}).then((usuarios)=>{
        return res.status(200).json(usuarios);
    }).catch((error)=>{
        return res.status(500).json({message:"Error al obtener los usuarios",error:error.message});
    });
}