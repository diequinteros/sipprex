-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2016 a las 15:30:14
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `discount`
--
CREATE DATABASE IF NOT EXISTS `discount` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `discount`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` int(10) UNSIGNED NOT NULL,
  `nombre_cargo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(75) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `nombre_cargo`, `descripcion`) VALUES
(2, 'Secretari@', 'Encargad@ del papeleo externo'),
(3, 'Gerente General', 'Encargado de el control de los empleados'),
(5, 'Ingeniero', 'Encargado de la infraestructura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id_descuento` int(10) UNSIGNED NOT NULL,
  `nombre_descuento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `porcentaje` decimal(5,4) UNSIGNED NOT NULL,
  `limite` decimal(5,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `descuentos`
--

INSERT INTO `descuentos` (`id_descuento`, `nombre_descuento`, `porcentaje`, `limite`) VALUES
(1, 'ISSS', '0.0300', '30.00'),
(3, 'AFP', '0.0625', '398.57'),
(4, 'PPS', '0.0400', '125.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `nombre1` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `nombre2` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre3` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido1` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellido3` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sueldo_base` decimal(6,2) UNSIGNED NOT NULL,
  `fecha_ing` date NOT NULL,
  `id_cargo` int(10) UNSIGNED NOT NULL,
  `dui` int(9) UNSIGNED NOT NULL,
  `telefono` int(8) UNSIGNED NOT NULL,
  `direccion` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `no_cuenta` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre1`, `nombre2`, `nombre3`, `apellido1`, `apellido2`, `apellido3`, `sueldo_base`, `fecha_ing`, `id_cargo`, `dui`, `telefono`, `direccion`, `no_cuenta`) VALUES
(1, 'Brayan', 'Adolfo', '', 'Romero', 'Payes', '', '500.00', '2016-06-03', 2, 123445678, 78654321, 'En tu casa', 4294967295),
(2, 'Andrea', 'Nicole', '', 'Urbina', 'Mena', '', '999.00', '2016-06-04', 3, 187364375, 98765432, 'Su casa', 4294967295),
(3, 'Jorge', 'Alejandro', '', 'Calderón', 'De Paz', '', '274.00', '2001-01-02', 3, 98765432, 12345678, 'Mi casa', 4294967295),
(4, 'Oscar', '', '', 'Martinez', 'Ramirez', '', '600.00', '2015-01-01', 5, 438548574, 76543218, 'Calle Poniente #32', 23456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre_empresa` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `modo_pago` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_empre` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre_empresa`, `modo_pago`, `id_tipo_empre`) VALUES
(2, 'PEPE.inc', 'Cheque', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personales`
--

CREATE TABLE `personales` (
  `id_dpersonal` int(10) UNSIGNED NOT NULL,
  `nombre_dpersonal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `porcentaje_personal` decimal(3,2) UNSIGNED NOT NULL,
  `id_empleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personales`
--

INSERT INTO `personales` (`id_dpersonal`, `nombre_dpersonal`, `porcentaje_personal`, `id_empleado`) VALUES
(1, 'Caja de Crédito Hipotéca', '0.30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planillas`
--

CREATE TABLE `planillas` (
  `id_planilla` int(10) UNSIGNED NOT NULL,
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `sueldo_base` decimal(6,2) UNSIGNED NOT NULL,
  `isss` decimal(4,2) UNSIGNED NOT NULL,
  `afp` decimal(6,2) UNSIGNED NOT NULL,
  `renta` decimal(8,2) UNSIGNED DEFAULT NULL,
  `indemnizacion` decimal(6,2) UNSIGNED DEFAULT NULL,
  `vacaciones` decimal(6,2) UNSIGNED DEFAULT NULL,
  `sueldo_final` decimal(6,2) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `aguinaldo` decimal(6,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planillas`
--

INSERT INTO `planillas` (`id_planilla`, `id_empleado`, `sueldo_base`, `isss`, `afp`, `renta`, `indemnizacion`, `vacaciones`, `sueldo_final`, `fecha`, `aguinaldo`) VALUES
(2, 1, '500.00', '15.00', '31.25', '20.47', '1.37', '0.00', '433.28', '2016-06-03', '0.00'),
(3, 1, '500.00', '15.00', '31.25', '20.47', '1.37', '0.00', '433.28', '2016-06-03', '0.00'),
(4, 1, '500.00', '15.00', '31.25', '20.47', '1.37', '325.00', '433.28', '2016-06-08', '0.00'),
(5, 4, '600.00', '18.00', '37.50', '30.47', '1.64', '390.00', '514.03', '2016-06-09', '0.00'),
(6, 3, '274.00', '8.22', '17.13', '0.00', '0.75', '178.10', '248.66', '2016-06-09', '0.00'),
(7, 3, '274.00', '8.22', '17.13', '0.00', '0.75', '178.10', '248.66', '2016-06-18', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empresa`
--

CREATE TABLE `tipo_empresa` (
  `id_tipo_empre` int(10) UNSIGNED NOT NULL,
  `nombre_tipoe` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `salario_min` decimal(6,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_empresa`
--

INSERT INTO `tipo_empresa` (`id_tipo_empre`, `nombre_tipoe`, `salario_min`) VALUES
(1, 'Comercio', '251.70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usu` int(10) UNSIGNED NOT NULL,
  `nombre_tipo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usu`, `nombre_tipo`, `descripcion`) VALUES
(1, 'Administrador', 'Control total en el sitio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nombre_usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `contraseña` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_usu` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `contraseña`, `id_tipo_usu`) VALUES
(1, 'AlejandroCalderón', '123456', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id_descuento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dui` (`dui`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `id_cargo_2` (`id_cargo`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `id_tipo_empre` (`id_tipo_empre`);

--
-- Indices de la tabla `personales`
--
ALTER TABLE `personales`
  ADD PRIMARY KEY (`id_dpersonal`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `planillas`
--
ALTER TABLE `planillas`
  ADD PRIMARY KEY (`id_planilla`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `tipo_empresa`
--
ALTER TABLE `tipo_empresa`
  ADD PRIMARY KEY (`id_tipo_empre`),
  ADD UNIQUE KEY `nombre_tipoe` (`nombre_tipoe`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usu`),
  ADD UNIQUE KEY `nombre_tipo` (`nombre_tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo_usu` (`id_tipo_usu`),
  ADD KEY `id_usuario_2` (`id_usuario`),
  ADD KEY `id_usuario_3` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id_descuento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `personales`
--
ALTER TABLE `personales`
  MODIFY `id_dpersonal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `planillas`
--
ALTER TABLE `planillas`
  MODIFY `id_planilla` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tipo_empresa`
--
ALTER TABLE `tipo_empresa`
  MODIFY `id_tipo_empre` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_tipoe` FOREIGN KEY (`id_tipo_empre`) REFERENCES `tipo_empresa` (`id_tipo_empre`);

--
-- Filtros para la tabla `personales`
--
ALTER TABLE `personales`
  ADD CONSTRAINT `fk_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `planillas`
--
ALTER TABLE `planillas`
  ADD CONSTRAINT `fk_empleados2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_tipou` FOREIGN KEY (`id_tipo_usu`) REFERENCES `tipo_usuario` (`id_tipo_usu`);
--
-- Base de datos: `journal`
--
CREATE DATABASE IF NOT EXISTS `journal` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `journal`;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{"snap_to_grid":"off","angular_direct":"direct","relation_lines":"true","full_screen":"on"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'Base100%real', '{"quick_or_custom":"quick","what":"sql","db_select[]":["discount","journal","phpmyadmin","rikoshop","siprex","ssppea","test","tienda"],"output_format":"sendit","filename_template":"@SERVER@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Estructura de la tabla @TABLE@","latex_structure_continued_caption":"Estructura de la tabla @TABLE@ (continÃºa)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Contenido de la tabla @TABLE@","latex_data_continued_caption":"Contenido de la tabla @TABLE@ (continÃºa)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","yaml_structure_or_data":"data","":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"ssppea","table":"administradores"},{"db":"ssppea","table":"empresas"},{"db":"ssppea","table":"ex_alumnos"},{"db":"ssppea","table":"ocupaciones"},{"db":"ssppea","table":"alumnos"},{"db":"ssppea","table":"a\\u00f1os"},{"db":"ssppea","table":"grupo_academico"},{"db":"ssppea","table":"secciones"},{"db":"ssppea","table":"grupo_tecnico"},{"db":"ssppea","table":"especialidades"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'rikoshop', 'marcas', '{"sorted_col":"`marcas`.`id_marca` ASC"}', '2016-05-11 00:25:51'),
('root', 'rikoshop', 'paises', '{"sorted_col":"`paises`.`id_pais` ASC"}', '2016-05-10 19:33:20'),
('root', 'siprex', 'alumnos', '{"sorted_col":"`alumnos`.`nombre1` ASC"}', '2016-06-01 10:11:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-05-04 17:08:09', '{"lang":"es","collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Base de datos: `rikoshop`
--
CREATE DATABASE IF NOT EXISTS `rikoshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `rikoshop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_cat` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`, `descripcion_cat`) VALUES
(1, 'Audifonos', 'Audifonos estéreo con diseño moderno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valoracion` int(1) UNSIGNED NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destacados`
--

CREATE TABLE `destacados` (
  `id_destacado` int(11) NOT NULL,
  `imagen` blob NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `destacados`
--

INSERT INTO `destacados` (`id_destacado`, `imagen`, `titulo`) VALUES
(1, 0x6956424f5277304b47676f414141414e5355684555674141424c414141415377434149414141426b517953594141414141584e535230494172733463365141414141526e51553142414143786a777638595155414141414a6345685a6377414144734d4141413744416364767147514141456764535552425648686537646378726b5535716758516e7330665a672b396672496a5331743677536d377561776c51674949444f592f2f774141414c4353677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d5152766f504147746b394150384334775947436c2f42414157794f67482b4263594d5442532f6767414c4a4452442f41764d474a6770507752414667676f782f67583244457744443548514377544e5941774b634d4678676d2f7749416c736b614150695534514c443546384177444a5a417743664d6c78676d50774c4146676d617744675534594c444a4e2f4151444c5a413041664d7077675748794c7742676d6177426745385a4c6a424d2f6755414c4a4d31415041707777574779623841674757794267412b5a626a414d506b58414c424d31674441707777584743622f4167435779526f412b4a54684173506b587744414d6c6b44414a3879584743592f41734157435a72414f42546867734d6b333842414d746b44514238796e4342596649764147435a7241474154786b754d457a2b425141736b7a554138436e444259624a767743415a6249474144356c754d41772b52634173457a57414d436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534514c44354639514a416d4161544c48752b5142664d7077675748794c796953424d41306d654e643867412b5a626a414d506b5846456b43594a724d38533535414a3879584743592f41754b4a41457754655a346c7a794154786b754d457a2b42555753414a676d6337784c4873436e444263594a762b43496b6b41544a4d353369555034464f4743777954663047524a41436d79527a766b6766774b634d4668736d2f6f456753414e4e6b6a6e664a412f695534634a3257624f2f496c30424d45336d2b457a7041526a4941326137724c4a666b6134416d435a7a664b623041417a6b41624e6456746d7653466341544a4d35506c4e3641416279674e6b75712b78587043734170736b636e796b3941414e357747795856665972306855413032534f7a35516567494538594c624c4b7673563651714161544c485a306f50774541654d4e746c6c66324b644158414e4a6e6a4d365548594341506d4f3279796e354675674a676d737a786d6449444d4a41487a485a5a5a6238695851457754656234544f6b42474d67445a727573736c2b52726743594a6e4e3870765141444f514273313157326139495677424d6b7a6b2b55336f4142764b41325336723746656b4b77436d795279664b54304141336e41624a645639697653465144545a4937506c42364167547867747373712b785870436f42704d73646e53672f4151423477323257562f597030426341306d654d7a7051646749412b5937624c4b666b5736416d43617a50475a30674d776b41664d646c6c6c76794a644154424e3576684d3651455979414e6d7536797958354775414a676d6333796d3941414d3541477a5856625a72306858414579544f54355465674147386f445a4c71767356365172414b624a484a387050514144656342736c3158324b394956414e4e6b6a732b55486f434250474332797972722f766e762f2f315052636f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e356e683372494f626b5171363941414d3541477a58565a5a64797a4635354779696e51467744535a34393278446d35474b756a53417a435142387832575758647352536652386f71306855413032534f6438633675426d706f457350774541654d4e746c6c585848556e77654b6174495677424d6b7a6e65486576675a7153434c6a304141336e41624a64563168314c38586d6b72434a644154424e3576684d3651455979414e6d7536797937726a486e6b664b4b744956414e4e6b6a732b55486f434250474332797972726a6e767365615373496c30424d45336d2b457a7041526a4941326137724c4c75754d656552386f71306855413032534f7a35516567494538594c624c4b75754f652b7835704b77695851457754656234544f6b42474d67445a727573737536347835354879697253465144545a4937506c42364167547867747373713634353737486d6b72434a644154424e3576684d3651455979414e6d7536797937726a486e6b664b4b744956414e4e6b6a732b55486f434250474332797972726a6e767365615373496c30424d45336d2b457a7041526a4941326137724c4c75754d656552386f71306855413032534f7a35516567494538594c624c4b75754f652b7835704b77695851457754656234544f6b42474d67445a727573737536347835354879697253465144545a4937506c42364167547867747373713634353737486d6b72434a644154424e3576684d3651455979414e6d7536797937726a486e6b664b4b744956414e4e6b6a732b55486f434250474332797972726a6e767365615373496c30424d45336d2b457a7041526a4941326137724c4c75754d656552386f71306855413032534f7a35516567494538594c624c4b75754f652b7835704b77695851457754656234544f6b42474d67445a727573736c2b52726743594a6e4e3870765141444f514273313157326139495677424d6b7a6b2b55336f4142764b41325336723746656b4b77436d795279664b54304141336e41624a645639697653465144545a4937506c42364167547867747373712b785870436741412f7344336b6531795350324b6441554141482f672b3868324f61522b52626f434149412f3848316b7578785376794a6441514441482f672b736c304f71562b52726741413441393848396b75683953765346634141504148766f39736c3050715636517241414434413939487473736839537653465141412f4948764939766c6b506f5636516f414150374139354874636b6a39696e51464141422f34507649646a6d6b666b573641674341502f42395a4c7363557238695851454177422f3450724a6444716c666b613441414f415066422f5a4c6f6655723068584141447742373650624a6444366c656b4b7741412b4150665237624c49665572306855414150794237795062355a443646656b4b4141442b77506352414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f5167424141435763684143414141733553414541414259796b4549414143776c494d51414142674b5163684141444155673543414143417052794541414141537a6b49415141416c6e4951416741414c4f556742414141574d704243414141734a53444541414159436b48495141417746494f51674141674b5563684141414145733543414541414a5a794541494141437a6c4941514141466a4b51516741414c4355677841414147417042794541414d4253446b49414149436c484951414141424c4f516742414143576368414341414373394d382f2f772b55534c4172735676504d6741414141424a52553545726b4a6767673d3d, 'Audifonos en oferta');
INSERT INTO `destacados` (`id_destacado`, `imagen`, `titulo`) VALUES
(3, 0x6956424f5277304b47676f414141414e5355684555674141424c4141414153774341594141414472496250504141414141584e535230494172733463365141414141526e51553142414143786a777638595155414141414a6345685a637741414473514141413745415a55724468734141435a655355524256486865376431525475504b466b4452726a63442f686b55513256512f444f45584b4a6e7044514330675462326262586b714a622f36376b75726571447550303567384141414141525031762b693841414141414a416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b6a644f62615130417741364d4d6162563937774741674262345151574141414141476b434667414141414270416859414141414161575a67426633723349715050456f414f4b356233783875655a6341414b71637741494141414167546341434141414149453341416741414143444e444b79494f655a5758504a59416542597a4d41434150624d43537741414141413067517341414141414e4a6349597877685241417547627539345750764438414146564f59414541414143514a6d4142414141416b435a6741514141414a426d427459644c546e48776d4d46674833777667414134415157414141414148454346674141414142704168594141414141615149574141414141476d47754b396f795347735a78346c742f725876576d5041617a504548634141436577414141414149675473414141414142496334567752613451556a4c336672542f414f626a32694141774e2b637741494141414167546341434141414149453341416741414143444e444b79466d5746426c526c59384c64627668503250557678477730413844636e7341414141414249453741414141414153424f77414141414145677a41327468633879773849685967766b71344874417839783738534e37457744594f69657741414141414567547341414141414249453741415943626e613244764837696e3835584279773841774e594a574141414141436b435667414141414170416c5941414141414b514a5741437741504f77754d596541514434647749574141414141476b4346674141414142704168594141414141616550305a6c717a67446e6d576e68454c4748756d5376324b567533356877693378664f2f413444415077374a3741414141414153424f774141414141456754734144677a666e363166746e61656572592b38666a73577a427743346a59414641414141514a714142514141414543616741554141414241326a6a356d38754c6d6d5047685566454575616576324b66736d66336d6c666b6537552f7639314c396751416346524f59414541414143514a6d4142414141416b435a6741514141414a426d427462436c70796234744878472f596d2f4e36617337463872376244377973417750796377414941414141675463414341414141494d305677685574666458456f2b5257632b394e6535476a5775744b6f6539596d393955414944354f59454641414141514a7141425141414145436167415541414142416d686c594b3170724e73715a783870506d4d384738317679652b553731575947466744412f4a7a41416741414143424e77414941414141675463414341414141494d304d7244746161796157523878506d643044387a4a6e62762f4d76514941574a5954574141414141436b4356674141414141704c6c43474c48576463497a6a357872584347455a626c75746a2b654b51444173707a41416741414143424e7741494141414167546341434141414149453341416741414143444e45506367413930704d644164356d6667392f35347067414179334943437741414149413041517341414143414e41454c414141416744517a73445a677a5a6c596c32774e506c70364c39707a484956355366766a6d5149414c4d734a4c414141414144534243774141414141306c7768334c4131727862614a7079357a677133636631322f355a3878703476414941545741414141414445435667414141414170416c5941414141414b535a6762556a6138306e736d58346a506b763844557a7349356c726638666632516641414237356751574141414141476b434667414141414270416859414141414161575a6737645361387a647349543479377765572f5237344472535a675155414d44386e7341414141414249453741414141414153484f46384142634a2b5465584b58694b4f7831726c6e722f386e32437743774e30356741514141414a416d59414541414143514a6d4142414141416b4759473167475a30634c6137446d4f776c376e4a3961616833566d2f774141572b634546674141414142704168594141414141615149574141414141476c6d5942336333504d33624365754d534f4950664f62797132576e6f646c4c774541572b6345466741414141427041685941414141416161345148707a72584e7954363162736a54334e58507a2f475144676230356741514141414a416d59414541414143514a6d4142414141416b475947466c2f363766774e573474727a417469622b78706c6d42664151413467515541414142416e4941464148416735784e6437783841674b30517341414141414249453741414141414153424f77414141414145675473414167797177697a73352f4e66443941774277564149574141414141476b43466741414141427041685941414141416151495773436f7a665141414150677041517341414143414e41454c41414141674c5278386a655a2b634a7672336a5a57727862363771675055664a6b767665586a2b7570583950375330416f4d6f4a4c4141414141445342437741414141413067517341414141414e4c4d774f4a4c5a6d44784532764e756672495071504b44437a574e7365657337634167436f6e7341414141414249453741414141414153424f77414141414145677a413473766d5948463262316d57333348336d4a726c7634652b5535775a675957414c426e546d4142414141416b435a6741514141414a446d437548427a58327478586261683971315166754b76566e794f2b6237636c797545414941652b594546674141414142704168594141414141615149574141414141476c6d5942326347566838356c347a734f77666a7367384c4f5a69426859417347644f59414541414143514a6d4142414141416b435a6741514141414a426d427459426d6266434e665949724d664d4f655a69426859417347644f59414541414143514a6d4142414141416b4f594b345145736654334646747133572f61505051487a634a32586e334346454144594d79657741414141414567547341414141414249453741414141414153444d443677444d77414c5976726c2f792f31323734385a574144416e6a6d42425141414145436167415541414142416d6f414641414141514a714142514141414543614965343774655467646c7347344c372b39546665372f5778474f494f414f795a453167414141414170416c5941414141414b514a574141414141436b6d594731492b5a65416342786d594546414f795a453167414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b6a5a4f2f6c37785a632f7935374f2f594767437748584f38462f682f50774251355151574141414141476b43466741414141427072684275774a4a584254312b414e6748567767426744317a41677341414143414e41454c414141416744514243774141414941304153766f504d506938674d41414142775a4149574141414141476b4346674141414142704168594141414141616550305a6c707a5232764f75764c49415744662f765739776a7342414c4156546d4142414141416b435a6741514141414a446d436d48456b6c6349505749414141426779357a41416741414143424e774149414141416754634143414141414945334132716e7a334b763344774141414d4357435667414141414170416c5941414141414b514a574141414141436b6a5a4d6853546c6a6a476e314d78346c414141417345644f59414541414143514a6d4142414141416b4f594b4951414141414270546d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b445a4f623662314959307870685541414a38352b4f7369414244674242594141414141615149574141414141476d37756b4c6f4f69414177503234616767414c4d554a4c4141414141445342437741414141413067517341414141414e49454c414141414144534e6a664533614232414944744d6541644150674e4a3741414141414153424f77414141414145675473414141414142493238514d4c484f764141434f77617773414f417a546d4142414141416b435a6741514141414a416d59414541414143516c706d425a633456414141666d596b46414a773567515541414142416d6f414641414141514e727156776a72567756665835366e4651444173547738506b32724a74634a416543346e4d41434141414149453341416741414143424e77414941414141673754417a734d7932416743593337336d5a706d4842514448346751574141414141476b434667414141414270693138685850504b6f4775434141416461313476644b55514150624e43537741414141413067517341414141414e49454c4141414141445346706d425a653456414143583170794864636c734c41445942796577414141414145675473414141414142494537414141414141534a747442745a6163362f4d76414941324a633135324f5a69515541322b514546674141414142704168594141414141615a753451756a61494144414d5378396e644156516744594a696577414141414145675473414141414142494537414141414141535076524443787a72674141574e4f534d37484d77774b4137584143437741414149413041517341414143414e41454c4141414167445142437741414149413041517341414143414e41454c41414141674c52782b7348664478356a544b7435764c34385479734141506a65772b5054744a724844313644415941376377494c414141416744514243774141414941304151734141414341744b7342367a7a33367630444141423734543058414c624443537741414141413067517341414141414e49454c414141414144534243774141414141307362707a62542b314e78444c5639666e71635641414463357548786156724e34386f724d5142775a30356741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514e6b35767076576e78686a54616836764c382f5443674141627650772b4453744150626a796a2f50346443637741494141414167546341434141414149453341416741414143424e774149414149434138777a71727a3577644149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141616550305a6c702f616f7778726562782b76493872514141344459506a302f5461683765555947357a6630376465576637724237546d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b445a4f623662317038595930326f6572792f5030776f414147377a38506730725741642f683344543833394f33586c6e2b36776530356741514141414a416d59414541414143514a6d4142414142636362344f64766b425946304346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b43466741414141427041685941414141416151495741414348647a71646648622b4157446242437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c414141414144534243774141414141306751734141414f62347a68732f4d50414e736d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d5941454141467a782b764c383177654164516c5941414141414b514a574141414141436b4356674141414141704933546d326e3971544847744a71482b2b494141507a57772b5054744a714864315267626e502f546c3335707a76736e684e5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b6a644f62616632704d6361306d736672792f4f3041674341327a7738506b307267474f34386b39333244306e7341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141434467644470392b59476a453741414141414153424f7741414141414567547341414141414249473663726c326e48474e4e71487138767a394d4b41414275382f44344e4b336d5962344d414c513567515541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a714142514141414544614f4c325a31703861593079722b62322b50453872414144343373506a3037536133355658596744677a707a41416741414143424e77414941414141675463414341414141494f31717744725041336a2f41414441586e6a50425944746341494c4141414167445142437741414149413041517341414143414e41454c4141414167445142437741414149413041517341414143414e41454c41414141674c5278656a4f747278706a544b763576623438547973414150692f6838656e6154572f4837774741774233356751574141414141476b434667414141414270416859414141414161542b616766556438374541415069744a5764656e5a6c3742514462354151574141414141476b4346674141414142706d376843654d6c315167434166566e363275416c56776742594a75637741494141414167546341434141414149453341416741414143427474686c596c3961616833566d4a685941514e2b61633634756d586b46415076674242594141414141615149574141414141476b43466741414141427069387a41756d5165466744414d613035393871734b7744594e796577414141414145675473414141414142493239555677752b34586767414d4c383172776c65636d55514149374643537741414141413067517341414141414e49454c4141414141445346702b423956466c4a745a587a4d6f4341506a6276655a636663634d4c414134466965774141414141456754734141414141424945374141414141415346743942745a5836724f78414142596e316c58414d435a453167414141414170416c5941414141414b526c7268422b782f56434149426a634755514150694d453167414141414170416c5941414141414b514a574141414141436b625749473169587a73414141747364734b7744674e357a41416741414143424e774149414141416754634143414141414947317a4d37432b597a345741454348755663417746796377414941414141675463414341414141494731585677687634646f68414d443358415545414f374e43537741414141413067517341414141414e49454c41414141414453446a384443774141414941324a3741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f774141414141416a37382b632f2b755a4857465548496d3841414141415355564f524b35435949493d, 'Mas de 100 marcas ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencias`
--

CREATE TABLE `existencias` (
  `id_existencia` int(11) NOT NULL,
  `cantidad` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `existencias`
--

INSERT INTO `existencias` (`id_existencia`, `cantidad`) VALUES
(1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_pro` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `imagen` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca`) VALUES
(11, 'AMD'),
(4, 'Beats'),
(13, 'CoolerMaster'),
(9, 'DELL'),
(14, 'Gigabyte'),
(6, 'HP'),
(12, 'Intel'),
(8, 'K1NGSTON'),
(5, 'Maxell'),
(7, 'Microsoft'),
(10, 'Nvidia'),
(15, 'PenDrive'),
(1, 'Samsung'),
(2, 'Sony'),
(3, 'Toshiba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas_categoria`
--

CREATE TABLE `ofertas_categoria` (
  `id_oferta_c` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `porcentaje` decimal(3,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas_producto`
--

CREATE TABLE `ofertas_producto` (
  `id_oferta_p` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `porcentaje` decimal(3,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ofertas_producto`
--

INSERT INTO `ofertas_producto` (`id_oferta_p`, `id_producto`, `porcentaje`) VALUES
(1, 1, '0.35'),
(2, 1, '0.10'),
(3, 1, '0.75');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL,
  `nombre_pais` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`) VALUES
(6, 'Alemania'),
(4, 'Argentina'),
(1, 'El Salvador'),
(7, 'Estados Unidos'),
(3, 'Guatemala'),
(9, 'Honduras'),
(8, 'Inglaterra'),
(2, 'Noruega'),
(5, 'Rusia'),
(10, 'TurkmenistÃ¡n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_pro` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(5,2) UNSIGNED NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_existencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_pro`, `precio`, `id_marca`, `id_categoria`, `id_existencia`) VALUES
(1, 'Punisher', 'Audifonos con diseño de "The Punisher" de alta calidad de sonido', '7.50', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `id_red` int(11) NOT NULL,
  `red` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `redes`
--

INSERT INTO `redes` (`id_red`, `red`, `url`) VALUES
(1, 'Facebook', 'http://www.facebook.com'),
(2, 'Twitter', 'http://www.twitter.com'),
(3, 'Google +', 'http://www.gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `selecciones`
--

CREATE TABLE `selecciones` (
  `id_seleccion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `cantidad` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id_sucusales` int(10) UNSIGNED NOT NULL,
  `id_pais` int(11) NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` int(25) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `estado` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` int(10) UNSIGNED DEFAULT NULL,
  `tarjeta` int(20) UNSIGNED DEFAULT NULL,
  `telefono` int(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pregunta` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `respuesta` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `id_tipo`, `email`, `clave`, `id_pais`, `estado`, `ciudad`, `direccion`, `codigo_postal`, `tarjeta`, `telefono`, `nombre`, `apellido`, `pregunta`, `respuesta`) VALUES
(1, 'Omega', 1, 'gorge.depaz@gmail.com', 'delunoalcincoenruso', 1, 'San Salvador', 'San Salvador', 'C.U. Jose Simeon Cañas Edif. 76 Apto #24', 503, 45678932, 78659432, 'Alejandro', 'Calderón', '', ''),
(2, 'Quinteros', 2, 'diego_quinteros@gmail.com', '123456', 3, 'San Salvador', 'Mejicanos', '12ava Casa a mano derecha', 503, 1234567890, 78965342, 'Diego Enrique', 'Quinteros Lemus', '', ''),
(3, 'XxxRickyxxX', 2, 'mlgproquickscoper@hotmail.es', '$2y$10$Tf7ig9XdkAUWYFIEAi', 10, 'Allahu Akbar', 'Allah', 'En la esquina del redondel', 666, 343743284, 12345678, 'Ricardo', 'Velazquez', '', ''),
(6, 'Omega8351', 2, 'omega@gmail.com', '$2y$10$EGUdyD0WVgC4Mrtv1bONuO8XKO3Zzm/JzLz8I9s7m5HrOG6mMxGha', 1, 'Aqui', 'AllÃ¡', 'Por ahÃ­', 503, 123456789, 12345678, 'Alejandro', 'CalderÃ³n', 'Â¿Te gusta nadar?', 'Thi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `total` decimal(6,2) UNSIGNED NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `categoria` (`categoria`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `destacados`
--
ALTER TABLE `destacados`
  ADD PRIMARY KEY (`id_destacado`);

--
-- Indices de la tabla `existencias`
--
ALTER TABLE `existencias`
  ADD PRIMARY KEY (`id_existencia`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `marca` (`marca`);

--
-- Indices de la tabla `ofertas_categoria`
--
ALTER TABLE `ofertas_categoria`
  ADD PRIMARY KEY (`id_oferta_c`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `ofertas_producto`
--
ALTER TABLE `ofertas_producto`
  ADD PRIMARY KEY (`id_oferta_p`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`),
  ADD UNIQUE KEY `nombre_pais` (`nombre_pais`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `nombre_producto` (`nombre_producto`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_existencia` (`id_existencia`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id_red`),
  ADD UNIQUE KEY `red` (`red`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indices de la tabla `selecciones`
--
ALTER TABLE `selecciones`
  ADD PRIMARY KEY (`id_seleccion`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_carrito` (`id_carrito`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id_sucusales`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_pais` (`id_pais`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_carrito` (`id_carrito`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `destacados`
--
ALTER TABLE `destacados`
  MODIFY `id_destacado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `existencias`
--
ALTER TABLE `existencias`
  MODIFY `id_existencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `ofertas_categoria`
--
ALTER TABLE `ofertas_categoria`
  MODIFY `id_oferta_c` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ofertas_producto`
--
ALTER TABLE `ofertas_producto`
  MODIFY `id_oferta_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `id_red` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `selecciones`
--
ALTER TABLE `selecciones`
  MODIFY `id_seleccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id_sucusales` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD CONSTRAINT `fk_usuario2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_producto4` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `fk_producto2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `ofertas_categoria`
--
ALTER TABLE `ofertas_categoria`
  ADD CONSTRAINT `fk_categoria2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `ofertas_producto`
--
ALTER TABLE `ofertas_producto`
  ADD CONSTRAINT `fk_producto5` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_existencia` FOREIGN KEY (`id_existencia`) REFERENCES `existencias` (`id_existencia`),
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

--
-- Filtros para la tabla `selecciones`
--
ALTER TABLE `selecciones`
  ADD CONSTRAINT `fk_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  ADD CONSTRAINT `fk_producto3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `fk_pais2` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  ADD CONSTRAINT `fk_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id_tipo`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_carrito2` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`);
--
-- Base de datos: `siprex`
--
CREATE DATABASE IF NOT EXISTS `siprex` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `siprex`;

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
(10432051, 13579024);

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
  `grado` int(1) DEFAULT NULL,
  `especialidad` int(1) DEFAULT NULL,
  `grupo_Tecnic` int(1) DEFAULT NULL,
  `secc` int(1) DEFAULT NULL,
  `grupo_academ` int(1) DEFAULT NULL,
  `inscrito` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`carnet`, `contraseña`, `nie`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `grado`, `especialidad`, `grupo_Tecnic`, `secc`, `grupo_academ`, `inscrito`) VALUES
(1, 0, 2, 'a', 'w', 'w', 'w', 2, 2, 2, 2, 2, 'FALSO'),
(20110005, 0, 1684787, 'Andrea', NULL, NULL, NULL, 1, 3, 1, 1, NULL, 'VERDADERO'),
(20110014, 0, 1683484, 'Katya', NULL, NULL, NULL, 1, 2, 1, 2, NULL, 'VERDADERO'),
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
(2, 'Con Don Bosco', 'Mantengamonos siempre alegres y con actitud positiva'),
(3, 'Salesianos en acción', '"Los jovenes son la semilla de la iglesia en la sociedad" dice el Padre Ernesto Ochoa en una entrevista realizada ayer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `años`
--

CREATE TABLE `años` (
  `id_año` int(1) NOT NULL,
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
  `id_depar` varchar(7) NOT NULL,
  `departamento` varchar(12) DEFAULT NULL,
  `encargado` varchar(9) DEFAULT NULL,
  `telefono_encargado` varchar(18) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentosempre`
--

INSERT INTO `departamentosempre` (`id_depar`, `departamento`, `encargado`, `telefono_encargado`, `empresa`) VALUES
('', 'ASDF', 'Pepe', '12345678', 312),
('1', 'R. Humanos', 'Lic. Ruiz', '76543211', 17);

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
  `correo` varchar(49) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `rubro`, `direccion`, `telefono`, `contacto`, `correo`) VALUES
(0, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 'Blanco Ingenieros Constructores', 'Arquitectura', 'Condominio IMPEP 0-39 Apto. 24-A, Mejicanos S.S', 78736030, 'Ing. Fredy Rafael Vicente Blanco', 'Bingeon@hotmail.com'),
(2, 'COLEGIO MARISTA SAN ALFONSO', 'ARQUITECTURA', 'MEJICANOS', 22720870, 'ALDO AREVALO LARIN', NULL),
(3, 'Monisterio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Li. Arturo Cardona', 'arturo.cardona@mop.gob.sv'),
(4, 'Innova Dreams Solutions\nVICEMINISTERIO DE VIVIENDA Y DESARROLLO URBANO MOPTVDU', 'ARQUITECTURA', 'Col San Francisco calle los Abetos #23 S.S.\npor distrito 4 de la Alcaldia 4\npropiedades al lado izquierdo\nAV. MANUEL ENRIQUE ARAUJO KM 5 1/2 CALLE SANTA TECLA', 22686411, 'Carolina Nuñez\nLIC. JOSE ARTURO CARDONA', 'gruposegovia.sa@gmail.com\nsit.vivienda@mop.gob.sv'),
(5, 'Inversiones Consultores S.A. de C.V.', 'ARQUITECTURA', 'Av. Libertad no. 204 San Salvador', 25150787, 'Arq. Marvin Alberto Chicas Escamilla', 'rcinversionesconsultores@hotmail.com'),
(6, 'Grimaldi Hnos. S. A. de C. V. Freelans Estudio', 'ARQUITECTURA', '67 Av. Sur pje caribe #13 Col. Roma S.S.', 22455257, 'Arq. Luis Herrera', 'luis@frelansestudio.com'),
(7, 'Diseño y Publicidad. S.A. de C.V.', 'ARQUITECTURA', 'Urb. Lorencia, poligono 15 casa 5, San Marcos', 25329950, 'Ing. Francisco Muñoz', 'dpcolorimagen2012@hotmail.com'),
(8, 'Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Lic. Arturo Cardona', 'arturo.cardona@mop.gob.sv'),
(9, 'Corte Suprema de Justicia, depto de ingenieria', 'ARQUITECTURA', 'Diagonal Universitaria Centro de Gobierno edificio de oficinas administrativas y jurídicas de la C:S:J:, San Salvador', NULL, 'Arq. Rafael Claros', 'rafaclarosxto@yahoo.com'),
(10, 'CAESS 4', 'ELECTRICIDAD', 'Calle el bambú col. San Antonio', 22299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com'),
(11, 'MOPTVDU Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283069, 'Arq. Juan Bernardo Amaya', NULL),
(12, 'Universidad de El Salvador', 'EDUCACION', 'Final 25 av. Sur norte ciudad universitaria', 22355235, 'Arq. Manuel Ortiz Garmendez', NULL),
(13, 'Cincopatasalgato, S.A. de C.V.', 'ARQUITECTURA', 'Av. Las Palmas pje 6#114 col. San Benito', 25645746, 'Lourdes Canizales', 'admin@cincopatasalgato.com'),
(14, 'DIRECCION DEPARTAMENTAL DE EDUCACIÓN DE SH SALVADOR', 'SERVICIOS DE EDUCACIÓN', '25 AV NOTE. Y CALLE SAN ANTONIO ABAD CONTIGUO A UES', 25221065, 'ARQ. HENRY ROSENDO MONTENEGRO', 'HENRIKMONTENEGRO@YAHOO.ES'),
(15, 'Frilans Estudio Grimadi Hnos. S.A. de C.V.', 'ARQUITECTURA', '67 av. Sur pje caribe #13 col. Roma S.S.', 22455257, 'Arq. Luis Herrera', 'luis@frilansestudio.com'),
(17, 'ORG Arquitectura construciones, S.A. de C. V.', 'ARQUITECTURA', 'Col Maquilishuat calle la mascota #93.3 B S.S.', 25369444, 'Arq. José David Gonzalez', 'david.gonzalez@grupoorg.com'),
(18, 'Almacenes Vidrí, S.A. de C.V. 5', 'COMERCIALIZACIÓN', 'Centro Comercial Metropolis Col. Zacamil', 22725000, 'Sergio mendez', 's.metropolis@vidri.com'),
(19, 'MOPTVDU Ministerio de Obras Públicas 1', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283069, 'Arq. Juan Bernardo Amaya Alvarez', 'N/A'),
(20, 'MOPTVDU Ministerio de Obras Públicas 2', 'ARQUITECTURA', 'Av. Manuel Enrique Araujo km 5 1/2 calle a Santa Tecla', 25283113, 'Lic. José Arturo Cordova', 'arturo.cardona@mop.gob.sv'),
(21, 'AVE Constructora S.A. de C.V.', 'ARQUITECTURA', 'Colonia y avenida santa victoria #24 S.S.', 22251338, 'Ing. Cynthia de Menjivar', 'c.menjivar@aveconstructora.net'),
(22, 'Grupo Senior, S.A. de C.V.', 'ARQUITECTURA', 'Av. Bernal Centro Comercial plaza Bernal 2da. Plantalocal 16, s.s.', 22847093, 'Ing. Alfredo Cruz', 'a.cruz@gruposenior.net'),
(23, 'Almacenes Vidrí, S.A. de C.V. 2', 'COMERCIO', 'C. zacamilCentro Comercial plaza metropolis mejicanos', 22725000, 'Nelson Mauricio Flores Sosa', 'nflores@vidri.com.sv'),
(24, 'Centro Nacional de Registros', 'CNR', '1 calle pte y final 43 av. Nte #2310, San Salvador', 25138400, 'Arq. Cristina Aracely Chávez de Rosales', 'cchavez@cnr.gob.sv'),
(25, 'CAESS 8', 'ELECTRICIDAD', 'Calle el bambú col. San Antonio', 25299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com'),
(26, 'Alamacenes Vidrí, S.A. de C.V.', 'COMERCIALIZACIÓN', 'Calle zacamil Centro Comercial Metropolis', 22725000, 'Nelson Mauricio Flores Sosa', 'nflores@vidri.com.sv'),
(28, 'Banco Agrícola', 'BANCO', 'Colonia San Benito Calle Loma Linda #154', 25148490, 'Dory de Martínez y Margarita Gald{amez', 'mgaldamez@bancoagricola.com.sv'),
(29, 'ISNA', 'ISNA', 'Av. Irazú y final calle santa marta No. 2 Col. Costa Rica', 22134781, 'Dinora Elizabeth Argueta Andaluz', 'dinoraargueta@outlook.com'),
(30, 'Corte Suprema de Justicia', 'CSJ', 'Diagonal Universitaria Centro de Gobierno edificio de oficinas administrativas y jurídicas de la C:S:J:, San Salvador', 22318300, 'Arq. Rafael Antonio Claros', 'rafaclarosxto@yahoo.com'),
(31, 'COLEGIO GABRIELA MISTRAL', 'ARQUITECTURA', 'COL. LAS MARGARITAS IV ETAPA CALLE PRINCIPAL POL E', 22924674, 'LICDA. ARGENTINA SANTOS', 'COLEGIOGAM@YAHOO.ES'),
(32, 'FONAVIPO', 'ARQUITECTURA', 'Alameda Juan Pablo II entre 37 y 39 av. Nte. Edificio Fonavipo', 22578888, 'Arq. Walter Velasco', 'walter.velasco@fonavipo.gob.sv'),
(33, 'MOPTVDU Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Lic. José Arturo Cardona', 'arturo.cardona@mop.gob.sv'),
(35, 'CENTRO DE PISCINAS Y CISTERNAS S.A. DE C.V. 1', 'COMERCIALIZACIÓN', 'AV. LOS ANDES No. 2980, LOCAL D COL. MIRAMONTE, S.S.', 22601364, 'CARMEN ELENA COREAS MARTINEZ', 'centrodepiscina@gmail.com'),
(36, 'ALMACENES VIDRI S.A. DE C.V. 3', 'COMPRA Y VENTA DE ARTICULOS DE FERRETERIA', '21 AV SUR ENTRE 12 Y 14 CALLE PTE S.S.', 22714033, 'JAIME CINCUIK', 'JCINCUIR@VIDRI.COM.SV'),
(37, 'ANAYA LEIVA Y CIA. DESPACHO CONTABLE ANAYA MONTALVO', 'SERVICIOS DE CONTABILIDAD', '19CALLE PTE. No. 444 LOCAL 3 S.S.', 22262235, 'JOSE BORIS MONTALVO MENJIVAR', 'BORI.MONTALVO57@HOTMAIL.COM'),
(38, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA FERROCARRILES NACIONALES DE EL SALVADOR', 'AUTONOMA', 'FINAL AV. PERALTA No. 903 S.S.', 22414100, 'ANGELICA TORRES GRANADOS', 'ANGELICA.TORRES@VEPA.GOB.SV'),
(39, 'ISSS', 'Recursos Humanos salud', 'AV. JUAN PABLO II y 39 AVE. NTE. Edificio El Salvador', 25913048, 'Licda. Jenny de Valiente', NULL),
(41, 'MENJIVAR MENJIVARY AUDITORES CONSULTORES S.A. DE C.-V.', 'SERVICIOS DE AUDITORIA Y CONTABILIDAD', '7A AV NTE Y 5A CALLE PTE PLAZA SAN ANGEL LOCAL 206 S.S.', 22718573, 'SRA ANA GLORIA RIVERA', 'MENJIVARAUDITORES@YAHOO.COM'),
(42, 'ASOCIACION PSORIASIS NUEVA VIDA EL SALVADOR', 'ASOCIACION SIN FINES DE LUCRO', 'RES SANTA TERESA 17 AV NTE #15 LOCAL 2 2A PLANTA CONTIGUO A FCA 1 CUIDAD MERLIOT', 23026699, 'EVELYN ROXANA DE AGUIRRE', 'PSORIASIS_NUEVAVIDA@HOTMAIL.COM'),
(43, 'DIRECCION GENERAL DE ADMINISTRACION MINISTERIO DE HACIENDA', 'MINISTERIO CONTA', 'S.S.', 22443000, 'LIC CARLOS MANUEL ABREGO', NULL),
(47, 'UNICOMER, S.A. DE C.V. A CURACAO CENTRO', 'COMERCIALIZACION', 'CALLE RUBEN DARIO No 515 SAN SALVADOR', 22218159, 'Misael Alejandro Cruz Bojorquez', NULL),
(48, 'ACOESUR, S.A. DE C.V.', 'ASOCIACION COOPERATIVA DE AHORRO Y CREDITO', 'BOULEVARD CONSTITUCION #504 EDIF. SUPER REPUESTOS, SAN SALVADOR', 22392049, 'WENDY LISSETTE AZUCENA', 'wendy.azucena@superrepuestos.com.sv'),
(49, 'DISTRIBUIDORA MORAZAN S.A de C.V', 'COMERCIO/CONTADURIA', 'APOPA, CARRETERA TRONCAL DEL NORTE', 22017707, 'MANUEL EDGARDO SEGOVIA CONTRERAS', 'Manuel_segovia@lamorazan.com'),
(50, 'SORTO GALICIA Y ASOCIADOS', 'DESPACHO CONTABLE', '13 CALLE ORIENTE Y PASAJE SAGRERA N° 13 CENTRO COMERCIAL METRO ESPAÑA LOCAL 211', 22712648, 'JORGE ALBERTO SORTO BONILLA', 'sortogalicia_asociados@yahoo.com.mx'),
(51, 'A P DE CENTROAMERICA S.A. DE C.V.', 'INDUSTRIA DE LA CONSTRUCCION', 'CALLE QUEQUISQUE #46 G JARDINES DE MERLIOT SANTA TECLA', 22892069, 'ARQ. HERBERT QUINTANILLA', 'HQUINTANILLA.AP@GMAIL.COM'),
(52, 'VOLUNTARIOS CONSTRUYENDO EL SALVADOR', 'ACTIVIDADES DE SAESORAMIENTO EMPRESARIAL', 'URB LA SULTANA CALLE LOS LAURELES Y PJE LOS CEDROS #18D ANTIGUO CUSCATLAN', 22433655, 'ALEXANDER JAFET MORALES MANCIA', 'JAFET.MORALES@TECHO.ORG'),
(53, 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN', 'MINISTERIO DE HACIENDA', 'S.S.', 22443000, 'LIC CARLOS MANUEL ABREGO', NULL),
(54, 'CENTRO DE PISCINAS Y CISTERNAS S.A. DE C.V. 2', 'CONSTRUCCIÓN', 'AV. LOS ANDES #2980 COL.MIRAMONTE', 22601364, 'CARMEN ELENA COREAS MARTINEZ', 'BODEGASCENTRODEPISCINAS@GMAIL.COM'),
(55, 'INFRA DE EL SALVADOR 1', 'FABRICACION DE GASES INDUSTRIALES', '25 AV. NTE #1080 S.S.', 22343210, 'SONIA ELIZABETH LOPEZ', 'NORMA.FUNES@OXGASA.COM'),
(56, 'ALCALDIA MUNICIPAL DE CUSCATANCINGO', 'ADMINISTRACION PUBLICA', 'CALLE EL CALVARIO #48 CUSCATANCINGO', 25268600, 'PAOLA ARTERO\nFRANCISCO JUAREZ', 'RRHUMANOS.CUSCATANCINGO@GMAIL.COM'),
(57, 'DFA DESPACHO FINANCIERO AGUILA', 'DESPACHO FINANCIERO', 'AV LOS ESPLIEGOS Y CALLO LOS EUCALIPTOS CASAS 10 COL LAS MERCEDES S.S.', 22365004, 'LIC. RAQUEL MOTTO DE GALVEZ', 'REQUELMOTTO@GMAIL.COM'),
(58, 'BANCO PROMERICA', 'FINANZAS', 'COLONIA SANTA URSULA AV EL RECREO', 25351517, 'BEYRA DE CHICAS', 'BYANES@PROMERICA.COM.SV'),
(59, 'APLEI', 'CONTABILIDAD', 'CASA COMUNAL COMUNIDAD IBERIA', 73136865, 'MARCO ANTONIO VALLADARES PAIZ', NULL),
(60, 'MENJIVAR Y MENJIVAR AUDITORES CONSULTORES S.A. DE C.V.', 'SERVICIOS DE AUDITORIA Y CONTABILIDAD', '7A AVENIDA NTE Y 5A CALL PTE PLAZA SAN ALGELLOCAL 206 S.S.', 227185723, 'SRA ANA GLORIA RIVERA', 'MENJIVARAUDITORES@YAHOO.COM'),
(61, 'Recinos Recinos y CIA', 'DESPACHO CONTABLE', 'Reparto y calle los Heroes No. 48 -A', 22732054, 'LIC. PABLO NOÉ RECINOS', 'RRYCIA.GERENCIA@GMAIL.COM'),
(62, 'COOPERATIVA FINANCIERA EMPRESARIAL ACACES DE R.L.', 'COOPERATIVA', 'AV. OLIMPICA Y 71 AV. SUR #3719 COLONIA ESCALON', 25612300, 'LIC. RAUL ANTONIO ARTIGA HERRERA', 'RRHH@ACACES.COM.SV'),
(63, 'SORTO GALICIA Y ASOCIADOS', 'DESPACHO CONTABLE Y AUDITORIA', '13 CALLE OTE. Y PASAJE SAGRERA N° 13 CENTRO COMERCIAL METRO ESPAÑA LOCAL 211, SAN SALVADOR.', 22712648, 'JORGE ALBERTO SORTO BONILLA', 'sortogalicia_asociados@yahoo.com.mx'),
(64, 'COMPAÑÍA PANAMERICANA DE AVIACION', 'TRANSPORTE AEREO DE PASAJEROS', '89 AV NTE Y CALLE EL MIRADOR EDIFICIO WORD TRADE CENTER LOCAL 107', 22092641, 'BILY MAX MONROY', 'BMMONROY@COMPAIR.COM'),
(65, 'VIDRIO INDUSTRIAL, S.A. DE C.V.', 'INDUSTRIA DE VIDRIO -ESPEJOS-ALUMINIO', 'AV MONSEÑOR OSCAR ROMERO Y 33 CALLE OTE #1804 COL LA RABIDA S.S.', 222671718, 'LIC. JOSE DAVID JIMENEZ FRANCO', 'GERENCIA@VIDRIOINDUSTRIAL.COM'),
(83, 'La Prensa Grafica', 'Imprenta', 'San Salvador', 22736005, 'Hector Enrique Ramirez', NULL),
(84, 'MASTERGRAFIC', 'ACTIVIDADE SERVICIO RELAIONADO A LA IMPRESIÓN', 'CALLE EL ROSAL COL MIRAMONTE TE No121 S.S.S', 22604422, 'JORGE ELIAS', 'MLOPEZ@MASTERGRAFIC'),
(85, 'COLEGIO DRA. MARI SOLA DE SELLARES', 'INSTITUCION/DISEÑO', 'SOYAPANGO', 25124955, 'Lorena Astrid Gonzales', NULL),
(86, 'IPRINT COLOR', 'DISEÑO', 'C.C. PLAZA MUNDO LOCAL 173 SOYAPANGO', 22778263, 'Milagro Rosales', 'info@iprintcolor.com'),
(87, 'DIALPHA, S.A. DE C.V.', 'INSUMOS MEDICOS', 'SAN SALVADOR', 22072760, 'MONICA DE RIVERA', 'MERCADEO@DIALPHASV.COM'),
(88, 'INSTITUTO TECNICO RICALDONE 1', 'EDUCACION', 'CENTRO URB, LIBERTAD AV AGUILARES No. 218 S.S.', 22346000, 'HERMANO RODRIGO MENDEZ', NULL),
(90, 'INSTITUTO TECNICO RICALDONE 2', 'EDUCACION', 'ITR', NULL, 'MARVIN TORRES P. MANUEL', 'marvin_torres@ricaldone.edu.sv'),
(91, 'MULTIDEAS PUBLICIDAD', 'PUBLICIDAD', 'CALLE CONSTITUCIÓN #17 POLIGONO N CIUDAD SATELITE S.S', 25661036, 'CHIRSTIAN ERNESTO RAMIRES', 'MULTIDEASPUBLICIDAD@GMAIL.COM'),
(92, 'CENTRO ESCOLAR "BENJAMIN BLOOM"', 'EDUCACIÓN', 'CARRETERA TRONCAL DEL NTE. KM 12 1/2 APOPA', 22169408, 'NORMA RUIZ DE CARRANZA', 'NORMA.DECARRANZA@GMAIL.COM'),
(93, 'MULTILINE S.A. DE C.V.', 'VENTA DE MOBILIARIO Y EQUIPO', 'CALLE LOMA LIDA CASA 204 CON SAN BENITO S.S.', 22103880, 'SILVIA DOMINGUEZ SIRI', 'IDEASMULTILINE@GMAIL.COM'),
(94, 'LA PRENSA GRAFICA', 'PRENSA', 'BLVD SANTA ELENA FRENTE A EMBAJADA AMERICANA', 22412752, 'HÉCTOR RAMIREZ', 'hramirez@laprensagrafica.com'),
(95, 'COLEGIO CRISTIANO HOREB', 'SERVICIOS EDUCATIVOS', 'RES. SAN PEDRO POLG. 14E #3 Y 4 MEJICANOS', 21310934, 'ARACLY DEL CARMEN RIVAS CASTANEDA', 'COLEGIO_OREB@HOTMAIL.COM'),
(96, 'INSTITUTO BADASH EL SALVADOR', 'DESARROLLO DE RECURSOS HUMANOS', 'AV. LAS CAMELIAS No 7 Y CALLE LOS BAMBUES COL. SAN FRANCISCO', 22243622, 'LIC. FERNANDO ZELEDON', 'CNL@BAHAIELSALVADOR.ORG'),
(97, 'UNIVERSIDAD DON BOSCO', 'SERVICIOS EDUCATIVOS', 'SOYAPANGO S.S.', 22518217, 'LIC. JOSE ERAZO', 'joseerazo@udb.edu.sv'),
(98, 'CLIDELFA', 'DENTAL', 'AYUTUXTEPEQUE', 22728613, 'WLTER DANIEL CRUZ', NULL),
(99, 'UNIVERSIDAD DON BOSCO', 'EDUCACION SUPERIOR', 'CALLE AL PLAN DEL PINO KM 1 1/2 SOYAPANGO', 22518217, 'LIC. JOSE LEON ERAZO ERAZO', 'JOSERAZO@UDB.EDU.SV'),
(100, 'FEDECASES DE R.L.', 'COOPERATIVA', '25 CALLE PTE. COL SAN JORGE #1301', 25553580, 'LIC. ARISTIDES ALBERTO MENJIVAR', 'ARISTIDES.MENJIVAR@FEDECACES.COM'),
(101, 'ITR 1', 'EDUCACION', 'CENTRO URB. LIBERTAD AV. AGUILARES NO. 218', 22346000, 'MARVIN TORRES', 'marvin_torres@ricaldone.edu.sv'),
(102, 'ITR 2', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv'),
(103, 'Divina providencia- Colegio', 'EDUCACION', 'Av. Concepción No. 426 San Salvador', 22221935, 'María Angélica López Vicente', 'mariaangelicalopezvicente@yahoo.com'),
(104, 'GRUPO DECOART, S.A. DE C.V.', 'REAIZACION DE EVENTOS SERVICIO MONTAJE', '3A AV NTE #1620 S.S.', 22355535, 'GUILLERMO ENRIQUE RIVERA', 'INFO@GRUPODECOARTE.COM'),
(105, 'VIP Marketing, S.A. de C.V.', 'PUBLICIDAD', 'COL. BUENOS AIRES AV ALVARADO COND. 2000-D, S.S.', 23524727, 'MARVIN BATAZAR CHAVEZ ORTIZ', 'ventasvipmaketing@gmail.com'),
(106, 'LA PRENSA GRÁFICA', 'MEDIO IMPRESO', 'BULEVAR SANTA ELENA, FRENTE EMBAJADA AMERICANA', 22412752, 'HECTOR RAMIREZ', 'hramirez@laprensagrafica.com'),
(107, 'SIGMA Q REPRO S.A.', NULL, 'Blvd.del ejercito nacional km 3 1/2 Soyapango', 25676000, 'Ernesto David Rodríguez Siguenza', 'erodriguez@repro.sigma.com'),
(108, 'MIXTO', 'Imprenta', 'Calle Sisimiles No. 114 Col. Jardines de Miramonte', 25127285, 'Janine Jerez', 'mixto.mixto@hotmail.com'),
(109, 'PUNTO PRINT', 'PUBLICIDAD', 'REPARTO Y PASEO MIRALVALLE NO. 24 S.S.S', 22743888, 'MARIA DE LOS ANGELES ARGUETA', 'PUNTOPRINTSV@HOTMAIL.COM'),
(110, 'MIXTO', 'Imprenta', 'Calle Sisimiles No. 114 Col. Jardines de Miramonte', 25127285, 'Janine Jerez', 'mixto.mixto@hotmail.com'),
(111, 'VIP MARKETING S.A. DE C.V.', 'PUBLICIDAD', 'COL BUENOS AIRES AV ALVARADO CON2000-D S.S.', 23524727, 'MARVIN BALTAZAR CHAVEZ ORTIZ', 'VENTASVIPMARKETIN@GMAIL.COM'),
(112, 'MIXTO', 'DISEÑO GRAFICO', 'COL MIRAMONTE', 25127285, 'JANINE', NULL),
(113, 'MIXTO', 'DISEÑO GRAFICO', NULL, NULL, NULL, NULL),
(114, 'MELRO Y ASOCIADOS S.A. DE C.V', 'ARQUITECTURA Y DISEÑO GRAFICO', '75 AVE. NORTE, PASAJE TIO CONRRA #13 SAN SALVADOR', 22074568, 'SARAH MELENDEZ MARTINEZ', 'melroyasociados@gmail.com'),
(115, 'A & CREATIVA S.A. DE C.V.', 'DISEÑO GRAFICO', 'CALLE CIRCUMBALACION EDIFICIO INTEL LOCAL 9 TERCERA PLANTA', 22604774, 'BLANCA RIVERA DE CORDOVA', NULL),
(116, 'Angel Editores', 'DISEÑO GRAFICO', '12 AV. NTE #1330 COL. MAGAÑA', 22263976, 'FABRICIO ANGEL', 'ANGELEDITORRES@YAHOO.COM'),
(117, 'ITR 3', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv'),
(118, 'MIXCO', 'DISEÑO GRAFICO', NULL, NULL, NULL, NULL),
(119, 'MULTIDEAS PUBLICIDAD', 'PUBLICIDAD', 'CALLE CONSTITUCIÓN NO. 17 POLIGONO N CIUDAD SATELITE, S.S.', 25661036, 'CHRISTIAN ERNESTO RAMIREZ', 'MULTIDEASPUBLICIDAD@GMAIL.COM'),
(121, 'PUNTO PRINT', 'PUBLICIDAD', 'REPARTO Y PASEO MIRALVALLE CASA 24 S.S.', 22743888, 'MA DE LOS ANGELES ARGUETA', 'PUNTOPRINTSV@GMAIL.COM'),
(122, 'ITR 5', 'CONCEJO', 'ITR', 22346000, 'P. MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv'),
(123, 'Punto Print', NULL, 'Blvd. Costitución y paseo miralvalle contiguo a papa jonhs', 22743888, 'Mario Argueta Castillo', 'puntoprintsv@gmail.com'),
(124, 'ISSS INSTITUTO SALVADOREÑO DEL SEGURO SOCIAL', 'SERVICIOS DE SALUD', 'CUIDADELA MONSERRAT', 25916720, 'ING,. ENRIQUE ANTONIO ESTEVEZ\nING. LUIS A. HERRERA', 'ENRIQUE.ESTEVEZ@ISSS.GOB.SV'),
(125, 'SERVICIOS Y CONSULTORIAS INDUSTRIALES', 'ELECTROMECANICA', 'CARRETERA A LOS PLANES DE RENDEROS PJE KRIETE #8-A SAN MARCOS', 25632291, 'ALEXGONZALO ZACARIAS VASQUEZ', 'SERCOINDESA@HOTMAIL.COM'),
(126, 'CHS COMERCIAL S.A. DE C.V.', 'VENTA DE MATERIALES ELECTRICOS', 'BLVD ALTAMIRA #13 RES ALTAMIRA S.S.', 22486700, 'FREDY VASQUEZ', 'EPINEDA@CHS.COM.SV'),
(129, 'FILAMENTOS PLASTICOS S.A.', 'FABRICACION DE PRODUCTOS PLASTICOS', 'BLVD. DEL EJERCITO #2615 ENTRADA A LA COLONIA LA CHACRA', 22931367, 'CARLOS ALFREDO MONTOYA', 'MOTOYA_CARLOSAL@HOTMAIL.COM'),
(130, 'IMDISAR, SA. DE C.V.', 'TALLER DE MECANICA', 'COL. FLOR BLANCA #2419 S.S.', 22983680, 'EDWIN FLORES ESCOBAR', 'INDISARELSALVADOR@INDISAR.COM'),
(131, 'FREISMAN S.A. DE .C.V.', 'FABRICANTE DE REPUESTOS INDUSTRIALES\nSERVICIOS DE MANTENIMIENTO Y MONTAJE', 'FINAL 41 CALLE PTE Y 2A AV NTE LOCAL 11-13 COLONIA SHANGRI-LAS.S.', 21315165, 'ROBIN JOE CAMPOS SALDAÑA', 'FREISMAN_SA@HOTMAIL.COM'),
(132, 'CEPA COMISION EECUTIVA PORTUARIA AUTONOMA', 'SERVICIOS AEROPORTUARIOS Y PORTUARIOS', 'AEROPUERTO COMALAPA', 23492210, 'LEONARDO HASBUN', 'LEONARDO.HASBUN@CEPA.GOB'),
(133, 'INTERPA S.A. DEC.V.', 'VENTA DE REPUESTOS', '29 CALLE PTE #1225 COL LAYCO S.S.', 22257994, 'ING. ROBERTO MOLINA', 'ROBERTOMOLINA@INTERPA-SA-COM'),
(134, 'MELHER S.A. DE C.V.', 'ELABORACION COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1-BIS COL LAS COLINAS MEJICANOS', 25006800, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM\nGGOMEZ@MELHER.COM'),
(135, 'TALLER INDUSTRIAL NAVAS', 'TRABAJOS DE MECANICA INDUSTRIAL', '21 AVSUR NO 4 COL SANTA CRISTINA BO SANTANITA', 22224976, 'SANDRA AIME NAVAS QUINTANILLA', NULL),
(136, 'INDUSTRIA RECICLADORA DE METALES Y PLASTICO //PROMETÍ', 'FABRICACION DE PROD METALICOS PARA USO ESTUCTURAL// EMCA', 'AV JUAN BERTIS CASA 137 CIUDAD DELGADOLA GRITA S.S. //AV BARRERA 254 BARRIO SAN JACINTO', 22762734, 'MARIO ARNOLDO HERNANDEZ HERNANDEZ', 'METAPLAS@HOTMAIL.ES'),
(137, 'INDUSTRIAS POSADA 4', 'INDUSTRIA TALLER TORNO Y OBRA DE BANCO', '25 CALLE OTE #137 BO. SAN MIGUELITO', 22356413, 'JULIO SALVADOR POSADA ALVAREZ', 'INSDUSTRIASPOSADA@GMAIL.COM'),
(138, 'MONTAJES AGRICOLAS', 'REPARACION Y SERVICIOS NO CLASIFICADOS PREVIAMENTE', 'BLVD. DEL EJERCITO KM 9 LOTE 1 LOCAL 3 Y 4 ILOPANGO S.S.', 22944822, 'YIMI ELENILSON OSORIO', 'MONTAJES.AGRICOLAS@HOTMAIL.COM'),
(139, 'FRITER', 'INSTALACION, REPARACION Y MANTENIMIENTO DE SISTEMAS DE REFRIGERACION', '13 CALLE OTE #154 S.S. BO. SAN MIGUELITO', 22211769, 'ING. CARLOS YUDICE', 'FRITER.SV@YAHOO.COM'),
(140, 'Corporación Bonima (Bayer)\nTalleres excel automotriz (Didea)', NULL, '21 av. Nte entre av. Juan Pablo II y calle lols andes col. Miramonte\nDidea km 1 1/2 carretera panamericana Ilopango', 22674700, 'Juan José Bonilla (bayer)\nOmar Rivera (Didea)', 'IVAN.GALVEZ@BAYER.COM'),
(141, 'CANAL 10', 'ESPACIO DE TV', 'SANTA TECLA', 22280811, 'AURELIO MARIN', 'AURELIO MARIN@HOTMAIL.COM'),
(142, 'PROMEIN, PROCESOS MECANICOS E INDUSTRIALES', 'INDUSTRIA METAL MECANICA', 'BLVD. SUR ENTRE 12 Y 14 AV #1819, SANTA TECLA', 25215409, 'CARLOS ALBERTO LOPEZ RAMOS', 'BLVD SUR #2021 SANTA TECLA'),
(143, 'MELHER, S.A. DE C.V.', 'ELABORACION COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1-BIS COL LAS COLINAS MEJICANOS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM'),
(144, 'ALMACENES VIDRI S.A. DE C.V. 4', 'FERRETERIA', 'CENTRO COMERCIAL METROPOLIS', 22725000, 'SERGIO MENDEZ', 'SERGIOMENDEZ@VIDRI.COM.SV'),
(145, 'OPRUMEDICAL', NULL, NULL, NULL, 'Carlos Platero', NULL),
(146, 'METAPLAST', 'TALLER DE MECANICA', 'AV. JUAN BERLIS #137 COL LAS VICTORIAS CIUDAD DELGADO', 22762734, 'DANIEL MORENO', 'INDMETALPLAST@HOTMAIL.COM'),
(147, 'CAESS 7', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'Calle el bambú Ayutuxtepeque', 25299235, 'Luis Umanzor', 'LUIS.UMANZOR@AES.COM'),
(148, 'METALPLAS', 'TALLER DE MECANICA', 'AV JUAN BERTIS 137 COL LAS VICTORIAS CIUDAD DELGADO', NULL, 'MARIO HERNANDEZ', 'INGMETAPLAS@HOTMAIL.COM'),
(149, 'INDUSTRIA DE MADERAS Y METALES S..A DE C.V.', 'INDUSTRIA', 'COLONIA CUCUMACAYAN CAYE CENTRAL 161 S.S', 22229002, 'SRA EVELUN DIAZ', 'METALMECANICA@TOROGOZ.COM'),
(150, 'ITR- CONSEJO', 'CONSEJO', 'ITR', 22346000, 'P. MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv'),
(151, 'CAESS 6', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'CALLE Y COLONIA EL BAMBU', 25299066, 'Benjamín Vasquez', 'BENJAMIN.VASQUEZ@AES.COM'),
(152, 'SIETELSA, S.A. DE C.V.', NULL, 'Final 5 av. Nte. Col y pae alfaro No. 506 mejicanos', 22261027, 'David Rivas Gómez', 'david.rivas@sietelsaonline.com'),
(153, 'Servicios Industriales J.F.', 'TALLER INDUSTRIAL', '6a. Calle pte. Cl. No 1-8A, Santa Tecla, Laibertad', 22887070, 'Lic. José Augusto Fuentes', 'SERVICIOSINDUSTRIALESJF@HOTMAIL.COM'),
(154, 'GRUPO PENIEL', 'FABRICACIÓN DE PRODUCTOS DE ALUMINIO Y VIDRIO', 'JARDINES DE LA LIBERTAD CALLE CHILTIUPAN LOCAL 11', 22782444, 'Brenda Guadalupe Miranda Marroquin', NULL),
(155, 'Industrias La Comstancia, S.A. de C.V.', 'ELECTROMECANICA', 'Av. Independencia#526 San Salvador', 25024353, 'Omar Alberto Argueta', 'ilc.sabmiller.com'),
(156, 'SIETELSA, SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'FINAL 5 AV NTE COL Y PAJE ALFARO No. 506 MEJICANOS', 22261027, 'JORGE ALBERTO VELASCO', 'ROBERTO.GARCIA@SIETELSAONLINE.COM'),
(157, 'TALLER DE TORNO Y SOLDADURA SAN ANTONIO', 'RECONSTRUCION DE PIEZAS', '4A CALLE PTE Y 13 AV SUR BO. CONCEPCION S.V.', 23930889, 'MARCO ANTONIO MERINO', 'N/A'),
(158, 'INDUSTRIAS POSADA 1', 'ELECTROMECANICA', 'BO. SAN MIGUELITO 25 CALLE OTE. 137 S.S.', 22512095, 'BALTAZAR CRUZ', NULL),
(159, 'MELHER S..A DE C.V.', 'ELABORACION DE COBERTURA DE CHOCOLATE', 'AV. POETA ROLANDO ELIAS #1 COL LAS COLINAS MEJICANOS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM'),
(160, 'ALMACENES VIDRI S.A. DE C.V. 2', 'FERRETERIA', 'CENTRO COMERCIAL SUCURSAL METROPOLIS', 22725000, 'NELSON FLORES', 'S.METROPOLIS@VIDRI.COM.SV'),
(161, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA 2', 'SERVICIOS PORTUARIOS Y AEROPORTUARIOS', 'AEROPUERTO INTERNACIONAL SAN LUIS TALPA, LA PAZ', 23662273, 'ING. MAURICIO ALVAREZ', 'MAURICIO.ALVAREZ@CEPA.GOB.SV'),
(163, 'Didea Taller los Héroes', NULL, '51 av. Nte. Alam. Juan Pablo II y av. Los andes col. Miramonte atrás de DIDEA los heroes', 22104344, 'Ing. Omar Rivera', NULL),
(164, 'MECATRONICA S.A. DE C.V.', 'OTRAS ACTIVIDADES DE SERVICIO', 'RESD. LA CIMA II OTE AV. A No. 9-G', 22765784, 'JOSE CECILIO DE LEON', 'INFO@MECATRONICA.COM'),
(165, 'MAFER SERVICIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM'),
(166, 'INGELMAT S.A. DE C.V.', 'INSTALACIONES ELECTRICAS', 'SERVICIOS DE ENERGIA ELECTRICA', 22451355, 'ING. JAIME AMAYA', 'INGELMAT1@YAHOO.ES'),
(167, 'MELHER, S.A. DE C.V.', 'ELABORACION DE COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1 BIS COL LAS COLINAS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM'),
(168, 'Alcaldia Municipal de Quezaltepeque', NULL, 'Av. José María Castro 2ACalle pte.', 23436705, 'Gladys Esmeralda Ruano Recinos', 'esmeraldajdrecinos@outlook.es'),
(170, 'CEPA', 'AEROPUERTO /EMCA', 'COMALAPA', 22491300, 'LIC. JOSUE RAMOS', 'N/A'),
(171, 'SIEMENS', 'AUTOMATIZACION', 'CALLE SIEMENS', 22783333, 'ING. CARLOS MENJIVAR', 'CARLOSERNESTO.MENJIVAR@SIEMENS.COM'),
(172, 'CAESS 1', NULL, 'Colonia San Antonio calle el Bambú No. 186', 25299066, 'Ing. Benjamin Vasquez', 'benjamin.vasquez'),
(173, 'MAFER SERVICIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUCTRIALES@GMAIL.COM'),
(174, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA 1', 'SERVICIOS PORTUARIO Y AEROPORTUARIO', 'BLVD LOS HEROES TORRE ROBLEE METROCENTRO', 22491467, 'MIRNA FUENTES DE PEÑA', 'MIRNA.FUENTES@CEPA.GOB.SV'),
(175, 'INDUSTRIA CENTROAMERICANA DE ALIMENTOS', 'ELABORACION DE SALSAS ADEREZOS Y ESPECIES', 'COL LAS COLINAS BLOCK G #11 MEJICANOS, S.S.', 22726954, 'LIC. CARLOS RAMON FIGUEROA', 'INDUCENTRAL@ELSALVADOR.COM'),
(176, 'Almacenes Vidrí, S.A. de C.V. 3', NULL, 'Calle al volcan pasaje la Ermita , mejicanos S.S.', 22324033, 'Edwin Flores', 'alvisa065@vidri.com.sv'),
(177, 'ALMACENES VIDRI S.A. DE C.V. 1', 'FERRETERIA', 'SUCURSAL MEJICANOS', 22324033, 'SAUL ERNESTO CASTANEDA CARRANZA', 'SCASTANEDA@VIDRI.COM'),
(178, 'COMPRESORES REPUESTOS Y SERVICIOS, S.A. DE CV', 'RECTIFICADO Y VENTA DE MOTORES', '67 AV. SUR No. 140, COL ESCALON', 22466666, 'TELIA SANCHEZ', NULL),
(179, 'SIEMENS S.A.', 'CENTA DE PRODUCTOS ELECTRICOS Y OTROS', 'CALLE SIMENS #43 ANTIGUO CUSCATLAN', 22482333, 'CARLOS ERNESTO MENJIVAR', NULL),
(180, 'INDUSTRIAS POSADA 3', 'INDUSTRIA (TORNO FRESADORA OBRA DE BANCO', '25 CALLE OTE #137 BO. SAN MIGUELITO S.S.', 22512095, 'JULIO SALVADOR POSADA ALVAREZ', 'INDUSTRRIASPOSADA@GMAIL.COM'),
(181, 'INDUSTRIAS POSADA 2', 'INDUSTRIA (TALLER TORNO Y OBRA DE BANCO)', '25CALLE OTE #137 BO. SAN MIGUELITO, S.S.', 22356413, 'JULIO SALVADOR PPOSADA ALVAREZ', 'INDUSTRIASPOSADA@GMAIL.COM'),
(182, 'MAFER SERVICIOS INDUSTRIALES', 'FASBRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV. NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM'),
(183, 'INFRA DE EL SALVADOR 2', 'GASES MÉDICOS ELECTRONICA', 'San Salvador', 22324033, 'Nelson M. Flores Sosa', 'nflores@vidri.com.sv'),
(184, 'CAESS 3', 'DISTRIBUIDORA DE ELECTRICIDAD', 'CALLE Y COLONIA EL BAMBU', 25299066, 'BENJAMIN VASQUEZ', 'BENJAMIN.VASQUEZ@AES.COM'),
(186, 'COMPRES S.A. DE C.V. 1', 'METAL MECANICA', '67 AV SUR #140 COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIASANCHEZ@COMPRES.COM.SV'),
(187, 'INSELPRO S.A. DE C.V.', 'ELECTRICIDAD', 'COL. ESCALON CALLE ARTURO AMBROGHI #525', 22649736, 'MAURICIO CRISTALES', 'OPERACIONES@INSELPRO.COM'),
(188, 'TALLER DIDEA', 'MECANICA', '51 AV NTE ENTRE ALAM JUAN PABLO II Y AVENIDA LOS ANDES COL MIRAMONTE ATRÁS DE DIDEA LOS HEROES S.S.', 22104343, 'ING. OMAR RIVERA', 'N/A'),
(189, 'HOTEL CROWNE PLAZA SAN SALVADOR', 'HOTELES', '87 Y 11 CALL PTE COL ESCALON', 25000716, 'JULIO RAFAEL MENJIVAR MOLINA', 'JULIO.MENJIVAR@HOTELSAL.COM'),
(190, 'MAFER SERVCIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO S.S.', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM'),
(191, 'CEPA AEROPUERTO INTERNACIONAL DE EL SALVADOR', 'SERVICIOS PORTUARIOS', 'AEROPUERTO INTERNACIONAL DE EL SALVADOR', 23492476, 'LUIS E. SAGET B.', 'LUIS.SAGET@CEPA.GOB.SV'),
(212, 'SIEMENS, S.A. DE C.V.', 'ELECTROMECANICA', 'Parque industrial Santa Elena, calle siemens #43 Antoguo Cuscatlan', 22487333, 'Ing. Enrique Campos', 'enrique.campos@siemens.com'),
(213, 'AGROSANIA, S.A. DE C.V. 1', 'PRODUCTOS LACTEOS', '51 AV. SUR No. 1738, COL. JARDINES DE MONSERRAT, S.S.', 24054028, 'PAOLA ALEJANDRA BATRES', NULL),
(214, 'ITR 11', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL),
(215, 'ITR 7', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL),
(216, 'ITR 8', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL),
(217, 'SERVITOTAL', 'REPARACION DE ARTICULOS DE LINEA CAFÉ', 'Av. España No. 620', 22317008, 'Joaquín Anchieta', 'joaquin_anchieta@servitotal.com'),
(218, 'SERVITOTAL', 'REPARACION DE ARTICULOS', 'AVENIDA ESPAÑA No. 620, S.S.', 22317008, 'JOAQUIN ANCHIETA', 'JOAQUIN_ANCHIETA@SERVITOTAL.COM'),
(219, 'TALLERES EXCEL S.A de C.V', 'REPARACION MECANICA DE VEHICULOS AUTOMOTORES', 'SAN SALVADOR', 22104200, 'ING. EMANUEL OMAR RIVERA CANJURA', 'eorivera@excelautomotriz.com'),
(220, 'Grupo Aereo Policial', 'MANTENIMIENTO DE AVIACION', 'Aeropuerto Internacional Ilopango', 22962516, 'TMA. Miguel Ernesto Miranda Cordova', 'apulomiranda@yahoo.com'),
(221, 'Almacenes Vidrí, S.A. de C.V. 4', 'COMERCIO', 'Calle zacamil Centro Comercial Metropolis', 22725000, 'Nelson Ernesto Bonilla Chavez', 'nelson.bonilla@aes.com'),
(222, 'Omnimusic, S.A. De C.V.', 'Electrónica', '11 calle poniente #3937 entre 75 y 77 av. Nte colonia Escalon', 22633869, 'Tec. David Enrique Tejada', 'taller@omnimusicsv.com'),
(223, 'ITR 9', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL),
(224, 'Almacenes Vidrí, S.A. de C.V. 1', 'COMERCIO', 'Calle al volcan y pasaje la ermita, mejicanos S.S.', 22324033, 'Aaron Dagoberto Paredes', 'scastaneda@vidri.com.sv'),
(225, 'OBIPADO DE ZACATECOLUCA', 'RELIGIOSO', '4a. CALLE PONIENTE #7 ZACATECOLUCA', 22340287, 'MONSEÑOR SAMUEL ELIAS BOLAÑOS', 'SAMUELAVELAR@GMAIL.COM'),
(226, 'ANDA', 'CAPTACION, TRATAMIENTO Y SUMINISTRO DE AGUA', 'COL ESLOVAN AV. LAS MAGNOLIAS PLANTEL JALACATL SAN MIGUEL', 26002060, 'SALVADOR SANCHEZ SARAVIA', 'SALVADOR.SANCHEZ@ANDA.GOB.SV'),
(227, 'AEROMAN', 'ELECTRONICA\nELECTOMECANICA', 'AEROPUERTO INTERNACIONAL, SAN LUIS TALPA', 23124000, 'JESUS CRUZ', 'susana.rodriguez@aeroman.com.sv'),
(228, 'CAESS S.A. DE C.V.', 'ELECTRICIDAD', 'COL EL BAMBU', 25299085, 'JOSE ROBERTO SALAZAR BARAHONA', 'ROBERTO.SALAZAR@AES.COM'),
(229, 'ITR 10', 'consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv'),
(230, 'Empresarios Juveniles', 'LIQUIDACION DE CONSTANCIAS DE DOCENTES', '85 av. Norte y 15 calle pte. #905, Col Escalón', 22655354, 'Ing. Raúl Pacheco', 'rpacheco@empresariosjuveniles.org'),
(231, 'SOLUCIONES PROFESIONALES S.A. DE C.V.', 'ELECTRONICA', 'San Salvador', 78626457, 'Jose Mustafa Alens Mancia', NULL),
(232, 'SIEMENS, S.A. DE C.V.', 'ELECTROMECANICA', 'Parque industrial Santa Elena, calle siemens #43 Antoguo Cuscatlan', 22487333, 'Ing. Enrique Campos', 'enrique.campos@siemens.com'),
(233, 'AES El Salvador', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'Final 29 av. Nte. Y calle el Bambu, Ayutuxtepeque', 25299192, 'Nelson Ernesto Bonilla Chavez', 'nelson.bonilla@aes.com'),
(234, 'ITR 4', 'Consejo', 'ITR', 22346000, 'P.PADRE MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv'),
(235, 'TEXTUFIL', 'ECA', 'SOYAPANGO', 22770066, 'LICDA. RINA AGUILAR', NULL),
(236, 'SIATELSA, S.A. DE C.V.', 'SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'FINAL 5A. AV NTE COL Y PJE ALFARO No. 506 MEJICANOS', 22261027, 'WALTER ARTURO MENJIVAR', NULL),
(237, 'Omnimusic, S.A. De C.V.', NULL, '11 calle poniente #3937 entre 75 y 77 av. Nte colonia Escalon', 22633869, 'Tec. David Tejada', 'taller@omnisport.com'),
(238, 'OMNIMUSIC, S.A. DE C.V.', 'VENTA DE INSTRUMENTOS MUSICALES', '11 CALLE PTE NO3937 ENTRE 77 Y 75 AV NTE COL ESCALON S.S.', 22633849, 'LICDA CECILIA DE MATINEZ', 'GERRENCIA.ADMON@OMNIMUSICSV.COM'),
(239, 'INGENIO EL ANGEL S.A. DE C.V.', 'INGENIO AZUCARERO', 'KM 14 1/2 C. A QUEZALTEPEQUE APOPA', 22012600, 'ING, IRVIN AGUILAR', 'IRVING.AGUILAR@INGENIOELANGEL.COM'),
(240, 'SERVITOTAL', 'REPARACION DE ARTICULOS LINEA CAFÉ', 'Av. España No. 620', 22317008, 'Joaquín Anchieta', 'joaquin_anchieta@servitotal.com'),
(241, 'CIDECA, S.A. DE C.V.', 'SERVICIOS DE INGENIERIA', 'Av. Las camelias #7A Col. San Francisco S.S.', 22230274, 'Aracely Palacios', 'aracely.palacios@cideca.net'),
(242, 'GRUPO COMPRES', 'VENTA DE OTROS PRODUCTOS NO ELASTICOS', '67 AV SUR #140, COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIASANCHEZ@COMPRES.COM.SV'),
(243, 'AGROSANIA, S.A. DE C.V. 2', 'INDUSTRIA DE LACTEOS', '51 AV. SUR No. 1738 COLONIA MONSERRAT, SAN SALVADOR', 24054028, 'PAOLA ALEJANDRA BATRES', NULL),
(244, 'OMNI MUSIC, S.A. DE C.V.', 'ELECTRÓNICA', '11 CALLE PTE. ENTRE 75 Y 77 AV. NTE, #3937, SAN SALVADOR', 22633849, 'LICDA. CECILIA DE MARTINEZ', NULL),
(245, 'CENTRO DE PISCINAS Y SISTERNAS S.A. DE C.V. 3', 'SERVICIOS', 'AVENIDA LOS ANDES #2980 COL. MIRAMONTE', 22601364, 'CARMEN ELENA COREAS MARTÍNEZ', 'CENTRODEPISCINAS@GMAIL.COM'),
(247, 'ALMACENES VIDRI', 'ELECTRONICA', 'CALLE AL VOLCAN MEJICANOS', 22324033, 'AARON PAREDES', 'SCASTANEDA @VIDRI.COM.SV'),
(248, 'FONAVIPO (FONDO NACIONAL PARA LA VIVIENDA NACIONAL)', 'BANCA (SEGUNDO PISO)', 'Entre 37 y 39 av. Alameda juan pablo II, S.S.', 22578829, 'Licda. Katia Navarrete', 'katia.navarrete@fonavipo.gob.sv'),
(249, 'CAESS 2', 'ELECTRICIDAD', 'Calle el bambú Colonia San Antonio, Ayutuxtepeque', 25299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com'),
(250, 'LACTEOS CHALATE', 'PRODUCCION Y PROCESAMIENTO DE PRODUCTOS LACTEOS', '11A CALLE OTE. BARRIO EL ROSARIO NVA CONCEPCION CHALATENANGO', 23068269, 'MIGUEL EDUARDO ARTEAGA CAMPOS', 'LEENPI@HOTMAIL.COM'),
(251, 'COMPRES S.A. DE C.V. 2', 'VENTA DE OTROS PRODUCTOS NO CLASIFICADOS', '67 AV SUR #140 COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIA.SANCHEZ@COMPRES.COM'),
(252, 'CAESS 5', 'LUZ Y FUERZA', 'COL SAN ANTONIO CALLE EL BAMBU AYUTUXTEPQUE', 25299236, 'ARMANDO GUEVARA', 'ARMANDO.GUEVARA@AES.COM'),
(253, 'ITR 12', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv'),
(254, 'GRUPO MTZ INTELECI, S.A. DE CV.', 'INFORMATICA', 'CALLE LOS BAMBUES AV LAS GARDEIAS #424-A COOL SAN FRANCISCO', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELECI.COM'),
(255, 'COOPERATIVA ZAFIRO DE R.L.', 'COOPERATIVA', NULL, NULL, 'JORGE EDGARDO GARCÍA', NULL),
(256, 'MICRONET, S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22359499, 'CARLOS ALBERTO GARCIA', NULL),
(257, 'RG OUTSOURCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S.', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM'),
(258, 'RG OUTSOURCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S.', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM'),
(262, 'RG OUTSOURSING S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM'),
(263, 'GRUPO TUSELL', 'RECTIFICADO DE MOTORES', '6 CALLE PTE Y 23 AV SUR No. 1112 S.S.', 22716300, 'RAFAEL TUSELL', 'RTUSELL@MTCORPORATIVO.COM'),
(265, 'GRUPO MTZ NENTELECI S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELESI.COM'),
(267, 'MICRONET S.A. DE C .V.', 'INFORMATICA', 'S.S.', NULL, 'CARLOS ALBERTO GARCIA', NULL),
(268, 'MICRONET S.A. DE C.V.', NULL, NULL, NULL, 'CARLOS ALBERTO GARCIA', NULL),
(270, 'GRUPO MTZ INENTELECI, S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELECI.COM'),
(272, 'RG OUTSORCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', '.S.S', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM'),
(273, 'MICRONET, S.A. DE C.V.', 'INFORMATICA', NULL, NULL, 'CARLOS ALBERTO GARCIA', NULL),
(274, 'GIMNASIO FIBRA VITALITY', 'SERVICIOS', '9 AVE. SUR EDIFICIO PATRICIA #304 4 PLANTA, S.S', 76414432, 'ESPERANZA GARCIA MEJIA', 'GFIBRAVITALITY@GMAIL.COM'),
(277, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221036, 'Lic. Raúl Ernesto Castillo Hernández', 'RAUL.HERNANDEZ@MINED.GOB.SV'),
(278, 'GALAXIA DEPORTES S.A. DE C.V.', 'VENTA DEARTICULOS DEPORTIVOS', 'METROCENTRO', 22601010, 'LICDA. ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM'),
(281, 'COSTISS DE RL', 'INFORMATICA', 'DIAGONAL ARTURO ROMERO AMBRIGI QUINTA GUADALUPE COL AMERICA 434 S.S.', 25254207, 'VICTOR ANTONIO PINEDA', 'victor.pineda69@hotmail.com'),
(282, 'SERVICIOS GLOBALES LOGÍSTICOS, S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV. SUR COL. ROMA CENTRO ROMA LOCAL 22 S.S.', 22838010, 'JUAN FERNANDO PARADA GÓMEZ', 'FERNADO.PARADA@SGL.COM.SV'),
(283, 'GALAXIA DEPORTES', 'VENTA DE ARTICULOS DEPORTIVOS', 'METROCENTRO', 22611010, 'ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM'),
(285, 'SERVICIOS GLOBALES LOGISTICOS S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'JUAN FERNANDO PARADA GOMEZ', 'FERNANDO.PARADA@SGL.COM.SV'),
(286, 'Galaxia Deportes, S.A. de C.V.', 'COMERCIALIZADORA', 'LOCAL 2 T. TORRE ROBLE , METROCENTRO SAN SALVADOR', 22611010, 'LICDA. ANDREA AMAYA', 'a.amaya@galaxia.com.sv'),
(287, 'GALAXIA', 'DEPORTES', 'LOCAL 2T TORRE ROBLE ,METROCENTRO SAN SALVADOR', 22611010, 'ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM'),
(289, 'SERVICIOS GLOBALES LOGISTICOS S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'Licenciado JUAN FERNANDO PARADA GOMEZ', 'FERNADO.PARADA@SLG.COM.SV'),
(292, 'SERVICIOS GLOBALES LOGISTICOS, S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'JUAN FERNANDO PARADA GOMEZ', 'FERNANDO.PARADA@SGL.COM.SV'),
(293, 'AMERICAS TOURS', 'AGENCIA DE VIAJES', 'BLVD SANTA ELENA CC ATRIUM PLAZA LOCAL 11 NIVEL 1', 22605476, 'DANIEL BELTRAN DIAZ', 'AMERICASTOURS@AMERICASTOURS.COM'),
(300, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv'),
(301, 'Saturno, S.A. de C.V.', NULL, 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv'),
(303, 'CABLEPUNTOCOM, S.A. DE C.V.', 'CONSULTORES DE EQUIPO INFORMATICO', 'AV. SIERRA NEVADA COL. MIRAMONTE #184 S.S.', 22604803, 'BERTA DE QUINTEROS', 'BERTADEQUINTEROS@INTEGRA.COM'),
(305, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv'),
(307, 'CIRCUITO YSR RADIO QUE BUENA', 'RADIO', 'ALAMEDA ROSSELVETL EDIFICIO 2-4-6', 22092000, 'GLAUCO RODRIGUEZ', NULL),
(308, 'Saturno, S.A. de C.V.', 'JOYERIA // PROYECTO INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv'),
(309, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221061, 'Lic. Raúl Ernesto Castillo Hernández', 'raul.hernandez@mined.gob.sv'),
(311, 'KR INVESTMENT, S.A. DE C.V.', 'INFORMATICA', '23 CALLE PONIENTE CALLE LA SVICTORIAS COL LAYCO PALOMO #154', 22006724, 'CARLOS ANTONIO RUIZ RAMOS', NULL),
(312, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv'),
(313, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEXANDER HERNANDEZ', NULL),
(314, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTUIPAN #5/6 CUIDAD MERLIOT', 22890391, 'JOSE ROBERTO CASTILLO', NULL),
(315, 'TOTOS PIZZA', 'METAPAN', 'METAPAN', 24111798, 'ALEX HERNANDEZ LANDAVERDE', 'ALEX_HERNANDEZ301'),
(317, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221036, 'Lic. Raúl Ernesto Castillo Hernández', 'RAUL.HERNANDEZ@MINED.GOB.SV'),
(318, 'COLEGIO BRADFORD', 'EDUCACION / PROYECTO INFO', 'COL LAS TRES MAGNOLIAS MEJICANOS', 0, 'CARMEN RIVERA', 'N/A'),
(319, 'ACORDE', 'RESTAURANTE', NULL, NULL, NULL, NULL),
(323, 'ITR 6', 'CONSEJO', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv'),
(324, 'BANCOFIT; ACORDES', 'INTERMEDIACION FINANCIERA ; RESTAURANTE', 'ALAMEDA ROSSELVETL 41 AVENIDA NTE #2174 COL FLOR BLANCA', 22617900, 'JUAN GONZALO RECINOS', 'RECINOS@BANCOFIT.COM.SV'),
(325, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEX HERNANDEZ', NULL),
(326, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTUIUPAN #5/6 CIUDAD MERLIORT', 22890391, 'JOSE ROBERTO CASTILLO', NULL),
(328, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEX HERNANDEZ', NULL),
(329, 'ACORDES', 'RESTAURANTE', NULL, NULL, NULL, NULL),
(330, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTIUPAN #5/6 CIUDAD MERLIOT', 22890391, 'JOSE ROBERTO CASTILLO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `especialidad`) VALUES
(0, NULL),
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
(20140643, 0, 'Alejandro', 'Calderón', 79667451, 3, 'gorge.depaz@gmail.com', 'Graduado con excelencia en Sistemas Informáticos'),
(20140645, 19970200, 'Nicolle', 'Hernandez', 78909654, 3, 'lizzie.hndz@hotmail.com', 'Alumna Ejemplar'),
(20140646, 123678, 'Rene', 'Alfaro', 47632843, 3, 'asdf.asdf@asdf.asdf', 'Manco :v');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_academico`
--

CREATE TABLE `grupo_academico` (
  `id_grupo_aca` int(1) NOT NULL,
  `grupo_aca` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo_academico`
--

INSERT INTO `grupo_academico` (`id_grupo_aca`, `grupo_aca`) VALUES
(0, NULL),
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
  `id_grupo_tec` int(1) NOT NULL,
  `grupo_tec` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo_tecnico`
--

INSERT INTO `grupo_tecnico` (`id_grupo_tec`, `grupo_tec`) VALUES
(0, NULL),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupaciones`
--

CREATE TABLE `ocupaciones` (
  `id_ocupacion` int(1) NOT NULL,
  `ocupacion` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ocupaciones`
--

INSERT INTO `ocupaciones` (`id_ocupacion`, `ocupacion`) VALUES
(0, NULL),
(1, 'Trabajador'),
(2, 'Desempleado'),
(3, 'Estudiante Universitario');

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
(1, 20110005, 1, 1, 'Desarrolla muy bien su trabajo', 1, 1, 1, 1, 'Concluyo resaltando su desempeño laboral'),
(4, 20140643, 88, 0, 'Actividades en desarrollo', 1, 1, 0, 0, 'En proceso de finalización de prácticas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id_seccion` int(1) NOT NULL,
  `seccion` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_seccion`, `seccion`) VALUES
(0, NULL),
(1, 'A'),
(2, 'B');

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
  ADD PRIMARY KEY (`id_empresa`);

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
  ADD UNIQUE KEY `id_exalumnos` (`id_exalumnos`),
  ADD KEY `ocupacion` (`ocupacion`),
  ADD KEY `id_exalumnos_2` (`id_exalumnos`);

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
-- Indices de la tabla `ocupaciones`
--
ALTER TABLE `ocupaciones`
  ADD PRIMARY KEY (`id_ocupacion`);

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
  MODIFY `id_anuncio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `espeempresa`
--
ALTER TABLE `espeempresa`
  MODIFY `id_espeempresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ex_alumnos`
--
ALTER TABLE `ex_alumnos`
  MODIFY `id_exalumnos` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20140647;
--
-- AUTO_INCREMENT de la tabla `registrospp`
--
ALTER TABLE `registrospp`
  MODIFY `id_registropp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  ADD CONSTRAINT `fk_especialidad` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `fk_grado` FOREIGN KEY (`grado`) REFERENCES `años` (`id_año`),
  ADD CONSTRAINT `fk_grupoaca` FOREIGN KEY (`grupo_academ`) REFERENCES `grupo_academico` (`id_grupo_aca`),
  ADD CONSTRAINT `fk_grupotec` FOREIGN KEY (`grupo_Tecnic`) REFERENCES `grupo_tecnico` (`id_grupo_tec`),
  ADD CONSTRAINT `fk_seccion` FOREIGN KEY (`secc`) REFERENCES `secciones` (`id_seccion`);

--
-- Filtros para la tabla `departamentosempre`
--
ALTER TABLE `departamentosempre`
  ADD CONSTRAINT `fk_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `espeempresa`
--
ALTER TABLE `espeempresa`
  ADD CONSTRAINT `espeempresa_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`),
  ADD CONSTRAINT `espeempresa_ibfk_2` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`id_especialidad`);

--
-- Filtros para la tabla `ex_alumnos`
--
ALTER TABLE `ex_alumnos`
  ADD CONSTRAINT `fk_ocupaciones` FOREIGN KEY (`ocupacion`) REFERENCES `ocupaciones` (`id_ocupacion`);

--
-- Filtros para la tabla `registrospp`
--
ALTER TABLE `registrospp`
  ADD CONSTRAINT `fk_alumno` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`carnet`),
  ADD CONSTRAINT `registrospp_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id_empresa`);
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
  `contraseña_admin` varchar(100) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `permiso_create` tinyint(1) NOT NULL,
  `permiso_update` tinyint(1) NOT NULL,
  `permiso_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`codigo_admin`, `contraseña_admin`, `correo`, `permiso_create`, `permiso_update`, `permiso_delete`) VALUES
(20140666, '666', 'diegoquinteros02.04.97@gmail.com', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `carnet` int(8) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
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
  `inscrito` varchar(9) DEFAULT NULL,
  `pregunta` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `respuesta` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`carnet`, `contraseña`, `nie`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `grado`, `especialidad`, `grupo_Tecnic`, `secc`, `grupo_academ`, `inscrito`, `pregunta`, `respuesta`) VALUES
(1, '0', 2, 'w', 'w', 'w', 'w', 2, 2, 2, 2, 2, 'FALSO', '', '0'),
(20110005, '0', 1684787, 'Andrea', 'Guadalupe', 'Marroquín', 'Paredes', 1, 3, 1, 1, 2, 'VERDADERO', 'Nombre de mi mascota', 'Pepito'),
(20110014, '0', 1683484, 'Katya', 'Michelle', 'Mathies', 'Sánchez', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20110035, '0', 2330559, 'Diego', 'Alfonso', 'García', 'Flores', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20110036, '0', 5864765, 'Gerson', 'Adin', 'López', 'Alvarado', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20110046, '0', 6262148, 'Eduardo', 'Antonio', 'Batres', 'Alvarado', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20110056, '0', 780160, 'Ricardo', 'Alejandro', 'Velásquez', 'Vega', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20110078, '0', 1686240, 'Gerardo', 'Antonio', 'Hernández', 'Hurtado', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20110085, '0', 1686145, 'Héctor', 'Antonio', 'Zelaya', 'Abrego', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20110086, '0', 1673660, 'Oscar', 'Armando', 'Vargas', 'Hernández', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20110092, '0', 1680535, 'Leslie', 'Elizabeth', 'Mejía', 'Ramírez', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20110094, '0', 1686239, 'Javier', 'Enrique', 'Guevara', 'Flores', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20110099, '0', 1675222, 'Erick', 'Gabriel', 'Soto', 'Mena', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20110106, '0', 1676531, 'Ricardo', 'Andrés', 'Calderón', 'Alfaro', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20110122, '0', 1676042, 'María', 'José', 'Nuila', 'López', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20110129, '0', 1679791, 'Christian', 'Javier', 'Jaco', 'Avilés', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20110134, '0', 1686204, 'Josué', 'Daniel', 'Osorto', 'Rivera', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20110182, '0', 1670737, 'Benjamín', 'Alejandro', 'Benítez', 'Vásquez', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20110183, '0', 1686224, 'Laura', 'Denisse', 'Cabezas', 'Solórzano', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20110206, '0', 1676227, 'Abel', 'Eduardo', 'Rodríguez', 'Ortíz', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20110227, '0', 1672613, 'José', 'Arturo', 'Romero', 'Gálvez', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20110247, '0', 1674172, 'Miguel', 'Antonio', 'Osegueda', 'Hernández', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20110249, '0', 1969511, 'Werner', 'Eduardo', 'Gómez', 'Zepeda', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20110264, '0', 1675778, 'Iván', 'Antonio', 'Viche', 'Campos', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20110266, '0', 1672937, 'José', 'Mauricio', 'Rivera', 'Sánchez', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20110272, '0', 1676317, 'María', 'Esperanza', 'Peña', 'Melara', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20110274, '0', 1692677, 'Cristian', 'Moisés', 'Cerritos', 'Bernal', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20110282, '0', 1690782, 'Mirna', 'Paola', 'Zavala', 'Lazo', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20110291, '0', 1686223, 'William', 'Alexander', 'García', 'Contreras', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20110292, '0', 1684959, 'Luis', 'Fernando', 'Acevedo', 'Renderos', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20110293, '0', 1690232, 'Denny', 'Rolando', 'Amaya', 'Juárez', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20110327, '0', 1674919, 'Adriana', 'Beatriz', 'Menjívar', 'Romero', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20110339, '0', 1670437, 'Aida', 'Gabriela', 'Rodríguez', 'López', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20110357, '0', 1967575, 'Norma', 'Patricia', 'Marroquín', 'Lima', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20110376, '0', 4363219, 'Fátima', 'Susana', 'Calles', 'Calles', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20110377, '0', 1691011, 'Diego', 'Pablo', 'Bracamonte', 'Romero', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20110378, '0', 1692871, 'Anderson', 'Ernesto', 'Barillas', 'Nuñez', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20110403, '0', 1687459, 'Luis', 'Alejandro', 'Rivas', 'Bonilla', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20110418, '0', 4364397, 'Luis', 'David', 'Guevara', 'Rodríguez', 1, 5, 1, 2, 2, 'VERDADERO', '', '0'),
(20110429, '0', 1683621, 'Franklin', 'Nahum', 'Ventura', 'Cruz', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20110442, '0', 1674221, 'Andrea', 'Geraldine', 'Palma', 'Villatoro', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20110478, '0', 5202567, 'Fernando', 'Alberto', 'Santana', 'Benítez', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20110502, '0', 3098710, 'Edgar', 'Ofilio', 'Chicas', 'Leiva', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20110506, '0', 5238407, 'Sarah', 'Valeria', 'Miranda', 'Quinteros', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20110509, '0', 1691887, 'Daniela', 'Alexandra', 'Peña', 'Hernández', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20110510, '0', 1691897, 'Oscar', 'Francisco', 'Ramos', 'Villalta', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20110512, '0', 1694367, 'Ernesto', 'Alexander', 'Cruz', 'Martínez', 1, 5, 1, 2, 2, 'VERDADERO', '', '0'),
(20110555, '0', 6368098, 'Milicen', 'Andrea', 'Garay', 'Ortez', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20110564, '0', 1685918, 'Carlos', 'Mario', 'Martínez', 'Guardado', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20110569, '0', 1172814, 'Andrea', 'Elizabeth', 'García', 'Vásquez', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20110582, '0', 1692869, 'Fernando', 'José', 'Alonzo', 'Reyes', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20110594, '0', 4363521, 'Willian', 'Stanley', 'Cocar', 'Genovez', 1, 6, 1, 2, 1, 'VERDADERO', '', '0'),
(20110601, '0', 3099142, 'Irene', 'María', 'Salvatierra', 'Mejía', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20110615, '0', 3099136, 'Evelyn', 'Carolina', 'Barahona', 'Martínez', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20110642, '0', 1674171, 'Samuel', 'Osmin', 'Henríquez', 'Osegueda', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20110643, '0', 1676016, 'Luis', 'Ernesto', 'Gutiérrez', 'González', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20110645, '0', 2330560, 'Diego', 'Alejandro', 'Rodríguez', 'Coreas', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20110705, '0', 4361998, 'Ernesto', 'Vladimir', 'Santos', 'Díaz', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20110794, '0', 1685924, 'Max', 'Edgardo', 'Palencia', 'Hernández', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20110795, '0', 1671695, 'Chritian', 'Rafael', 'Chacón', 'Manzur', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20120021, '0', 2211817, 'Jorge', 'Andre', 'Franco', 'Hernández', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20120064, '0', 1676083, 'José', 'Antonio', 'Morales', 'Lira', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20120113, '0', 2667749, 'Mauricio', 'Ernesto', 'León', 'Preza', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20120133, '0', 1686143, 'Eduardo', 'Alberto', 'López', 'Torres', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20120181, '0', 7116222, 'Moisés', 'Antonio', 'Arévalo', 'Ayala', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20120202, '0', 1685677, 'Gabriela', 'Patricia', 'Rodríguez', 'Sánchez', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20120263, '0', 1684997, 'Jonathan', 'Moisés', 'Hernández', 'Posada', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20120391, '0', 1685764, 'Sonia', 'Gabriela', 'Vargas', 'Miranda', 1, 3, 2, 2, 1, 'VERDADERO', '', '0'),
(20120506, '0', 1678488, 'Walter', 'Orlando', 'Díaz', 'López', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20120528, '0', 1681551, 'Ana', 'Laura', 'Chávez', 'Mijango', 1, 6, 1, 2, 2, 'VERDADERO', '', '0'),
(20120575, '0', 1686319, 'Andrea', 'Alicia', 'Barraza', 'Díaz', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20120618, '0', 1685337, 'Vanessa', 'Rocío', 'Muñoz', 'Salazar', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20120629, '0', 4364534, 'Tatiana', 'Michelle', 'Orantes', 'Cardoza', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20120678, '0', 2049820, 'Edwin', 'Alberto', 'López', 'Almira', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20120757, '0', 1695422, 'Ernesto', 'José', 'Melara', 'Carrillo', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20120762, '0', 1677311, 'Diego', 'Mauricio', 'Campos', 'Moreno', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20120775, '0', 1688621, 'Johanna', 'Esmeralda', 'Aquino', 'Murcia', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20120812, '0', 5681610, 'Stacy', 'Alejandra', 'Figueroa', 'Mendoza', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20120863, '0', 1685483, 'Carlos', 'Isaac', 'Ventura', 'Guevara', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20120871, '0', 1676262, 'Trixia', 'Aroneth', 'Delgado', 'Solórzano', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20120895, '0', 2308871, 'Kenya', 'Alexandra', 'Teshé', 'Cartagena', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20120935, '0', 1690656, 'Wendy', 'Lisseth', 'Pérez', 'Lovos', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20120968, '0', 1717047, 'Sergio', 'Eduardo', 'Arce', 'López', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20130066, '0', 1687597, 'Ivette', NULL, 'Lemus', 'Guevara', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20130082, '0', 4363782, 'Gabriela', 'Abigaíl', 'Vásquez', 'Castillo', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20130113, '0', 4363115, 'Rafael', 'Antonio', 'Mateu', 'Choto', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20130124, '0', 5099735, 'Iván', 'Alejandro', 'Rivas', 'Sánchez', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20130126, '0', 1686059, 'Carlos', 'Alberto', 'Díaz', 'Rivera', 1, 5, 1, 2, 2, 'VERDADERO', '', '0'),
(20130133, '0', 1686821, 'Kevin', 'Samuel', 'Delgado', 'Rivera', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20130209, '0', 5099730, 'Oscar', 'Eduardo', 'Landaverde', 'Medina', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20130238, '0', 2345129, 'Mónica', 'Marcela', 'Paz', 'Quintanilla', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20130241, '0', 1687551, 'Katherine', 'Irene', 'Gutiérrez', 'Aguirre', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20130259, '0', 1689520, 'Herbert', 'Ernesto', 'Vásquez', 'Ruíz', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20130261, '0', 2235224, 'Boris', 'Edgardo', 'Rafailano', 'Dimas', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20130267, '0', 2235222, 'María', 'Jhoselin', 'Pérez', 'Flores', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20130281, '0', 1849681, 'Leonardo', 'Andrés', 'Hernández', 'Hernández', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20130320, '0', 1676332, 'Bernardo', 'Javier', 'Avilés', 'López', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20130321, '0', 1685157, 'Anthony', 'Joseph', 'Martínez', 'Sosa', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20130347, '0', 1453598, 'Gerardo', 'Ernesto', 'Argueta', 'De Paz', 1, 6, 1, 2, 2, 'VERDADERO', '', '0'),
(20130410, '0', 2030760, 'Stephanie', 'Elizabeth', 'Castaneda', 'Chávez', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20130513, '0', 1695727, 'Gabriel', 'Alejandro', 'Rivera', 'Miranda', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20130544, '0', 1687540, 'Mario', 'German', 'González', 'Burgos', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20130552, '0', 4363626, 'Gabriel', 'Antonio', 'Andaluz', 'Sagastume', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20130576, '0', 1688863, 'Rafael', 'Edgardo', 'Chacón', 'Callejas', 1, 6, 1, 2, 2, 'VERDADERO', '', '0'),
(20130633, '0', 798038, 'Emely', 'Adriana', 'Ramírez', 'Alvarado', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20130652, '0', 1675932, 'David', 'Esaú', 'Díaz', 'Roldán', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20130686, '0', 5681924, 'Evelyn', 'Johanna', 'Martínez', 'Romero', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20130727, '0', 1692278, 'Verónica', 'Elizabeth', 'Pacheco', 'Sánchez', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20130756, '0', 1691701, 'Ricardo', 'Arturo', 'Orantes', 'Rivera', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20130881, '0', 787899, 'David', 'Alejandro', 'Miranda', 'Quezada', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20130896, '0', 1687907, 'Ernesto', 'Eduardo', 'Solano', 'Flores', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20130935, '0', 4974629, 'Kevin', 'Francisco', 'Vásquez', 'Grande', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20131034, '0', 1682360, 'Mónica', 'Susana', 'Bonilla', 'García', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20140002, '0', 4363519, 'José', 'Alfredo', 'Burgos', 'Cruz', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140003, '0', 5684028, 'Raúl', 'Alexander', 'Sánchez', 'Menjívar', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20140004, '0', 2722205, 'Mauricio', 'Alejandro', 'Parada', 'Méndez', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20140006, '0', 1688933, 'Patricia', 'Consuelo', 'Merino', 'Ayala', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20140007, '0', 4363217, 'Sara', 'Marloni', 'Mayorga', 'García', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20140008, '0', 4363523, 'Gabriel', 'Alejandro', 'Hidalgo', 'Rodríguez', 1, 6, 1, 2, 1, 'VERDADERO', '', '0'),
(20140010, '0', 1686092, 'Kennet', 'Iván', 'Crespín', 'Solís', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20140028, '0', 1673704, 'Lissa', 'Lorena', 'Valenzuela', 'Canjura', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20140038, '0', 4361999, 'Juan', 'Carlos', 'Serrano', 'Lemus', 1, 6, 1, 2, 1, 'VERDADERO', '', '0'),
(20140039, '0', 1677718, 'José', 'Alejandro', 'Herrera', 'Ventura', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140040, '0', 1684831, 'Daniel', 'Alexander', 'Cornejo', 'Fajardo', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140042, '0', 4364003, 'Carlos', 'Javier', 'Reyes', 'Guardado', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20140043, '0', 2584118, 'Bryan', 'Adolfo', 'Romero', 'Payés', 1, 3, 2, 2, 1, 'VERDADERO', '', '0'),
(20140046, '0', 6761080, 'Fátima', 'Guadalupe', 'Hernández', 'González', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20140055, '0', 4363627, 'Gabriela', 'Gisselle', 'Callejas', 'Álvarez', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20140056, '0', 2934643, 'Mayra', 'Alejandra', 'Domínguez', 'Menjívar', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20140059, '0', 4363508, 'Rodrigo', 'Andrés', 'Ayala', 'Escalante', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20140060, '0', 1688595, 'Mónica', 'Alejandra', 'Gómez', 'Solórzano', 1, 4, 2, 1, 4, 'VERDADERO', '', '0'),
(20140061, '0', 1511728, 'Héctor', 'Osmin', 'Larreinaga', 'Paz', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140063, '0', 1580811, 'María', 'Fernanda', 'Miranda', 'Ramírez', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20140065, '0', 1702025, 'Carlos', 'Andrés', 'Artiga', 'Pacheco', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140069, '0', 1683964, 'José', 'Fabricio', 'Acevedo', 'López', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140071, '0', 1686023, 'Walter', 'Ernesto', 'Flores', 'Paz', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140076, '0', 4364004, 'Silvia', 'María', 'Rodríguez', 'Gallegos', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20140078, '0', 4362727, 'Roberto', 'Carlos', 'Martínez', 'Cerón', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20140084, '0', 1674939, 'Alejandro', 'Javier', 'González', 'Loarca', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20140085, '0', 3130796, 'Adilio', 'Adonay', 'Umaña', 'Mena', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20140089, '0', 784337, 'Fredy', 'Alexander', 'Castro', 'George', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140091, '0', 1687599, 'Nelson', 'Steve', 'Mata', 'Alfaro', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140102, '0', 1695844, 'Diana', 'Elizabeth', 'Escalante', 'Cruz', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140105, '0', 1696508, 'Cristian', 'Geovanny', 'Quijada', 'Rosa', 1, 5, 1, 2, 2, 'VERDADERO', '', '0'),
(20140107, '0', 4364186, 'Gabriela', 'Alejandra', 'Amaya', 'Fuentes', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20140110, '0', 1671997, 'Diego', 'Abraham', 'Preza', 'Cardoza', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20140114, '0', 1675733, 'Gerson', 'Joaquín', 'Pérez', 'Muñoz', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20140115, '0', 1675465, 'Herber', 'Saúl', 'Pérez', 'Dimas', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20140116, '0', 1695621, 'Daniel', 'Enrique', 'Alvarado', 'Pleitez', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140118, '0', 1970879, 'Ricardo', 'Ernesto', 'Gómez', 'Crespo', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20140123, '0', 1695892, 'Pamela', 'Sofía', 'Calles', 'Tobías', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140124, '0', 1671197, 'Guillermo', 'Javier', 'Morales', 'Cornejo', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140128, '0', 4363778, 'Ricardo', 'Alexander', 'Hernández', 'Minero', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140136, '0', 1694974, 'Zulma', 'Belén', 'Aguillón', 'Castro', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140138, '0', 1687601, 'Fernando', 'Antonio', 'Monteagudo', 'Cordova', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20140142, '0', 4363633, 'Sara', 'Lucía', 'Palomo', 'Mejía', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140144, '0', 6761092, 'Diana', 'Carolina', 'Benavides', 'Nuila', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20140145, '0', 6761087, 'Mónica', 'Lisseth', 'Hernández', 'Candray', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140149, '0', 1850007, 'Gerson', 'Fernando', 'Muñoz', 'Sosa', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20140151, '0', 2131290, 'Ariel', 'Alexander', 'Gamero', 'Mejía', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20140153, '0', 1694574, 'David', 'Emanuel', 'Orantes', 'Cubías', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20140155, '0', 4362497, 'Daniel', 'Wilfredo', 'Granados', 'Hernández', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140156, '0', 2054913, 'Edgar', 'Gustavo', 'Cordova', 'Rivas', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140157, '0', 6761975, 'Douglas', 'Enrique', 'Romero', 'Pineda', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20140159, '0', 1671834, 'Gustavo', 'Amilcar', 'López', 'Aquino', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20140161, '0', 1672558, 'Omar', 'Alexander', 'Ramírez', 'Flores', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20140165, '0', 1691694, 'María', 'Esther', 'Marroquín', 'Canjura', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140168, '0', 1670739, 'Carlos', 'Guillermo', 'Eguizabal', 'Orellana', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140173, '0', 6105685, 'Iván', 'Stanley', 'Ortíz', 'Paniagua', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20140180, '0', 2131295, 'Kathya', 'Melissa', 'López', 'Cortez', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140196, '0', 1974315, 'Valeria', 'Alejandra', 'Juárez', 'Rosales', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140199, '0', 1685920, 'Diego', 'Fernando', 'Muñoz', 'Noubleau', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20140200, '0', 917651, 'Leslie', 'Paola', 'González', 'Flores', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20140204, '0', 1686241, 'Oscar', 'Omar', 'Lizama', 'Escobar', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20140206, '0', 1673173, 'Alexander', 'Ariel', 'Mendoza', 'Méndez', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20140209, '0', 6438038, 'Carlos', 'Antonio', 'Aguirre', 'Montes', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20140210, '0', 4362075, 'María', 'José', 'Torres', 'Morales', 1, 3, 2, 2, 3, 'VERDADERO', '', '0'),
(20140211, '0', 1849978, 'Alejandro', 'Donalí', 'Hernández', 'Ramos', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20140213, '0', 1684514, 'Roberto', 'Alexander', 'Rubio', 'Castillo', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140219, '0', 4955209, 'Luis', 'Andrés', 'Torres', 'Alvarado', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140225, '0', 1694976, 'Johanna', 'Lissette', 'Beltrán', 'Gómez', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140233, '0', 1674311, 'Ricardo', 'Arturo', 'Andasol', 'Escalante', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140249, '0', 1697907, 'José', 'Miguel', 'De Asís', 'Ulloa', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20140251, '0', 1671666, 'Cindy', 'Carolina', 'Flores', 'Bran', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140254, '0', 4364246, 'Stephanie', 'Carolina', 'Moreno', 'Cerón', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20140257, '0', 487330, 'Kelvin', 'Adonay', 'Palacios', 'Del Cid', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140258, '0', 6370546, 'Kenneth', 'Isaac', 'Sánchez', 'Flores', 1, 6, 1, 2, 2, 'VERDADERO', '', '0'),
(20140266, '0', 1687596, 'Jonathan', 'Eduardo', 'González', 'Sosa', 1, 6, 1, 2, 1, 'VERDADERO', '', '0'),
(20140272, '0', 4363143, 'Emilio', 'Stanley', 'Ramírez', 'Fuentes', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140278, '0', 6761961, 'Rodrigo', 'Salvador', 'Parras', 'Castillo', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140280, '0', 1692289, 'Ricardo', 'Alfredo', 'Pleitez', 'Torres', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20140282, '0', 6438052, 'René', 'Paul', 'Orellana', 'Campos', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20140290, '0', 1672072, 'Gabriel', 'Sebastián', 'Mora', 'Barrientos', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20140301, '0', 1671049, 'Brenda', 'Patricia', 'Preza', 'García', 1, 4, 1, 2, 4, 'VERDADERO', '', '0'),
(20140303, '0', 1687548, 'Salvador', 'Alonso', 'Amaya', 'Mejía', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140306, '0', 1676356, 'Christian', 'Alberto', 'Gutiérrez', 'Rodríguez', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140307, '0', 1676046, 'Luis', 'Armando', 'Chévez', 'Durán', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140309, '0', 1674248, 'Edwin', 'Anibal', 'Escobar', 'Portillo', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20140314, '0', 5532151, 'Carlos', 'Alberto', 'Blanco', 'Rivera', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140315, '0', 1677221, 'Luis', 'Eduardo', 'Hernández', 'González', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140316, '0', 3553705, 'Fernando', 'Josué', 'Blanco', 'Palacios', 1, 6, 1, 2, 2, 'VERDADERO', '', '0'),
(20140321, '0', 2029796, 'Isela', 'Abigail', 'Cisneros', 'Olmedo', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20140324, '0', 5681612, 'Milagro', 'Margarita', 'Hernández', 'Morán', 1, 6, 1, 2, 1, 'VERDADERO', '', '0'),
(20140334, '0', 2093944, 'Marvin', 'Fernando', 'Paredes', 'Choto', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20140342, '0', 4363634, 'Diego', 'Enrique', 'Quinteros', 'Lemus', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20140349, '0', 7318440, 'María', 'José', 'Pineda', 'Calero', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20140353, '0', 1683386, 'Alejandra', 'Beatriz', 'Menjivar', 'Orellana', 1, 6, 1, 2, 1, 'VERDADERO', '', '0'),
(20140354, '0', 1455995, 'William', 'Adalberto', 'Ovando', 'Méndez', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20140357, '0', 1741860, 'Josué', 'Antonio', 'Caballero', 'Caballero', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20140369, '0', 3194011, 'Kelly', 'Andrea', 'Figueroa', 'García', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140376, '0', 4364189, 'Diego', 'René', 'Herrera', 'Jiménez', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20140386, '0', 2185296, 'Hugo', 'Alejandro', 'Landaverde', 'Lara', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20140398, '0', 1706946, 'Paul', 'Alexis', 'Ramos', 'Escobar', 1, 4, 2, 2, 2, 'VERDADERO', '', '0'),
(20140403, '0', 1447962, 'Manuel', 'Enrique', 'Coto', 'Parada', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20140406, '0', 6761881, 'Favio', 'Roberto', 'López', 'Peña', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140407, '0', 1676938, 'Andrea', 'Nicole', 'Urbina', 'Mena', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140411, '0', 6105709, 'Oscar', 'Isaac', 'Tobar', 'Bonilla', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20140417, '0', 1683976, 'Alan', 'Guillermo', 'Turcios', 'Villalta', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20140419, '0', 2240654, 'Gilberto', 'Alexander', 'Corleto', 'Rivera', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20140420, '0', 1683141, 'Rafael', 'Stanley', 'Pérez', 'Mejía', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140423, '0', 782088, 'Gabriela', 'María', 'Pineda', 'Huezo', 1, 3, 2, 2, 3, 'VERDADERO', '', '0'),
(20140424, '0', 1684125, 'Carlos', 'Enrique', 'Mendoza', 'Delgado', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20140431, '0', 1696846, 'Irvin', 'Danilo', 'Melgar', 'Escobar', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20140436, '0', 4363116, 'Arianna', 'Gisela', 'Mejía', 'Henríquez', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140442, '0', 1672834, 'Julio', 'Armando', 'Barrientos', 'Mendoza', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20140445, '0', 790049, 'Mirian', 'Verónica', 'Vásquez', 'Salomé', 1, 3, 2, 2, 3, 'VERDADERO', '', '0'),
(20140455, '0', 1682432, 'Jeniffer', 'Arlette', 'Rivas', 'Zelaya', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20140466, '0', 1689660, 'Sofía', 'Eugenia', 'Mena', 'Ortíz', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20140468, '0', 1673855, 'Rocío', 'Esmeralda', 'Morán', 'Gómez', 1, 3, 2, 2, 3, 'VERDADERO', '', '0'),
(20140469, '0', 1685125, 'Luis', 'Fernando', 'Chávez', 'Mayorga', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20140477, '0', 2131300, 'Kevin', 'David', 'Navarro', 'Chanchan', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20140481, '0', 1688852, 'Stephanie', 'Natalia', 'Alas', 'Mendez', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20140491, '0', 1675984, 'Jorge', 'Herminio', 'Villatoro', 'Henríquez', 1, 5, 1, 2, 3, 'VERDADERO', '', '0'),
(20140492, '0', 1958227, 'Luis', 'Enrique', 'Araujo', 'Aquino', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140500, '0', 1681938, 'Rafael', 'Ernesto', 'Galdámez', 'Rivera', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140503, '0', 3553702, 'Mario', 'Enrique', 'Samayoa', 'Campos', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140504, '0', 2240637, 'Mariela', 'Alejandra', 'Reyes', 'Dueñas', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140513, '0', 1686243, 'Kevin', 'Antonio', 'Larios', 'Mejía', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20140517, '0', 800835, 'Nelson', 'Alfredo', 'Paniagua', 'Sigui', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20140521, '0', 1674630, 'Humberto', 'Napoleón', 'Galdámez', 'García', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140528, '0', 1677045, 'Oscar', 'Josué', 'Quevedo', 'Palacios', 1, 6, 1, 1, 2, 'VERDADERO', '', '0'),
(20140542, '0', 2355024, 'Manuel', 'Alfredo', 'Landaverde', 'Barahona', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140547, '0', 4976229, 'Fernando', 'Enrique', 'Castaneda', 'Figueroa', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20140551, '0', 1687369, 'Gabriela', 'Del Carmen', 'Lucero', 'Mejía', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140554, '0', 1675306, 'Pamela', 'Rocío', 'López', 'Flores', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140559, '0', 1685971, 'Claudia', 'Guadalupe', 'Flores', 'Gracias', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140560, '0', 1672077, 'Lilian', 'Jeannette', 'Umanzor', 'Campos', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20140567, '0', 1449764, 'Daniel', 'Alejandro', 'Henríquez', 'Rodas', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140570, '0', 1684513, 'Ángel', 'Enrique', 'Morales', 'Cardoza', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20140571, '0', 780394, 'Gerardo', 'Enrique', 'Rivera', 'Martínez', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20140573, '0', 1680293, 'Germán', 'Alexander', 'Sánchez', 'Mejía', 1, 4, 2, 2, 1, 'VERDADERO', '', '0'),
(20140574, '0', 3194231, 'Marta', 'Elena', 'Martínez', 'Flores', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140591, '0', 1683967, 'Diego', 'Daniel', 'Barrientos', 'Cortez', 1, 5, 1, 2, 2, 'VERDADERO', '', '0'),
(20140595, '0', 1694484, 'Ulíses', 'Giovanni', 'Granillo', 'Díaz', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140600, '0', 1671823, 'Ángel', 'Mauricio', 'Acevedo', 'Guardado', 1, 6, 1, 2, 2, 'VERDADERO', '', '0'),
(20140620, '0', 1675664, 'Keren', 'Gisselle', 'Reyes', 'Mármol', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140622, '0', 1849576, 'Dennis', 'Giovanni', 'Regalado', 'Durán', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20140628, '0', 1683569, 'Gabriela', 'Ileana', 'Blanco', 'Rodríguez', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140635, '0', 1676681, 'Daniela', 'Esmeralda', 'Figueroa', 'Portillo', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140641, '0', 785561, 'Gissela', 'Beatriz', 'Acevedo', 'Calero', 1, 3, 2, 2, 2, 'VERDADERO', '', '0'),
(20140643, '$2y$10$dkqJqtNrxmRTqVCSt8gbQOgGSJQA23rqqLCBs6Cy9zIIyzBgebUUG', 3982723, 'Jorge', 'Alejandro', 'Calderón', 'De Paz', 1, 6, 1, 2, 2, 'VERDADERO', '¿Nombre de mi primer mascota?', 'Axel'),
(20140656, '0', 6761992, 'Gabriel', 'Armando', 'Monge', 'Caballero', 1, 6, 2, 1, 3, 'VERDADERO', '', '0'),
(20140658, '0', 1676905, 'Oscar', 'Rafael', 'Parras', 'Padilla', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20140679, '0', 3553700, 'Luis', 'Fernando', 'Larín', 'Contreras', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140685, '0', 1687186, 'Abraham', 'Gilberto', 'Martínez', 'Oliva', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140686, '0', 6727034, 'Edgardo', 'Javier', 'Guidos', 'Membreño', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140701, '0', 1971883, 'Eduardo', 'Ulises', 'Arias', 'Cerón', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140705, '0', 6496935, 'Lourdes', 'Eunice', 'Calderón', 'Villeda', 1, 1, 1, 1, 3, 'VERDADERO', '', '0'),
(20140720, '0', 1674163, 'José', 'Francisco', 'Abarca', 'Reyes', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20140740, '0', 6761958, 'Ariel', 'Nahomy', 'Menjivar', 'Guevara', 1, 3, 2, 2, 3, 'VERDADERO', '', '0'),
(20140743, '0', 1683275, 'Valeria', 'Nicole', 'Ayala', 'Morales', 1, 3, 1, 1, 1, 'VERDADERO', '', '0'),
(20140746, '0', 1671158, 'Beatriz', 'Eunice', 'Viera', 'Dimas', 1, 1, 1, 2, 1, 'VERDADERO', '', '0'),
(20140763, '0', 2632543, 'Katherine', 'Elisa', 'Vides', 'Orellana', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20140776, '0', 1670937, 'Erick', 'Wilfredo', 'Arévalo', 'Alvarado', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140786, '0', 780500, 'German', 'William', 'Rodríguez', 'López', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140788, '0', 2789468, 'Nathaly', 'Nohemy', 'Pérez', 'Molina', 1, 2, 1, 1, 4, 'VERDADERO', '', '0'),
(20140789, '0', 6794604, 'Wilson', 'Saddam', 'Cerna', 'Roque', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20140793, '0', 1677778, 'Douglas', 'Ernesto', 'Guillén', 'García', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20140797, '0', 2049832, 'Ali', 'Balmore', 'Barahona', 'Reyes', 1, 5, 1, 1, 1, 'VERDADERO', '', '0'),
(20140815, '0', 5716816, 'Byron', 'Armando', 'Loza', 'Guzmán', 1, 6, 2, 2, 1, 'VERDADERO', '', '0'),
(20140821, '0', 2597127, 'René', 'Isaac', 'Alfaro', 'Funes', 1, 6, 1, 1, 1, 'VERDADERO', '', '0'),
(20140826, '0', 1683499, 'Diego', 'Alexander', 'Méndez', 'Waldthausen', 1, 5, 1, 1, 2, 'VERDADERO', '', '0'),
(20140850, '0', 6536571, 'Jocelyn', 'Nohemy', 'Hernández', 'Hernández', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140887, '0', 1670574, 'Sergio', 'Alejandro', 'Henríquez', 'Renderos', 1, 5, 1, 2, 2, 'VERDADERO', '', '0'),
(20140891, '0', 1692690, 'Miguel', 'Eduardo', 'Guerra', 'Fuentes', 1, 2, 1, 2, 3, 'VERDADERO', '', '0'),
(20140901, '0', 5864860, 'Bryan', 'Enrique', 'Izaguirre', 'Zelada', 1, 3, 2, 2, 4, 'VERDADERO', '', '0'),
(20140916, '0', 1689699, 'Fernando', 'José', 'Ramos', 'Herrera', 1, 4, 1, 1, 4, 'VERDADERO', '', '0'),
(20140917, '0', 2343252, 'Erlinda', 'Rebeca', 'Sandoval', 'Reyes', 1, 6, 2, 2, 3, 'VERDADERO', '', '0'),
(20140927, '0', 4363212, 'Jocelyn', 'Alexandra', 'Fuentes', 'Molina', 1, 3, 1, 1, 2, 'VERDADERO', '', '0'),
(20140933, '0', 2608873, 'Jorge', 'Alexander', 'Guardado', 'Alfaro', 1, 2, 1, 1, 3, 'VERDADERO', '', '0'),
(20140943, '0', 5003962, 'Carlos', 'Antonio', 'De La Cruz', 'Romero', 1, 4, 1, 2, 3, 'VERDADERO', '', '0'),
(20140948, '0', 1365662, 'Melissa', 'Alejandra', 'García', 'Cunza', 1, 2, 1, 2, 4, 'VERDADERO', '', '0'),
(20140966, '0', 1679870, 'José', 'Rodrigo', 'Cerrato', 'Cruz', 1, 4, 1, 1, 3, 'VERDADERO', '', '0'),
(20141012, '0', 5202755, 'Jimmy', 'André', 'Reyes', 'Colocho', 1, 1, 1, 1, 4, 'VERDADERO', '', '0'),
(20141013, '0', 1971180, 'Ariel', 'Alexander', 'Martínez', 'Natarén', 1, 6, 2, 1, 4, 'VERDADERO', '', '0'),
(20141015, '0', 1720140, 'Nelson', 'Eduardo', 'Martínez', 'Lovo', 1, 4, 2, 1, 3, 'VERDADERO', '', '0'),
(20141020, '0', 1679131, 'Esmerly', 'Jociel', 'Campos', 'Velasco', 1, 1, 1, 2, 2, 'VERDADERO', '', '0'),
(20150423, '0', 1688635, 'César', 'Alberto', 'Morales', 'Orellana', 1, 5, 1, 2, 4, 'VERDADERO', '', '0'),
(20150781, '0', 1688017, 'Otto', 'Efraín', 'Cabrera', 'Castro', 1, 3, 2, 2, 1, 'VERDADERO', '', '0');

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
  `año` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `años`
--

INSERT INTO `años` (`id_año`, `año`) VALUES
(1, 'Segundo Año'),
(2, 'Tercer Año'),
(3, 'Tercer Año PILLET');

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
  `contraseña_empre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `rubro`, `direccion`, `telefono`, `contacto`, `correo`, `codigo_empresa`, `contraseña_empre`) VALUES
(1, 'Blanco Ingenieros Constructores', 'Arquitectura', 'Condominio IMPEP 0-39 Apto. 24-A, Mejicanos S.S', 78736030, 'Ing. Fredy Rafael Vicente Blanco', 'Bingeon@hotmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(2, 'COLEGIO MARISTA SAN ALFONSO', 'ARQUITECTURA', 'MEJICANOS', 22720870, 'ALDO AREVALO LARIN', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(3, 'Monisterio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Li. Arturo Cardona', 'arturo.cardona@mop.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(4, 'Innova Dreams Solutions\nVICEMINISTERIO DE VIVIENDA Y DESARROLLO URBANO MOPTVDU', 'ARQUITECTURA', 'Col San Francisco calle los Abetos #23 S.S.\npor distrito 4 de la Alcaldia 4\npropiedades al lado izquierdo\nAV. MANUEL ENRIQUE ARAUJO KM 5 1/2 CALLE SANTA TECLA', 22686411, 'Carolina Nuñez\nLIC. JOSE ARTURO CARDONA', 'gruposegovia.sa@gmail.com\nsit.vivienda@mop.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(5, 'Inversiones Consultores S.A. de C.V.', 'ARQUITECTURA', 'Av. Libertad no. 204 San Salvador', 25150787, 'Arq. Marvin Alberto Chicas Escamilla', 'rcinversionesconsultores@hotmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(6, 'Grimaldi Hnos. S. A. de C. V. Freelans Estudio', 'ARQUITECTURA', '67 Av. Sur pje caribe #13 Col. Roma S.S.', 22455257, 'Arq. Luis Herrera', 'luis@frelansestudio.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(7, 'Diseño y Publicidad. S.A. de C.V.', 'ARQUITECTURA', 'Urb. Lorencia, poligono 15 casa 5, San Marcos', 25329950, 'Ing. Francisco Muñoz', 'dpcolorimagen2012@hotmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(8, 'Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Lic. Arturo Cardona', 'arturo.cardona@mop.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(9, 'Corte Suprema de Justicia, depto de ingenieria', 'ARQUITECTURA', 'Diagonal Universitaria Centro de Gobierno edificio de oficinas administrativas y jurídicas de la C:S:J:, San Salvador', NULL, 'Arq. Rafael Claros', 'rafaclarosxto@yahoo.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(10, 'CAESS 4', 'ELECTRICIDAD', 'Calle el bambú col. San Antonio', 22299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(11, 'MOPTVDU Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283069, 'Arq. Juan Bernardo Amaya', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(12, 'Universidad de El Salvador', 'EDUCACION', 'Final 25 av. Sur norte ciudad universitaria', 22355235, 'Arq. Manuel Ortiz Garmendez', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(13, 'Cincopatasalgato, S.A. de C.V.', 'ARQUITECTURA', 'Av. Las Palmas pje 6#114 col. San Benito', 25645746, 'Lourdes Canizales', 'admin@cincopatasalgato.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(14, 'DIRECCION DEPARTAMENTAL DE EDUCACIÓN DE SH SALVADOR', 'SERVICIOS DE EDUCACIÓN', '25 AV NOTE. Y CALLE SAN ANTONIO ABAD CONTIGUO A UES', 25221065, 'ARQ. HENRY ROSENDO MONTENEGRO', 'HENRIKMONTENEGRO@YAHOO.ES', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(15, 'Frilans Estudio Grimadi Hnos. S.A. de C.V.', 'ARQUITECTURA', '67 av. Sur pje caribe #13 col. Roma S.S.', 22455257, 'Arq. Luis Herrera', 'luis@frilansestudio.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(17, 'ORG Arquitectura construciones, S.A. de C. V.', 'ARQUITECTURA', 'Col Maquilishuat calle la mascota #93.3 B S.S.', 25369444, 'Arq. José David Gonzalez', 'david.gonzalez@grupoorg.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(18, 'Almacenes Vidrí, S.A. de C.V. 5', 'COMERCIALIZACIÓN', 'Centro Comercial Metropolis Col. Zacamil', 22725000, 'Sergio mendez', 's.metropolis@vidri.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(19, 'MOPTVDU Ministerio de Obras Públicas 1', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283069, 'Arq. Juan Bernardo Amaya Alvarez', 'N/A', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(20, 'MOPTVDU Ministerio de Obras Públicas 2', 'ARQUITECTURA', 'Av. Manuel Enrique Araujo km 5 1/2 calle a Santa Tecla', 25283113, 'Lic. José Arturo Cordova', 'arturo.cardona@mop.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(21, 'AVE Constructora S.A. de C.V.', 'ARQUITECTURA', 'Colonia y avenida santa victoria #24 S.S.', 22251338, 'Ing. Cynthia de Menjivar', 'c.menjivar@aveconstructora.net', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(22, 'Grupo Senior, S.A. de C.V.', 'ARQUITECTURA', 'Av. Bernal Centro Comercial plaza Bernal 2da. Plantalocal 16, s.s.', 22847093, 'Ing. Alfredo Cruz', 'a.cruz@gruposenior.net', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(23, 'Almacenes Vidrí, S.A. de C.V. 2', 'COMERCIO', 'C. zacamilCentro Comercial plaza metropolis mejicanos', 22725000, 'Nelson Mauricio Flores Sosa', 'nflores@vidri.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(24, 'Centro Nacional de Registros', 'CNR', '1 calle pte y final 43 av. Nte #2310, San Salvador', 25138400, 'Arq. Cristina Aracely Chávez de Rosales', 'cchavez@cnr.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(25, 'CAESS 8', 'ELECTRICIDAD', 'Calle el bambú col. San Antonio', 25299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(26, 'Alamacenes Vidrí, S.A. de C.V.', 'COMERCIALIZACIÓN', 'Calle zacamil Centro Comercial Metropolis', 22725000, 'Nelson Mauricio Flores Sosa', 'nflores@vidri.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(28, 'Banco Agrícola', 'BANCO', 'Colonia San Benito Calle Loma Linda #154', 25148490, 'Dory de Martínez y Margarita Gald{amez', 'mgaldamez@bancoagricola.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(29, 'ISNA', 'ISNA', 'Av. Irazú y final calle santa marta No. 2 Col. Costa Rica', 22134781, 'Dinora Elizabeth Argueta Andaluz', 'dinoraargueta@outlook.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(30, 'Corte Suprema de Justicia', 'CSJ', 'Diagonal Universitaria Centro de Gobierno edificio de oficinas administrativas y jurídicas de la C:S:J:, San Salvador', 22318300, 'Arq. Rafael Antonio Claros', 'rafaclarosxto@yahoo.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(31, 'COLEGIO GABRIELA MISTRAL', 'ARQUITECTURA', 'COL. LAS MARGARITAS IV ETAPA CALLE PRINCIPAL POL E', 22924674, 'LICDA. ARGENTINA SANTOS', 'COLEGIOGAM@YAHOO.ES', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(32, 'FONAVIPO', 'ARQUITECTURA', 'Alameda Juan Pablo II entre 37 y 39 av. Nte. Edificio Fonavipo', 22578888, 'Arq. Walter Velasco', 'walter.velasco@fonavipo.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(33, 'MOPTVDU Ministerio de Obras Públicas', 'ARQUITECTURA', 'Plantel la Lechuza km 5 1/2 carretera a Santa Tecla', 25283113, 'Lic. José Arturo Cardona', 'arturo.cardona@mop.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(35, 'CENTRO DE PISCINAS Y CISTERNAS S.A. DE C.V. 1', 'COMERCIALIZACIÓN', 'AV. LOS ANDES No. 2980, LOCAL D COL. MIRAMONTE, S.S.', 22601364, 'CARMEN ELENA COREAS MARTINEZ', 'centrodepiscina@gmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(36, 'ALMACENES VIDRI S.A. DE C.V. 3', 'COMPRA Y VENTA DE ARTICULOS DE FERRETERIA', '21 AV SUR ENTRE 12 Y 14 CALLE PTE S.S.', 22714033, 'JAIME CINCUIK', 'JCINCUIR@VIDRI.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(37, 'ANAYA LEIVA Y CIA. DESPACHO CONTABLE ANAYA MONTALVO', 'SERVICIOS DE CONTABILIDAD', '19CALLE PTE. No. 444 LOCAL 3 S.S.', 22262235, 'JOSE BORIS MONTALVO MENJIVAR', 'BORI.MONTALVO57@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(38, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA FERROCARRILES NACIONALES DE EL SALVADOR', 'AUTONOMA', 'FINAL AV. PERALTA No. 903 S.S.', 22414100, 'ANGELICA TORRES GRANADOS', 'ANGELICA.TORRES@VEPA.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(39, 'ISSS', 'Recursos Humanos salud', 'AV. JUAN PABLO II y 39 AVE. NTE. Edificio El Salvador', 25913048, 'Licda. Jenny de Valiente', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(41, 'MENJIVAR MENJIVARY AUDITORES CONSULTORES S.A. DE C.-V.', 'SERVICIOS DE AUDITORIA Y CONTABILIDAD', '7A AV NTE Y 5A CALLE PTE PLAZA SAN ANGEL LOCAL 206 S.S.', 22718573, 'SRA ANA GLORIA RIVERA', 'MENJIVARAUDITORES@YAHOO.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(42, 'ASOCIACION PSORIASIS NUEVA VIDA EL SALVADOR', 'ASOCIACION SIN FINES DE LUCRO', 'RES SANTA TERESA 17 AV NTE #15 LOCAL 2 2A PLANTA CONTIGUO A FCA 1 CUIDAD MERLIOT', 23026699, 'EVELYN ROXANA DE AGUIRRE', 'PSORIASIS_NUEVAVIDA@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(43, 'DIRECCION GENERAL DE ADMINISTRACION MINISTERIO DE HACIENDA', 'MINISTERIO CONTA', 'S.S.', 22443000, 'LIC CARLOS MANUEL ABREGO', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(47, 'UNICOMER, S.A. DE C.V. A CURACAO CENTRO', 'COMERCIALIZACION', 'CALLE RUBEN DARIO No 515 SAN SALVADOR', 22218159, 'Misael Alejandro Cruz Bojorquez', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(48, 'ACOESUR, S.A. DE C.V.', 'ASOCIACION COOPERATIVA DE AHORRO Y CREDITO', 'BOULEVARD CONSTITUCION #504 EDIF. SUPER REPUESTOS, SAN SALVADOR', 22392049, 'WENDY LISSETTE AZUCENA', 'wendy.azucena@superrepuestos.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(49, 'DISTRIBUIDORA MORAZAN S.A de C.V', 'COMERCIO/CONTADURIA', 'APOPA, CARRETERA TRONCAL DEL NORTE', 22017707, 'MANUEL EDGARDO SEGOVIA CONTRERAS', 'Manuel_segovia@lamorazan.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(50, 'SORTO GALICIA Y ASOCIADOS', 'DESPACHO CONTABLE', '13 CALLE ORIENTE Y PASAJE SAGRERA N° 13 CENTRO COMERCIAL METRO ESPAÑA LOCAL 211', 22712648, 'JORGE ALBERTO SORTO BONILLA', 'sortogalicia_asociados@yahoo.com.mx', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(51, 'A P DE CENTROAMERICA S.A. DE C.V.', 'INDUSTRIA DE LA CONSTRUCCION', 'CALLE QUEQUISQUE #46 G JARDINES DE MERLIOT SANTA TECLA', 22892069, 'ARQ. HERBERT QUINTANILLA', 'HQUINTANILLA.AP@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(52, 'VOLUNTARIOS CONSTRUYENDO EL SALVADOR', 'ACTIVIDADES DE SAESORAMIENTO EMPRESARIAL', 'URB LA SULTANA CALLE LOS LAURELES Y PJE LOS CEDROS #18D ANTIGUO CUSCATLAN', 22433655, 'ALEXANDER JAFET MORALES MANCIA', 'JAFET.MORALES@TECHO.ORG', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(53, 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN', 'MINISTERIO DE HACIENDA', 'S.S.', 22443000, 'LIC CARLOS MANUEL ABREGO', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(54, 'CENTRO DE PISCINAS Y CISTERNAS S.A. DE C.V. 2', 'CONSTRUCCIÓN', 'AV. LOS ANDES #2980 COL.MIRAMONTE', 22601364, 'CARMEN ELENA COREAS MARTINEZ', 'BODEGASCENTRODEPISCINAS@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(55, 'INFRA DE EL SALVADOR 1', 'FABRICACION DE GASES INDUSTRIALES', '25 AV. NTE #1080 S.S.', 22343210, 'SONIA ELIZABETH LOPEZ', 'NORMA.FUNES@OXGASA.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(56, 'ALCALDIA MUNICIPAL DE CUSCATANCINGO', 'ADMINISTRACION PUBLICA', 'CALLE EL CALVARIO #48 CUSCATANCINGO', 25268600, 'PAOLA ARTERO\nFRANCISCO JUAREZ', 'RRHUMANOS.CUSCATANCINGO@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(57, 'DFA DESPACHO FINANCIERO AGUILA', 'DESPACHO FINANCIERO', 'AV LOS ESPLIEGOS Y CALLO LOS EUCALIPTOS CASAS 10 COL LAS MERCEDES S.S.', 22365004, 'LIC. RAQUEL MOTTO DE GALVEZ', 'REQUELMOTTO@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(58, 'BANCO PROMERICA', 'FINANZAS', 'COLONIA SANTA URSULA AV EL RECREO', 25351517, 'BEYRA DE CHICAS', 'BYANES@PROMERICA.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(59, 'APLEI', 'CONTABILIDAD', 'CASA COMUNAL COMUNIDAD IBERIA', 73136865, 'MARCO ANTONIO VALLADARES PAIZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(60, 'MENJIVAR Y MENJIVAR AUDITORES CONSULTORES S.A. DE C.V.', 'SERVICIOS DE AUDITORIA Y CONTABILIDAD', '7A AVENIDA NTE Y 5A CALL PTE PLAZA SAN ALGELLOCAL 206 S.S.', 227185723, 'SRA ANA GLORIA RIVERA', 'MENJIVARAUDITORES@YAHOO.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(61, 'Recinos Recinos y CIA', 'DESPACHO CONTABLE', 'Reparto y calle los Heroes No. 48 -A', 22732054, 'LIC. PABLO NOÉ RECINOS', 'RRYCIA.GERENCIA@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(62, 'COOPERATIVA FINANCIERA EMPRESARIAL ACACES DE R.L.', 'COOPERATIVA', 'AV. OLIMPICA Y 71 AV. SUR #3719 COLONIA ESCALON', 25612300, 'LIC. RAUL ANTONIO ARTIGA HERRERA', 'RRHH@ACACES.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(63, 'SORTO GALICIA Y ASOCIADOS', 'DESPACHO CONTABLE Y AUDITORIA', '13 CALLE OTE. Y PASAJE SAGRERA N° 13 CENTRO COMERCIAL METRO ESPAÑA LOCAL 211, SAN SALVADOR.', 22712648, 'JORGE ALBERTO SORTO BONILLA', 'sortogalicia_asociados@yahoo.com.mx', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(64, 'COMPAÑÍA PANAMERICANA DE AVIACION', 'TRANSPORTE AEREO DE PASAJEROS', '89 AV NTE Y CALLE EL MIRADOR EDIFICIO WORD TRADE CENTER LOCAL 107', 22092641, 'BILY MAX MONROY', 'BMMONROY@COMPAIR.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(65, 'VIDRIO INDUSTRIAL, S.A. DE C.V.', 'INDUSTRIA DE VIDRIO -ESPEJOS-ALUMINIO', 'AV MONSEÑOR OSCAR ROMERO Y 33 CALLE OTE #1804 COL LA RABIDA S.S.', 222671718, 'LIC. JOSE DAVID JIMENEZ FRANCO', 'GERENCIA@VIDRIOINDUSTRIAL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(83, 'La Prensa Grafica', 'Imprenta', 'San Salvador', 22736005, 'Hector Enrique Ramirez', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(84, 'MASTERGRAFIC', 'ACTIVIDADE SERVICIO RELAIONADO A LA IMPRESIÓN', 'CALLE EL ROSAL COL MIRAMONTE TE No121 S.S.S', 22604422, 'JORGE ELIAS', 'MLOPEZ@MASTERGRAFIC', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(85, 'COLEGIO DRA. MARI SOLA DE SELLARES', 'INSTITUCION/DISEÑO', 'SOYAPANGO', 25124955, 'Lorena Astrid Gonzales', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(86, 'IPRINT COLOR', 'DISEÑO', 'C.C. PLAZA MUNDO LOCAL 173 SOYAPANGO', 22778263, 'Milagro Rosales', 'info@iprintcolor.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(87, 'DIALPHA, S.A. DE C.V.', 'INSUMOS MEDICOS', 'SAN SALVADOR', 22072760, 'MONICA DE RIVERA', 'MERCADEO@DIALPHASV.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(88, 'INSTITUTO TECNICO RICALDONE 1', 'EDUCACION', 'CENTRO URB, LIBERTAD AV AGUILARES No. 218 S.S.', 22346000, 'HERMANO RODRIGO MENDEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(90, 'INSTITUTO TECNICO RICALDONE 2', 'EDUCACION', 'ITR', NULL, 'MARVIN TORRES P. MANUEL', 'marvin_torres@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(91, 'MULTIDEAS PUBLICIDAD', 'PUBLICIDAD', 'CALLE CONSTITUCIÓN #17 POLIGONO N CIUDAD SATELITE S.S', 25661036, 'CHIRSTIAN ERNESTO RAMIRES', 'MULTIDEASPUBLICIDAD@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(92, 'CENTRO ESCOLAR "BENJAMIN BLOOM"', 'EDUCACIÓN', 'CARRETERA TRONCAL DEL NTE. KM 12 1/2 APOPA', 22169408, 'NORMA RUIZ DE CARRANZA', 'NORMA.DECARRANZA@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(93, 'MULTILINE S.A. DE C.V.', 'VENTA DE MOBILIARIO Y EQUIPO', 'CALLE LOMA LIDA CASA 204 CON SAN BENITO S.S.', 22103880, 'SILVIA DOMINGUEZ SIRI', 'IDEASMULTILINE@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(94, 'LA PRENSA GRAFICA', 'PRENSA', 'BLVD SANTA ELENA FRENTE A EMBAJADA AMERICANA', 22412752, 'HÉCTOR RAMIREZ', 'hramirez@laprensagrafica.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(95, 'COLEGIO CRISTIANO HOREB', 'SERVICIOS EDUCATIVOS', 'RES. SAN PEDRO POLG. 14E #3 Y 4 MEJICANOS', 21310934, 'ARACLY DEL CARMEN RIVAS CASTANEDA', 'COLEGIO_OREB@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(96, 'INSTITUTO BADASH EL SALVADOR', 'DESARROLLO DE RECURSOS HUMANOS', 'AV. LAS CAMELIAS No 7 Y CALLE LOS BAMBUES COL. SAN FRANCISCO', 22243622, 'LIC. FERNANDO ZELEDON', 'CNL@BAHAIELSALVADOR.ORG', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(97, 'UNIVERSIDAD DON BOSCO', 'SERVICIOS EDUCATIVOS', 'SOYAPANGO S.S.', 22518217, 'LIC. JOSE ERAZO', 'joseerazo@udb.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(98, 'CLIDELFA', 'DENTAL', 'AYUTUXTEPEQUE', 22728613, 'WLTER DANIEL CRUZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(99, 'UNIVERSIDAD DON BOSCO', 'EDUCACION SUPERIOR', 'CALLE AL PLAN DEL PINO KM 1 1/2 SOYAPANGO', 22518217, 'LIC. JOSE LEON ERAZO ERAZO', 'JOSERAZO@UDB.EDU.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(100, 'FEDECASES DE R.L.', 'COOPERATIVA', '25 CALLE PTE. COL SAN JORGE #1301', 25553580, 'LIC. ARISTIDES ALBERTO MENJIVAR', 'ARISTIDES.MENJIVAR@FEDECACES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(101, 'ITR 1', 'EDUCACION', 'CENTRO URB. LIBERTAD AV. AGUILARES NO. 218', 22346000, 'MARVIN TORRES', 'marvin_torres@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(102, 'ITR 2', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(103, 'Divina providencia- Colegio', 'EDUCACION', 'Av. Concepción No. 426 San Salvador', 22221935, 'María Angélica López Vicente', 'mariaangelicalopezvicente@yahoo.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(104, 'GRUPO DECOART, S.A. DE C.V.', 'REAIZACION DE EVENTOS SERVICIO MONTAJE', '3A AV NTE #1620 S.S.', 22355535, 'GUILLERMO ENRIQUE RIVERA', 'INFO@GRUPODECOARTE.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(105, 'VIP Marketing, S.A. de C.V.', 'PUBLICIDAD', 'COL. BUENOS AIRES AV ALVARADO COND. 2000-D, S.S.', 23524727, 'MARVIN BATAZAR CHAVEZ ORTIZ', 'ventasvipmaketing@gmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(106, 'LA PRENSA GRÁFICA', 'MEDIO IMPRESO', 'BULEVAR SANTA ELENA, FRENTE EMBAJADA AMERICANA', 22412752, 'HECTOR RAMIREZ', 'hramirez@laprensagrafica.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(107, 'SIGMA Q REPRO S.A.', NULL, 'Blvd.del ejercito nacional km 3 1/2 Soyapango', 25676000, 'Ernesto David Rodríguez Siguenza', 'erodriguez@repro.sigma.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(108, 'MIXTO', 'Imprenta', 'Calle Sisimiles No. 114 Col. Jardines de Miramonte', 25127285, 'Janine Jerez', 'mixto.mixto@hotmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(109, 'PUNTO PRINT', 'PUBLICIDAD', 'REPARTO Y PASEO MIRALVALLE NO. 24 S.S.S', 22743888, 'MARIA DE LOS ANGELES ARGUETA', 'PUNTOPRINTSV@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(110, 'MIXTO', 'Imprenta', 'Calle Sisimiles No. 114 Col. Jardines de Miramonte', 25127285, 'Janine Jerez', 'mixto.mixto@hotmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(111, 'VIP MARKETING S.A. DE C.V.', 'PUBLICIDAD', 'COL BUENOS AIRES AV ALVARADO CON2000-D S.S.', 23524727, 'MARVIN BALTAZAR CHAVEZ ORTIZ', 'VENTASVIPMARKETIN@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(112, 'MIXTO', 'DISEÑO GRAFICO', 'COL MIRAMONTE', 25127285, 'JANINE', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(113, 'MIXTO', 'DISEÑO GRAFICO', NULL, NULL, NULL, NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(114, 'MELRO Y ASOCIADOS S.A. DE C.V', 'ARQUITECTURA Y DISEÑO GRAFICO', '75 AVE. NORTE, PASAJE TIO CONRRA #13 SAN SALVADOR', 22074568, 'SARAH MELENDEZ MARTINEZ', 'melroyasociados@gmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(115, 'A & CREATIVA S.A. DE C.V.', 'DISEÑO GRAFICO', 'CALLE CIRCUMBALACION EDIFICIO INTEL LOCAL 9 TERCERA PLANTA', 22604774, 'BLANCA RIVERA DE CORDOVA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(116, 'Angel Editores', 'DISEÑO GRAFICO', '12 AV. NTE #1330 COL. MAGAÑA', 22263976, 'FABRICIO ANGEL', 'ANGELEDITORRES@YAHOO.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(117, 'ITR 3', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(118, 'MIXCO', 'DISEÑO GRAFICO', NULL, NULL, NULL, NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(119, 'MULTIDEAS PUBLICIDAD', 'PUBLICIDAD', 'CALLE CONSTITUCIÓN NO. 17 POLIGONO N CIUDAD SATELITE, S.S.', 25661036, 'CHRISTIAN ERNESTO RAMIREZ', 'MULTIDEASPUBLICIDAD@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(121, 'PUNTO PRINT', 'PUBLICIDAD', 'REPARTO Y PASEO MIRALVALLE CASA 24 S.S.', 22743888, 'MA DE LOS ANGELES ARGUETA', 'PUNTOPRINTSV@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(122, 'ITR 5', 'CONCEJO', 'ITR', 22346000, 'P. MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(123, 'Punto Print', NULL, 'Blvd. Costitución y paseo miralvalle contiguo a papa jonhs', 22743888, 'Mario Argueta Castillo', 'puntoprintsv@gmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(124, 'ISSS INSTITUTO SALVADOREÑO DEL SEGURO SOCIAL', 'SERVICIOS DE SALUD', 'CUIDADELA MONSERRAT', 25916720, 'ING,. ENRIQUE ANTONIO ESTEVEZ\nING. LUIS A. HERRERA', 'ENRIQUE.ESTEVEZ@ISSS.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(125, 'SERVICIOS Y CONSULTORIAS INDUSTRIALES', 'ELECTROMECANICA', 'CARRETERA A LOS PLANES DE RENDEROS PJE KRIETE #8-A SAN MARCOS', 25632291, 'ALEXGONZALO ZACARIAS VASQUEZ', 'SERCOINDESA@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(126, 'CHS COMERCIAL S.A. DE C.V.', 'VENTA DE MATERIALES ELECTRICOS', 'BLVD ALTAMIRA #13 RES ALTAMIRA S.S.', 22486700, 'FREDY VASQUEZ', 'EPINEDA@CHS.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(129, 'FILAMENTOS PLASTICOS S.A.', 'FABRICACION DE PRODUCTOS PLASTICOS', 'BLVD. DEL EJERCITO #2615 ENTRADA A LA COLONIA LA CHACRA', 22931367, 'CARLOS ALFREDO MONTOYA', 'MOTOYA_CARLOSAL@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(130, 'IMDISAR, SA. DE C.V.', 'TALLER DE MECANICA', 'COL. FLOR BLANCA #2419 S.S.', 22983680, 'EDWIN FLORES ESCOBAR', 'INDISARELSALVADOR@INDISAR.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(131, 'FREISMAN S.A. DE .C.V.', 'FABRICANTE DE REPUESTOS INDUSTRIALES\nSERVICIOS DE MANTENIMIENTO Y MONTAJE', 'FINAL 41 CALLE PTE Y 2A AV NTE LOCAL 11-13 COLONIA SHANGRI-LAS.S.', 21315165, 'ROBIN JOE CAMPOS SALDAÑA', 'FREISMAN_SA@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(132, 'CEPA COMISION EECUTIVA PORTUARIA AUTONOMA', 'SERVICIOS AEROPORTUARIOS Y PORTUARIOS', 'AEROPUERTO COMALAPA', 23492210, 'LEONARDO HASBUN', 'LEONARDO.HASBUN@CEPA.GOB', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(133, 'INTERPA S.A. DEC.V.', 'VENTA DE REPUESTOS', '29 CALLE PTE #1225 COL LAYCO S.S.', 22257994, 'ING. ROBERTO MOLINA', 'ROBERTOMOLINA@INTERPA-SA-COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(134, 'MELHER S.A. DE C.V.', 'ELABORACION COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1-BIS COL LAS COLINAS MEJICANOS', 25006800, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM\nGGOMEZ@MELHER.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(135, 'TALLER INDUSTRIAL NAVAS', 'TRABAJOS DE MECANICA INDUSTRIAL', '21 AVSUR NO 4 COL SANTA CRISTINA BO SANTANITA', 22224976, 'SANDRA AIME NAVAS QUINTANILLA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(136, 'INDUSTRIA RECICLADORA DE METALES Y PLASTICO //PROMETÍ', 'FABRICACION DE PROD METALICOS PARA USO ESTUCTURAL// EMCA', 'AV JUAN BERTIS CASA 137 CIUDAD DELGADOLA GRITA S.S. //AV BARRERA 254 BARRIO SAN JACINTO', 22762734, 'MARIO ARNOLDO HERNANDEZ HERNANDEZ', 'METAPLAS@HOTMAIL.ES', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(137, 'INDUSTRIAS POSADA 4', 'INDUSTRIA TALLER TORNO Y OBRA DE BANCO', '25 CALLE OTE #137 BO. SAN MIGUELITO', 22356413, 'JULIO SALVADOR POSADA ALVAREZ', 'INSDUSTRIASPOSADA@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(138, 'MONTAJES AGRICOLAS', 'REPARACION Y SERVICIOS NO CLASIFICADOS PREVIAMENTE', 'BLVD. DEL EJERCITO KM 9 LOTE 1 LOCAL 3 Y 4 ILOPANGO S.S.', 22944822, 'YIMI ELENILSON OSORIO', 'MONTAJES.AGRICOLAS@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(139, 'FRITER', 'INSTALACION, REPARACION Y MANTENIMIENTO DE SISTEMAS DE REFRIGERACION', '13 CALLE OTE #154 S.S. BO. SAN MIGUELITO', 22211769, 'ING. CARLOS YUDICE', 'FRITER.SV@YAHOO.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(140, 'Corporación Bonima (Bayer)\nTalleres excel automotriz (Didea)', NULL, '21 av. Nte entre av. Juan Pablo II y calle lols andes col. Miramonte\nDidea km 1 1/2 carretera panamericana Ilopango', 22674700, 'Juan José Bonilla (bayer)\nOmar Rivera (Didea)', 'IVAN.GALVEZ@BAYER.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(141, 'CANAL 10', 'ESPACIO DE TV', 'SANTA TECLA', 22280811, 'AURELIO MARIN', 'AURELIO MARIN@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(142, 'PROMEIN, PROCESOS MECANICOS E INDUSTRIALES', 'INDUSTRIA METAL MECANICA', 'BLVD. SUR ENTRE 12 Y 14 AV #1819, SANTA TECLA', 25215409, 'CARLOS ALBERTO LOPEZ RAMOS', 'BLVD SUR #2021 SANTA TECLA', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(143, 'MELHER, S.A. DE C.V.', 'ELABORACION COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1-BIS COL LAS COLINAS MEJICANOS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(144, 'ALMACENES VIDRI S.A. DE C.V. 4', 'FERRETERIA', 'CENTRO COMERCIAL METROPOLIS', 22725000, 'SERGIO MENDEZ', 'SERGIOMENDEZ@VIDRI.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(145, 'OPRUMEDICAL', NULL, NULL, NULL, 'Carlos Platero', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(146, 'METAPLAST', 'TALLER DE MECANICA', 'AV. JUAN BERLIS #137 COL LAS VICTORIAS CIUDAD DELGADO', 22762734, 'DANIEL MORENO', 'INDMETALPLAST@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(147, 'CAESS 7', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'Calle el bambú Ayutuxtepeque', 25299235, 'Luis Umanzor', 'LUIS.UMANZOR@AES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(148, 'METALPLAS', 'TALLER DE MECANICA', 'AV JUAN BERTIS 137 COL LAS VICTORIAS CIUDAD DELGADO', NULL, 'MARIO HERNANDEZ', 'INGMETAPLAS@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(149, 'INDUSTRIA DE MADERAS Y METALES S..A DE C.V.', 'INDUSTRIA', 'COLONIA CUCUMACAYAN CAYE CENTRAL 161 S.S', 22229002, 'SRA EVELUN DIAZ', 'METALMECANICA@TOROGOZ.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(150, 'ITR- CONSEJO', 'CONSEJO', 'ITR', 22346000, 'P. MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(151, 'CAESS 6', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'CALLE Y COLONIA EL BAMBU', 25299066, 'Benjamín Vasquez', 'BENJAMIN.VASQUEZ@AES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(152, 'SIETELSA, S.A. DE C.V.', NULL, 'Final 5 av. Nte. Col y pae alfaro No. 506 mejicanos', 22261027, 'David Rivas Gómez', 'david.rivas@sietelsaonline.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(153, 'Servicios Industriales J.F.', 'TALLER INDUSTRIAL', '6a. Calle pte. Cl. No 1-8A, Santa Tecla, Laibertad', 22887070, 'Lic. José Augusto Fuentes', 'SERVICIOSINDUSTRIALESJF@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(154, 'GRUPO PENIEL', 'FABRICACIÓN DE PRODUCTOS DE ALUMINIO Y VIDRIO', 'JARDINES DE LA LIBERTAD CALLE CHILTIUPAN LOCAL 11', 22782444, 'Brenda Guadalupe Miranda Marroquin', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(155, 'Industrias La Comstancia, S.A. de C.V.', 'ELECTROMECANICA', 'Av. Independencia#526 San Salvador', 25024353, 'Omar Alberto Argueta', 'ilc.sabmiller.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(156, 'SIETELSA, SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'FINAL 5 AV NTE COL Y PAJE ALFARO No. 506 MEJICANOS', 22261027, 'JORGE ALBERTO VELASCO', 'ROBERTO.GARCIA@SIETELSAONLINE.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(157, 'TALLER DE TORNO Y SOLDADURA SAN ANTONIO', 'RECONSTRUCION DE PIEZAS', '4A CALLE PTE Y 13 AV SUR BO. CONCEPCION S.V.', 23930889, 'MARCO ANTONIO MERINO', 'N/A', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(158, 'INDUSTRIAS POSADA 1', 'ELECTROMECANICA', 'BO. SAN MIGUELITO 25 CALLE OTE. 137 S.S.', 22512095, 'BALTAZAR CRUZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(159, 'MELHER S..A DE C.V.', 'ELABORACION DE COBERTURA DE CHOCOLATE', 'AV. POETA ROLANDO ELIAS #1 COL LAS COLINAS MEJICANOS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(160, 'ALMACENES VIDRI S.A. DE C.V. 2', 'FERRETERIA', 'CENTRO COMERCIAL SUCURSAL METROPOLIS', 22725000, 'NELSON FLORES', 'S.METROPOLIS@VIDRI.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(161, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA 2', 'SERVICIOS PORTUARIOS Y AEROPORTUARIOS', 'AEROPUERTO INTERNACIONAL SAN LUIS TALPA, LA PAZ', 23662273, 'ING. MAURICIO ALVAREZ', 'MAURICIO.ALVAREZ@CEPA.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(163, 'Didea Taller los Héroes', NULL, '51 av. Nte. Alam. Juan Pablo II y av. Los andes col. Miramonte atrás de DIDEA los heroes', 22104344, 'Ing. Omar Rivera', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(164, 'MECATRONICA S.A. DE C.V.', 'OTRAS ACTIVIDADES DE SERVICIO', 'RESD. LA CIMA II OTE AV. A No. 9-G', 22765784, 'JOSE CECILIO DE LEON', 'INFO@MECATRONICA.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(165, 'MAFER SERVICIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(166, 'INGELMAT S.A. DE C.V.', 'INSTALACIONES ELECTRICAS', 'SERVICIOS DE ENERGIA ELECTRICA', 22451355, 'ING. JAIME AMAYA', 'INGELMAT1@YAHOO.ES', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(167, 'MELHER, S.A. DE C.V.', 'ELABORACION DE COBERTURA DE CHOCOLATE', 'AV POETA ROLANDO ELIAS #1 BIS COL LAS COLINAS', 22852222, 'RENE ERNESTO RIVERA', 'RLOPEZ@MELHER.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(168, 'Alcaldia Municipal de Quezaltepeque', NULL, 'Av. José María Castro 2ACalle pte.', 23436705, 'Gladys Esmeralda Ruano Recinos', 'esmeraldajdrecinos@outlook.es', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(170, 'CEPA', 'AEROPUERTO /EMCA', 'COMALAPA', 22491300, 'LIC. JOSUE RAMOS', 'N/A', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(171, 'SIEMENS', 'AUTOMATIZACION', 'CALLE SIEMENS', 22783333, 'ING. CARLOS MENJIVAR', 'CARLOSERNESTO.MENJIVAR@SIEMENS.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(172, 'CAESS 1', NULL, 'Colonia San Antonio calle el Bambú No. 186', 25299066, 'Ing. Benjamin Vasquez', 'benjamin.vasquez', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(173, 'MAFER SERVICIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUCTRIALES@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(174, 'CEPA, COMISION EJECUTIVA PORTUARIA AUTONOMA 1', 'SERVICIOS PORTUARIO Y AEROPORTUARIO', 'BLVD LOS HEROES TORRE ROBLEE METROCENTRO', 22491467, 'MIRNA FUENTES DE PEÑA', 'MIRNA.FUENTES@CEPA.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(175, 'INDUSTRIA CENTROAMERICANA DE ALIMENTOS', 'ELABORACION DE SALSAS ADEREZOS Y ESPECIES', 'COL LAS COLINAS BLOCK G #11 MEJICANOS, S.S.', 22726954, 'LIC. CARLOS RAMON FIGUEROA', 'INDUCENTRAL@ELSALVADOR.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(176, 'Almacenes Vidrí, S.A. de C.V. 3', NULL, 'Calle al volcan pasaje la Ermita , mejicanos S.S.', 22324033, 'Edwin Flores', 'alvisa065@vidri.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(177, 'ALMACENES VIDRI S.A. DE C.V. 1', 'FERRETERIA', 'SUCURSAL MEJICANOS', 22324033, 'SAUL ERNESTO CASTANEDA CARRANZA', 'SCASTANEDA@VIDRI.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(178, 'COMPRESORES REPUESTOS Y SERVICIOS, S.A. DE CV', 'RECTIFICADO Y VENTA DE MOTORES', '67 AV. SUR No. 140, COL ESCALON', 22466666, 'TELIA SANCHEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(179, 'SIEMENS S.A.', 'CENTA DE PRODUCTOS ELECTRICOS Y OTROS', 'CALLE SIMENS #43 ANTIGUO CUSCATLAN', 22482333, 'CARLOS ERNESTO MENJIVAR', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(180, 'INDUSTRIAS POSADA 3', 'INDUSTRIA (TORNO FRESADORA OBRA DE BANCO', '25 CALLE OTE #137 BO. SAN MIGUELITO S.S.', 22512095, 'JULIO SALVADOR POSADA ALVAREZ', 'INDUSTRRIASPOSADA@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(181, 'INDUSTRIAS POSADA 2', 'INDUSTRIA (TALLER TORNO Y OBRA DE BANCO)', '25CALLE OTE #137 BO. SAN MIGUELITO, S.S.', 22356413, 'JULIO SALVADOR PPOSADA ALVAREZ', 'INDUSTRIASPOSADA@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(182, 'MAFER SERVICIOS INDUSTRIALES', 'FASBRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV. NTE 27 CALLE PTE #1106 COL LAYCO', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(183, 'INFRA DE EL SALVADOR 2', 'GASES MÉDICOS ELECTRONICA', 'San Salvador', 22324033, 'Nelson M. Flores Sosa', 'nflores@vidri.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(184, 'CAESS 3', 'DISTRIBUIDORA DE ELECTRICIDAD', 'CALLE Y COLONIA EL BAMBU', 25299066, 'BENJAMIN VASQUEZ', 'BENJAMIN.VASQUEZ@AES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(186, 'COMPRES S.A. DE C.V. 1', 'METAL MECANICA', '67 AV SUR #140 COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIASANCHEZ@COMPRES.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(187, 'INSELPRO S.A. DE C.V.', 'ELECTRICIDAD', 'COL. ESCALON CALLE ARTURO AMBROGHI #525', 22649736, 'MAURICIO CRISTALES', 'OPERACIONES@INSELPRO.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(188, 'TALLER DIDEA', 'MECANICA', '51 AV NTE ENTRE ALAM JUAN PABLO II Y AVENIDA LOS ANDES COL MIRAMONTE ATRÁS DE DIDEA LOS HEROES S.S.', 22104343, 'ING. OMAR RIVERA', 'N/A', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(189, 'HOTEL CROWNE PLAZA SAN SALVADOR', 'HOTELES', '87 Y 11 CALL PTE COL ESCALON', 25000716, 'JULIO RAFAEL MENJIVAR MOLINA', 'JULIO.MENJIVAR@HOTELSAL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(190, 'MAFER SERVCIOS INDUSTRIALES', 'FABRICACION DE PRODUCTOS METALICOS Y NO METALICOS', '19 AV NTE 27 CALLE PTE #1106 COL LAYCO S.S.', 25324846, 'DENIS CHICAS', 'MAFERSERVICIOSINDUSTRIALES@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(191, 'CEPA AEROPUERTO INTERNACIONAL DE EL SALVADOR', 'SERVICIOS PORTUARIOS', 'AEROPUERTO INTERNACIONAL DE EL SALVADOR', 23492476, 'LUIS E. SAGET B.', 'LUIS.SAGET@CEPA.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(212, 'SIEMENS, S.A. DE C.V.', 'ELECTROMECANICA', 'Parque industrial Santa Elena, calle siemens #43 Antoguo Cuscatlan', 22487333, 'Ing. Enrique Campos', 'enrique.campos@siemens.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(213, 'AGROSANIA, S.A. DE C.V. 1', 'PRODUCTOS LACTEOS', '51 AV. SUR No. 1738, COL. JARDINES DE MONSERRAT, S.S.', 24054028, 'PAOLA ALEJANDRA BATRES', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(214, 'ITR 11', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(215, 'ITR 7', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(216, 'ITR 8', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(217, 'SERVITOTAL', 'REPARACION DE ARTICULOS DE LINEA CAFÉ', 'Av. España No. 620', 22317008, 'Joaquín Anchieta', 'joaquin_anchieta@servitotal.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(218, 'SERVITOTAL', 'REPARACION DE ARTICULOS', 'AVENIDA ESPAÑA No. 620, S.S.', 22317008, 'JOAQUIN ANCHIETA', 'JOAQUIN_ANCHIETA@SERVITOTAL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(219, 'TALLERES EXCEL S.A de C.V', 'REPARACION MECANICA DE VEHICULOS AUTOMOTORES', 'SAN SALVADOR', 22104200, 'ING. EMANUEL OMAR RIVERA CANJURA', 'eorivera@excelautomotriz.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(220, 'Grupo Aereo Policial', 'MANTENIMIENTO DE AVIACION', 'Aeropuerto Internacional Ilopango', 22962516, 'TMA. Miguel Ernesto Miranda Cordova', 'apulomiranda@yahoo.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(221, 'Almacenes Vidrí, S.A. de C.V. 4', 'COMERCIO', 'Calle zacamil Centro Comercial Metropolis', 22725000, 'Nelson Ernesto Bonilla Chavez', 'nelson.bonilla@aes.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(222, 'Omnimusic, S.A. De C.V.', 'Electrónica', '11 calle poniente #3937 entre 75 y 77 av. Nte colonia Escalon', 22633869, 'Tec. David Enrique Tejada', 'taller@omnimusicsv.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(223, 'ITR 9', 'ECA', 'S.S.', 22346000, 'EDUARDO BARRERA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(224, 'Almacenes Vidrí, S.A. de C.V. 1', 'COMERCIO', 'Calle al volcan y pasaje la ermita, mejicanos S.S.', 22324033, 'Aaron Dagoberto Paredes', 'scastaneda@vidri.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(225, 'OBIPADO DE ZACATECOLUCA', 'RELIGIOSO', '4a. CALLE PONIENTE #7 ZACATECOLUCA', 22340287, 'MONSEÑOR SAMUEL ELIAS BOLAÑOS', 'SAMUELAVELAR@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(226, 'ANDA', 'CAPTACION, TRATAMIENTO Y SUMINISTRO DE AGUA', 'COL ESLOVAN AV. LAS MAGNOLIAS PLANTEL JALACATL SAN MIGUEL', 26002060, 'SALVADOR SANCHEZ SARAVIA', 'SALVADOR.SANCHEZ@ANDA.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(227, 'AEROMAN', 'ELECTRONICA\nELECTOMECANICA', 'AEROPUERTO INTERNACIONAL, SAN LUIS TALPA', 23124000, 'JESUS CRUZ', 'susana.rodriguez@aeroman.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(228, 'CAESS S.A. DE C.V.', 'ELECTRICIDAD', 'COL EL BAMBU', 25299085, 'JOSE ROBERTO SALAZAR BARAHONA', 'ROBERTO.SALAZAR@AES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(229, 'ITR 10', 'consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(230, 'Empresarios Juveniles', 'LIQUIDACION DE CONSTANCIAS DE DOCENTES', '85 av. Norte y 15 calle pte. #905, Col Escalón', 22655354, 'Ing. Raúl Pacheco', 'rpacheco@empresariosjuveniles.org', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(231, 'SOLUCIONES PROFESIONALES S.A. DE C.V.', 'ELECTRONICA', 'San Salvador', 78626457, 'Jose Mustafa Alens Mancia', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(232, 'SIEMENS, S.A. DE C.V.', 'ELECTROMECANICA', 'Parque industrial Santa Elena, calle siemens #43 Antoguo Cuscatlan', 22487333, 'Ing. Enrique Campos', 'enrique.campos@siemens.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(233, 'AES El Salvador', 'DISTRIBUCION DE ENERGIA ELECTRICA', 'Final 29 av. Nte. Y calle el Bambu, Ayutuxtepeque', 25299192, 'Nelson Ernesto Bonilla Chavez', 'nelson.bonilla@aes.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(234, 'ITR 4', 'Consejo', 'ITR', 22346000, 'P.PADRE MANUEL ANTONIO GOMEZ', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(235, 'TEXTUFIL', 'ECA', 'SOYAPANGO', 22770066, 'LICDA. RINA AGUILAR', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(236, 'SIATELSA, S.A. DE C.V.', 'SERVICIOS DE INGENIERIA ELECTRICA Y TELECOMUNICACIONES', 'FINAL 5A. AV NTE COL Y PJE ALFARO No. 506 MEJICANOS', 22261027, 'WALTER ARTURO MENJIVAR', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(237, 'Omnimusic, S.A. De C.V.', NULL, '11 calle poniente #3937 entre 75 y 77 av. Nte colonia Escalon', 22633869, 'Tec. David Tejada', 'taller@omnisport.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(238, 'OMNIMUSIC, S.A. DE C.V.', 'VENTA DE INSTRUMENTOS MUSICALES', '11 CALLE PTE NO3937 ENTRE 77 Y 75 AV NTE COL ESCALON S.S.', 22633849, 'LICDA CECILIA DE MATINEZ', 'GERRENCIA.ADMON@OMNIMUSICSV.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(239, 'INGENIO EL ANGEL S.A. DE C.V.', 'INGENIO AZUCARERO', 'KM 14 1/2 C. A QUEZALTEPEQUE APOPA', 22012600, 'ING, IRVIN AGUILAR', 'IRVING.AGUILAR@INGENIOELANGEL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(240, 'SERVITOTAL', 'REPARACION DE ARTICULOS LINEA CAFÉ', 'Av. España No. 620', 22317008, 'Joaquín Anchieta', 'joaquin_anchieta@servitotal.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(241, 'CIDECA, S.A. DE C.V.', 'SERVICIOS DE INGENIERIA', 'Av. Las camelias #7A Col. San Francisco S.S.', 22230274, 'Aracely Palacios', 'aracely.palacios@cideca.net', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(242, 'GRUPO COMPRES', 'VENTA DE OTROS PRODUCTOS NO ELASTICOS', '67 AV SUR #140, COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIASANCHEZ@COMPRES.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(243, 'AGROSANIA, S.A. DE C.V. 2', 'INDUSTRIA DE LACTEOS', '51 AV. SUR No. 1738 COLONIA MONSERRAT, SAN SALVADOR', 24054028, 'PAOLA ALEJANDRA BATRES', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(244, 'OMNI MUSIC, S.A. DE C.V.', 'ELECTRÓNICA', '11 CALLE PTE. ENTRE 75 Y 77 AV. NTE, #3937, SAN SALVADOR', 22633849, 'LICDA. CECILIA DE MARTINEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(245, 'CENTRO DE PISCINAS Y SISTERNAS S.A. DE C.V. 3', 'SERVICIOS', 'AVENIDA LOS ANDES #2980 COL. MIRAMONTE', 22601364, 'CARMEN ELENA COREAS MARTÍNEZ', 'CENTRODEPISCINAS@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(247, 'ALMACENES VIDRI', 'ELECTRONICA', 'CALLE AL VOLCAN MEJICANOS', 22324033, 'AARON PAREDES', 'SCASTANEDA @VIDRI.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(248, 'FONAVIPO (FONDO NACIONAL PARA LA VIVIENDA NACIONAL)', 'BANCA (SEGUNDO PISO)', 'Entre 37 y 39 av. Alameda juan pablo II, S.S.', 22578829, 'Licda. Katia Navarrete', 'katia.navarrete@fonavipo.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(249, 'CAESS 2', 'ELECTRICIDAD', 'Calle el bambú Colonia San Antonio, Ayutuxtepeque', 25299234, 'Aquiles Trigueros', 'aquiles.trigueros@aes.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(250, 'LACTEOS CHALATE', 'PRODUCCION Y PROCESAMIENTO DE PRODUCTOS LACTEOS', '11A CALLE OTE. BARRIO EL ROSARIO NVA CONCEPCION CHALATENANGO', 23068269, 'MIGUEL EDUARDO ARTEAGA CAMPOS', 'LEENPI@HOTMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(251, 'COMPRES S.A. DE C.V. 2', 'VENTA DE OTROS PRODUCTOS NO CLASIFICADOS', '67 AV SUR #140 COL ESCALON', 22466608, 'TELIA SANCHEZ', 'TELIA.SANCHEZ@COMPRES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(252, 'CAESS 5', 'LUZ Y FUERZA', 'COL SAN ANTONIO CALLE EL BAMBU AYUTUXTEPQUE', 25299236, 'ARMANDO GUEVARA', 'ARMANDO.GUEVARA@AES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(253, 'ITR 12', 'Consejo', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(254, 'GRUPO MTZ INTELECI, S.A. DE CV.', 'INFORMATICA', 'CALLE LOS BAMBUES AV LAS GARDEIAS #424-A COOL SAN FRANCISCO', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELECI.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(255, 'COOPERATIVA ZAFIRO DE R.L.', 'COOPERATIVA', NULL, NULL, 'JORGE EDGARDO GARCÍA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(256, 'MICRONET, S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22359499, 'CARLOS ALBERTO GARCIA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(257, 'RG OUTSOURCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S.', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(258, 'RG OUTSOURCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S.', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(262, 'RG OUTSOURSING S.A. DE C.V.', 'APOYO EMPRESARIAL', 'S.S', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(263, 'GRUPO TUSELL', 'RECTIFICADO DE MOTORES', '6 CALLE PTE Y 23 AV SUR No. 1112 S.S.', 22716300, 'RAFAEL TUSELL', 'RTUSELL@MTCORPORATIVO.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(265, 'GRUPO MTZ NENTELECI S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELESI.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(267, 'MICRONET S.A. DE C .V.', 'INFORMATICA', 'S.S.', NULL, 'CARLOS ALBERTO GARCIA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(268, 'MICRONET S.A. DE C.V.', NULL, NULL, NULL, 'CARLOS ALBERTO GARCIA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(270, 'GRUPO MTZ INENTELECI, S.A. DE C.V.', 'INFORMATICA', 'S.S.', 22233123, 'MIRNA ELIZABETH MENJIVAR DE MARTINEZ', 'MIRNADEMARTINEZ@INENTELECI.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(272, 'RG OUTSORCING, S.A. DE C.V.', 'APOYO EMPRESARIAL', '.S.S', 25213203, 'ESTER PAREDES', 'RRHHRGOUTSOURCING.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(273, 'MICRONET, S.A. DE C.V.', 'INFORMATICA', NULL, NULL, 'CARLOS ALBERTO GARCIA', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(274, 'GIMNASIO FIBRA VITALITY', 'SERVICIOS', '9 AVE. SUR EDIFICIO PATRICIA #304 4 PLANTA, S.S', 76414432, 'ESPERANZA GARCIA MEJIA', 'GFIBRAVITALITY@GMAIL.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(277, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221036, 'Lic. Raúl Ernesto Castillo Hernández', 'RAUL.HERNANDEZ@MINED.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26');
INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `rubro`, `direccion`, `telefono`, `contacto`, `correo`, `codigo_empresa`, `contraseña_empre`) VALUES
(278, 'GALAXIA DEPORTES S.A. DE C.V.', 'VENTA DEARTICULOS DEPORTIVOS', 'METROCENTRO', 22601010, 'LICDA. ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(281, 'COSTISS DE RL', 'INFORMATICA', 'DIAGONAL ARTURO ROMERO AMBRIGI QUINTA GUADALUPE COL AMERICA 434 S.S.', 25254207, 'VICTOR ANTONIO PINEDA', 'victor.pineda69@hotmail.com', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(282, 'SERVICIOS GLOBALES LOGÍSTICOS, S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV. SUR COL. ROMA CENTRO ROMA LOCAL 22 S.S.', 22838010, 'JUAN FERNANDO PARADA GÓMEZ', 'FERNADO.PARADA@SGL.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(283, 'GALAXIA DEPORTES', 'VENTA DE ARTICULOS DEPORTIVOS', 'METROCENTRO', 22611010, 'ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(285, 'SERVICIOS GLOBALES LOGISTICOS S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'JUAN FERNANDO PARADA GOMEZ', 'FERNANDO.PARADA@SGL.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(286, 'Galaxia Deportes, S.A. de C.V.', 'COMERCIALIZADORA', 'LOCAL 2 T. TORRE ROBLE , METROCENTRO SAN SALVADOR', 22611010, 'LICDA. ANDREA AMAYA', 'a.amaya@galaxia.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(287, 'GALAXIA', 'DEPORTES', 'LOCAL 2T TORRE ROBLE ,METROCENTRO SAN SALVADOR', 22611010, 'ANDREA AMAYA', 'A.AMAYA@GALAXIADEPORTES.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(289, 'SERVICIOS GLOBALES LOGISTICOS S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'Licenciado JUAN FERNANDO PARADA GOMEZ', 'FERNADO.PARADA@SLG.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(292, 'SERVICIOS GLOBALES LOGISTICOS, S.A.', 'OTRAS ACTIVIDADES DE SERVICIOS NO CLASIFICADOS', '67 AV SUR COL ROMA CENTRO ROMA LOCAL #22 S.S.', 22838010, 'JUAN FERNANDO PARADA GOMEZ', 'FERNANDO.PARADA@SGL.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(293, 'AMERICAS TOURS', 'AGENCIA DE VIAJES', 'BLVD SANTA ELENA CC ATRIUM PLAZA LOCAL 11 NIVEL 1', 22605476, 'DANIEL BELTRAN DIAZ', 'AMERICASTOURS@AMERICASTOURS.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(300, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(301, 'Saturno, S.A. de C.V.', NULL, 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(303, 'CABLEPUNTOCOM, S.A. DE C.V.', 'CONSULTORES DE EQUIPO INFORMATICO', 'AV. SIERRA NEVADA COL. MIRAMONTE #184 S.S.', 22604803, 'BERTA DE QUINTEROS', 'BERTADEQUINTEROS@INTEGRA.COM', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(305, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(307, 'CIRCUITO YSR RADIO QUE BUENA', 'RADIO', 'ALAMEDA ROSSELVETL EDIFICIO 2-4-6', 22092000, 'GLAUCO RODRIGUEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(308, 'Saturno, S.A. de C.V.', 'JOYERIA // PROYECTO INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(309, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221061, 'Lic. Raúl Ernesto Castillo Hernández', 'raul.hernandez@mined.gob.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(311, 'KR INVESTMENT, S.A. DE C.V.', 'INFORMATICA', '23 CALLE PONIENTE CALLE LA SVICTORIAS COL LAYCO PALOMO #154', 22006724, 'CARLOS ANTONIO RUIZ RAMOS', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(312, 'Saturno, S.A. de C.V.', 'INFORMATICA', 'Metrocentro nte. 6a. Etapa local #152', 22603161, 'Carlos Mauricio Merino López', 'cmerino@navegante.com.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(313, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEXANDER HERNANDEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(314, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTUIPAN #5/6 CUIDAD MERLIOT', 22890391, 'JOSE ROBERTO CASTILLO', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(315, 'TOTOS PIZZA', 'METAPAN', 'METAPAN', 24111798, 'ALEX HERNANDEZ LANDAVERDE', 'ALEX_HERNANDEZ301', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(317, 'Ministerio de Educación', 'ENTIDAD DE GOBIERNO', 'Final 25 av. Nte. Calle a san Antonio Abad, contiguo a UES S.S.', 25221036, 'Lic. Raúl Ernesto Castillo Hernández', 'RAUL.HERNANDEZ@MINED.GOB.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(318, 'COLEGIO BRADFORD', 'EDUCACION / PROYECTO INFO', 'COL LAS TRES MAGNOLIAS MEJICANOS', 0, 'CARMEN RIVERA', 'N/A', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(319, 'ACORDE', 'RESTAURANTE', NULL, NULL, NULL, NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(323, 'ITR 6', 'CONSEJO', 'ITR', NULL, 'P. Manuel Antonio Gomez', 'manuel_gomez@ricaldone.edu.sv', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(324, 'BANCOFIT; ACORDES', 'INTERMEDIACION FINANCIERA ; RESTAURANTE', 'ALAMEDA ROSSELVETL 41 AVENIDA NTE #2174 COL FLOR BLANCA', 22617900, 'JUAN GONZALO RECINOS', 'RECINOS@BANCOFIT.COM.SV', NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(325, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEX HERNANDEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(326, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTUIUPAN #5/6 CIUDAD MERLIORT', 22890391, 'JOSE ROBERTO CASTILLO', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(328, 'TOTOS PIZZA', 'INFORMATICA', 'METAPAN', 24111798, 'ALEX HERNANDEZ', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(329, 'ACORDES', 'RESTAURANTE', NULL, NULL, NULL, NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(330, 'SERVICIOS CASTILLO HERMANOS', 'TALLER AUTOMOTRIZ', 'CALLE CHILTIUPAN #5/6 CIUDAD MERLIOT', 22890391, 'JOSE ROBERTO CASTILLO', NULL, NULL, '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(331, 'AAA', 'AAA', 'AAB', 222, '222', '2@hotmail', '1', '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26'),
(332, 'Delta Inc.', 'Desarrollo de Software', '3a Calle Poniente Avenida Las Rosas #32', 22929292, 'Delta Inc.', 'delta_inc@gmail.com', '120199', '$2y$10$/MmUdu2WwXuHPu3sAebkheUGszRZ/F.PlpGJdpwj/TjKgpxjBRp26');

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
  `contraseña` varchar(100) NOT NULL,
  `nombre1` varchar(35) NOT NULL,
  `apellido1` varchar(35) NOT NULL,
  `telefono` int(8) NOT NULL,
  `ocupacion` int(11) NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `observacion` varchar(200) NOT NULL,
  `pregunta` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `respuesta` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ex_alumnos`
--

INSERT INTO `ex_alumnos` (`id_exalumnos`, `contraseña`, `nombre1`, `apellido1`, `telefono`, `ocupacion`, `correo_electronico`, `observacion`, `pregunta`, `respuesta`) VALUES
(11116666, '$2y$10$3DIxv3HxGy.8DjdyBUGkB.YpvBIvwrcSFLcCYf84TPeVNuFBIvIs2', 'Diego', 'Quinteros', 79865432, 3, 'diego_quinteros@gmail.com', 'Estudiante destacado', 'Mi segundo apellido', 'Lemus');

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
(2, 1, 3, 1, 'JI', 1, 0, 0, 0, 'Hi'),
(3, 20140643, 1, 0, 'Muy colaborador', 1, 1, 1, 1, 'Concluyo con exito sus practicas');

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

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`id_sesion`, `unisesion`, `usuario`, `fecha`, `os`) VALUES
(6, '57b6e5d50d727_ses', 20140666, '2016-08-19 10:56:21', 'WinNT'),
(7, '57b6e6c980902_ses', 20140666, '2016-08-19 11:00:25', 'WinNT'),
(8, '57b6e75b16765_ses', 20140666, '2016-08-19 11:02:51', 'WinNT');

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

--
-- Volcado de datos para la tabla `sesiones_alum`
--

INSERT INTO `sesiones_alum` (`id_sesion`, `unisesion`, `usuario`, `fecha`, `os`) VALUES
(1, '57bb9ff3ba335_ses', 20140643, '2016-08-23 00:59:31', 'Windows 7'),
(2, '57bbf17f30c04_ses', 20140643, '2016-08-23 06:47:27', 'Windows 7'),
(5, '57bc008ce8b12_ses', 20140643, '2016-08-23 07:51:40', 'Windows 7'),
(6, '57bc322d15aa5_ses', 20140643, '2016-08-23 11:23:25', 'Windows 7'),
(7, '57bc329c9a151_ses', 20140643, '2016-08-23 11:25:16', 'Windows 7');

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

--
-- Volcado de datos para la tabla `sesiones_empre`
--

INSERT INTO `sesiones_empre` (`id_sesion`, `unisesion`, `usuario`, `fecha`, `os`) VALUES
(1, '57bbb92850fdf_ses', 332, '2016-08-23 02:47:04', 'Windows 7'),
(2, '57bbb9664102d_ses', 332, '2016-08-23 02:48:06', 'Windows 7'),
(3, '57bbba1f3f71a_ses', 332, '2016-08-23 02:51:11', 'Windows 7'),
(4, '57bc25964fef1_ses', 332, '2016-08-23 10:29:42', 'Windows 7'),
(5, '57bc26e0056fb_ses', 332, '2016-08-23 10:35:12', 'Windows 7'),
(6, '57bc28c100ec1_ses', 3, '2016-08-23 10:43:13', 'Windows 7'),
(7, '57bc291451ad0_ses', 332, '2016-08-23 10:44:36', 'Windows 7'),
(8, '57bc29731191a_ses', 332, '2016-08-23 10:46:11', 'Windows 7');

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

--
-- Volcado de datos para la tabla `sesiones_exalum`
--

INSERT INTO `sesiones_exalum` (`id_sesion`, `unisesion`, `usuario`, `fecha`, `os`) VALUES
(1, '57bb9bce1a99a_ses', 11116666, '2016-08-23 00:41:50', 'Windows 7'),
(2, '57bb9e374bfd8_ses', 11116666, '2016-08-23 00:52:07', 'Windows 7'),
(3, '57bb9f40842f2_ses', 11116666, '2016-08-23 00:56:32', 'Windows 7'),
(5, '57bc1ad0d50f4_ses', 11116666, '2016-08-23 09:43:44', 'Windows 7'),
(6, '57bc251ecf2c0_ses', 11116666, '2016-08-23 10:27:42', 'Windows 7');

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
  MODIFY `id_registropp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_seccion` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `sesiones_alum`
--
ALTER TABLE `sesiones_alum`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `sesiones_empre`
--
ALTER TABLE `sesiones_empre`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `sesiones_exalum`
--
ALTER TABLE `sesiones_exalum`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_categoria` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`) VALUES
(5, 'En Polvo', 'Café distribuido en polvo para su preparación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_producto` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio_producto` decimal(5,2) NOT NULL,
  `imagen_producto` mediumblob NOT NULL,
  `estado_producto` tinyint(1) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `imagen_producto`, `estado_producto`, `id_categoria`) VALUES
(1, 'Café BigBrown', 'Café de marca española con aroma dulce', '4.01', 0x6956424f5277304b47676f414141414e5355684555674141424c4141414153774341594141414472496250504141414141584e535230494172733463365141414141526e51553142414143786a777638595155414141414a6345685a637741414473514141413745415a55724468734141435a655355524256486865376431525475504b466b4452726a63442f686b55513256512f444f45584b4a6e7044514330675462326262586b714a622f36376b75726571447550303567384141414141525031762b693841414141414a416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b6a644f62615130417741364d4d6162563937774741674262345151574141414141476b434667414141414270416859414141414161575a67426633723349715050456f414f4b356233783875655a6341414b71637741494141414167546341434141414149453341416741414143444e444b79494f655a5758504a59416542597a4d41434150624d43537741414141413067517341414141414e4a6349597877685241417547627539345750764438414146564f59414541414143514a6d4142414141416b435a6741514141414a426d427459644c546e48776d4d46674833777667414134415157414141414148454346674141414142704168594141414141615149574141414141476d47754b396f795347735a78346c742f725876576d5041617a504548634141436577414141414149675473414141414142496334567752613451556a4c336672542f414f626a32694141774e2b637741494141414167546341434141414149453341416741414143444e444b79466d5746426c526c59384c64627668503250557678477730413844636e7341414141414249453741414141414153424f77414141414145677a41327468633879773849685967766b71344874417839783738534e37457744594f69657741414141414567547341414141414249453741415943626e613244764837696e3835584279773841774e594a574141414141436b435667414141414170416c5941414141414b514a5741437741504f77754d596541514434647749574141414141476b4346674141414142704168594141414141616550305a6c717a67446e6d576e68454c4748756d5376324b567533356877693378664f2f413444415077374a3741414141414153424f774141414141456754734144677a666e363166746e61656572592b38666a73577a427743346a59414641414141514a714142514141414543616741554141414241326a6a356d38754c6d6d5047685566454575616576324b66736d66336d6c666b6537552f7639314c396751416346524f59414541414143514a6d4142414141416b435a6741514141414a426d427462436c70796234744878472f596d2f4e36617337463872376244377973417750796377414941414141675463414341414141494d305677685574666458456f2b5257632b394e6535476a5775744b6f6539596d393955414944354f59454641414141514a7141425141414145436167415541414142416d686c594b3170724e73715a783870506d4d384738317679652b553731575947466744412f4a7a41416741414143424e77414941414141675463414341414141494d304d7244746161796157523878506d643044387a4a6e62762f4d76514941574a5954574141414141436b4356674141414141704c6c43474c48576463497a6a357872584347455a626c75746a2b654b51444173707a41416741414143424e7741494141414167546341434141414149453341416741414143444e45506367413930704d644164356d6667392f35347067414179334943437741414149413041517341414143414e41454c414141416744517a73445a677a5a6c596c32774e506c70364c39707a484956355366766a6d5149414c4d734a4c414141414144534243774141414141306c7768334c4131727862614a7079357a677133636631322f355a3878703476414941545741414141414445435667414141414170416c5941414141414b535a6762556a6138306e736d58346a506b763844557a7349356c726638666632516641414237356751574141414141476b434667414141414270416859414141414161575a6737645361387a647349543479377765572f5237344472535a675155414d44386e7341414141414249453741414141414153484f46384142634a2b5465584b58694b4f7831726c6e722f386e32437743774e30356741514141414a416d59414541414143514a6d4142414141416b4759473167475a30634c6137446d4f776c376e4a3961616833566d2f774141572b634546674141414142704168594141414141615149574141414141476c6d5942336333504d33624365754d534f4950664f62797132576e6f646c4c774541572b6345466741414141427041685941414141416161345148707a72584e7954363162736a54334e58507a2f475144676230356741514141414a416d59414541414143514a6d4142414141416b475947466c2f363766774e573474727a417469622b78706c6d42664151413467515541414142416e4941464148416735784e6437783841674b30517341414141414249453741414141414153424f77414141414145675473414167797177697a73352f4e66443941774277564149574141414141476b43466741414141427041685941414141416151495773436f7a665141414150677041517341414143414e41454c41414141674c5278386a655a2b634a7672336a5a57727862363771675055664a6b767665586a2b7570583950375330416f4d6f4a4c4141414141445342437741414141413067517341414141414e4c4d774f4a4c5a6d44784532764e756672495071504b44437a574e7365657337634167436f6e7341414141414249453741414141414153424f77414141414145677a413473766d5948463262316d57333348336d4a726c7634652b5535775a675957414c426e546d4142414141416b435a6741514141414a446d437548427a58327478586261683971315166754b76566e794f2b6237636c797545414941652b594546674141414142704168594141414141615149574141414141476c6d5942326347566838356c347a734f77666a7367384c4f5a69426859417347644f59414541414143514a6d4142414141416b435a6741514141414a426d427459426d6266434e665949724d664d4f655a69426859417347644f59414541414143514a6d4142414141416b4f594b345145736654334646747133572f61505051487a634a32586e334346454144594d79657741414141414567547341414141414249453741414141414153444d443677444d77414c5976726c2f792f31323734385a574144416e6a6d42425141414145436167415541414142416d6f414641414141514a714142514141414543614965343774655467646c7347344c372b39546665372f5778474f494f414f795a453167414141414170416c5941414141414b514a574141414141436b6d594731492b5a65416342786d594546414f795a453167414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b6a5a4f2f6c37785a632f7935374f2f594767437748584f38462f682f50774251355151574141414141476b43466741414141427072684275774a4a584254312b414e6748567767426744317a41677341414143414e41454c414141416744514243774141414941304153766f504d506938674d41414142775a4149574141414141476b4346674141414142704168594141414141616550305a6c707a5232764f75764c49415744662f765739776a7342414c4156546d4142414141416b435a6741514141414a446d436d48456b6c6349505749414141426779357a41416741414143424e774149414141416754634143414141414945334132716e7a334b763344774141414d4357435667414141414170416c5941414141414b514a574141414141436b6a5a4d6853546c6a6a476e314d78346c414141417345644f59414541414143514a6d4142414141416b4f594b4951414141414270546d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b445a4f623662314959307870685541414a38352b4f7369414244674242594141414141615149574141414141476d37756b4c6f4f69414177503234616767414c4d554a4c4141414141445342437741414141413067517341414141414e49454c414141414144534e6a664533614232414944744d6541644150674e4a3741414141414153424f77414141414145675473414141414142493238514d4c484f764141434f77617773414f417a546d4142414141416b435a6741514141414a416d59414541414143516c706d425a633456414141666d596b46414a773567515541414142416d6f414641414141514e727156776a72567756665835366e4651444173547738506b32724a74634a416543346e4d41434141414149453341416741414143424e77414941414141673754417a734d7932416743593337336d5a706d4842514448346751574141414141476b434667414141414270693138685850504b6f4775434141416461313476644b55514150624e43537741414141413067517341414141414e49454c4141414141445346706d425a653456414143583170794864636c734c41445942796577414141414145675473414141414142494537414141414141534a747442745a6163362f4d76414941324a633135324f5a69515541322b514546674141414142704168594141414141615a753451756a61494144414d5378396e644156516744594a696577414141414145675473414141414142494537414141414141535076524443787a72674141574e4f534d37484d77774b4137584143437741414149413041517341414143414e41454c4141414167445142437741414149413041517341414143414e41454c41414141674c52782b7348664478356a544b7435764c34385479734141506a65772b5054744a724844313644415941376377494c414141416744514243774141414941304151734141414341744b7342367a7a33367630444141423734543058414c624443537741414141413067517341414141414e49454c414141414144534243774141414141307362707a62542b314e78444c5639666e71635641414463357548786156724e34386f724d5142775a30356741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514e6b35767076576e78686a54616836764c382f5443674141627650772b4453744150626a796a2f50346443637741494141414167546341434141414149453341416741414143424e774149414149434138777a71727a3577644149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141616550305a6c702f616f7778726562782b76493872514141344459506a302f5461683765555947357a6630376465576637724237546d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b445a4f623662317038595930326f6572792f5030776f414147377a38506730725741642f683344543833394f33586c6e2b36776530356741514141414a416d59414541414143514a6d4142414142636362344f64766b425946304346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b4346674141414142704168594141414141615149574141414141476b43466741414141427041685941414141416151495741414348647a71646648622b4157446242437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c4141414141445342437741414141413067517341414141414e49454c414141414144534243774141414141306751734141414f62347a68732f4d50414e736d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d59414541414143514a6d4142414141416b435a6741514141414a416d5941454141467a782b764c383177654164516c5941414141414b514a574141414141436b4356674141414141704933546d326e3971544847744a71482b2b494141507a57772b5054744a714864315267626e502f546c3335707a76736e684e5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b435667414141414170416c5941414141414b514a574141414141436b6a644f62616632704d6361306d736672792f4f3041674341327a7738506b307267474f34386b39333244306e7341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141434467644470392b59476a453741414141414153424f7741414141414567547341414141414249473663726c326e48474e4e71487138767a394d4b41414275382f44344e4b336d5962344d414c513567515541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a7141425141414145436167415541414142416d6f414641414141514a714142514141414544614f4c325a31703861593079722b62322b50453872414144343373506a3037536133355658596744677a707a41416741414143424e77414941414141675463414341414141494f31717744725041336a2f41414441586e6a50425944746341494c4141414167445142437741414149413041517341414143414e41454c4141414167445142437741414149413041517341414143414e41454c41414141674c5278656a4f747278706a544b763576623438547973414150692f6838656e6154572f4837774741774233356751574141414141476b434667414141414270416859414141414161542b616766556438374541415069744a5764656e5a6c3742514462354151574141414141476b4346674141414142706d376843654d6c315167434166566e363275416c56776742594a75637741494141414167546341434141414149453341416741414143427474686c596c3961616833566d4a685941514e2b61633634756d586b46415076674242594141414141615149574141414141476b43466741414141427069387a41756d5165466744414d613035393871734b7744594e796577414141414145675473414141414142493239555677752b34586767414d4c383172776c65636d55514149374643537741414141413067517341414141414e49454c4141414141445346702b423956466c4a745a587a4d6f4341506a6276655a636663634d4c414134466965774141414141456754734141414141424945374141414141415346743942745a5836724f78414142596e316c58414d435a453167414141414170416c5941414141414b526c7268422b782f56434149426a634755514150694d453167414141414170416c5941414141414b514a574141414141436b625749473169587a73414141747364734b7744674e357a41416741414143424e774149414141416754634143414141414947317a4d37432b597a345741454348755663417746796377414941414141675463414341414141494731585677687634646f68414d443358415545414f374e43537741414141413067517341414141414e49454c41414141414453446a384443774141414941324a3741414141414153424f7741414141414567547341414141414249453741414141414153424f7741414141414567547341414141414249453741414141414153424f774141414141416a37382b632f2b755a4857465548496d3841414141415355564f524b35435949493d, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombres`, `apellidos`, `correo`, `alias`, `clave`) VALUES
(1, 'Jorge Alejandro', 'Calderón De Paz', 'gorge.depaz@gmail.com', 'Omega', '$2y$10$zS1gBHipDteWev6sjezGdur.z1OATLtsl5oYLvZeLfgRpdbUBTk8S');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre_categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `nombre` (`nombre_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
