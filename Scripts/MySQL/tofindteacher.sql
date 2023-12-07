-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2023 a las 05:27:00
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tofindteacher`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `alumno_id` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `edad` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `lugar_residencia` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`alumno_id`, `nombre`, `edad`, `apellido`, `lugar_residencia`) VALUES
('7eQqceWHglOWo34Fx543STuyMg53', 'Paco', '36', 'Perez', 'Veracruz '),
('D56UKAoG7CWusSgnD09f4HAezrS2', 'Alejandro', '23', 'Vargas', 'Mérida'),
('JjCjgkr7VchGuGpk0JmYVMIZfxW2', 'Eduardo', '23', 'García', 'CDMX'),
('JV5z754iEQW1UtMBRDi2AGkK3Dy1', 'María', '515', 'Villa', 'Acapulco'),
('l2Ue8FudLBPbKIplSRkW6cVHC1s2', 'Luis', '24', 'Mendoza', 'Sonora'),
('luwIWJaYnZSsggZsiyPolxDI8e73', 'Manuel', '20', 'Estrada', 'Mérida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `area_id` int(11) NOT NULL,
  `nombre_area` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sinopsis` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`area_id`, `nombre_area`, `sinopsis`) VALUES
(1, 'Matemáticas', 'Desarrolla tu habilidad matemática'),
(2, 'Programación', 'Desarrolla fluidez y comprensión en los Lenguajes de las Maquinas'),
(3, 'Español', 'Construye y mejora tu Lenguaje Nativa para dominarla.'),
(4, 'Algebra Lineal', 'Comprende las letras dentro del mundo de la matemáticas y sus posibilidades.'),
(5, 'Ciencia', 'Comprende e interactúa con los principios básicos del mundo.'),
(6, 'Artes', 'Sé cultura y genera cultura al conocer las artes , sus formas, métodos, importancia y permítete crea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `clase_id` int(11) NOT NULL,
  `alumno_id` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `maestro_id` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `maestro_id` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `edad` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL,
  `residencia` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`maestro_id`, `nombre`, `area_id`, `edad`, `residencia`, `descripcion`) VALUES
('aHuvnovcw8ZCmomkAsGAChw3pYg2', 'Eduardo', 1, '22', 'Puebla', 'Universidad Autónoma de Puebla'),
('JV5z754iEQW1UtMBRDi2AGkK3Dy1', 'Alejandro', 6, '30', 'Boca del Río', 'Licenciado en Música y Composición Jazz'),
('nxtiNOODG6XU0hBBmwzVYB3aMCC3', 'Samantha', 3, '26', 'Boca del Río', 'Licenciatura en Letras'),
('zMb1kSAzNTgIFpTKQrCzgS6Tuo83', 'Enrique', 1, '46', 'Veracruz', 'Egresado del Colegio Nacional de Matemáticas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rating`
--

CREATE TABLE `rating` (
  `maestro_id` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `alumno_id` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `rating`
--

INSERT INTO `rating` (`maestro_id`, `alumno_id`, `rating`) VALUES
('aHuvnovcw8ZCmomkAsGAChw3pYg2', '7eQqceWHglOWo34Fx543STuyMg53', '5.0'),
('nxtiNOODG6XU0hBBmwzVYB3aMCC3', 'l2Ue8FudLBPbKIplSRkW6cVHC1s2', '4.0'),
('zMb1kSAzNTgIFpTKQrCzgS6Tuo83', 'luwIWJaYnZSsggZsiyPolxDI8e73', '3.0'),
('nxtiNOODG6XU0hBBmwzVYB3aMCC3', 'l2Ue8FudLBPbKIplSRkW6cVHC1s2', '4.0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`alumno_id`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`clase_id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `maestro_id` (`maestro_id`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`maestro_id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `rating`
--
ALTER TABLE `rating`
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `maestro_id` (`maestro_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `clase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`maestro_id`) REFERENCES `maestros` (`maestro_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD CONSTRAINT `maestros_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`area_id`);

--
-- Filtros para la tabla `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`maestro_id`) REFERENCES `maestros` (`maestro_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
