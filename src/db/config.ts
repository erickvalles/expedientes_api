import { Sequelize } from "sequelize-typescript";
import { Division } from "../models/division";
import { Departamento } from "../models/departamento";
import dotenv from "dotenv";
import { CentroInvestigacion } from "../models/centro_investigacion";
import { Profesor } from "../models/profesor";
import { ProfeCentroInvestigacion } from "../models/profe_centro_inv";
import { Usuario} from "../models/usuario";
dotenv.config();

const user = process.env.DB_USER;
const pass = process.env.DB_PASS;
const db = process.env.DB_NAME;
const host = process.env.DB_HOST;

const connection = new Sequelize({
    dialect: "mysql",
    host: host,
    username: user,
    password: pass,
    database: db,
    logging: false,
    port: 3306,
    models: [Division,Departamento,Profesor,CentroInvestigacion,ProfeCentroInvestigacion,Usuario]
});

export default connection;
