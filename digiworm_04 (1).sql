-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-03-2024 a las 19:47:27
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `digiworm_04`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `MoverCitasRealizadas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MoverCitasRealizadas` ()   BEGIN
    -- Declara variables para la fecha y hora actual
    DECLARE fecha_actual DATE;
    DECLARE hora_actual TIME;
    SET fecha_actual = CURDATE();
    SET hora_actual = CURTIME();

    -- Mueve los registros de citas a citas_realizadas si la fecha y hora de la cita son anteriores a la fecha y hora actual
    INSERT INTO citas_realizadas (nombre, email, fecha, hora)
    SELECT nombre, email, fecha, hora
    FROM citas
    WHERE fecha < fecha_actual OR (fecha = fecha_actual AND hora < hora_actual);

    -- Elimina los registros de citas que se han movido a citas_realizadas
    DELETE FROM citas
    WHERE fecha < fecha_actual OR (fecha = fecha_actual AND hora < hora_actual);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

DROP TABLE IF EXISTS `actividades`;
CREATE TABLE IF NOT EXISTS `actividades` (
  `idActividades` int NOT NULL AUTO_INCREMENT,
  `Nombre_act` varchar(60) DEFAULT NULL,
  `Asignatura` varchar(100) NOT NULL,
  `Docente` int DEFAULT NULL,
  `Archivo` varchar(45) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idActividades`),
  KEY `Docente_nom_docente` (`Docente`),
  KEY `Asignaturas_Materias` (`Asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`idActividades`, `Nombre_act`, `Asignatura`, `Docente`, `Archivo`, `Estado`) VALUES
(8, 'quimica basica', 'Calculo', 1054115102, NULL, 'Activo'),
(9, 'quimica basica', 'Calculo', 1054115102, NULL, 'Activo'),
(24, 'biomedica', 'Calculo', 142223657, 'mapa mental johan (2) (1).pdf', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

DROP TABLE IF EXISTS `citas`;
CREATE TABLE IF NOT EXISTS `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `nombre`, `email`, `fecha`, `hora`, `creado_en`) VALUES
(9, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-08', '12:28:00', '2024-02-29 17:28:44'),
(10, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-08', '12:28:00', '2024-02-29 17:34:47'),
(11, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-08', '12:28:00', '2024-02-29 17:35:30'),
(12, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-08', '12:28:00', '2024-02-29 17:35:38'),
(13, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-08', '12:28:00', '2024-02-29 17:42:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_realizadas`
--

DROP TABLE IF EXISTS `citas_realizadas`;
CREATE TABLE IF NOT EXISTS `citas_realizadas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `citas_realizadas`
--

INSERT INTO `citas_realizadas` (`id`, `nombre`, `email`, `fecha`, `hora`, `creado_en`) VALUES
(1, '', '', '0000-00-00', '00:00:00', '2024-02-29 19:09:18'),
(2, 'magdy velasco', 'villabilons@gmail.com', '2024-02-29', '13:00:00', '2024-02-29 19:09:18'),
(3, 'johan oliveros', 'oliverossilvajohan@gmail.com', '2024-02-29', '14:22:00', '2024-02-29 19:24:18'),
(4, 'Johan Santiago Villanueva', 'andreina301094@hotmail.com', '2024-03-01', '11:28:00', '2024-03-05 18:59:18'),
(5, 'Johan Santiago Villanueva', 'andreina301094@hotmail.com', '2024-03-01', '11:28:00', '2024-03-05 18:59:18'),
(6, 'Johan Santiago Villanueva', 'andreina301094@hotmail.com', '2024-03-01', '11:32:00', '2024-03-05 18:59:18'),
(7, 'Johan Santiago Villanueva', 'andreina301094@hotmail.com', '2024-03-01', '11:32:00', '2024-03-05 18:59:18'),
(8, 'Johan Santiago Villanueva', 'andreina301094@hotmail.com', '2024-03-01', '12:15:00', '2024-03-05 18:59:18'),
(9, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-02', '13:30:00', '2024-03-05 18:59:18'),
(10, 'Johan Santiago Villanueva', 'villabilons@gmail.com', '2024-03-02', '13:30:00', '2024-03-05 18:59:18'),
(11, 'magdy velasco', 'mvelazcovelasco17@gmail.com', '2024-02-29', '15:00:00', '2024-03-05 18:59:18'),
(12, 'magdy velasco', 'villabilons@gmail.com', '2024-02-29', '15:00:00', '2024-03-05 18:59:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinador`
--

DROP TABLE IF EXISTS `coordinador`;
CREATE TABLE IF NOT EXISTS `coordinador` (
  `idCoordinador` int NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Pasword` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Jornada` enum('Mañana','Tarde') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idCoordinador`),
  KEY `NombreCoordinador_Nombres` (`Nombres`),
  KEY `ApellidoCoordinador_Apellido` (`Apellidos`),
  KEY `EmailCoordinador_Email` (`Email`),
  KEY `Password` (`Pasword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `coordinador`
--

INSERT INTO `coordinador` (`idCoordinador`, `Nombres`, `Apellidos`, `Email`, `Pasword`, `Jornada`) VALUES
(10000, 'Jimmy', 'Avila', 'Jimmy2020@gmail.com', '5a1dfc0934d7a2fe6b9d1c41e2913dca', 'Mañana'),
(1563298, 'leydi ', 'Roa', 'Coordinadora@gmail.com', '7b9c0a9b357cd7c707742562f82add2c', 'Mañana'),
(1023537206, 'Jeison', 'Villanueva', 'jei555555@gmail.com', '7c4c5a96ac34d000f49e9ecefad47722', 'Tarde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `idCurso` int NOT NULL AUTO_INCREMENT,
  `Nombre_curso` varchar(45) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idCurso`, `Nombre_curso`, `Estado`) VALUES
(1, '1103', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

DROP TABLE IF EXISTS `docente`;
CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` int NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Pasword` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Curso` int DEFAULT NULL,
  `Materia` int DEFAULT NULL,
  PRIMARY KEY (`idDocente`) USING BTREE,
  KEY `Materia_idMateria` (`Materia`),
  KEY `Curso_idCurso` (`Curso`),
  KEY `NombreDoc_Nombres` (`Nombres`),
  KEY `ApellidoDoc_Apellidos` (`Apellidos`),
  KEY `EmailDoc_Email` (`Email`),
  KEY `Password` (`Pasword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`idDocente`, `Nombres`, `Apellidos`, `Email`, `Pasword`, `Curso`, `Materia`) VALUES
(142223657, 'Didier', 'Orozco', 'Orozco09@gmail.com', '598d8591e55346928b3a3a0a01da9ee5', 1, NULL),
(1025538177, 'Aurelio', 'Rivas Renteria', 'Aurelio2023@gmail.com', '8223b621da582c18a06f35b39efcdbed', 1, NULL),
(1054115102, 'Vilma ', 'Barrios Gomez', 'EldiabloAndante@gmail.com', '93d7abad7bbf270154ff3270fe46f4d3', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `idEstudiante` int NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Pasword` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Curso` int DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `curso_cursoid` (`Curso`),
  KEY `NombreEst_Nombre` (`Nombres`),
  KEY `ApellidoEst_Apellido` (`Apellidos`),
  KEY `EmailEst_Email` (`Email`),
  KEY `PasswordEst_password` (`Pasword`),
  KEY `Estado_Est_Usr` (`Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idEstudiante`, `Nombres`, `Apellidos`, `Email`, `Pasword`, `Curso`, `Estado`) VALUES
(100030256, 'Santiago', 'Orjuela', 'orjtailand@gmail.com', '12157a63af655888c72bcb10bfbf0cc7', NULL, 'Activo'),
(1030521423, 'Alejandra', 'Andrade', 'jennyandrade1302@gmail.com', '3c9f06a12a72aa72674e57e05a7a56f0', NULL, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foros`
--

DROP TABLE IF EXISTS `foros`;
CREATE TABLE IF NOT EXISTS `foros` (
  `idForos` int NOT NULL,
  `tema` varchar(45) DEFAULT NULL,
  `Contenido` varchar(700) DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  PRIMARY KEY (`idForos`),
  KEY `idUsuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE IF NOT EXISTS `materias` (
  `idMaterias` int NOT NULL AUTO_INCREMENT,
  `Nombre_Materia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMaterias`),
  KEY `Nombre_Materia` (`Nombre_Materia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMaterias`, `Nombre_Materia`) VALUES
(3, 'Calculo'),
(2, 'Español'),
(1, 'Ingles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE IF NOT EXISTS `mensajes` (
  `Idmensaje` int NOT NULL AUTO_INCREMENT,
  `Mensaje_entrante` int DEFAULT NULL,
  `Mensaje_saliente` int DEFAULT NULL,
  `Mensaje` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Idmensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`Idmensaje`, `Mensaje_entrante`, `Mensaje_saliente`, `Mensaje`) VALUES
(1, 1068732649, 1030521423, 'r5y6rty'),
(2, 1059643579, 1030521423, 'hola'),
(3, 1030521423, 1059643579, 'como estas'),
(4, 10000, 1059643579, 'hola mkon'),
(5, 1059643579, 10000, 'hola pendeja'),
(6, 1030521423, 1101443174, 'hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opiniones`
--

DROP TABLE IF EXISTS `opiniones`;
CREATE TABLE IF NOT EXISTS `opiniones` (
  `iDopinion` int NOT NULL AUTO_INCREMENT,
  `Nombres_Apellidos` varchar(200) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`iDopinion`),
  KEY `iDpadres` (`Nombres_Apellidos`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `opiniones`
--

INSERT INTO `opiniones` (`iDopinion`, `Nombres_Apellidos`, `Email`, `Opinion`) VALUES
(1, 'Juan David Julio Rodriguez', 'draxjulio13@gmail.com', 'Es un desarrollo bastante fructífero y bastante versátil y sencillo para el fácil manejo de el mismo'),
(2, 'Dilan Romero', 'DilanRom@gmail.com', '¡¡Me gusta!!'),
(3, 'johan santiago villanueva roa', 'villabilons@gmail.com', 'Me parece super la pagina'),
(4, 'Juan David Julio Rodríguez', 'draxjulio13@gmail.com', 'es super importante la educacion hoy en dia siendo que asi guiamos a la persona del mañana para poder tener un futuro mejor'),
(5, 'magdy velazco', 'magdy17@gmail.com', 'este es un buen aplicativo por que fue elaborado por nosotros hajajajja'),
(6, 'stiven oliveros', 'oliverossilvajohan@gmail.com', 'sobelo .com'),
(7, 'andreina melgarejo', 'andreina301094@hotmail.com', 'buena herramienta de trabajo ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre_familia`
--

DROP TABLE IF EXISTS `padre_familia`;
CREATE TABLE IF NOT EXISTS `padre_familia` (
  `idPadre_Familia` int NOT NULL,
  `Estado_representante` int DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPadre_Familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE IF NOT EXISTS `publicaciones` (
  `idPublicaciones` int NOT NULL,
  `Archivo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  PRIMARY KEY (`idPublicaciones`),
  KEY `usuario_usuarioId` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Idusuarios` int NOT NULL,
  `Nombres` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Telefono` bigint DEFAULT NULL,
  `Pasword` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  `Rol` enum('Docente','Coordinador','Estudiante','Padre de familia') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`Idusuarios`),
  UNIQUE KEY `Email` (`Email`) USING BTREE,
  KEY `Nombres` (`Nombres`) USING BTREE,
  KEY `Apellidos` (`Apellidos`),
  KEY `Password` (`Pasword`),
  KEY `Estado` (`Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Idusuarios`, `Nombres`, `Apellidos`, `Email`, `Telefono`, `Pasword`, `img`, `Rol`, `Estado`, `status`) VALUES
(10000, 'Jimmy', 'Avila', 'Jimmy2020@gmail.com', 3241742555, '5a1dfc0934d7a2fe6b9d1c41e2913dca', 'img/testimonial-4.jpg', 'Coordinador', 'Activo', 'Offline now'),
(1563298, 'leydi ', 'Roa', 'Coordinadora@gmail.com', 3152363254, '7b9c0a9b357cd7c707742562f82add2c', '1652660564avatar.png', 'Coordinador', 'Activo', ''),
(10000568, 'Johan Santiagooo', 'Villanueva Roa', 'villabilons@gmail.com', 3234167037, '0f81efae2d3ada62b2208b530c89a820', '1652660564avatar.png', 'Estudiante', 'Activo', ''),
(100030256, 'Santiago', 'Orjuela', 'orjtailand@gmail.com', 3154897654, '12157a63af655888c72bcb10bfbf0cc7', '1652660564avatar.png', 'Estudiante', 'Activo', ''),
(142223657, 'Didier', 'Orozco', 'Orozco09@gmail.com', 3215642585, '598d8591e55346928b3a3a0a01da9ee5', '1652660564avatar.png', 'Docente', 'Activo', ''),
(1023537206, 'Jeison', 'Villanueva', 'jei555555@gmail.com', 3144787155, '7c4c5a96ac34d000f49e9ecefad47722', '1652660564avatar.png', 'Coordinador', 'Activo', ''),
(1025538177, 'Aurelio', 'Rivas Renteria', 'Aurelio2023@gmail.com', 3172548978, '8223b621da582c18a06f35b39efcdbed', '1652660564avatar.png', 'Docente', 'Activo', ''),
(1030521423, 'Alejandra', 'Andrade', 'jennyandrade1302@gmail.com', 3198792555, '3c9f06a12a72aa72674e57e05a7a56f0', '1652660564avatar.png', 'Estudiante', 'Activo', 'Offline now'),
(1054115102, 'Vilma ', 'Barrios Gomez', 'EldiabloAndante@gmail.com', 3241742555, '93d7abad7bbf270154ff3270fe46f4d3', '1652660564avatar.png', 'Docente', 'Activo', ''),
(1101443174, 'Juan David', 'Julio Rodríguez ', 'draxjulio13@gmail.com', 3136065261, '3882a7d8c99e7f13c7b4debae42cbb91', NULL, 'Estudiante', 'Activo', 'Offline now');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `Asignaturas_Materias` FOREIGN KEY (`Asignatura`) REFERENCES `materias` (`Nombre_Materia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Docente_nom_docente` FOREIGN KEY (`Docente`) REFERENCES `docente` (`idDocente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD CONSTRAINT `EmailCoordinador_Email` FOREIGN KEY (`Email`) REFERENCES `usuarios` (`Email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idcoordinador_usuarios` FOREIGN KEY (`idCoordinador`) REFERENCES `usuarios` (`Idusuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `Curso_idCurso` FOREIGN KEY (`Curso`) REFERENCES `curso` (`idCurso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `EmailDoc_Email` FOREIGN KEY (`Email`) REFERENCES `usuarios` (`Email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idddocente_usuarios` FOREIGN KEY (`idDocente`) REFERENCES `usuarios` (`Idusuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Materia_idMateria` FOREIGN KEY (`Materia`) REFERENCES `materias` (`idMaterias`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `Curso_idCurse` FOREIGN KEY (`Curso`) REFERENCES `curso` (`idCurso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `EmailEst_Email` FOREIGN KEY (`Email`) REFERENCES `usuarios` (`Email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `idEstudiante_usuarios` FOREIGN KEY (`idEstudiante`) REFERENCES `usuarios` (`Idusuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `foros`
--
ALTER TABLE `foros`
  ADD CONSTRAINT `idUsuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`Idusuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `padre_familia`
--
ALTER TABLE `padre_familia`
  ADD CONSTRAINT `idPadre_usuarios` FOREIGN KEY (`idPadre_Familia`) REFERENCES `usuarios` (`Idusuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `usuario_usuarioId` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`Idusuarios`) ON DELETE RESTRICT ON UPDATE RESTRICT;

DELIMITER $$
--
-- Eventos
--
DROP EVENT IF EXISTS `mover_citas_pasadas`$$
CREATE DEFINER=`root`@`localhost` EVENT `mover_citas_pasadas` ON SCHEDULE EVERY 1 MINUTE STARTS '2024-02-29 11:24:18' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DECLARE fecha_actual DATE;
    SET fecha_actual = CURDATE();

    INSERT INTO citas_realizadas (nombre, email, fecha, hora)
    SELECT nombre, email, fecha, hora
    FROM citas
    WHERE fecha < fecha_actual OR (fecha = fecha_actual AND hora < CURTIME());

    DELETE FROM citas
    WHERE fecha < fecha_actual OR (fecha = fecha_actual AND hora < CURTIME());
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
