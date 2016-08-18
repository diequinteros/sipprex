-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2016 a las 00:50:49
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ssppea`
--
CREATE DATABASE IF NOT EXISTS `ssppea` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ssppea`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `codigo_admin` int(8) NOT NULL,
  `contraseña_admin` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`codigo_admin`, `contraseña_admin`) VALUES
(20140666, 666);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `carnet` int(8) NOT NULL,
  `contraseña` int(8) NOT NULL,
  `nie` int(7) DEFAULT NULL,
  `nombre1` varchar(9) DEFAULT NULL,
  `nombre2` varchar(10) DEFAULT NULL,
  `apellido1` varchar(11) DEFAULT NULL,
  `apellido2` varchar(11) DEFAULT NULL,
  `grado` int(2) DEFAULT NULL,
  `especialidad` int(2) DEFAULT NULL,
  `grupo_Tecnic` int(2) DEFAULT NULL,
  `secc` int(2) DEFAULT NULL,
  `grupo_academ` int(2) DEFAULT NULL,
  `inscrito` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`carnet`, `contraseña`, `nie`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `grado`, `especialidad`, `grupo_Tecnic`, `secc`, `grupo_academ`, `inscrito`) VALUES
(1, 0, 2, 'w', 'w', 'w', 'w', 2, 2, 2, 2, 2, 'FALSO'),
(20110005, 0, 1684787, 'Andrea', 'Guadalupe', 'Marroquín', 'Paredes', 1, 3, 1, 1, 2, 'VERDADERO'),
(20110014, 0, 1683484, 'Katya', 'Michelle', 'Mathies', 'Sánchez', 1, 2, 1, 2, 3, 'VERDADERO'),
(20110035, 0, 2330559, 'Diego', 'Alfonso', 'García', 'Flores', 1, 4, 2, 2, 1, 'VERDADERO'),
(20110036, 0, 5864765, 'Gerson', 'Adin', 'López', 'Alvarado', 1, 4, 1, 2, 3, 'VERDADERO'),
(20110046, 0, 6262148, 'Eduardo', 'Antonio', 'Batres', 'Alvarado', 1, 1, 1, 2, 1, 'VERDADERO'),
(20110056, 0, 780160, 'Ricardo', 'Alejandro', 'Velásquez', 'Vega', 1, 6, 2, 1, 3, 'VERDADERO'),
(20110078, 0, 1686240, 'Gerardo', 'Antonio', 'Hernández', 'Hurtado', 1, 4, 2, 2, 2, 'VERDADERO'),
(20110085, 0, 1686145, 'Héctor', 'Antonio', 'Zelaya', 'Abrego', 1, 4, 2, 1, 3, 'VERDADERO'),
(20110086, 0, 1673660, 'Oscar', 'Armando', 'Vargas', 'Hernández', 1, 1, 1, 2, 1, 'VERDADERO'),
(20110092, 0, 1680535, 'Leslie', 'Elizabeth', 'Mejía', 'Ramírez', 1, 3, 2, 2, 2, 'VERDADERO'),
(20110094, 0, 1686239, 'Javier', 'Enrique', 'Guevara', 'Flores', 1, 4, 2, 1, 3, 'VERDADERO'),
(20110099, 0, 1675222, 'Erick', 'Gabriel', 'Soto', 'Mena', 1, 3, 1, 1, 1, 'VERDADERO'),
(20110106, 0, 1676531, 'Ricardo', 'Andrés', 'Calderón', 'Alfaro', 1, 2, 1, 1, 3, 'VERDADERO'),
(20110122, 0, 1676042, 'María', 'José', 'Nuila', 'López', 1, 6, 2, 2, 3, 'VERDADERO'),
(20110129, 0, 1679791, 'Christian', 'Javier', 'Jaco', 'Avilés', 1, 4, 2, 1, 4, 'VERDADERO'),
(20110134, 0, 1686204, 'Josué', 'Daniel', 'Osorto', 'Rivera', 1, 4, 1, 2, 4, 'VERDADERO'),
(20110182, 0, 1670737, 'Benjamín', 'Alejandro', 'Benítez', 'Vásquez', 1, 4, 1, 2, 3, 'VERDADERO'),
(20110183, 0, 1686224, 'Laura', 'Denisse', 'Cabezas', 'Solórzano', 1, 1, 1, 1, 4, 'VERDADERO'),
(20110206, 0, 1676227, 'Abel', 'Eduardo', 'Rodríguez', 'Ortíz', 1, 4, 2, 2, 1, 'VERDADERO'),
(20110227, 0, 1672613, 'José', 'Arturo', 'Romero', 'Gálvez', 1, 4, 1, 2, 4, 'VERDADERO'),
(20110247, 0, 1674172, 'Miguel', 'Antonio', 'Osegueda', 'Hernández', 1, 1, 1, 2, 2, 'VERDADERO'),
(20110249, 0, 1969511, 'Werner', 'Eduardo', 'Gómez', 'Zepeda', 1, 4, 1, 1, 4, 'VERDADERO'),
(20110264, 0, 1675778, 'Iván', 'Antonio', 'Viche', 'Campos', 1, 4, 2, 2, 2, 'VERDADERO'),
(20110266, 0, 1672937, 'José', 'Mauricio', 'Rivera', 'Sánchez', 1, 4, 1, 1, 3, 'VERDADERO'),
(20110272, 0, 1676317, 'María', 'Esperanza', 'Peña', 'Melara', 1, 4, 2, 1, 4, 'VERDADERO'),
(20110274, 0, 1692677, 'Cristian', 'Moisés', 'Cerritos', 'Bernal', 1, 5, 1, 1, 2, 'VERDADERO'),
(20110282, 0, 1690782, 'Mirna', 'Paola', 'Zavala', 'Lazo', 1, 3, 1, 1, 1, 'VERDADERO'),
(20110291, 0, 1686223, 'William', 'Alexander', 'García', 'Contreras', 1, 6, 2, 1, 3, 'VERDADERO'),
(20110292, 0, 1684959, 'Luis', 'Fernando', 'Acevedo', 'Renderos', 1, 4, 1, 1, 3, 'VERDADERO'),
(20110293, 0, 1690232, 'Denny', 'Rolando', 'Amaya', 'Juárez', 1, 4, 1, 1, 3, 'VERDADERO'),
(20110327, 0, 1674919, 'Adriana', 'Beatriz', 'Menjívar', 'Romero', 1, 2, 1, 1, 4, 'VERDADERO'),
(20110339, 0, 1670437, 'Aida', 'Gabriela', 'Rodríguez', 'López', 1, 3, 1, 1, 1, 'VERDADERO'),
(20110357, 0, 1967575, 'Norma', 'Patricia', 'Marroquín', 'Lima', 1, 1, 1, 2, 1, 'VERDADERO'),
(20110376, 0, 4363219, 'Fátima', 'Susana', 'Calles', 'Calles', 1, 2, 1, 2, 3, 'VERDADERO'),
(20110377, 0, 1691011, 'Diego', 'Pablo', 'Bracamonte', 'Romero', 1, 4, 2, 1, 4, 'VERDADERO'),
(20110378, 0, 1692871, 'Anderson', 'Ernesto', 'Barillas', 'Nuñez', 1, 4, 2, 2, 1, 'VERDADERO'),
(20110403, 0, 1687459, 'Luis', 'Alejandro', 'Rivas', 'Bonilla', 1, 6, 1, 1, 2, 'VERDADERO'),
(20110418, 0, 4364397, 'Luis', 'David', 'Guevara', 'Rodríguez', 1, 5, 1, 2, 2, 'VERDADERO'),
(20110429, 0, 1683621, 'Franklin', 'Nahum', 'Ventura', 'Cruz', 1, 6, 2, 2, 3, 'VERDADERO'),
(20110442, 0, 1674221, 'Andrea', 'Geraldine', 'Palma', 'Villatoro', 1, 3, 2, 2, 4, 'VERDADERO'),
(20110478, 0, 5202567, 'Fernando', 'Alberto', 'Santana', 'Benítez', 1, 4, 2, 1, 3, 'VERDADERO'),
(20110502, 0, 3098710, 'Edgar', 'Ofilio', 'Chicas', 'Leiva', 1, 5, 1, 2, 4, 'VERDADERO'),
(20110506, 0, 5238407, 'Sarah', 'Valeria', 'Miranda', 'Quinteros', 1, 1, 1, 2, 2, 'VERDADERO'),
(20110509, 0, 1691887, 'Daniela', 'Alexandra', 'Peña', 'Hernández', 1, 4, 1, 2, 4, 'VERDADERO'),
(20110510, 0, 1691897, 'Oscar', 'Francisco', 'Ramos', 'Villalta', 1, 4, 2, 2, 2, 'VERDADERO'),
(20110512, 0, 1694367, 'Ernesto', 'Alexander', 'Cruz', 'Martínez', 1, 5, 1, 2, 2, 'VERDADERO'),
(20110555, 0, 6368098, 'Milicen', 'Andrea', 'Garay', 'Ortez', 1, 4, 1, 2, 4, 'VERDADERO'),
(20110564, 0, 1685918, 'Carlos', 'Mario', 'Martínez', 'Guardado', 1, 4, 2, 2, 2, 'VERDADERO'),
(20110569, 0, 1172814, 'Andrea', 'Elizabeth', 'García', 'Vásquez', 1, 3, 1, 1, 2, 'VERDADERO'),
(20110582, 0, 1692869, 'Fernando', 'José', 'Alonzo', 'Reyes', 1, 4, 2, 2, 1, 'VERDADERO'),
(20110594, 0, 4363521, 'Willian', 'Stanley', 'Cocar', 'Genovez', 1, 6, 1, 2, 1, 'VERDADERO'),
(20110601, 0, 3099142, 'Irene', 'María', 'Salvatierra', 'Mejía', 1, 3, 1, 1, 2, 'VERDADERO'),
(20110615, 0, 3099136, 'Evelyn', 'Carolina', 'Barahona', 'Martínez', 1, 2, 1, 1, 3, 'VERDADERO'),
(20110642, 0, 1674171, 'Samuel', 'Osmin', 'Henríquez', 'Osegueda', 1, 4, 1, 2, 4, 'VERDADERO'),
(20110643, 0, 1676016, 'Luis', 'Ernesto', 'Gutiérrez', 'González', 1, 6, 1, 1, 2, 'VERDADERO'),
(20110645, 0, 2330560, 'Diego', 'Alejandro', 'Rodríguez', 'Coreas', 1, 5, 1, 2, 4, 'VERDADERO'),
(20110705, 0, 4361998, 'Ernesto', 'Vladimir', 'Santos', 'Díaz', 1, 4, 1, 2, 4, 'VERDADERO'),
(20110794, 0, 1685924, 'Max', 'Edgardo', 'Palencia', 'Hernández', 1, 4, 2, 2, 2, 'VERDADERO'),
(20110795, 0, 1671695, 'Chritian', 'Rafael', 'Chacón', 'Manzur', 1, 1, 1, 1, 4, 'VERDADERO'),
(20120021, 0, 2211817, 'Jorge', 'Andre', 'Franco', 'Hernández', 1, 4, 1, 2, 3, 'VERDADERO'),
(20120064, 0, 1676083, 'José', 'Antonio', 'Morales', 'Lira', 1, 6, 1, 1, 1, 'VERDADERO'),
(20120113, 0, 2667749, 'Mauricio', 'Ernesto', 'León', 'Preza', 1, 5, 1, 2, 4, 'VERDADERO'),
(20120133, 0, 1686143, 'Eduardo', 'Alberto', 'López', 'Torres', 1, 6, 1, 1, 1, 'VERDADERO'),
(20120181, 0, 7116222, 'Moisés', 'Antonio', 'Arévalo', 'Ayala', 1, 4, 1, 1, 4, 'VERDADERO'),
(20120202, 0, 1685677, 'Gabriela', 'Patricia', 'Rodríguez', 'Sánchez', 1, 2, 1, 1, 3, 'VERDADERO'),
(20120263, 0, 1684997, 'Jonathan', 'Moisés', 'Hernández', 'Posada', 1, 5, 1, 2, 3, 'VERDADERO'),
(20120391, 0, 1685764, 'Sonia', 'Gabriela', 'Vargas', 'Miranda', 1, 3, 2, 2, 1, 'VERDADERO'),
(20120506, 0, 1678488, 'Walter', 'Orlando', 'Díaz', 'López', 1, 1, 1, 1, 3, 'VERDADERO'),
(20120528, 0, 1681551, 'Ana', 'Laura', 'Chávez', 'Mijango', 1, 6, 1, 2, 2, 'VERDADERO'),
(20120575, 0, 1686319, 'Andrea', 'Alicia', 'Barraza', 'Díaz', 1, 3, 1, 1, 2, 'VERDADERO'),
(20120618, 0, 1685337, 'Vanessa', 'Rocío', 'Muñoz', 'Salazar', 1, 2, 1, 1, 4, 'VERDADERO'),
(20120629, 0, 4364534, 'Tatiana', 'Michelle', 'Orantes', 'Cardoza', 1, 3, 1, 1, 1, 'VERDADERO'),
(20120678, 0, 2049820, 'Edwin', 'Alberto', 'López', 'Almira', 1, 6, 2, 1, 4, 'VERDADERO'),
(20120757, 0, 1695422, 'Ernesto', 'José', 'Melara', 'Carrillo', 1, 5, 1, 2, 4, 'VERDADERO'),
(20120762, 0, 1677311, 'Diego', 'Mauricio', 'Campos', 'Moreno', 1, 6, 2, 1, 4, 'VERDADERO'),
(20120775, 0, 1688621, 'Johanna', 'Esmeralda', 'Aquino', 'Murcia', 1, 1, 1, 1, 3, 'VERDADERO'),
(20120812, 0, 5681610, 'Stacy', 'Alejandra', 'Figueroa', 'Mendoza', 1, 3, 2, 2, 2, 'VERDADERO'),
(20120863, 0, 1685483, 'Carlos', 'Isaac', 'Ventura', 'Guevara', 1, 3, 1, 1, 1, 'VERDADERO'),
(20120871, 0, 1676262, 'Trixia', 'Aroneth', 'Delgado', 'Solórzano', 1, 2, 1, 1, 4, 'VERDADERO'),
(20120895, 0, 2308871, 'Kenya', 'Alexandra', 'Teshé', 'Cartagena', 1, 1, 1, 1, 4, 'VERDADERO'),
(20120935, 0, 1690656, 'Wendy', 'Lisseth', 'Pérez', 'Lovos', 1, 3, 2, 2, 4, 'VERDADERO'),
(20120968, 0, 1717047, 'Sergio', 'Eduardo', 'Arce', 'López', 1, 4, 2, 1, 4, 'VERDADERO'),
(20130066, 0, 1687597, 'Ivette', NULL, 'Lemus', 'Guevara', 1, 6, 1, 1, 2, 'VERDADERO'),
(20130082, 0, 4363782, 'Gabriela', 'Abigaíl', 'Vásquez', 'Castillo', 1, 3, 2, 2, 4, 'VERDADERO'),
(20130113, 0, 4363115, 'Rafael', 'Antonio', 'Mateu', 'Choto', 1, 4, 1, 1, 4, 'VERDADERO'),
(20130124, 0, 5099735, 'Iván', 'Alejandro', 'Rivas', 'Sánchez', 1, 4, 2, 2, 1, 'VERDADERO'),
(20130126, 0, 1686059, 'Carlos', 'Alberto', 'Díaz', 'Rivera', 1, 5, 1, 2, 2, 'VERDADERO'),
(20130133, 0, 1686821, 'Kevin', 'Samuel', 'Delgado', 'Rivera', 1, 4, 1, 2, 3, 'VERDADERO'),
(20130209, 0, 5099730, 'Oscar', 'Eduardo', 'Landaverde', 'Medina', 1, 2, 1, 2, 4, 'VERDADERO'),
(20130238, 0, 2345129, 'Mónica', 'Marcela', 'Paz', 'Quintanilla', 1, 1, 1, 2, 1, 'VERDADERO'),
(20130241, 0, 1687551, 'Katherine', 'Irene', 'Gutiérrez', 'Aguirre', 1, 3, 2, 2, 2, 'VERDADERO'),
(20130259, 0, 1689520, 'Herbert', 'Ernesto', 'Vásquez', 'Ruíz', 1, 4, 2, 2, 2, 'VERDADERO'),
(20130261, 0, 2235224, 'Boris', 'Edgardo', 'Rafailano', 'Dimas', 1, 4, 1, 2, 4, 'VERDADERO'),
(20130267, 0, 2235222, 'María', 'Jhoselin', 'Pérez', 'Flores', 1, 3, 1, 1, 2, 'VERDADERO'),
(20130281, 0, 1849681, 'Leonardo', 'Andrés', 'Hernández', 'Hernández', 1, 3, 1, 1, 1, 'VERDADERO'),
(20130320, 0, 1676332, 'Bernardo', 'Javier', 'Avilés', 'López', 1, 4, 1, 2, 3, 'VERDADERO'),
(20130321, 0, 1685157, 'Anthony', 'Joseph', 'Martínez', 'Sosa', 1, 1, 1, 2, 1, 'VERDADERO'),
(20130347, 0, 1453598, 'Gerardo', 'Ernesto', 'Argueta', 'De Paz', 1, 6, 1, 2, 2, 'VERDADERO'),
(20130410, 0, 2030760, 'Stephanie', 'Elizabeth', 'Castaneda', 'Chávez', 1, 3, 1, 1, 1, 'VERDADERO'),
(20130513, 0, 1695727, 'Gabriel', 'Alejandro', 'Rivera', 'Miranda', 1, 5, 1, 2, 4, 'VERDADERO'),
(20130544, 0, 1687540, 'Mario', 'German', 'González', 'Burgos', 1, 1, 1, 2, 2, 'VERDADERO'),
(20130552, 0, 4363626, 'Gabriel', 'Antonio', 'Andaluz', 'Sagastume', 1, 6, 2, 2, 1, 'VERDADERO'),
(20130576, 0, 1688863, 'Rafael', 'Edgardo', 'Chacón', 'Callejas', 1, 6, 1, 2, 2, 'VERDADERO'),
(20130633, 0, 798038, 'Emely', 'Adriana', 'Ramírez', 'Alvarado', 1, 4, 1, 1, 3, 'VERDADERO'),
(20130652, 0, 1675932, 'David', 'Esaú', 'Díaz', 'Roldán', 1, 5, 1, 1, 1, 'VERDADERO'),
(20130686, 0, 5681924, 'Evelyn', 'Johanna', 'Martínez', 'Romero', 1, 1, 1, 1, 3, 'VERDADERO'),
(20130727, 0, 1692278, 'Verónica', 'Elizabeth', 'Pacheco', 'Sánchez', 1, 1, 1, 2, 2, 'VERDADERO'),
(20130756, 0, 1691701, 'Ricardo', 'Arturo', 'Orantes', 'Rivera', 1, 1, 1, 1, 3, 'VERDADERO'),
(20130881, 0, 787899, 'David', 'Alejandro', 'Miranda', 'Quezada', 1, 4, 1, 1, 4, 'VERDADERO'),
(20130896, 0, 1687907, 'Ernesto', 'Eduardo', 'Solano', 'Flores', 1, 6, 2, 2, 1, 'VERDADERO'),
(20130935, 0, 4974629, 'Kevin', 'Francisco', 'Vásquez', 'Grande', 1, 6, 1, 1, 2, 'VERDADERO'),
(20131034, 0, 1682360, 'Mónica', 'Susana', 'Bonilla', 'García', 1, 4, 1, 1, 3, 'VERDADERO'),
(20140002, 0, 4363519, 'José', 'Alfredo', 'Burgos', 'Cruz', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140003, 0, 5684028, 'Raúl', 'Alexander', 'Sánchez', 'Menjívar', 1, 2, 1, 1, 3, 'VERDADERO'),
(20140004, 0, 2722205, 'Mauricio', 'Alejandro', 'Parada', 'Méndez', 1, 4, 1, 2, 3, 'VERDADERO'),
(20140006, 0, 1688933, 'Patricia', 'Consuelo', 'Merino', 'Ayala', 1, 3, 2, 2, 4, 'VERDADERO'),
(20140007, 0, 4363217, 'Sara', 'Marloni', 'Mayorga', 'García', 1, 2, 1, 2, 3, 'VERDADERO'),
(20140008, 0, 4363523, 'Gabriel', 'Alejandro', 'Hidalgo', 'Rodríguez', 1, 6, 1, 2, 1, 'VERDADERO'),
(20140010, 0, 1686092, 'Kennet', 'Iván', 'Crespín', 'Solís', 1, 4, 2, 2, 2, 'VERDADERO'),
(20140028, 0, 1673704, 'Lissa', 'Lorena', 'Valenzuela', 'Canjura', 1, 1, 1, 1, 3, 'VERDADERO'),
(20140038, 0, 4361999, 'Juan', 'Carlos', 'Serrano', 'Lemus', 1, 6, 1, 2, 1, 'VERDADERO'),
(20140039, 0, 1677718, 'José', 'Alejandro', 'Herrera', 'Ventura', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140040, 0, 1684831, 'Daniel', 'Alexander', 'Cornejo', 'Fajardo', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140042, 0, 4364003, 'Carlos', 'Javier', 'Reyes', 'Guardado', 1, 2, 1, 2, 3, 'VERDADERO'),
(20140043, 0, 2584118, 'Bryan', 'Adolfo', 'Romero', 'Payés', 1, 3, 2, 2, 1, 'VERDADERO'),
(20140046, 0, 6761080, 'Fátima', 'Guadalupe', 'Hernández', 'González', 1, 1, 1, 1, 4, 'VERDADERO'),
(20140055, 0, 4363627, 'Gabriela', 'Gisselle', 'Callejas', 'Álvarez', 1, 4, 2, 1, 4, 'VERDADERO'),
(20140056, 0, 2934643, 'Mayra', 'Alejandra', 'Domínguez', 'Menjívar', 1, 4, 2, 1, 4, 'VERDADERO'),
(20140059, 0, 4363508, 'Rodrigo', 'Andrés', 'Ayala', 'Escalante', 1, 4, 1, 1, 4, 'VERDADERO'),
(20140060, 0, 1688595, 'Mónica', 'Alejandra', 'Gómez', 'Solórzano', 1, 4, 2, 1, 4, 'VERDADERO'),
(20140061, 0, 1511728, 'Héctor', 'Osmin', 'Larreinaga', 'Paz', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140063, 0, 1580811, 'María', 'Fernanda', 'Miranda', 'Ramírez', 1, 6, 2, 2, 3, 'VERDADERO'),
(20140065, 0, 1702025, 'Carlos', 'Andrés', 'Artiga', 'Pacheco', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140069, 0, 1683964, 'José', 'Fabricio', 'Acevedo', 'López', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140071, 0, 1686023, 'Walter', 'Ernesto', 'Flores', 'Paz', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140076, 0, 4364004, 'Silvia', 'María', 'Rodríguez', 'Gallegos', 1, 2, 1, 1, 4, 'VERDADERO'),
(20140078, 0, 4362727, 'Roberto', 'Carlos', 'Martínez', 'Cerón', 1, 4, 1, 1, 4, 'VERDADERO'),
(20140084, 0, 1674939, 'Alejandro', 'Javier', 'González', 'Loarca', 1, 6, 2, 2, 3, 'VERDADERO'),
(20140085, 0, 3130796, 'Adilio', 'Adonay', 'Umaña', 'Mena', 1, 2, 1, 1, 4, 'VERDADERO'),
(20140089, 0, 784337, 'Fredy', 'Alexander', 'Castro', 'George', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140091, 0, 1687599, 'Nelson', 'Steve', 'Mata', 'Alfaro', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140102, 0, 1695844, 'Diana', 'Elizabeth', 'Escalante', 'Cruz', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140105, 0, 1696508, 'Cristian', 'Geovanny', 'Quijada', 'Rosa', 1, 5, 1, 2, 2, 'VERDADERO'),
(20140107, 0, 4364186, 'Gabriela', 'Alejandra', 'Amaya', 'Fuentes', 1, 2, 1, 1, 3, 'VERDADERO'),
(20140110, 0, 1671997, 'Diego', 'Abraham', 'Preza', 'Cardoza', 1, 1, 1, 2, 2, 'VERDADERO'),
(20140114, 0, 1675733, 'Gerson', 'Joaquín', 'Pérez', 'Muñoz', 1, 5, 1, 2, 3, 'VERDADERO'),
(20140115, 0, 1675465, 'Herber', 'Saúl', 'Pérez', 'Dimas', 1, 4, 2, 2, 1, 'VERDADERO'),
(20140116, 0, 1695621, 'Daniel', 'Enrique', 'Alvarado', 'Pleitez', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140118, 0, 1970879, 'Ricardo', 'Ernesto', 'Gómez', 'Crespo', 1, 1, 1, 1, 4, 'VERDADERO'),
(20140123, 0, 1695892, 'Pamela', 'Sofía', 'Calles', 'Tobías', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140124, 0, 1671197, 'Guillermo', 'Javier', 'Morales', 'Cornejo', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140128, 0, 4363778, 'Ricardo', 'Alexander', 'Hernández', 'Minero', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140136, 0, 1694974, 'Zulma', 'Belén', 'Aguillón', 'Castro', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140138, 0, 1687601, 'Fernando', 'Antonio', 'Monteagudo', 'Cordova', 1, 6, 2, 2, 1, 'VERDADERO'),
(20140142, 0, 4363633, 'Sara', 'Lucía', 'Palomo', 'Mejía', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140144, 0, 6761092, 'Diana', 'Carolina', 'Benavides', 'Nuila', 1, 2, 1, 2, 3, 'VERDADERO'),
(20140145, 0, 6761087, 'Mónica', 'Lisseth', 'Hernández', 'Candray', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140149, 0, 1850007, 'Gerson', 'Fernando', 'Muñoz', 'Sosa', 1, 4, 2, 1, 3, 'VERDADERO'),
(20140151, 0, 2131290, 'Ariel', 'Alexander', 'Gamero', 'Mejía', 1, 6, 2, 2, 1, 'VERDADERO'),
(20140153, 0, 1694574, 'David', 'Emanuel', 'Orantes', 'Cubías', 1, 4, 1, 1, 3, 'VERDADERO'),
(20140155, 0, 4362497, 'Daniel', 'Wilfredo', 'Granados', 'Hernández', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140156, 0, 2054913, 'Edgar', 'Gustavo', 'Cordova', 'Rivas', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140157, 0, 6761975, 'Douglas', 'Enrique', 'Romero', 'Pineda', 1, 4, 1, 2, 3, 'VERDADERO'),
(20140159, 0, 1671834, 'Gustavo', 'Amilcar', 'López', 'Aquino', 1, 6, 2, 1, 4, 'VERDADERO'),
(20140161, 0, 1672558, 'Omar', 'Alexander', 'Ramírez', 'Flores', 1, 4, 1, 2, 4, 'VERDADERO'),
(20140165, 0, 1691694, 'María', 'Esther', 'Marroquín', 'Canjura', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140168, 0, 1670739, 'Carlos', 'Guillermo', 'Eguizabal', 'Orellana', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140173, 0, 6105685, 'Iván', 'Stanley', 'Ortíz', 'Paniagua', 1, 4, 2, 1, 3, 'VERDADERO'),
(20140180, 0, 2131295, 'Kathya', 'Melissa', 'López', 'Cortez', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140196, 0, 1974315, 'Valeria', 'Alejandra', 'Juárez', 'Rosales', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140199, 0, 1685920, 'Diego', 'Fernando', 'Muñoz', 'Noubleau', 1, 4, 1, 2, 3, 'VERDADERO'),
(20140200, 0, 917651, 'Leslie', 'Paola', 'González', 'Flores', 1, 1, 1, 2, 2, 'VERDADERO'),
(20140204, 0, 1686241, 'Oscar', 'Omar', 'Lizama', 'Escobar', 1, 6, 2, 1, 4, 'VERDADERO'),
(20140206, 0, 1673173, 'Alexander', 'Ariel', 'Mendoza', 'Méndez', 1, 4, 1, 1, 4, 'VERDADERO'),
(20140209, 0, 6438038, 'Carlos', 'Antonio', 'Aguirre', 'Montes', 1, 5, 1, 2, 4, 'VERDADERO'),
(20140210, 0, 4362075, 'María', 'José', 'Torres', 'Morales', 1, 3, 2, 2, 3, 'VERDADERO'),
(20140211, 0, 1849978, 'Alejandro', 'Donalí', 'Hernández', 'Ramos', 1, 6, 2, 1, 4, 'VERDADERO'),
(20140213, 0, 1684514, 'Roberto', 'Alexander', 'Rubio', 'Castillo', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140219, 0, 4955209, 'Luis', 'Andrés', 'Torres', 'Alvarado', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140225, 0, 1694976, 'Johanna', 'Lissette', 'Beltrán', 'Gómez', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140233, 0, 1674311, 'Ricardo', 'Arturo', 'Andasol', 'Escalante', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140249, 0, 1697907, 'José', 'Miguel', 'De Asís', 'Ulloa', 1, 1, 1, 2, 1, 'VERDADERO'),
(20140251, 0, 1671666, 'Cindy', 'Carolina', 'Flores', 'Bran', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140254, 0, 4364246, 'Stephanie', 'Carolina', 'Moreno', 'Cerón', 1, 1, 1, 1, 4, 'VERDADERO'),
(20140257, 0, 487330, 'Kelvin', 'Adonay', 'Palacios', 'Del Cid', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140258, 0, 6370546, 'Kenneth', 'Isaac', 'Sánchez', 'Flores', 1, 6, 1, 2, 2, 'VERDADERO'),
(20140266, 0, 1687596, 'Jonathan', 'Eduardo', 'González', 'Sosa', 1, 6, 1, 2, 1, 'VERDADERO'),
(20140272, 0, 4363143, 'Emilio', 'Stanley', 'Ramírez', 'Fuentes', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140278, 0, 6761961, 'Rodrigo', 'Salvador', 'Parras', 'Castillo', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140280, 0, 1692289, 'Ricardo', 'Alfredo', 'Pleitez', 'Torres', 1, 4, 1, 2, 4, 'VERDADERO'),
(20140282, 0, 6438052, 'René', 'Paul', 'Orellana', 'Campos', 1, 2, 1, 1, 4, 'VERDADERO'),
(20140290, 0, 1672072, 'Gabriel', 'Sebastián', 'Mora', 'Barrientos', 1, 1, 1, 1, 3, 'VERDADERO'),
(20140301, 0, 1671049, 'Brenda', 'Patricia', 'Preza', 'García', 1, 4, 1, 2, 4, 'VERDADERO'),
(20140303, 0, 1687548, 'Salvador', 'Alonso', 'Amaya', 'Mejía', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140306, 0, 1676356, 'Christian', 'Alberto', 'Gutiérrez', 'Rodríguez', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140307, 0, 1676046, 'Luis', 'Armando', 'Chévez', 'Durán', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140309, 0, 1674248, 'Edwin', 'Anibal', 'Escobar', 'Portillo', 1, 5, 1, 2, 3, 'VERDADERO'),
(20140314, 0, 5532151, 'Carlos', 'Alberto', 'Blanco', 'Rivera', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140315, 0, 1677221, 'Luis', 'Eduardo', 'Hernández', 'González', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140316, 0, 3553705, 'Fernando', 'Josué', 'Blanco', 'Palacios', 1, 6, 1, 2, 2, 'VERDADERO'),
(20140321, 0, 2029796, 'Isela', 'Abigail', 'Cisneros', 'Olmedo', 1, 1, 1, 2, 1, 'VERDADERO'),
(20140324, 0, 5681612, 'Milagro', 'Margarita', 'Hernández', 'Morán', 1, 6, 1, 2, 1, 'VERDADERO'),
(20140334, 0, 2093944, 'Marvin', 'Fernando', 'Paredes', 'Choto', 1, 4, 2, 1, 3, 'VERDADERO'),
(20140342, 0, 4363634, 'Diego', 'Enrique', 'Quinteros', 'Lemus', 1, 6, 2, 2, 1, 'VERDADERO'),
(20140349, 0, 7318440, 'María', 'José', 'Pineda', 'Calero', 1, 2, 1, 2, 3, 'VERDADERO'),
(20140353, 0, 1683386, 'Alejandra', 'Beatriz', 'Menjivar', 'Orellana', 1, 6, 1, 2, 1, 'VERDADERO'),
(20140354, 0, 1455995, 'William', 'Adalberto', 'Ovando', 'Méndez', 1, 5, 1, 2, 4, 'VERDADERO'),
(20140357, 0, 1741860, 'Josué', 'Antonio', 'Caballero', 'Caballero', 1, 5, 1, 2, 4, 'VERDADERO'),
(20140369, 0, 3194011, 'Kelly', 'Andrea', 'Figueroa', 'García', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140376, 0, 4364189, 'Diego', 'René', 'Herrera', 'Jiménez', 1, 1, 1, 1, 3, 'VERDADERO'),
(20140386, 0, 2185296, 'Hugo', 'Alejandro', 'Landaverde', 'Lara', 1, 5, 1, 2, 3, 'VERDADERO'),
(20140398, 0, 1706946, 'Paul', 'Alexis', 'Ramos', 'Escobar', 1, 4, 2, 2, 2, 'VERDADERO'),
(20140403, 0, 1447962, 'Manuel', 'Enrique', 'Coto', 'Parada', 1, 6, 2, 2, 1, 'VERDADERO'),
(20140406, 0, 6761881, 'Favio', 'Roberto', 'López', 'Peña', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140407, 0, 1676938, 'Andrea', 'Nicole', 'Urbina', 'Mena', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140411, 0, 6105709, 'Oscar', 'Isaac', 'Tobar', 'Bonilla', 1, 5, 1, 2, 3, 'VERDADERO'),
(20140417, 0, 1683976, 'Alan', 'Guillermo', 'Turcios', 'Villalta', 1, 6, 2, 2, 1, 'VERDADERO'),
(20140419, 0, 2240654, 'Gilberto', 'Alexander', 'Corleto', 'Rivera', 1, 6, 2, 1, 4, 'VERDADERO'),
(20140420, 0, 1683141, 'Rafael', 'Stanley', 'Pérez', 'Mejía', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140423, 0, 782088, 'Gabriela', 'María', 'Pineda', 'Huezo', 1, 3, 2, 2, 3, 'VERDADERO'),
(20140424, 0, 1684125, 'Carlos', 'Enrique', 'Mendoza', 'Delgado', 1, 5, 1, 2, 3, 'VERDADERO'),
(20140431, 0, 1696846, 'Irvin', 'Danilo', 'Melgar', 'Escobar', 1, 2, 1, 1, 4, 'VERDADERO'),
(20140436, 0, 4363116, 'Arianna', 'Gisela', 'Mejía', 'Henríquez', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140442, 0, 1672834, 'Julio', 'Armando', 'Barrientos', 'Mendoza', 1, 6, 2, 2, 3, 'VERDADERO'),
(20140445, 0, 790049, 'Mirian', 'Verónica', 'Vásquez', 'Salomé', 1, 3, 2, 2, 3, 'VERDADERO'),
(20140455, 0, 1682432, 'Jeniffer', 'Arlette', 'Rivas', 'Zelaya', 1, 1, 1, 2, 1, 'VERDADERO'),
(20140466, 0, 1689660, 'Sofía', 'Eugenia', 'Mena', 'Ortíz', 1, 2, 1, 1, 3, 'VERDADERO'),
(20140468, 0, 1673855, 'Rocío', 'Esmeralda', 'Morán', 'Gómez', 1, 3, 2, 2, 3, 'VERDADERO'),
(20140469, 0, 1685125, 'Luis', 'Fernando', 'Chávez', 'Mayorga', 1, 1, 1, 2, 2, 'VERDADERO'),
(20140477, 0, 2131300, 'Kevin', 'David', 'Navarro', 'Chanchan', 1, 1, 1, 1, 4, 'VERDADERO'),
(20140481, 0, 1688852, 'Stephanie', 'Natalia', 'Alas', 'Mendez', 1, 4, 1, 1, 3, 'VERDADERO'),
(20140491, 0, 1675984, 'Jorge', 'Herminio', 'Villatoro', 'Henríquez', 1, 5, 1, 2, 3, 'VERDADERO'),
(20140492, 0, 1958227, 'Luis', 'Enrique', 'Araujo', 'Aquino', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140500, 0, 1681938, 'Rafael', 'Ernesto', 'Galdámez', 'Rivera', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140503, 0, 3553702, 'Mario', 'Enrique', 'Samayoa', 'Campos', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140504, 0, 2240637, 'Mariela', 'Alejandra', 'Reyes', 'Dueñas', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140513, 0, 1686243, 'Kevin', 'Antonio', 'Larios', 'Mejía', 1, 4, 1, 1, 4, 'VERDADERO'),
(20140517, 0, 800835, 'Nelson', 'Alfredo', 'Paniagua', 'Sigui', 1, 4, 2, 1, 3, 'VERDADERO'),
(20140521, 0, 1674630, 'Humberto', 'Napoleón', 'Galdámez', 'García', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140528, 0, 1677045, 'Oscar', 'Josué', 'Quevedo', 'Palacios', 1, 6, 1, 1, 2, 'VERDADERO'),
(20140542, 0, 2355024, 'Manuel', 'Alfredo', 'Landaverde', 'Barahona', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140547, 0, 4976229, 'Fernando', 'Enrique', 'Castaneda', 'Figueroa', 1, 5, 1, 2, 4, 'VERDADERO'),
(20140551, 0, 1687369, 'Gabriela', 'Del Carmen', 'Lucero', 'Mejía', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140554, 0, 1675306, 'Pamela', 'Rocío', 'López', 'Flores', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140559, 0, 1685971, 'Claudia', 'Guadalupe', 'Flores', 'Gracias', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140560, 0, 1672077, 'Lilian', 'Jeannette', 'Umanzor', 'Campos', 1, 3, 2, 2, 4, 'VERDADERO'),
(20140567, 0, 1449764, 'Daniel', 'Alejandro', 'Henríquez', 'Rodas', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140570, 0, 1684513, 'Ángel', 'Enrique', 'Morales', 'Cardoza', 1, 6, 2, 1, 4, 'VERDADERO'),
(20140571, 0, 780394, 'Gerardo', 'Enrique', 'Rivera', 'Martínez', 1, 1, 1, 1, 4, 'VERDADERO'),
(20140573, 0, 1680293, 'Germán', 'Alexander', 'Sánchez', 'Mejía', 1, 4, 2, 2, 1, 'VERDADERO'),
(20140574, 0, 3194231, 'Marta', 'Elena', 'Martínez', 'Flores', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140591, 0, 1683967, 'Diego', 'Daniel', 'Barrientos', 'Cortez', 1, 5, 1, 2, 2, 'VERDADERO'),
(20140595, 0, 1694484, 'Ulíses', 'Giovanni', 'Granillo', 'Díaz', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140600, 0, 1671823, 'Ángel', 'Mauricio', 'Acevedo', 'Guardado', 1, 6, 1, 2, 2, 'VERDADERO'),
(20140620, 0, 1675664, 'Keren', 'Gisselle', 'Reyes', 'Mármol', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140622, 0, 1849576, 'Dennis', 'Giovanni', 'Regalado', 'Durán', 1, 3, 2, 2, 4, 'VERDADERO'),
(20140628, 0, 1683569, 'Gabriela', 'Ileana', 'Blanco', 'Rodríguez', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140635, 0, 1676681, 'Daniela', 'Esmeralda', 'Figueroa', 'Portillo', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140641, 0, 785561, 'Gissela', 'Beatriz', 'Acevedo', 'Calero', 1, 3, 2, 2, 2, 'VERDADERO'),
(20140643, 0, 3982723, 'Jorge', 'Alejandro', 'Calderón', 'De Paz', 1, 6, 1, 2, 2, 'VERDADERO'),
(20140656, 0, 6761992, 'Gabriel', 'Armando', 'Monge', 'Caballero', 1, 6, 2, 1, 3, 'VERDADERO'),
(20140658, 0, 1676905, 'Oscar', 'Rafael', 'Parras', 'Padilla', 1, 4, 1, 1, 3, 'VERDADERO'),
(20140679, 0, 3553700, 'Luis', 'Fernando', 'Larín', 'Contreras', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140685, 0, 1687186, 'Abraham', 'Gilberto', 'Martínez', 'Oliva', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140686, 0, 6727034, 'Edgardo', 'Javier', 'Guidos', 'Membreño', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140701, 0, 1971883, 'Eduardo', 'Ulises', 'Arias', 'Cerón', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140705, 0, 6496935, 'Lourdes', 'Eunice', 'Calderón', 'Villeda', 1, 1, 1, 1, 3, 'VERDADERO'),
(20140720, 0, 1674163, 'José', 'Francisco', 'Abarca', 'Reyes', 1, 6, 2, 2, 3, 'VERDADERO'),
(20140740, 0, 6761958, 'Ariel', 'Nahomy', 'Menjivar', 'Guevara', 1, 3, 2, 2, 3, 'VERDADERO'),
(20140743, 0, 1683275, 'Valeria', 'Nicole', 'Ayala', 'Morales', 1, 3, 1, 1, 1, 'VERDADERO'),
(20140746, 0, 1671158, 'Beatriz', 'Eunice', 'Viera', 'Dimas', 1, 1, 1, 2, 1, 'VERDADERO'),
(20140763, 0, 2632543, 'Katherine', 'Elisa', 'Vides', 'Orellana', 1, 1, 1, 2, 2, 'VERDADERO'),
(20140776, 0, 1670937, 'Erick', 'Wilfredo', 'Arévalo', 'Alvarado', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140786, 0, 780500, 'German', 'William', 'Rodríguez', 'López', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140788, 0, 2789468, 'Nathaly', 'Nohemy', 'Pérez', 'Molina', 1, 2, 1, 1, 4, 'VERDADERO'),
(20140789, 0, 6794604, 'Wilson', 'Saddam', 'Cerna', 'Roque', 1, 3, 2, 2, 4, 'VERDADERO'),
(20140793, 0, 1677778, 'Douglas', 'Ernesto', 'Guillén', 'García', 1, 6, 2, 2, 3, 'VERDADERO'),
(20140797, 0, 2049832, 'Ali', 'Balmore', 'Barahona', 'Reyes', 1, 5, 1, 1, 1, 'VERDADERO'),
(20140815, 0, 5716816, 'Byron', 'Armando', 'Loza', 'Guzmán', 1, 6, 2, 2, 1, 'VERDADERO'),
(20140821, 0, 2597127, 'René', 'Isaac', 'Alfaro', 'Funes', 1, 6, 1, 1, 1, 'VERDADERO'),
(20140826, 0, 1683499, 'Diego', 'Alexander', 'Méndez', 'Waldthausen', 1, 5, 1, 1, 2, 'VERDADERO'),
(20140850, 0, 6536571, 'Jocelyn', 'Nohemy', 'Hernández', 'Hernández', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140887, 0, 1670574, 'Sergio', 'Alejandro', 'Henríquez', 'Renderos', 1, 5, 1, 2, 2, 'VERDADERO'),
(20140891, 0, 1692690, 'Miguel', 'Eduardo', 'Guerra', 'Fuentes', 1, 2, 1, 2, 3, 'VERDADERO'),
(20140901, 0, 5864860, 'Bryan', 'Enrique', 'Izaguirre', 'Zelada', 1, 3, 2, 2, 4, 'VERDADERO'),
(20140916, 0, 1689699, 'Fernando', 'José', 'Ramos', 'Herrera', 1, 4, 1, 1, 4, 'VERDADERO'),
(20140917, 0, 2343252, 'Erlinda', 'Rebeca', 'Sandoval', 'Reyes', 1, 6, 2, 2, 3, 'VERDADERO'),
(20140927, 0, 4363212, 'Jocelyn', 'Alexandra', 'Fuentes', 'Molina', 1, 3, 1, 1, 2, 'VERDADERO'),
(20140933, 0, 2608873, 'Jorge', 'Alexander', 'Guardado', 'Alfaro', 1, 2, 1, 1, 3, 'VERDADERO'),
(20140943, 0, 5003962, 'Carlos', 'Antonio', 'De La Cruz', 'Romero', 1, 4, 1, 2, 3, 'VERDADERO'),
(20140948, 0, 1365662, 'Melissa', 'Alejandra', 'García', 'Cunza', 1, 2, 1, 2, 4, 'VERDADERO'),
(20140966, 0, 1679870, 'José', 'Rodrigo', 'Cerrato', 'Cruz', 1, 4, 1, 1, 3, 'VERDADERO'),
(20141012, 0, 5202755, 'Jimmy', 'André', 'Reyes', 'Colocho', 1, 1, 1, 1, 4, 'VERDADERO'),
(20141013, 0, 1971180, 'Ariel', 'Alexander', 'Martínez', 'Natarén', 1, 6, 2, 1, 4, 'VERDADERO'),
(20141015, 0, 1720140, 'Nelson', 'Eduardo', 'Martínez', 'Lovo', 1, 4, 2, 1, 3, 'VERDADERO'),
(20141020, 0, 1679131, 'Esmerly', 'Jociel', 'Campos', 'Velasco', 1, 1, 1, 2, 2, 'VERDADERO'),
(20150423, 0, 1688635, 'César', 'Alberto', 'Morales', 'Orellana', 1, 5, 1, 2, 4, 'VERDADERO'),
(20150781, 0, 1688017, 'Otto', 'Efraín', 'Cabrera', 'Castro', 1, 3, 2, 2, 1, 'VERDADERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `id_anuncio` int(11) NOT NULL,
  `titulo_anuncio` varchar(100) NOT NULL,
  `contenido_anuncio` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `anuncios`
--

INSERT INTO `anuncios` (`id_anuncio`, `titulo_anuncio`, `contenido_anuncio`) VALUES
(1, 'Titulo anuncio', 'Aqui va el contenido del anuncio\nAqui va el contenido del anuncio\n\nAqui va el contenido del anuncioAqui va el contenido del anuncio\nAqui va el contenido del anuncio\n\nAqui va el contenido del anuncioAqui va el contenido del anuncio\nAqui va el contenido del anuncio\n\nAqui va el contenido del anuncioAqui va el contenido del anuncio\nAqui va el contenido del anuncio\n\nAqui va el contenido del anuncioAqui'),
(2, 'Titulo anuncio 2', 'Aqui va el contenido del anuncio\r\nAqui va el contenido del anuncio\r\n\r\nAqui va el contenido del anuncioAqui va el contenido del anuncio\r\nAqui va el contenido del anuncio\r\n\r\nAqui va el contenido del anuncioAqui va el contenido del anuncio\r\nAqui va el contenido del anuncio\r\n\r\nAqui va el contenido del anuncioAqui va el contenido del anuncio\r\nAqui va el contenido del anuncio\r\n\r\nAqui va el contenido del');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `años`
--

CREATE TABLE `años` (
  `id_año` int(2) NOT NULL,
  `año` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `años`
--

INSERT INTO `años` (`id_año`, `año`) VALUES
(1, 'Segundo'),
(2, 'Tercero'),
(3, 'Tercero PILET');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

CREATE TABLE `config` (
  `id` int(1) NOT NULL,
  `color1` int(1) DEFAULT NULL,
  `color2` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`id`, `color1`, `color2`) VALUES
(1, 6, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentosempre`
--

CREATE TABLE `departamentosempre` (
  `id_depar` int(7) NOT NULL,
  `departamento` varchar(12) DEFAULT NULL,
  `encargado` varchar(9) DEFAULT NULL,
  `telefono_encargado` varchar(18) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `nombre_empresa` varchar(83) DEFAULT NULL,
  `rubro` varchar(73) DEFAULT NULL,
  `direccion` varchar(158) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `correo` varchar(49) DEFAULT NULL,
  `codigo_empresa` varchar(50) DEFAULT NULL,
  `contraseña_empre` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `rubro`, `direccion`, `telefono`, `contacto`, `correo`, `codigo_empresa`, `contraseña_empre`) VALUES
(1, 'Blanco Ingenieros Constructores', 'Arquitectura', 'Condominio IMPEP 0-39 Apto. 24-A, Mejicanos S.S', 78736030, 'Ing. Fredy Rafael Vicente Blanco', 'Bingeon@hotmail.com', NULL, '1'),
(2, 'COLEGIO MARISTA SAN ALFONSO', 'ARQUITECTURA', 'MEJICANOS', 22720870, 'ALDO AREVALO LARIN', NULL, NULL, '1'),
(3, 'Monisterio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Li. Arturo Cardona', 'arturo.cardona@mop.gob.sv', NULL, '1'),
(4, 'Innova Dreams Solutions\nVICEMINISTERIO DE VIVIENDA Y DESARROLLO URBANO MOPTVDU', 'ARQUITECTURA', 'Col San Francisco calle los Abetos #23 S.S.\npor distrito 4 de la Alcaldia 4\npropiedades al lado izquierdo\nAV. MANUEL ENRIQUE ARAUJO KM 5 1/2 CALLE SANTA TECLA', 22686411, 'Carolina Nuñez\nLIC. JOSE ARTURO CARDONA', 'gruposegovia.sa@gmail.com\nsit.vivienda@mop.gob.sv', NULL, '1'),
(5, 'Inversiones Consultores S.A. de C.V.', 'ARQUITECTURA', 'Av. Libertad no. 204 San Salvador', 25150787, 'Arq. Marvin Alberto Chicas Escamilla', 'rcinversionesconsultores@hotmail.com', NULL, '1'),
(6, 'Grimaldi Hnos. S. A. de C. V. Freelans Estudio', 'ARQUITECTURA', '67 Av. Sur pje caribe #13 Col. Roma S.S.', 22455257, 'Arq. Luis Herrera', 'luis@frelansestudio.com', NULL, '1'),
(7, 'Diseño y Publicidad. S.A. de C.V.', 'ARQUITECTURA', 'Urb. Lorencia, poligono 15 casa 5, San Marcos', 25329950, 'Ing. Francisco Muñoz', 'dpcolorimagen2012@hotmail.com', NULL, '1'),
(8, 'Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Lic. Arturo Cardona', 'arturo.cardona@mop.gob.sv', NULL, '1'),
(9, 'Corte Suprema de Justicia, depto de ingenieria', 'ARQUITECTURA', 'Diagonal Universitaria Centro de Gobierno edificio de oficinas administrativas y jurídicas de la C:S:J:, San Salvador', NULL, 'Arq. Rafael Claros', 'rafaclarosxto@yahoo.com', NULL, '1'),
(10, 'CAESS 4', 'ELECTRICIDAD', 'Calle el bambú col. San Antonio', 22299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com', NULL, '1'),
(11, 'MOPTVDU Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283069, 'Arq. Juan Bernardo Amaya', NULL, NULL, '1'),
(12, 'Universidad de El Salvador', 'EDUCACION', 'Final 25 av. Sur norte ciudad universitaria', 22355235, 'Arq. Manuel Ortiz Garmendez', NULL, NULL, '1'),
(13, 'Cincopatasalgato, S.A. de C.V.', 'ARQUITECTURA', 'Av. Las Palmas pje 6#114 col. San Benito', 25645746, 'Lourdes Canizales', 'admin@cincopatasalgato.com', NULL, '1'),
(14, 'DIRECCION DEPARTAMENTAL DE EDUCACIÓN DE SH SALVADOR', 'SERVICIOS DE EDUCACIÓN', '25 AV NOTE. Y CALLE SAN ANTONIO ABAD CONTIGUO A UES', 25221065, 'ARQ. HENRY ROSENDO MONTENEGRO', 'HENRIKMONTENEGRO@YAHOO.ES', NULL, '1'),
(15, 'Frilans Estudio Grimadi Hnos. S.A. de C.V.', 'ARQUITECTURA', '67 av. Sur pje caribe #13 col. Roma S.S.', 22455257, 'Arq. Luis Herrera', 'luis@frilansestudio.com', NULL, '1'),
(17, 'ORG Arquitectura construciones, S.A. de C. V.', 'ARQUITECTURA', 'Col Maquilishuat calle la mascota #93.3 B S.S.', 25369444, 'Arq. José David Gonzalez', 'david.gonzalez@grupoorg.com', NULL, '1'),
(18, 'Almacenes Vidrí, S.A. de C.V. 5', 'COMERCIALIZACIÓN', 'Centro Comercial Metropolis Col. Zacamil', 22725000, 'Sergio mendez', 's.metropolis@vidri.com', NULL, '1'),
(19, 'MOPTVDU Ministerio de Obras Públicas 1', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283069, 'Arq. Juan Bernardo Amaya Alvarez', 'N/A', NULL, '1'),
(20, 'MOPTVDU Ministerio de Obras Públicas 2', 'ARQUITECTURA', 'Av. Manuel Enrique Araujo km 5 1/2 calle a Santa Tecla', 25283113, 'Lic. José Arturo Cordova', 'arturo.cardona@mop.gob.sv', NULL, '1'),
(21, 'AVE Constructora S.A. de C.V.', 'ARQUITECTURA', 'Colonia y avenida santa victoria #24 S.S.', 22251338, 'Ing. Cynthia de Menjivar', 'c.menjivar@aveconstructora.net', NULL, '1'),
(22, 'Grupo Senior, S.A. de C.V.', 'ARQUITECTURA', 'Av. Bernal Centro Comercial plaza Bernal 2da. Plantalocal 16, s.s.', 22847093, 'Ing. Alfredo Cruz', 'a.cruz@gruposenior.net', NULL, '1'),
(23, 'Almacenes Vidrí, S.A. de C.V. 2', 'COMERCIO', 'C. zacamilCentro Comercial plaza metropolis mejicanos', 22725000, 'Nelson Mauricio Flores Sosa', 'nflores@vidri.com.sv', NULL, '1'),
(24, 'Centro Nacional de Registros', 'CNR', '1 calle pte y final 43 av. Nte #2310, San Salvador', 25138400, 'Arq. Cristina Aracely Chávez de Rosales', 'cchavez@cnr.gob.sv', NULL, '1'),
(25, 'CAESS 8', 'ELECTRICIDAD', 'Calle el bambú col. San Antonio', 25299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com', NULL, '1'),
(26, 'Alamacenes Vidrí, S.A. de C.V.', 'COMERCIALIZACIÓN', 'Calle zacamil Centro Comercial Metropolis', 22725000, 'Nelson Mauricio Flores Sosa', 'nflores@vidri.com.sv', NULL, '1'),
(28, 'Banco Agrícola', 'BANCO', 'Colonia San Benito Calle Loma Linda #154', 25148490, 'Dory de Martínez y Margarita Gald{amez', 'mgaldamez@bancoagricola.com.sv', NULL, '1'),
(29, 'ISNA', 'ISNA', 'Av. Irazú y final calle santa marta No. 2 Col. Costa Rica', 22134781, 'Dinora Elizabeth Argueta Andaluz', 'dinoraargueta@outlook.com', NULL, '1'),
(30, 'Corte Suprema de Justicia', 'CSJ', 'Diagonal Universitaria Centro de Gobierno edificio de oficinas administrativas y jurídicas de la C:S:J:, San Salvador', 22318300, 'Arq. Rafael Antonio Claros', 'rafaclarosxto@yahoo.com', NULL, '1'),
(31, 'COLEGIO GABRIELA MISTRAL', 'ARQUITECTURA', 'COL. LAS MARGARITAS IV ETAPA CALLE PRINCIPAL POL E', 22924674, 'LICDA. ARGENTINA SANTOS', 'COLEGIOGAM@YAHOO.ES', NULL, '1'),
(32, 'FONAVIPO', 'ARQUITECTURA', 'Alameda Juan Pablo II entre 37 y 39 av. Nte. Edificio Fonavipo', 22578888, 'Arq. Walter Velasco', 'walter.velasco@fonavipo.gob.sv', NULL, '1'),
(33, 'MOPTVDU Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Lic. José Arturo Cardona', 'arturo.cardona@mop.gob.sv', NULL, '1'),
(35, 'CENTRO DE PISCINAS Y CISTERNAS S.A. DE C.V. 1', 'COMERCIALIZACIÓN', 'AV. LOS ANDES No. 2980, LOCAL D COL. MIRAMONTE, S.S.', 22601364, 'CARMEN ELENA COREAS MARTINEZ', 'centrodepiscina@gmail.com', NULL, '1'),
(36, 'ALMACENES VIDRI S.A. DE C.V. 3', 'COMPRA Y VENTA DE ARTICULOS DE FERRETERIA', '21 AV SUR ENTRE 12 Y 14 CALLE PTE S.S.', 22714033, 'JAIME CINCUIK', 'JCINCUIR@VIDRI.COM.SV', NULL, '1'),
(37, 'ANAYA LEIVA Y CIA. DESPACHO CONTABLE ANAYA MONTALVO', 'SERVICIOS DE CONTABILIDAD', '19CALLE PTE. No. 444 LOCAL 3 S.S.', 22262235, 'JOSE BORIS MONTALVO MENJIVAR', 'BORI.MONTALVO57@HOTMAIL.COM', NULL, '1'),
(38, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA FERROCARRILES NACIONALES DE EL SALVADOR', 'AUTONOMA', 'FINAL AV. PERALTA No. 903 S.S.', 22414100, 'ANGELICA TORRES GRANADOS', 'ANGELICA.TORRES@VEPA.GOB.SV', NULL, '1'),
(39, 'ISSS', 'Recursos Humanos salud', 'AV. JUAN PABLO II y 39 AVE. NTE. Edificio El Salvador', 25913048, 'Licda. Jenny de Valiente', NULL, NULL, '1'),
(41, 'MENJIVAR MENJIVARY AUDITORES CONSULTORES S.A. DE C.-V.', 'SERVICIOS DE AUDITORIA Y CONTABILIDAD', '7A AV NTE Y 5A CALLE PTE PLAZA SAN ANGEL LOCAL 206 S.S.', 22718573, 'SRA ANA GLORIA RIVERA', 'MENJIVARAUDITORES@YAHOO.COM', NULL, '1'),
(42, 'ASOCIACION PSORIASIS NUEVA VIDA EL SALVADOR', 'ASOCIACION SIN FINES DE LUCRO', 'RES SANTA TERESA 17 AV NTE #15 LOCAL 2 2A PLANTA CONTIGUO A FCA 1 CUIDAD MERLIOT', 23026699, 'EVELYN ROXANA DE AGUIRRE', 'PSORIASIS_NUEVAVIDA@HOTMAIL.COM', NULL, '1'),
(43, 'DIRECCION GENERAL DE ADMINISTRACION MINISTERIO DE HACIENDA', 'MINISTERIO CONTA', 'S.S.', 22443000, 'LIC CARLOS MANUEL ABREGO', NULL, NULL, '1'),
(47, 'UNICOMER, S.A. DE C.V. A CURACAO CENTRO', 'COMERCIALIZACION', 'CALLE RUBEN DARIO No 515 SAN SALVADOR', 22218159, 'Misael Alejandro Cruz Bojorquez', NULL, NULL, '1'),
(48, 'ACOESUR, S.A. DE C.V.', 'ASOCIACION COOPERATIVA DE AHORRO Y CREDITO', 'BOULEVARD CONSTITUCION #504 EDIF. SUPER REPUESTOS, SAN SALVADOR', 22392049, 'WENDY LISSETTE AZUCENA', 'wendy.azucena@superrepuestos.com.sv', NULL, '1'),
(49, 'DISTRIBUIDORA MORAZAN S.A de C.V', 'COMERCIO/CONTADURIA', 'APOPA, CARRETERA TRONCAL DEL NORTE', 22017707, 'MANUEL EDGARDO SEGOVIA CONTRERAS', 'Manuel_segovia@lamorazan.com', NULL, '1'),
(50, 'SORTO GALICIA Y ASOCIADOS', 'DESPACHO CONTABLE', '13 CALLE ORIENTE Y PASAJE SAGRERA N° 13 CENTRO COMERCIAL METRO ESPAÑA LOCAL 211', 22712648, 'JORGE ALBERTO SORTO BONILLA', 'sortogalicia_asociados@yahoo.com.mx', NULL, '1'),
(51, 'A P DE CENTROAMERICA S.A. DE C.V.', 'INDUSTRIA DE LA CONSTRUCCION', 'CALLE QUEQUISQUE #46 G JARDINES DE MERLIOT SANTA TECLA', 22892069, 'ARQ. HERBERT QUINTANILLA', 'HQUINTANILLA.AP@GMAIL.COM', NULL, '1'),
(52, 'VOLUNTARIOS CONSTRUYENDO EL SALVADOR', 'ACTIVIDADES DE SAESORAMIENTO EMPRESARIAL', 'URB LA SULTANA CALLE LOS LAURELES Y PJE LOS CEDROS #18D ANTIGUO CUSCATLAN', 22433655, 'ALEXANDER JAFET MORALES MANCIA', 'JAFET.MORALES@TECHO.ORG', NULL, '1'),
(53, 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN', 'MINISTERIO DE HACIENDA', 'S.S.', 22443000, 'LIC CARLOS MANUEL ABREGO', NULL, NULL, '1'),
(54, 'CENTRO DE PISCINAS Y CISTERNAS S.A. DE C.V. 2', 'CONSTRUCCIÓN', 'AV. LOS ANDES #2980 COL.MIRAMONTE', 22601364, 'CARMEN ELENA COREAS MARTINEZ', 'BODEGASCENTRODEPISCINAS@GMAIL.COM', NULL, '1'),
(55, 'INFRA DE EL SALVADOR 1', 'FABRICACION DE GASES INDUSTRIALES', '25 AV. NTE #1080 S.S.', 22343210, 'SONIA ELIZABETH LOPEZ', 'NORMA.FUNES@OXGASA.COM', NULL, '1'),
(56, 'ALCALDIA MUNICIPAL DE CUSCATANCINGO', 'ADMINISTRACION PUBLICA', 'CALLE EL CALVARIO #48 CUSCATANCINGO', 25268600, 'PAOLA ARTERO\nFRANCISCO JUAREZ', 'RRHUMANOS.CUSCATANCINGO@GMAIL.COM', NULL, '1'),
(57, 'DFA DESPACHO FINANCIERO AGUILA', 'DESPACHO FINANCIERO', 'AV LOS ESPLIEGOS Y CALLO LOS EUCALIPTOS CASAS 10 COL LAS MERCEDES S.S.', 22365004, 'LIC. RAQUEL MOTTO DE GALVEZ', 'REQUELMOTTO@GMAIL.COM', NULL, '1'),
(58, 'BANCO PROMERICA', 'FINANZAS', 'COLONIA SANTA URSULA AV EL RECREO', 25351517, 'BEYRA DE CHICAS', 'BYANES@PROMERICA.COM.SV', NULL, '1'),
(59, 'APLEI', 'CONTABILIDAD', 'CASA COMUNAL COMUNIDAD IBERIA', 73136865, 'MARCO ANTONIO VALLADARES PAIZ', NULL, NULL, '1'),
(60, 'MENJIVAR Y MENJIVAR AUDITORES CONSULTORES S.A. DE C.V.', 'SERVICIOS DE AUDITORIA Y CONTABILIDAD', '7A AVENIDA NTE Y 5A CALL PTE PLAZA SAN ALGELLOCAL 206 S.S.', 227185723, 'SRA ANA GLORIA RIVERA', 'MENJIVARAUDITORES@YAHOO.COM', NULL, '1'),
(61, 'Recinos Recinos y CIA', 'DESPACHO CONTABLE', 'Reparto y calle los Heroes No. 48 -A', 22732054, 'LIC. PABLO NOÉ RECINOS', 'RRYCIA.GERENCIA@GMAIL.COM', NULL, '1'),
(62, 'COOPERATIVA FINANCIERA EMPRESARIAL ACACES DE R.L.', 'COOPERATIVA', 'AV. OLIMPICA Y 71 AV. SUR #3719 COLONIA ESCALON', 25612300, 'LIC. RAUL ANTONIO ARTIGA HERRERA', 'RRHH@ACACES.COM.SV', NULL, '1'),
(63, 'SORTO GALICIA Y ASOCIADOS', 'DESPACHO CONTABLE Y AUDITORIA', '13 CALLE OTE. Y PASAJE SAGRERA N° 13 CENTRO COMERCIAL METRO ESPAÑA LOCAL 211, SAN SALVADOR.', 22712648, 'JORGE ALBERTO SORTO BONILLA', 'sortogalicia_asociados@yahoo.com.mx', NULL, '1'),
(64, 'COMPAÑÍA PANAMERICANA DE AVIACION', 'TRANSPORTE AEREO DE PASAJEROS', '89 AV NTE Y CALLE EL MIRADOR EDIFICIO WORD TRADE CENTER LOCAL 107', 22092641, 'BILY MAX MONROY', 'BMMONROY@COMPAIR.COM', NULL, '1'),
(65, 'VIDRIO INDUSTRIAL, S.A. DE C.V.', 'INDUSTRIA DE VIDRIO -ESPEJOS-ALUMINIO', 'AV MONSEÑOR OSCAR ROMERO Y 33 CALLE OTE #1804 COL LA RABIDA S.S.', 222671718, 'LIC. JOSE DAVID JIMENEZ FRANCO', 'GERENCIA@VIDRIOINDUSTRIAL.COM', NULL, '1'),
(83, 'La Prensa Grafica', 'Imprenta', 'San Salvador', 22736005, 'Hector Enrique Ramirez', NULL, NULL, '1'),
(84, 'MASTERGRAFIC', 'ACTIVIDADE SERVICIO RELAIONADO A LA IMPRESIÓN', 'CALLE EL ROSAL COL MIRAMONTE TE No121 S.S.S', 22604422, 'JORGE ELIAS', 'MLOPEZ@MASTERGRAFIC', NULL, '1'),
(85, 'COLEGIO DRA. MARI SOLA DE SELLARES', 'INSTITUCION/DISEÑO', 'SOYAPANGO', 25124955, 'Lorena Astrid Gonzales', NULL, NULL, '1'),
(86, 'IPRINT COLOR', 'DISEÑO', 'C.C. PLAZA MUNDO LOCAL 173 SOYAPANGO', 22778263, 'Milagro Rosales', 'info@iprintcolor.com', NULL, '1'),
(87, 'DIALPHA, S.A. DE C.V.', 'INSUMOS MEDICOS', 'SAN SALVADOR', 22072760, 'MONICA DE RIVERA', 'MERCADEO@DIALPHASV.COM', NULL, '1'),
(88, 'INSTITUTO TECNICO RICALDONE 1', 'EDUCACION', 'CENTRO URB, LIBERTAD AV AGUILARES No. 218 S.S.', 22346000, 'HERMANO RODRIGO MENDEZ', NULL, NULL, '1'),
(90, 'INSTITUTO TECNICO RICALDONE 2', 'EDUCACION', 'ITR', NULL, 'MARVIN TORRES P. MANUEL', 'marvin_torres@ricaldone.edu.sv', NULL, '1'),
(91, 'MULTIDEAS PUBLICIDAD', 'PUBLICIDAD', 'CALLE CONSTITUCIÓN #17 POLIGONO N CIUDAD SATELITE S.S', 25661036, 'CHIRSTIAN ERNESTO RAMIRES', 'MULTIDEASPUBLICIDAD@GMAIL.COM', NULL, '1'),
(92, 'CENTRO ESCOLAR "BENJAMIN BLOOM"', 'EDUCACIÓN', 'CARRETERA TRONCAL DEL NTE. KM 12 1/2 APOPA', 22169408, 'NORMA RUIZ DE CARRANZA', 'NORMA.DECARRANZA@GMAIL.COM', NULL, '1'),
(93, 'MULTILINE S.A. DE C.V.', 'VENTA DE MOBILIARIO Y EQUIPO', 'CALLE LOMA LIDA CASA 204 CON SAN BENITO S.S.', 22103880, 'SILVIA DOMINGUEZ SIRI', 'IDEASMULTILINE@GMAIL.COM', NULL, '1'),
(94, 'LA PRENSA GRAFICA', 'PRENSA', 'BLVD SANTA ELENA FRENTE A EMBAJADA AMERICANA', 22412752, 'HÉCTOR RAMIREZ', 'hramirez@laprensagrafica.com', NULL, '1'),
(95, 'COLEGIO CRISTIANO HOREB', 'SERVICIOS EDUCATIVOS', 'RES. SAN PEDRO POLG. 14E #3 Y 4 MEJICANOS', 21310934, 'ARACLY DEL CARMEN RIVAS CASTANEDA', 'COLEGIO_OREB@HOTMAIL.COM', NULL, '1'),
(96, 'INSTITUTO BADASH EL SALVADOR', 'DESARROLLO DE RECURSOS HUMANOS', 'AV. LAS CAMELIAS No 7 Y CALLE LOS BAMBUES COL. SAN FRANCISCO', 22243622, 'LIC. FERNANDO ZELEDON', 'CNL@BAHAIELSALVADOR.ORG', NULL, '1'),
(97, 'UNIVERSIDAD DON BOSCO', 'SERVICIOS EDUCATIVOS', 'SOYAPANGO S.S.', 22518217, 'LIC. JOSE ERAZO', 'joseerazo@udb.edu.sv', NULL, '1'),
(98, 'CLIDELFA', 'DENTAL', 'AYUTUXTEPEQUE', 22728613, 'WLTER DANIEL CRUZ', NULL, NULL, '1'),
(99, 'UNIVERSIDAD DON BOSCO', 'EDUCACION SUPERIOR', 'CALLE AL PLAN DEL PINO KM 1 1/2 SOYAPANGO', 22518217, 'LIC. JOSE LEON ERAZO ERAZO', 'JOSERAZO@UDB.EDU.SV', NULL, '1'),
(100, 'FEDECASES DE R.L.', 'COOPERATIVA', '25 CALLE PTE. COL SAN JORGE #1301', 25553580, 'LIC. ARISTIDES ALBERTO MENJIVAR', 'ARISTIDES.MENJIVAR@FEDECACES.COM', NULL, '1'),
(101, 'ITR 1', 'EDUCACION', 'CENTRO URB. LIBERTAD AV. AGUILARES NO. 218', 22346000, 'MARVIN TORRES', 'marvin_torres@ricaldone.edu.sv', NULL, '1'),
(102, 'ITR 2', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(103, 'Divina providencia- Colegio', 'EDUCACION', 'Av. Concepción No. 426 San Salvador', 22221935, 'María Angélica López Vicente', 'mariaangelicalopezvicente@yahoo.com', NULL, '1'),
(104, 'GRUPO DECOART, S.A. DE C.V.', 'REAIZACION DE EVENTOS SERVICIO MONTAJE', '3A AV NTE #1620 S.S.', 22355535, 'GUILLERMO ENRIQUE RIVERA', 'INFO@GRUPODECOARTE.COM', NULL, '1'),
(105, 'VIP Marketing, S.A. de C.V.', 'PUBLICIDAD', 'COL. BUENOS AIRES AV ALVARADO COND. 2000-D, S.S.', 23524727, 'MARVIN BATAZAR CHAVEZ ORTIZ', 'ventasvipmaketing@gmail.com', NULL, '1'),
(106, 'LA PRENSA GRÁFICA', 'MEDIO IMPRESO', 'BULEVAR SANTA ELENA, FRENTE EMBAJADA AMERICANA', 22412752, 'HECTOR RAMIREZ', 'hramirez@laprensagrafica.com', NULL, '1'),
(107, 'SIGMA Q REPRO S.A.', NULL, 'Blvd.del ejercito nacional km 3 1/2 Soyapango', 25676000, 'Ernesto David Rodríguez Siguenza', 'erodriguez@repro.sigma.com', NULL, '1'),
(108, 'MIXTO', 'Imprenta', 'Calle Sisimiles No. 114 Col. Jardines de Miramonte', 25127285, 'Janine Jerez', 'mixto.mixto@hotmail.com', NULL, '1'),
(109, 'PUNTO PRINT', 'PUBLICIDAD', 'REPARTO Y PASEO MIRALVALLE NO. 24 S.S.S', 22743888, 'MARIA DE LOS ANGELES ARGUETA', 'PUNTOPRINTSV@HOTMAIL.COM', NULL, '1'),
(110, 'MIXTO', 'Imprenta', 'Calle Sisimiles No. 114 Col. Jardines de Miramonte', 25127285, 'Janine Jerez', 'mixto.mixto@hotmail.com', NULL, '1'),
(111, 'VIP MARKETING S.A. DE C.V.', 'PUBLICIDAD', 'COL BUENOS AIRES AV ALVARADO CON2000-D S.S.', 23524727, 'MARVIN BALTAZAR CHAVEZ ORTIZ', 'VENTASVIPMARKETIN@GMAIL.COM', NULL, '1'),
(112, 'MIXTO', 'DISEÑO GRAFICO', 'COL MIRAMONTE', 25127285, 'JANINE', NULL, NULL, '1'),
(113, 'MIXTO', 'DISEÑO GRAFICO', NULL, NULL, NULL, NULL, NULL, '1'),
(114, 'MELRO Y ASOCIADOS S.A. DE C.V', 'ARQUITECTURA Y DISEÑO GRAFICO', '75 AVE. NORTE, PASAJE TIO CONRRA #13 SAN SALVADOR', 22074568, 'SARAH MELENDEZ MARTINEZ', 'melroyasociados@gmail.com', NULL, '1'),
(115, 'A & CREATIVA S.A. DE C.V.', 'DISEÑO GRAFICO', 'CALLE CIRCUMBALACION EDIFICIO INTEL LOCAL 9 TERCERA PLANTA', 22604774, 'BLANCA RIVERA DE CORDOVA', NULL, NULL, '1'),
(116, 'Angel Editores', 'DISEÑO GRAFICO', '12 AV. NTE #1330 COL. MAGAÑA', 22263976, 'FABRICIO ANGEL', 'ANGELEDITORRES@YAHOO.COM', NULL, '1'),
(117, 'ITR 3', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(118, 'MIXCO', 'DISEÑO GRAFICO', NULL, NULL, NULL, NULL, NULL, '1'),
(119, 'MULTIDEAS PUBLICIDAD', 'PUBLICIDAD', 'CALLE CONSTITUCIÓN NO. 17 POLIGONO N CIUDAD SATELITE, S.S.', 25661036, 'CHRISTIAN ERNESTO RAMIREZ', 'MULTIDEASPUBLICIDAD@GMAIL.COM', NULL, '1'),
(121, 'PUNTO PRINT', 'PUBLICIDAD', 'REPARTO Y PASEO MIRALVALLE CASA 24 S.S.', 22743888, 'MA DE LOS ANGELES ARGUETA', 'PUNTOPRINTSV@GMAIL.COM', NULL, '1'),
(122, 'ITR 5', 'CONCEJO', 'ITR', 22346000, 'P. MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(123, 'Punto Print', NULL, 'Blvd. Costitución y paseo miralvalle contiguo a papa jonhs', 22743888, 'Mario Argueta Castillo', 'puntoprintsv@gmail.com', NULL, '1'),
(124, 'ISSS INSTITUTO SALVADOREÑO DEL SEGURO SOCIAL', 'SERVICIOS DE SALUD', 'CUIDADELA MONSERRAT', 25916720, 'ING,. ENRIQUE ANTONIO ESTEVEZ\nING. LUIS A. HERRERA', 'ENRIQUE.ESTEVEZ@ISSS.GOB.SV', NULL, '1'),
(125, 'SERVICIOS Y CONSULTORIAS INDUSTRIALES', 'ELECTROMECANICA', 'CARRETERA A LOS PLANES DE RENDEROS PJE KRIETE #8-A SAN MARCOS', 25632291, 'ALEXGONZALO ZACARIAS VASQUEZ', 'SERCOINDESA@HOTMAIL.COM', NULL, '1'),
(126, 'CHS COMERCIAL S.A. DE C.V.', 'VENTA DE MATERIALES ELECTRICOS', 'BLVD ALTAMIRA #13 RES ALTAMIRA S.S.', 22486700, 'FREDY VASQUEZ', 'EPINEDA@CHS.COM.SV', NULL, '1'),
(129, 'FILAMENTOS PLASTICOS S.A.', 'FABRICACION DE PRODUCTOS PLASTICOS', 'BLVD. DEL EJERCITO #2615 ENTRADA A LA COLONIA LA CHACRA', 22931367, 'CARLOS ALFREDO MONTOYA', 'MOTOYA_CARLOSAL@HOTMAIL.COM', NULL, '1'),
(130, 'IMDISAR, SA. DE C.V.', 'TALLER DE MECANICA', 'COL. FLOR BLANCA #2419 S.S.', 22983680, 'EDWIN FLORES ESCOBAR', 'INDISARELSALVADOR@INDISAR.COM', NULL, '1'),
(131, 'FREISMAN S.A. DE .C.V.', 'FABRICANTE DE REPUESTOS INDUSTRIALES\nSERVICIOS DE MANTENIMIENTO Y MONTAJE', 'FINAL 41 CALLE PTE Y 2A AV NTE LOCAL 11-13 COLONIA SHANGRI-LAS.S.', 21315165, 'ROBIN JOE CAMPOS SALDAÑA', 'FREISMAN_SA@HOTMAIL.COM', NULL, '1'),
(132, 'CEPA COMISION EECUTIVA PORTUARIA AUTONOMA', 'SERVICIOS AEROPORTUARIOS Y PORTUARIOS', 'AEROPUERTO COMALAPA', 23492210, 'LEONARDO HASBUN', 'LEONARDO.HASBUN@CEPA.GOB', NULL, '1'),
(133, 'INTERPA S.A. DEC.V.', 'VENTA DE REPUESTOS', '29 CALLE PTE #1225 COL LAYCO S.S.', 22257994, 'ING. ROBERTO MOLINA', 'ROBERTOMOLINA@INTERPA-SA-COM', NULL, '1'),
(134, 'MELHER S.A. DE C.V.', 'ELABORACION COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1-BIS COL LAS COLINAS MEJICANOS', 25006800, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM\nGGOMEZ@MELHER.COM', NULL, '1'),
(135, 'TALLER INDUSTRIAL NAVAS', 'TRABAJOS DE MECANICA INDUSTRIAL', '21 AVSUR NO 4 COL SANTA CRISTINA BO SANTANITA', 22224976, 'SANDRA AIME NAVAS QUINTANILLA', NULL, NULL, '1'),
(136, 'INDUSTRIA RECICLADORA DE METALES Y PLASTICO //PROMETÍ', 'FABRICACION DE PROD METALICOS PARA USO ESTUCTURAL// EMCA', 'AV JUAN BERTIS CASA 137 CIUDAD DELGADOLA GRITA S.S. //AV BARRERA 254 BARRIO SAN JACINTO', 22762734, 'MARIO ARNOLDO HERNANDEZ HERNANDEZ', 'METAPLAS@HOTMAIL.ES', NULL, '1'),
(137, 'INDUSTRIAS POSADA 4', 'INDUSTRIA TALLER TORNO Y OBRA DE BANCO', '25 CALLE OTE #137 BO. SAN MIGUELITO', 22356413, 'JULIO SALVADOR POSADA ALVAREZ', 'INSDUSTRIASPOSADA@GMAIL.COM', NULL, '1'),
(138, 'MONTAJES AGRICOLAS', 'REPARACION Y SERVICIOS NO CLASIFICADOS PREVIAMENTE', 'BLVD. DEL EJERCITO KM 9 LOTE 1 LOCAL 3 Y 4 ILOPANGO S.S.', 22944822, 'YIMI ELENILSON OSORIO', 'MONTAJES.AGRICOLAS@HOTMAIL.COM', NULL, '1'),
(139, 'FRITER', 'INSTALACION, REPARACION Y MANTENIMIENTO DE SISTEMAS DE REFRIGERACION', '13 CALLE OTE #154 S.S. BO. SAN MIGUELITO', 22211769, 'ING. CARLOS YUDICE', 'FRITER.SV@YAHOO.COM', NULL, '1'),
(140, 'Corporación Bonima (Bayer)\nTalleres excel automotriz (Didea)', NULL, '21 av. Nte entre av. Juan Pablo II y calle lols andes col. Miramonte\nDidea km 1 1/2 carretera panamericana Ilopango', 22674700, 'Juan José Bonilla (bayer)\nOmar Rivera (Didea)', 'IVAN.GALVEZ@BAYER.COM', NULL, '1'),
(141, 'CANAL 10', 'ESPACIO DE TV', 'SANTA TECLA', 22280811, 'AURELIO MARIN', 'AURELIO MARIN@HOTMAIL.COM', NULL, '1'),
(142, 'PROMEIN, PROCESOS MECANICOS E INDUSTRIALES', 'INDUSTRIA METAL MECANICA', 'BLVD. SUR ENTRE 12 Y 14 AV #1819, SANTA TECLA', 25215409, 'CARLOS ALBERTO LOPEZ RAMOS', 'BLVD SUR #2021 SANTA TECLA', NULL, '1'),
(143, 'MELHER, S.A. DE C.V.', 'ELABORACION COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1-BIS COL LAS COLINAS MEJICANOS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM', NULL, '1'),
(144, 'ALMACENES VIDRI S.A. DE C.V. 4', 'FERRETERIA', 'CENTRO COMERCIAL METROPOLIS', 22725000, 'SERGIO MENDEZ', 'SERGIOMENDEZ@VIDRI.COM.SV', NULL, '1'),
(145, 'OPRUMEDICAL', NULL, NULL, NULL, 'Carlos Platero', NULL, NULL, '1'),
(146, 'METAPLAST', 'TALLER DE MECANICA', 'AV. JUAN BERLIS #137 COL LAS VICTORIAS CIUDAD DELGADO', 22762734, 'DANIEL MORENO', 'INDMETALPLAST@HOTMAIL.COM', NULL, '1'),
(147, 'CAESS 7', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'Calle el bambú Ayutuxtepeque', 25299235, 'Luis Umanzor', 'LUIS.UMANZOR@AES.COM', NULL, '1'),
(148, 'METALPLAS', 'TALLER DE MECANICA', 'AV JUAN BERTIS 137 COL LAS VICTORIAS CIUDAD DELGADO', NULL, 'MARIO HERNANDEZ', 'INGMETAPLAS@HOTMAIL.COM', NULL, '1'),
(149, 'INDUSTRIA DE MADERAS Y METALES S..A DE C.V.', 'INDUSTRIA', 'COLONIA CUCUMACAYAN CAYE CENTRAL 161 S.S', 22229002, 'SRA EVELUN DIAZ', 'METALMECANICA@TOROGOZ.COM', NULL, '1'),
(150, 'ITR- CONSEJO', 'CONSEJO', 'ITR', 22346000, 'P. MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(151, 'CAESS 6', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'CALLE Y COLONIA EL BAMBU', 25299066, 'Benjamín Vasquez', 'BENJAMIN.VASQUEZ@AES.COM', NULL, '1'),
(152, 'SIETELSA, S.A. DE C.V.', NULL, 'Final 5 av. Nte. Col y pae alfaro No. 506 mejicanos', 22261027, 'David Rivas Gómez', 'david.rivas@sietelsaonline.com', NULL, '1'),
(153, 'Servicios Industriales J.F.', 'TALLER INDUSTRIAL', '6a. Calle pte. Cl. No 1-8A, Santa Tecla, Laibertad', 22887070, 'Lic. José Augusto Fuentes', 'SERVICIOSINDUSTRIALESJF@HOTMAIL.COM', NULL, '1'),
(154, 'GRUPO PENIEL', 'FABRICACIÓN DE PRODUCTOS DE ALUMINIO Y VIDRIO', 'JARDINES DE LA LIBERTAD CALLE CHILTIUPAN LOCAL 11', 22782444, 'Brenda Guadalupe Miranda Marroquin', NULL, NULL, '1'),
(155, 'Industrias La Comstancia, S.A. de C.V.', 'ELECTROMECANICA', 'Av. Independencia#526 San Salvador', 25024353, 'Omar Alberto Argueta', 'ilc.sabmiller.com', NULL, '1'),
(156, 'SIETELSA, SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'FINAL 5 AV NTE COL Y PAJE ALFARO No. 506 MEJICANOS', 22261027, 'JORGE ALBERTO VELASCO', 'ROBERTO.GARCIA@SIETELSAONLINE.COM', NULL, '1'),
(157, 'TALLER DE TORNO Y SOLDADURA SAN ANTONIO', 'RECONSTRUCION DE PIEZAS', '4A CALLE PTE Y 13 AV SUR BO. CONCEPCION S.V.', 23930889, 'MARCO ANTONIO MERINO', 'N/A', NULL, '1'),
(158, 'INDUSTRIAS POSADA 1', 'ELECTROMECANICA', 'BO. SAN MIGUELITO 25 CALLE OTE. 137 S.S.', 22512095, 'BALTAZAR CRUZ', NULL, NULL, '1'),
(159, 'MELHER S..A DE C.V.', 'ELABORACION DE COBERTURA DE CHOCOLATE', 'AV. POETA ROLANDO ELIAS #1 COL LAS COLINAS MEJICANOS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM', NULL, '1'),
(160, 'ALMACENES VIDRI S.A. DE C.V. 2', 'FERRETERIA', 'CENTRO COMERCIAL SUCURSAL METROPOLIS', 22725000, 'NELSON FLORES', 'S.METROPOLIS@VIDRI.COM.SV', NULL, '1'),
(161, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA 2', 'SERVICIOS PORTUARIOS Y AEROPORTUARIOS', 'AEROPUERTO INTERNACIONAL SAN LUIS TALPA, LA PAZ', 23662273, 'ING. MAURICIO ALVAREZ', 'MAURICIO.ALVAREZ@CEPA.GOB.SV', NULL, '1'),
(163, 'Didea Taller los Héroes', NULL, '51 av. Nte. Alam. Juan Pablo II y av. Los andes col. Miramonte atrás de DIDEA los heroes', 22104344, 'Ing. Omar Rivera', NULL, NULL, '1'),
(164, 'MECATRONICA S.A. DE C.V.', 'OTRAS ACTIVIDADES DE SERVICIO', 'RESD. LA CIMA II OTE AV. A No. 9-G', 22765784, 'JOSE CECILIO DE LEON', 'INFO@MECATRONICA.COM', NULL, '1'),
(165, 'MAFER SERVICIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM', NULL, '1'),
(166, 'INGELMAT S.A. DE C.V.', 'INSTALACIONES ELECTRICAS', 'SERVICIOS DE ENERGIA ELECTRICA', 22451355, 'ING. JAIME AMAYA', 'INGELMAT1@YAHOO.ES', NULL, '1'),
(167, 'MELHER, S.A. DE C.V.', 'ELABORACION DE COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1 BIS COL LAS COLINAS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM', NULL, '1'),
(168, 'Alcaldia Municipal de Quezaltepeque', NULL, 'Av. José María Castro 2ACalle pte.', 23436705, 'Gladys Esmeralda Ruano Recinos', 'esmeraldajdrecinos@outlook.es', NULL, '1'),
(170, 'CEPA', 'AEROPUERTO /EMCA', 'COMALAPA', 22491300, 'LIC. JOSUE RAMOS', 'N/A', NULL, '1'),
(171, 'SIEMENS', 'AUTOMATIZACION', 'CALLE SIEMENS', 22783333, 'ING. CARLOS MENJIVAR', 'CARLOSERNESTO.MENJIVAR@SIEMENS.COM', NULL, '1'),
(172, 'CAESS 1', NULL, 'Colonia San Antonio calle el Bambú No. 186', 25299066, 'Ing. Benjamin Vasquez', 'benjamin.vasquez', NULL, '1'),
(173, 'MAFER SERVICIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUCTRIALES@GMAIL.COM', NULL, '1'),
(174, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA 1', 'SERVICIOS PORTUARIO Y AEROPORTUARIO', 'BLVD LOS HEROES TORRE ROBLEE METROCENTRO', 22491467, 'MIRNA FUENTES DE PEÑA', 'MIRNA.FUENTES@CEPA.GOB.SV', NULL, '1'),
(175, 'INDUSTRIA CENTROAMERICANA DE ALIMENTOS', 'ELABORACION DE SALSAS ADEREZOS Y ESPECIES', 'COL LAS COLINAS BLOCK G #11 MEJICANOS, S.S.', 22726954, 'LIC. CARLOS RAMON FIGUEROA', 'INDUCENTRAL@ELSALVADOR.COM', NULL, '1'),
(176, 'Almacenes Vidrí, S.A. de C.V. 3', NULL, 'Calle al volcan pasaje la Ermita , mejicanos S.S.', 22324033, 'Edwin Flores', 'alvisa065@vidri.com.sv', NULL, '1'),
(177, 'ALMACENES VIDRI S.A. DE C.V. 1', 'FERRETERIA', 'SUCURSAL MEJICANOS', 22324033, 'SAUL ERNESTO CASTANEDA CARRANZA', 'SCASTANEDA@VIDRI.COM', NULL, '1'),
(178, 'COMPRESORES REPUESTOS Y SERVICIOS, S.A. DE CV', 'RECTIFICADO Y VENTA DE MOTORES', '67 AV. SUR No. 140, COL ESCALON', 22466666, 'TELIA SANCHEZ', NULL, NULL, '1'),
(179, 'SIEMENS S.A.', 'CENTA DE PRODUCTOS ELECTRICOS Y OTROS', 'CALLE SIMENS #43 ANTIGUO CUSCATLAN', 22482333, 'CARLOS ERNESTO MENJIVAR', NULL, NULL, '1'),
(180, 'INDUSTRIAS POSADA 3', 'INDUSTRIA (TORNO FRESADORA OBRA DE BANCO', '25 CALLE OTE #137 BO. SAN MIGUELITO S.S.', 22512095, 'JULIO SALVADOR POSADA ALVAREZ', 'INDUSTRRIASPOSADA@GMAIL.COM', NULL, '1'),
(181, 'INDUSTRIAS POSADA 2', 'INDUSTRIA (TALLER TORNO Y OBRA DE BANCO)', '25CALLE OTE #137 BO. SAN MIGUELITO, S.S.', 22356413, 'JULIO SALVADOR PPOSADA ALVAREZ', 'INDUSTRIASPOSADA@GMAIL.COM', NULL, '1'),
(182, 'MAFER SERVICIOS INDUSTRIALES', 'FASBRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV. NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM', NULL, '1'),
(183, 'INFRA DE EL SALVADOR 2', 'GASES MÉDICOS ELECTRONICA', 'San Salvador', 22324033, 'Nelson M. Flores Sosa', 'nflores@vidri.com.sv', NULL, '1'),
(184, 'CAESS 3', 'DISTRIBUIDORA DE ELECTRICIDAD', 'CALLE Y COLONIA EL BAMBU', 25299066, 'BENJAMIN VASQUEZ', 'BENJAMIN.VASQUEZ@AES.COM', NULL, '1'),
(186, 'COMPRES S.A. DE C.V. 1', 'METAL MECANICA', '67 AV SUR #140 COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIASANCHEZ@COMPRES.COM.SV', NULL, '1'),
(187, 'INSELPRO S.A. DE C.V.', 'ELECTRICIDAD', 'COL. ESCALON CALLE ARTURO AMBROGHI #525', 22649736, 'MAURICIO CRISTALES', 'OPERACIONES@INSELPRO.COM', NULL, '1'),
(188, 'TALLER DIDEA', 'MECANICA', '51 AV NTE ENTRE ALAM JUAN PABLO II Y AVENIDA LOS ANDES COL MIRAMONTE ATRÁS DE DIDEA LOS HEROES S.S.', 22104343, 'ING. OMAR RIVERA', 'N/A', NULL, '1'),
(189, 'HOTEL CROWNE PLAZA SAN SALVADOR', 'HOTELES', '87 Y 11 CALL PTE COL ESCALON', 25000716, 'JULIO RAFAEL MENJIVAR MOLINA', 'JULIO.MENJIVAR@HOTELSAL.COM', NULL, '1'),
(190, 'MAFER SERVCIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO S.S.', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM', NULL, '1'),
(191, 'CEPA AEROPUERTO INTERNACIONAL DE EL SALVADOR', 'SERVICIOS PORTUARIOS', 'AEROPUERTO INTERNACIONAL DE EL SALVADOR', 23492476, 'LUIS E. SAGET B.', 'LUIS.SAGET@CEPA.GOB.SV', NULL, '1'),
(212, 'SIEMENS, S.A. DE C.V.', 'ELECTROMECANICA', 'Parque industrial Santa Elena, calle siemens #43 Antoguo Cuscatlan', 22487333, 'Ing. Enrique Campos', 'enrique.campos@siemens.com', NULL, '1'),
(213, 'AGROSANIA, S.A. DE C.V. 1', 'PRODUCTOS LACTEOS', '51 AV. SUR No. 1738, COL. JARDINES DE MONSERRAT, S.S.', 24054028, 'PAOLA ALEJANDRA BATRES', NULL, NULL, '1'),
(214, 'ITR 11', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '1'),
(215, 'ITR 7', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '1'),
(216, 'ITR 8', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '1'),
(217, 'SERVITOTAL', 'REPARACION DE ARTICULOS DE LINEA CAFÉ', 'Av. España No. 620', 22317008, 'Joaquín Anchieta', 'joaquin_anchieta@servitotal.com', NULL, '1'),
(218, 'SERVITOTAL', 'REPARACION DE ARTICULOS', 'AVENIDA ESPAÑA No. 620, S.S.', 22317008, 'JOAQUIN ANCHIETA', 'JOAQUIN_ANCHIETA@SERVITOTAL.COM', NULL, '1'),
(219, 'TALLERES EXCEL S.A de C.V', 'REPARACION MECANICA DE VEHICULOS AUTOMOTORES', 'SAN SALVADOR', 22104200, 'ING. EMANUEL OMAR RIVERA CANJURA', 'eorivera@excelautomotriz.com', NULL, '1'),
(220, 'Grupo Aereo Policial', 'MANTENIMIENTO DE AVIACION', 'Aeropuerto Internacional Ilopango', 22962516, 'TMA. Miguel Ernesto Miranda Cordova', 'apulomiranda@yahoo.com', NULL, '1'),
(221, 'Almacenes Vidrí, S.A. de C.V. 4', 'COMERCIO', 'Calle zacamil Centro Comercial Metropolis', 22725000, 'Nelson Ernesto Bonilla Chavez', 'nelson.bonilla@aes.com', NULL, '1'),
(222, 'Omnimusic, S.A. De C.V.', 'Electrónica', '11 calle poniente #3937 entre 75 y 77 av. Nte colonia Escalon', 22633869, 'Tec. David Enrique Tejada', 'taller@omnimusicsv.com', NULL, '1'),
(223, 'ITR 9', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '1'),
(224, 'Almacenes Vidrí, S.A. de C.V. 1', 'COMERCIO', 'Calle al volcan y pasaje la ermita, mejicanos S.S.', 22324033, 'Aaron Dagoberto Paredes', 'scastaneda@vidri.com.sv', NULL, '1'),
(225, 'OBIPADO DE ZACATECOLUCA', 'RELIGIOSO', '4a. CALLE PONIENTE #7 ZACATECOLUCA', 22340287, 'MONSEÑOR SAMUEL ELIAS BOLAÑOS', 'SAMUELAVELAR@GMAIL.COM', NULL, '1'),
(226, 'ANDA', 'CAPTACION, TRATAMIENTO Y SUMINISTRO DE AGUA', 'COL ESLOVAN AV. LAS MAGNOLIAS PLANTEL JALACATL SAN MIGUEL', 26002060, 'SALVADOR SANCHEZ SARAVIA', 'SALVADOR.SANCHEZ@ANDA.GOB.SV', NULL, '1'),
(227, 'AEROMAN', 'ELECTRONICA\nELECTOMECANICA', 'AEROPUERTO INTERNACIONAL, SAN LUIS TALPA', 23124000, 'JESUS CRUZ', 'susana.rodriguez@aeroman.com.sv', NULL, '1'),
(228, 'CAESS S.A. DE C.V.', 'ELECTRICIDAD', 'COL EL BAMBU', 25299085, 'JOSE ROBERTO SALAZAR BARAHONA', 'ROBERTO.SALAZAR@AES.COM', NULL, '1'),
(229, 'ITR 10', 'consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(230, 'Empresarios Juveniles', 'LIQUIDACION DE CONSTANCIAS DE DOCENTES', '85 av. Norte y 15 calle pte. #905, Col Escalón', 22655354, 'Ing. Raúl Pacheco', 'rpacheco@empresariosjuveniles.org', NULL, '1'),
(231, 'SOLUCIONES PROFESIONALES S.A. DE C.V.', 'ELECTRONICA', 'San Salvador', 78626457, 'Jose Mustafa Alens Mancia', NULL, NULL, '1'),
(232, 'SIEMENS, S.A. DE C.V.', 'ELECTROMECANICA', 'Parque industrial Santa Elena, calle siemens #43 Antoguo Cuscatlan', 22487333, 'Ing. Enrique Campos', 'enrique.campos@siemens.com', NULL, '1'),
(233, 'AES El Salvador', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'Final 29 av. Nte. Y calle el Bambu, Ayutuxtepeque', 25299192, 'Nelson Ernesto Bonilla Chavez', 'nelson.bonilla@aes.com', NULL, '1'),
(234, 'ITR 4', 'Consejo', 'ITR', 22346000, 'P.PADRE MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(235, 'TEXTUFIL', 'ECA', 'SOYAPANGO', 22770066, 'LICDA. RINA AGUILAR', NULL, NULL, '1'),
(236, 'SIATELSA, S.A. DE C.V.', 'SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'FINAL 5A. AV NTE COL Y PJE ALFARO No. 506 MEJICANOS', 22261027, 'WALTER ARTURO MENJIVAR', NULL, NULL, '1'),
(237, 'Omnimusic, S.A. De C.V.', NULL, '11 calle poniente #3937 entre 75 y 77 av. Nte colonia Escalon', 22633869, 'Tec. David Tejada', 'taller@omnisport.com', NULL, '1'),
(238, 'OMNIMUSIC, S.A. DE C.V.', 'VENTA DE INSTRUMENTOS MUSICALES', '11 CALLE PTE NO3937 ENTRE 77 Y 75 AV NTE COL ESCALON S.S.', 22633849, 'LICDA CECILIA DE MATINEZ', 'GERRENCIA.ADMON@OMNIMUSICSV.COM', NULL, '1'),
(239, 'INGENIO EL ANGEL S.A. DE C.V.', 'INGENIO AZUCARERO', 'KM 14 1/2 C. A QUEZALTEPEQUE APOPA', 22012600, 'ING, IRVIN AGUILAR', 'IRVING.AGUILAR@INGENIOELANGEL.COM', NULL, '1'),
(240, 'SERVITOTAL', 'REPARACION DE ARTICULOS LINEA CAFÉ', 'Av. España No. 620', 22317008, 'Joaquín Anchieta', 'joaquin_anchieta@servitotal.com', NULL, '1'),
(241, 'CIDECA, S.A. DE C.V.', 'SERVICIOS DE INGENIERIA', 'Av. Las camelias #7A Col. San Francisco S.S.', 22230274, 'Aracely Palacios', 'aracely.palacios@cideca.net', NULL, '1'),
(242, 'GRUPO COMPRES', 'VENTA DE OTROS PRODUCTOS NO ELASTICOS', '67 AV SUR #140, COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIASANCHEZ@COMPRES.COM.SV', NULL, '1'),
(243, 'AGROSANIA, S.A. DE C.V. 2', 'INDUSTRIA DE LACTEOS', '51 AV. SUR No. 1738 COLONIA MONSERRAT, SAN SALVADOR', 24054028, 'PAOLA ALEJANDRA BATRES', NULL, NULL, '1'),
(244, 'OMNI MUSIC, S.A. DE C.V.', 'ELECTRÓNICA', '11 CALLE PTE. ENTRE 75 Y 77 AV. NTE, #3937, SAN SALVADOR', 22633849, 'LICDA. CECILIA DE MARTINEZ', NULL, NULL, '1'),
(245, 'CENTRO DE PISCINAS Y SISTERNAS S.A. DE C.V. 3', 'SERVICIOS', 'AVENIDA LOS ANDES #2980 COL. MIRAMONTE', 22601364, 'CARMEN ELENA COREAS MARTÍNEZ', 'CENTRODEPISCINAS@GMAIL.COM', NULL, '1'),
(247, 'ALMACENES VIDRI', 'ELECTRONICA', 'CALLE AL VOLCAN MEJICANOS', 22324033, 'AARON PAREDES', 'SCASTANEDA @VIDRI.COM.SV', NULL, '1'),
(248, 'FONAVIPO (FONDO NACIONAL PARA LA VIVIENDA NACIONAL)', 'BANCA (SEGUNDO PISO)', 'Entre 37 y 39 av. Alameda juan pablo II, S.S.', 22578829, 'Licda. Katia Navarrete', 'katia.navarrete@fonavipo.gob.sv', NULL, '1'),
(249, 'CAESS 2', 'ELECTRICIDAD', 'Calle el bambú Colonia San Antonio, Ayutuxtepeque', 25299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com', NULL, '1'),
(250, 'LACTEOS CHALATE', 'PRODUCCION Y PROCESAMIENTO DE PRODUCTOS LACTEOS', '11A CALLE OTE. BARRIO EL ROSARIO NVA CONCEPCION CHALATENANGO', 23068269, 'MIGUEL EDUARDO ARTEAGA CAMPOS', 'LEENPI@HOTMAIL.COM', NULL, '1'),
(251, 'COMPRES S.A. DE C.V. 2', 'VENTA DE OTROS PRODUCTOS NO CLASIFICADOS', '67 AV SUR #140 COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIA.SANCHEZ@COMPRES.COM', NULL, '1'),
(252, 'CAESS 5', 'LUZ Y FUERZA', 'COL SAN ANTONIO CALLE EL BAMBU AYUTUXTEPQUE', 25299236, 'ARMANDO GUEVARA', 'ARMANDO.GUEVARA@AES.COM', NULL, '1'),
(253, 'ITR 12', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(254, 'GRUPO MTZ INTELECI, S.A. DE CV.', 'INFORMATICA', 'CALLE LOS BAMBUES AV LAS GARDEIAS #424-A COOL SAN FRANCISCO', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELECI.COM', NULL, '1'),
(255, 'COOPERATIVA ZAFIRO DE R.L.', 'COOPERATIVA', NULL, NULL, 'JORGE EDGARDO GARCÍA', NULL, NULL, '1'),
(256, 'MICRONET, S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22359499, 'CARLOS ALBERTO GARCIA', NULL, NULL, '1'),
(257, 'RG OUTSOURCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S.', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '1'),
(258, 'RG OUTSOURCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S.', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '1'),
(262, 'RG OUTSOURSING S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '1'),
(263, 'GRUPO TUSELL', 'RECTIFICADO DE MOTORES', '6 CALLE PTE Y 23 AV SUR No. 1112 S.S.', 22716300, 'RAFAEL TUSELL', 'RTUSELL@MTCORPORATIVO.COM', NULL, '1'),
(265, 'GRUPO MTZ NENTELECI S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELESI.COM', NULL, '1'),
(267, 'MICRONET S.A. DE C .V.', 'INFORMATICA', 'S.S.', NULL, 'CARLOS ALBERTO GARCIA', NULL, NULL, '1'),
(268, 'MICRONET S.A. DE C.V.', NULL, NULL, NULL, 'CARLOS ALBERTO GARCIA', NULL, NULL, '1'),
(270, 'GRUPO MTZ INENTELECI, S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELECI.COM', NULL, '1'),
(272, 'RG OUTSORCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', '.S.S', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '1'),
(273, 'MICRONET, S.A. DE C.V.', 'INFORMATICA', NULL, NULL, 'CARLOS ALBERTO GARCIA', NULL, NULL, '1'),
(274, 'GIMNASIO FIBRA VITALITY', 'SERVICIOS', '9 AVE. SUR EDIFICIO PATRICIA #304 4 PLANTA, S.S', 76414432, 'ESPERANZA GARCIA MEJIA', 'GFIBRAVITALITY@GMAIL.COM', NULL, '1'),
(277, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221036, 'Lic. Raúl Ernesto Castillo Hernández', 'RAUL.HERNANDEZ@MINED.GOB.SV', NULL, '1'),
(278, 'GALAXIA DEPORTES S.A. DE C.V.', 'VENTA DEARTICULOS DEPORTIVOS', 'METROCENTRO', 22601010, 'LICDA. ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM', NULL, '1'),
(281, 'COSTISS DE RL', 'INFORMATICA', 'DIAGONAL ARTURO ROMERO AMBRIGI QUINTA GUADALUPE COL AMERICA 434 S.S.', 25254207, 'VICTOR ANTONIO PINEDA', 'victor.pineda69@hotmail.com', NULL, '1'),
(282, 'SERVICIOS GLOBALES LOGÍSTICOS, S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV. SUR COL. ROMA CENTRO ROMA LOCAL 22 S.S.', 22838010, 'JUAN FERNANDO PARADA GÓMEZ', 'FERNADO.PARADA@SGL.COM.SV', NULL, '1'),
(283, 'GALAXIA DEPORTES', 'VENTA DE ARTICULOS DEPORTIVOS', 'METROCENTRO', 22611010, 'ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM', NULL, '1'),
(285, 'SERVICIOS GLOBALES LOGISTICOS S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'JUAN FERNANDO PARADA GOMEZ', 'FERNANDO.PARADA@SGL.COM.SV', NULL, '1'),
(286, 'Galaxia Deportes, S.A. de C.V.', 'COMERCIALIZADORA', 'LOCAL 2 T. TORRE ROBLE , METROCENTRO SAN SALVADOR', 22611010, 'LICDA. ANDREA AMAYA', 'a.amaya@galaxia.com.sv', NULL, '1'),
(287, 'GALAXIA', 'DEPORTES', 'LOCAL 2T TORRE ROBLE ,METROCENTRO SAN SALVADOR', 22611010, 'ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM', NULL, '1'),
(289, 'SERVICIOS GLOBALES LOGISTICOS S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'Licenciado JUAN FERNANDO PARADA GOMEZ', 'FERNADO.PARADA@SLG.COM.SV', NULL, '1'),
(292, 'SERVICIOS GLOBALES LOGISTICOS, S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'JUAN FERNANDO PARADA GOMEZ', 'FERNANDO.PARADA@SGL.COM.SV', NULL, '1'),
(293, 'AMERICAS TOURS', 'AGENCIA DE VIAJES', 'BLVD SANTA ELENA CC ATRIUM PLAZA LOCAL 11 NIVEL 1', 22605476, 'DANIEL BELTRAN DIAZ', 'AMERICASTOURS@AMERICASTOURS.COM', NULL, '1'),
(300, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '1'),
(301, 'Saturno, S.A. de C.V.', NULL, 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '1'),
(303, 'CABLEPUNTOCOM, S.A. DE C.V.', 'CONSULTORES DE EQUIPO INFORMATICO', 'AV. SIERRA NEVADA COL. MIRAMONTE #184 S.S.', 22604803, 'BERTA DE QUINTEROS', 'BERTADEQUINTEROS@INTEGRA.COM', NULL, '1'),
(305, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '1'),
(307, 'CIRCUITO YSR RADIO QUE BUENA', 'RADIO', 'ALAMEDA ROSSELVETL EDIFICIO 2-4-6', 22092000, 'GLAUCO RODRIGUEZ', NULL, NULL, '1'),
(308, 'Saturno, S.A. de C.V.', 'JOYERIA // PROYECTO INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '1'),
(309, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221061, 'Lic. Raúl Ernesto Castillo Hernández', 'raul.hernandez@mined.gob.sv', NULL, '1'),
(311, 'KR INVESTMENT, S.A. DE C.V.', 'INFORMATICA', '23 CALLE PONIENTE CALLE LA SVICTORIAS COL LAYCO PALOMO #154', 22006724, 'CARLOS ANTONIO RUIZ RAMOS', NULL, NULL, '1'),
(312, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '1'),
(313, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEXANDER HERNANDEZ', NULL, NULL, '1'),
(314, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTUIPAN #5/6 CUIDAD MERLIOT', 22890391, 'JOSE ROBERTO CASTILLO', NULL, NULL, '1'),
(315, 'TOTOS PIZZA', 'METAPAN', 'METAPAN', 24111798, 'ALEX HERNANDEZ LANDAVERDE', 'ALEX_HERNANDEZ301', NULL, '1'),
(317, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221036, 'Lic. Raúl Ernesto Castillo Hernández', 'RAUL.HERNANDEZ@MINED.GOB.SV', NULL, '1'),
(318, 'COLEGIO BRADFORD', 'EDUCACION / PROYECTO INFO', 'COL LAS TRES MAGNOLIAS MEJICANOS', 0, 'CARMEN RIVERA', 'N/A', NULL, '1'),
(319, 'ACORDE', 'RESTAURANTE', NULL, NULL, NULL, NULL, NULL, '1'),
(323, 'ITR 6', 'CONSEJO', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '1'),
(324, 'BANCOFIT; ACORDES', 'INTERMEDIACION FINANCIERA ; RESTAURANTE', 'ALAMEDA ROSSELVETL 41 AVENIDA NTE #2174 COL FLOR BLANCA', 22617900, 'JUAN GONZALO RECINOS', 'RECINOS@BANCOFIT.COM.SV', NULL, '1'),
(325, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEX HERNANDEZ', NULL, NULL, '1'),
(326, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTUIUPAN #5/6 CIUDAD MERLIORT', 22890391, 'JOSE ROBERTO CASTILLO', NULL, NULL, '1'),
(328, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEX HERNANDEZ', NULL, NULL, '1'),
(329, 'ACORDES', 'RESTAURANTE', NULL, NULL, NULL, NULL, NULL, '1'),
(330, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTIUPAN #5/6 CIUDAD MERLIOT', 22890391, 'JOSE ROBERTO CASTILLO', NULL, NULL, '1'),
(331, 'AAA', 'AAA', 'AAB', 222, '222', '2@hotmail', '1', '1'),
(332, 'D', 'D', 'D', 22929292, '"', 'd@g.com', '2', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(2) NOT NULL,
  `especialidad` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `especialidad`) VALUES
(1, 'Arquitectura'),
(2, 'Contaduría'),
(3, 'Diseño Gráfico'),
(4, 'Electromecánica'),
(5, 'Electrónica'),
(6, 'Sistemas Informáticos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espeempresa`
--

CREATE TABLE `espeempresa` (
  `id_espeempresa` int(11) NOT NULL,
  `empresa` int(11) NOT NULL,
  `especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ex_alumnos`
--

CREATE TABLE `ex_alumnos` (
  `id_exalumnos` int(8) NOT NULL,
  `contraseña` int(8) NOT NULL,
  `nombre1` varchar(35) NOT NULL,
  `apellido1` varchar(35) NOT NULL,
  `telefono` int(8) NOT NULL,
  `ocupacion` int(11) NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `observacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ex_alumnos`
--

INSERT INTO `ex_alumnos` (`id_exalumnos`, `contraseña`, `nombre1`, `apellido1`, `telefono`, `ocupacion`, `correo_electronico`, `observacion`) VALUES
(11116666, 666, 'Diego', 'Quinteros', 0, 1, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_academico`
--

CREATE TABLE `grupo_academico` (
  `id_grupo_aca` int(2) NOT NULL,
  `grupo_aca` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo_academico`
--

INSERT INTO `grupo_academico` (`id_grupo_aca`, `grupo_aca`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_tecnico`
--

CREATE TABLE `grupo_tecnico` (
  `id_grupo_tec` int(2) NOT NULL,
  `grupo_tec` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo_tecnico`
--

INSERT INTO `grupo_tecnico` (`id_grupo_tec`, `grupo_tec`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `cod_mensaje` int(11) NOT NULL,
  `id_usuario_destino` int(11) DEFAULT NULL,
  `id_empre_destino` int(11) DEFAULT NULL,
  `id_exalum_destino` int(11) DEFAULT NULL,
  `id_exalum_origen` int(11) DEFAULT NULL,
  `id_empre_origen` int(11) DEFAULT NULL,
  `id_usuario_origen` int(11) DEFAULT NULL,
  `admin_ori` tinyint(1) DEFAULT NULL,
  `admin_des` tinyint(1) DEFAULT NULL,
  `titulo` varchar(70) NOT NULL,
  `contenido` varchar(1600) NOT NULL,
  `fecha_enviado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_leeido` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`cod_mensaje`, `id_usuario_destino`, `id_empre_destino`, `id_exalum_destino`, `id_exalum_origen`, `id_empre_origen`, `id_usuario_origen`, `admin_ori`, `admin_des`, `titulo`, `contenido`, `fecha_enviado`, `fecha_leeido`) VALUES
(1, NULL, NULL, NULL, NULL, 115, NULL, NULL, 1, 'HU', 'HE', '2016-07-12 04:39:12', NULL),
(2, NULL, NULL, NULL, NULL, 115, NULL, NULL, 1, 'MENSAJE DE EMPRESA - ENVIO DE USU Y CONTRA', 'CORREO EMPRESA: diegoquinteros02.04.97@gmail.com AL PROPIETARIO: Diego', '2016-07-12 04:43:13', '0000-00-00 00:00:00'),
(3, NULL, NULL, NULL, NULL, 115, NULL, NULL, 1, 'MENSAJE DEL SISTEMA - EMPRESA CON ID: 115 Y NOMBRE: Array SOLICITA USU', 'CORREO EMPRESA: diegoquinteros02.04.97@gmail.com AL PROPIETARIO: Diego', '2016-07-12 04:49:56', '0000-00-00 00:00:00'),
(4, NULL, NULL, NULL, NULL, 115, NULL, NULL, 1, 'MENSAJE DEL SISTEMA - EMPRESA CON ID: 115 Y NOMBRE: A & CREATIVA S.A. ', 'CORREO EMPRESA: diegoquinteros02.04.97@gmail.com AL PROPIETARIO: Diego', '2016-07-12 04:53:26', '0000-00-00 00:00:00'),
(5, NULL, NULL, NULL, 11116666, NULL, NULL, NULL, 1, 'D', 'A', '2016-07-13 23:48:13', NULL),
(6, NULL, NULL, NULL, 11116666, NULL, NULL, NULL, 1, 'Prueba', 'Contenido de la prueba', '2016-07-14 00:51:03', NULL),
(7, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'Esto es un mensaje de prueba ayuda saber si', 'ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODALODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL ODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL MODAL', '2016-07-14 00:54:53', NULL),
(8, NULL, NULL, 11116666, NULL, NULL, NULL, 1, NULL, 'Probar enviar', 'Probando si se envio el mensaje', '2016-07-14 14:16:12', NULL),
(9, NULL, NULL, NULL, NULL, NULL, 20110122, NULL, 1, 'Titulo', 'Mensaje', '2016-07-15 03:01:20', NULL),
(10, NULL, NULL, NULL, NULL, 331, NULL, NULL, 1, 'Probando envio de mensajes', 'Enviado', '2016-07-15 08:58:36', NULL),
(11, NULL, NULL, NULL, NULL, NULL, 20110122, NULL, 1, 'Prueba con el profe pa que vea que furula', 'Yeah', '2016-07-15 15:52:54', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupaciones`
--

CREATE TABLE `ocupaciones` (
  `id_ocupacion` int(2) NOT NULL,
  `ocupacion` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ocupaciones`
--

INSERT INTO `ocupaciones` (`id_ocupacion`, `ocupacion`) VALUES
(1, 'Empleado'),
(2, 'Desempleado'),
(3, 'Estudiante Universitario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `id_exalum_encargado` int(11) DEFAULT NULL,
  `id_empre_encargado` int(11) DEFAULT NULL,
  `titulo` int(75) NOT NULL,
  `descripcion` varchar(666) NOT NULL,
  `fecha_propuesto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vigente` tinyint(1) NOT NULL DEFAULT '1',
  `remunerado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id_proyecto`, `id_exalum_encargado`, `id_empre_encargado`, `titulo`, `descripcion`, `fecha_propuesto`, `vigente`, `remunerado`) VALUES
(1, NULL, 331, 0, 'Estoy probando esto a las 5 a.m.', '2016-07-15 10:59:09', 1, 0),
(2, NULL, 331, 0, 'Nuevo', '2016-07-15 11:01:39', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrospp`
--

CREATE TABLE `registrospp` (
  `id_registropp` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  `empresa` int(11) NOT NULL,
  `finalizo` tinyint(1) NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  `acuerdo` tinyint(1) NOT NULL,
  `bitacora` tinyint(1) NOT NULL,
  `carta` tinyint(1) NOT NULL,
  `evaluaciones` tinyint(1) NOT NULL,
  `observacion_final` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registrospp`
--

INSERT INTO `registrospp` (`id_registropp`, `alumno`, `empresa`, `finalizo`, `observaciones`, `acuerdo`, `bitacora`, `carta`, `evaluaciones`, `observacion_final`) VALUES
(1, 20110122, 1, 0, '', 0, 0, 0, 0, ''),
(2, 1, 3, 1, 'JI', 1, 0, 0, 0, 'Hi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id_seccion` int(2) NOT NULL,
  `seccion` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_seccion`, `seccion`) VALUES
(1, 'A'),
(2, 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `id_sesion` int(11) NOT NULL,
  `unisesion` varchar(100) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `os` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_alum`
--

CREATE TABLE `sesiones_alum` (
  `id_sesion` int(11) NOT NULL,
  `unisesion` varchar(100) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `os` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_empre`
--

CREATE TABLE `sesiones_empre` (
  `id_sesion` int(11) NOT NULL,
  `unisesion` varchar(100) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `os` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_exalum`
--

CREATE TABLE `sesiones_exalum` (
  `id_sesion` int(11) NOT NULL,
  `unisesion` varchar(100) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `os` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id_visita` int(11) NOT NULL,
  `empresa` int(11) NOT NULL,
  `fecha_ultima_visita` date NOT NULL,
  `observaciones` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`codigo_admin`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`carnet`),
  ADD KEY `grado` (`grado`),
  ADD KEY `especialidad` (`especialidad`),
  ADD KEY `grupo_Tecnic` (`grupo_Tecnic`),
  ADD KEY `secc` (`secc`),
  ADD KEY `grupo_academ` (`grupo_academ`);

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id_anuncio`);

--
-- Indices de la tabla `años`
--
ALTER TABLE `años`
  ADD PRIMARY KEY (`id_año`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentosempre`
--
ALTER TABLE `departamentosempre`
  ADD PRIMARY KEY (`id_depar`),
  ADD KEY `empresa` (`empresa`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `codigo_empresa` (`codigo_empresa`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `espeempresa`
--
ALTER TABLE `espeempresa`
  ADD PRIMARY KEY (`id_espeempresa`),
  ADD KEY `empresa` (`empresa`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `ex_alumnos`
--
ALTER TABLE `ex_alumnos`
  ADD PRIMARY KEY (`id_exalumnos`),
  ADD KEY `ocupacion` (`ocupacion`);

--
-- Indices de la tabla `grupo_academico`
--
ALTER TABLE `grupo_academico`
  ADD PRIMARY KEY (`id_grupo_aca`);

--
-- Indices de la tabla `grupo_tecnico`
--
ALTER TABLE `grupo_tecnico`
  ADD PRIMARY KEY (`id_grupo_tec`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`cod_mensaje`),
  ADD KEY `id_empre_origen` (`id_empre_destino`),
  ADD KEY `id_usuario_destino` (`id_usuario_destino`),
  ADD KEY `id_empre_origen_2` (`id_empre_origen`),
  ADD KEY `id_usuario_origen_2` (`id_usuario_origen`),
  ADD KEY `id_exalum_origen` (`id_exalum_origen`),
  ADD KEY `id_exalum_destino` (`id_exalum_destino`);

--
-- Indices de la tabla `ocupaciones`
--
ALTER TABLE `ocupaciones`
  ADD PRIMARY KEY (`id_ocupacion`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `id_usu_encargado` (`id_exalum_encargado`),
  ADD KEY `id_empre_encargado` (`id_empre_encargado`);

--
-- Indices de la tabla `registrospp`
--
ALTER TABLE `registrospp`
  ADD PRIMARY KEY (`id_registropp`),
  ADD KEY `alumno` (`alumno`),
  ADD KEY `empresa` (`empresa`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id_seccion`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `sesiones_alum`
--
ALTER TABLE `sesiones_alum`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `sesiones_empre`
--
ALTER TABLE `sesiones_empre`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `sesiones_exalum`
--
ALTER TABLE `sesiones_exalum`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id_visita`),
  ADD KEY `empresa` (`empresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id_anuncio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `años`
--
ALTER TABLE `años`
  MODIFY `id_año` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `departamentosempre`
--
ALTER TABLE `departamentosempre`
  MODIFY `id_depar` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;
--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `espeempresa`
--
ALTER TABLE `espeempresa`
  MODIFY `id_espeempresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grupo_academico`
--
ALTER TABLE `grupo_academico`
  MODIFY `id_grupo_aca` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `grupo_tecnico`
--
ALTER TABLE `grupo_tecnico`
  MODIFY `id_grupo_tec` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `cod_mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `ocupaciones`
--
ALTER TABLE `ocupaciones`
  MODIFY `id_ocupacion` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `registrospp`
--
ALTER TABLE `registrospp`
  MODIFY `id_registropp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_seccion` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sesiones_alum`
--
ALTER TABLE `sesiones_alum`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sesiones_empre`
--
ALTER TABLE `sesiones_empre`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sesiones_exalum`
--
ALTER TABLE `sesiones_exalum`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`grupo_Tecnic`) REFERENCES `grupo_tecnico` (`id_grupo_tec`),
  ADD CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`grado`) REFERENCES `años` (`id_año`),
  ADD CONSTRAINT `alumnos_ibfk_3` FOREIGN KEY (`secc`) REFERENCES `secciones` (`id_seccion`),
  ADD CONSTRAINT `alumnos_ibfk_4` FOREIGN KEY (`grupo_academ`) REFERENCES `grupo_academico` (`id_grupo_aca`),
  ADD CONSTRAINT `alumnos_ibfk_5` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`id_especialidad`);

--
-- Filtros para la tabla `departamentosempre`
--
ALTER TABLE `departamentosempre`
  ADD CONSTRAINT `departamentosempre_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `espeempresa`
--
ALTER TABLE `espeempresa`
  ADD CONSTRAINT `espeempresa_ibfk_1` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `espeempresa_ibfk_2` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `ex_alumnos`
--
ALTER TABLE `ex_alumnos`
  ADD CONSTRAINT `ex_alumnos_ibfk_1` FOREIGN KEY (`ocupacion`) REFERENCES `ocupaciones` (`id_ocupacion`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `em_empre_ori` FOREIGN KEY (`id_empre_origen`) REFERENCES `empresas` (`id_empresa`),
  ADD CONSTRAINT `em_exa_des` FOREIGN KEY (`id_exalum_destino`) REFERENCES `ex_alumnos` (`id_exalumnos`),
  ADD CONSTRAINT `em_exa_ori` FOREIGN KEY (`id_exalum_origen`) REFERENCES `ex_alumnos` (`id_exalumnos`),
  ADD CONSTRAINT `em_usu_des` FOREIGN KEY (`id_usuario_destino`) REFERENCES `alumnos` (`carnet`),
  ADD CONSTRAINT `em_usu_ori` FOREIGN KEY (`id_usuario_origen`) REFERENCES `alumnos` (`carnet`),
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_empre_destino`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`id_exalum_encargado`) REFERENCES `ex_alumnos` (`id_exalumnos`),
  ADD CONSTRAINT `proyecto_ibfk_2` FOREIGN KEY (`id_empre_encargado`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `registrospp`
--
ALTER TABLE `registrospp`
  ADD CONSTRAINT `registrospp_ibfk_1` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`carnet`),
  ADD CONSTRAINT `registrospp_ibfk_2` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`usuario`) REFERENCES `administradores` (`codigo_admin`);

--
-- Filtros para la tabla `sesiones_alum`
--
ALTER TABLE `sesiones_alum`
  ADD CONSTRAINT `fk_alum` FOREIGN KEY (`usuario`) REFERENCES `alumnos` (`carnet`);

--
-- Filtros para la tabla `sesiones_empre`
--
ALTER TABLE `sesiones_empre`
  ADD CONSTRAINT `fk_empre` FOREIGN KEY (`usuario`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `sesiones_exalum`
--
ALTER TABLE `sesiones_exalum`
  ADD CONSTRAINT `fk_exalum` FOREIGN KEY (`usuario`) REFERENCES `ex_alumnos` (`id_exalumnos`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
