-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 02-05-2024 a las 18:02:36
-- Versión del servidor: 8.0.19
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ExpedientesProfesores`
--
CREATE DATABASE IF NOT EXISTS `ExpedientesProfesores` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ExpedientesProfesores`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CentrosInvestigacion`
--

CREATE TABLE `CentrosInvestigacion` (
  `idCentrosInvestigacion` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CentrosInvestigacion`
--

INSERT INTO `CentrosInvestigacion` (`idCentrosInvestigacion`, `Departamento_idDepartamento`, `nombre`) VALUES
(1, 2, 'Nuevo centro de investigación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CuerposAcademicos`
--

CREATE TABLE `CuerposAcademicos` (
  `idCuerposAcademicos` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento`
--

CREATE TABLE `Departamento` (
  `idDepartamento` int NOT NULL,
  `Divisiones_idDivisiones` int NOT NULL,
  `nombre` varchar(245) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Departamento`
--

INSERT INTO `Departamento` (`idDepartamento`, `Divisiones_idDivisiones`, `nombre`) VALUES
(2, 1, 'Departamento de Ciencias Computacionales e Ingenierías'),
(3, 1, 'Departamento de Ciencias Naturales y Exactas'),
(4, 3, 'Departamento de prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Distinciones`
--

CREATE TABLE `Distinciones` (
  `idDistinciones` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fechaObtencion` date DEFAULT NULL,
  `Profesores_idProfesores` int NOT NULL,
  `Instituciones_idInstituciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Divisiones`
--

CREATE TABLE `Divisiones` (
  `idDivisiones` int NOT NULL,
  `nombre` varchar(245) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Divisiones`
--

INSERT INTO `Divisiones` (`idDivisiones`, `nombre`) VALUES
(1, 'División de Estudios Científicos y Tecnológicos'),
(2, 'División actualizada'),
(3, 'Otra división 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GradosAcademicos`
--

CREATE TABLE `GradosAcademicos` (
  `idGradosAcademicos` int NOT NULL,
  `Profesores_idProfesores` int NOT NULL,
  `Instituciones_idInstituciones` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `expertiz` varchar(45) DEFAULT NULL,
  `fechaObtencion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Instituciones`
--

CREATE TABLE `Instituciones` (
  `idInstituciones` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores`
--

CREATE TABLE `Profesores` (
  `idProfesores` int NOT NULL,
  `TipoContrato_idTipoContrato` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Profesores`
--

INSERT INTO `Profesores` (`idProfesores`, `TipoContrato_idTipoContrato`, `Departamento_idDepartamento`, `nombre`, `apellidos`, `rfc`, `fechaNacimiento`, `correo`, `telefono`, `fechaIngreso`, `cedula`) VALUES
(1, 2, 2, 'Erick', 'Guerrero', 'lñasdklñasdkl', '2024-04-01', 'erickg@valles.udg.mx', '3333333333', '2024-04-15', 'dasdsasdsdadsasad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores_has_CentrosInvestigacion`
--

CREATE TABLE `Profesores_has_CentrosInvestigacion` (
  `Profesores_idProfesores` int NOT NULL,
  `CentrosInvestigacion_idCentrosInvestigacion` int NOT NULL,
  `fechaIngreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Profesores_has_CentrosInvestigacion`
--

INSERT INTO `Profesores_has_CentrosInvestigacion` (`Profesores_idProfesores`, `CentrosInvestigacion_idCentrosInvestigacion`, `fechaIngreso`) VALUES
(1, 1, '2024-04-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores_has_CuerposAcademicos`
--

CREATE TABLE `Profesores_has_CuerposAcademicos` (
  `Profesores_idProfesores` int NOT NULL,
  `CuerposAcademicos_idCuerposAcademicos` int NOT NULL,
  `fechaIngreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoContrato`
--

CREATE TABLE `TipoContrato` (
  `idTipoContrato` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TipoContrato`
--

INSERT INTO `TipoContrato` (`idTipoContrato`, `nombre`) VALUES
(1, 'Tiempo completo'),
(2, 'Contratación por horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `idUsuarios` int NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `password` varchar(245) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`idUsuarios`, `correo`, `password`, `nombre`) VALUES
(1, 'admin@valles.udg.mx', '$2b$10$lKsnzrqTtgQeg3jNgWdAzepudOpIehBXrbk8aACN.L6x67hm6wRdy', 'Admin'),
(3, 'altoera@valles.udg.mx', '$2b$10$EeVCCkD0.5Frqa2.UqiaGeueCCYzmLe6LE6Qzf35G97DzaeTEmIPa', 'Eréndira');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CentrosInvestigacion`
--
ALTER TABLE `CentrosInvestigacion`
  ADD PRIMARY KEY (`idCentrosInvestigacion`,`Departamento_idDepartamento`),
  ADD KEY `fk_CentrosInvestigacion_Departamento1_idx` (`Departamento_idDepartamento`);

--
-- Indices de la tabla `CuerposAcademicos`
--
ALTER TABLE `CuerposAcademicos`
  ADD PRIMARY KEY (`idCuerposAcademicos`,`Departamento_idDepartamento`),
  ADD KEY `fk_CuerposAcademicos_Departamento1_idx` (`Departamento_idDepartamento`);

--
-- Indices de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD PRIMARY KEY (`idDepartamento`,`Divisiones_idDivisiones`),
  ADD KEY `fk_Departamento_Divisiones1_idx` (`Divisiones_idDivisiones`);

--
-- Indices de la tabla `Distinciones`
--
ALTER TABLE `Distinciones`
  ADD PRIMARY KEY (`idDistinciones`,`Profesores_idProfesores`,`Instituciones_idInstituciones`),
  ADD KEY `fk_Distinciones_Profesores1_idx` (`Profesores_idProfesores`),
  ADD KEY `fk_Distinciones_Instituciones1_idx` (`Instituciones_idInstituciones`);

--
-- Indices de la tabla `Divisiones`
--
ALTER TABLE `Divisiones`
  ADD PRIMARY KEY (`idDivisiones`);

--
-- Indices de la tabla `GradosAcademicos`
--
ALTER TABLE `GradosAcademicos`
  ADD PRIMARY KEY (`idGradosAcademicos`,`Profesores_idProfesores`,`Instituciones_idInstituciones`),
  ADD KEY `fk_GradosAcademicos_Profesores1_idx` (`Profesores_idProfesores`),
  ADD KEY `fk_GradosAcademicos_Instituciones1_idx` (`Instituciones_idInstituciones`);

--
-- Indices de la tabla `Instituciones`
--
ALTER TABLE `Instituciones`
  ADD PRIMARY KEY (`idInstituciones`);

--
-- Indices de la tabla `Profesores`
--
ALTER TABLE `Profesores`
  ADD PRIMARY KEY (`idProfesores`,`TipoContrato_idTipoContrato`,`Departamento_idDepartamento`),
  ADD KEY `fk_Profesores_TipoContrato1_idx` (`TipoContrato_idTipoContrato`),
  ADD KEY `fk_Profesores_Departamento1_idx` (`Departamento_idDepartamento`);

--
-- Indices de la tabla `Profesores_has_CentrosInvestigacion`
--
ALTER TABLE `Profesores_has_CentrosInvestigacion`
  ADD PRIMARY KEY (`Profesores_idProfesores`,`CentrosInvestigacion_idCentrosInvestigacion`),
  ADD KEY `fk_Profesores_has_CentrosInvestigacion_CentrosInvestigacion_idx` (`CentrosInvestigacion_idCentrosInvestigacion`),
  ADD KEY `fk_Profesores_has_CentrosInvestigacion_Profesores1_idx` (`Profesores_idProfesores`);

--
-- Indices de la tabla `Profesores_has_CuerposAcademicos`
--
ALTER TABLE `Profesores_has_CuerposAcademicos`
  ADD PRIMARY KEY (`Profesores_idProfesores`,`CuerposAcademicos_idCuerposAcademicos`),
  ADD KEY `fk_Profesores_has_CuerposAcademicos_CuerposAcademicos1_idx` (`CuerposAcademicos_idCuerposAcademicos`),
  ADD KEY `fk_Profesores_has_CuerposAcademicos_Profesores1_idx` (`Profesores_idProfesores`);

--
-- Indices de la tabla `TipoContrato`
--
ALTER TABLE `TipoContrato`
  ADD PRIMARY KEY (`idTipoContrato`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CentrosInvestigacion`
--
ALTER TABLE `CentrosInvestigacion`
  MODIFY `idCentrosInvestigacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `CuerposAcademicos`
--
ALTER TABLE `CuerposAcademicos`
  MODIFY `idCuerposAcademicos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  MODIFY `idDepartamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Distinciones`
--
ALTER TABLE `Distinciones`
  MODIFY `idDistinciones` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Divisiones`
--
ALTER TABLE `Divisiones`
  MODIFY `idDivisiones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `GradosAcademicos`
--
ALTER TABLE `GradosAcademicos`
  MODIFY `idGradosAcademicos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Instituciones`
--
ALTER TABLE `Instituciones`
  MODIFY `idInstituciones` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Profesores`
--
ALTER TABLE `Profesores`
  MODIFY `idProfesores` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `TipoContrato`
--
ALTER TABLE `TipoContrato`
  MODIFY `idTipoContrato` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `idUsuarios` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CentrosInvestigacion`
--
ALTER TABLE `CentrosInvestigacion`
  ADD CONSTRAINT `fk_CentrosInvestigacion_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `Departamento` (`idDepartamento`);

--
-- Filtros para la tabla `CuerposAcademicos`
--
ALTER TABLE `CuerposAcademicos`
  ADD CONSTRAINT `fk_CuerposAcademicos_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `Departamento` (`idDepartamento`);

--
-- Filtros para la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD CONSTRAINT `fk_Departamento_Divisiones1` FOREIGN KEY (`Divisiones_idDivisiones`) REFERENCES `Divisiones` (`idDivisiones`);

--
-- Filtros para la tabla `Distinciones`
--
ALTER TABLE `Distinciones`
  ADD CONSTRAINT `fk_Distinciones_Instituciones1` FOREIGN KEY (`Instituciones_idInstituciones`) REFERENCES `Instituciones` (`idInstituciones`),
  ADD CONSTRAINT `fk_Distinciones_Profesores1` FOREIGN KEY (`Profesores_idProfesores`) REFERENCES `Profesores` (`idProfesores`);

--
-- Filtros para la tabla `GradosAcademicos`
--
ALTER TABLE `GradosAcademicos`
  ADD CONSTRAINT `fk_GradosAcademicos_Instituciones1` FOREIGN KEY (`Instituciones_idInstituciones`) REFERENCES `Instituciones` (`idInstituciones`),
  ADD CONSTRAINT `fk_GradosAcademicos_Profesores1` FOREIGN KEY (`Profesores_idProfesores`) REFERENCES `Profesores` (`idProfesores`);

--
-- Filtros para la tabla `Profesores`
--
ALTER TABLE `Profesores`
  ADD CONSTRAINT `fk_Profesores_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `Departamento` (`idDepartamento`),
  ADD CONSTRAINT `fk_Profesores_TipoContrato1` FOREIGN KEY (`TipoContrato_idTipoContrato`) REFERENCES `TipoContrato` (`idTipoContrato`);

--
-- Filtros para la tabla `Profesores_has_CentrosInvestigacion`
--
ALTER TABLE `Profesores_has_CentrosInvestigacion`
  ADD CONSTRAINT `fk_Profesores_has_CentrosInvestigacion_CentrosInvestigacion1` FOREIGN KEY (`CentrosInvestigacion_idCentrosInvestigacion`) REFERENCES `CentrosInvestigacion` (`idCentrosInvestigacion`),
  ADD CONSTRAINT `fk_Profesores_has_CentrosInvestigacion_Profesores1` FOREIGN KEY (`Profesores_idProfesores`) REFERENCES `Profesores` (`idProfesores`);

--
-- Filtros para la tabla `Profesores_has_CuerposAcademicos`
--
ALTER TABLE `Profesores_has_CuerposAcademicos`
  ADD CONSTRAINT `fk_Profesores_has_CuerposAcademicos_CuerposAcademicos1` FOREIGN KEY (`CuerposAcademicos_idCuerposAcademicos`) REFERENCES `CuerposAcademicos` (`idCuerposAcademicos`),
  ADD CONSTRAINT `fk_Profesores_has_CuerposAcademicos_Profesores1` FOREIGN KEY (`Profesores_idProfesores`) REFERENCES `Profesores` (`idProfesores`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
