-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-06-2020 a las 17:34:26
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `idBrands` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'Nom companyies d''ulleres',
  `ulleres_idGlasses` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idBrands`),
  KEY `fk_brands_ulleres1_idx` (`ulleres_idGlasses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`idBrands`, `name`, `ulleres_idGlasses`) VALUES
(1, 'Ray-Ban', 1),
(2, 'Ray-Ban', 2),
(3, 'Ray-Ban', 3),
(4, 'Police', 3),
(5, 'Police', 2),
(6, 'Police', 1),
(7, 'Arnette', 1),
(8, 'Arnette', 2),
(9, 'Arnette', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unsigned 0 to 4294967295\n\nfont: https://www.tutorialrepublic.com/sql-reference/mysql-data-types.php',
  `nom` varchar(45) NOT NULL COMMENT 'nom i cognoms => varchar No crec que hi hagin noms tant llargs , peró...',
  `cognom` varchar(45) NOT NULL,
  `telèfon` varchar(20) NOT NULL COMMENT '+353 01 123 45 56 89 Era com s''escrivia el meu num de telèfon Irlandés. soc old school i crec que es més fàcil de llegir un num de tel amb els espais en blanc Suposo que deu haver-hi una manera de forçar-ho amb php peró no se com fer-ho.',
  `mail` varchar(90) NOT NULL COMMENT 'aquí..."ancha es Castilla" Cada mail es fill/a de son pare/ mare.',
  `codi_postal` decimal(10,0) NOT NULL COMMENT 'codi postal mes llarg del mon',
  `creacio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'mireu els triggers i dieu me si està bé\n\nfonts:\n\nhttps://dev.mysql.com/doc/workbench/en/wb-table-editor-triggers-tab.html\n\nhttps://forums.mysql.com/read.php?152,660080,660130',
  `amic_client` varchar(45) DEFAULT NULL COMMENT 'Ha sigut recomenat? Potser si o no. NN queda lliure',
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`idClient`, `nom`, `cognom`, `telèfon`, `mail`, `codi_postal`, `creacio`, `amic_client`) VALUES
(1, 'John', 'Wick', '+1 555 123 45 67', 'hello@wick.com', '123456', '2020-06-21 18:29:47', NULL),
(2, 'John', 'Rambo', '+1 987 65 43', 'hello@rambo.com', '123456', '2020-06-21 18:31:12', NULL),
(3, 'John', 'Snow', '+1 456 78 91', 'hello@snow.com', '123456', '2020-06-21 18:32:12', 'John wick');

--
-- Disparadores `client`
--
DROP TRIGGER IF EXISTS `Client_AFTER_UPDATE`;
DELIMITER $$
CREATE TRIGGER `Client_AFTER_UPDATE` AFTER UPDATE ON `client` FOR EACH ROW BEGIN
UPDATE client SET timestamp = NOW();
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Client_BEFORE_UPDATE`;
DELIMITER $$
CREATE TRIGGER `Client_BEFORE_UPDATE` BEFORE UPDATE ON `client` FOR EACH ROW BEGIN
UPDATE client SET timestamp = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Abans de pagar la factura (jo que porto ulleres sempre ho he vist així) arriba un sobre amb les teves ulleres\n\nrelacio 1 - 1 =>  aquestes ulleres amb aquesta graduació son teves, de ningú més. Després aquestes dades personals e instranferibles es pasan a la factura!',
  `Client_idClient` int(10) UNSIGNED NOT NULL,
  `preuVenda` decimal(5,2) NOT NULL COMMENT 'preu final venta. Dioptries inclosses\n',
  `ulleres_ddbb_idUlleresBD` int(11) NOT NULL,
  PRIMARY KEY (`idCompra`),
  UNIQUE KEY `idCompra_UNIQUE` (`idCompra`),
  KEY `fk_compra_Client1_idx` (`Client_idClient`),
  KEY `fk_compra_ulleres_ddbb1_idx` (`ulleres_ddbb_idUlleresBD`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idCompra`, `Client_idClient`, `preuVenda`, `ulleres_ddbb_idUlleresBD`) VALUES
(1, 1, '295.95', 1),
(2, 3, '175.95', 3),
(3, 2, '385.95', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

DROP TABLE IF EXISTS `empleats`;
CREATE TABLE IF NOT EXISTS `empleats` (
  `idEmpleats` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `cognom` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpleats`),
  UNIQUE KEY `idEmpleats_UNIQUE` (`idEmpleats`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`idEmpleats`, `nom`, `cognom`) VALUES
(1, 'Maria', 'Martinez'),
(2, 'Lourdes', 'Martinez'),
(3, 'Luis', 'Martinez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL COMMENT 'cadafactura serà ùnica',
  `dia_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de la compra.',
  `compra_idCompra` int(11) NOT NULL,
  `empleats_idEmpleats` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`,`compra_idCompra`,`empleats_idEmpleats`),
  UNIQUE KEY `idFactura_UNIQUE` (`idFactura`),
  KEY `fk_factura_compra1_idx` (`compra_idCompra`),
  KEY `fk_factura_empleats1_idx` (`empleats_idEmpleats`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `dia_compra`, `compra_idCompra`, `empleats_idEmpleats`) VALUES
(1, '2020-06-21 19:31:15', 1, 3),
(2, '2020-06-21 19:31:43', 2, 1),
(3, '2020-06-21 19:32:08', 3, 2);

--
-- Disparadores `factura`
--
DROP TRIGGER IF EXISTS `factura_AFTER_UPDATE`;
DELIMITER $$
CREATE TRIGGER `factura_AFTER_UPDATE` AFTER UPDATE ON `factura` FOR EACH ROW BEGIN
UPDATE factura SET timestamp = NOW();
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `factura_BEFORE_UPDATE`;
DELIMITER $$
CREATE TRIGGER `factura_BEFORE_UPDATE` BEFORE UPDATE ON `factura` FOR EACH ROW BEGIN
UPDATE factura SET timestamp = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
CREATE TABLE IF NOT EXISTS `proveidor` (
  `idProveidor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'De moment deixo el id automatic com el referent númeric de cada proveïdor',
  `nomProv` varchar(45) NOT NULL COMMENT 'No conec el mon de les óptiques, suposo que no hi han dos proveïdors amb el mateix nom...',
  `tipus_carrer` varchar(15) NOT NULL COMMENT 'avinguda => 8\npassatge => 8\ncarrer      => 6\nriera        => 5\nplaça       => 5\ncarretera =>9\ntravesía   =>8\nespigones=>9\ncat and cast i si son estrangers''',
  `nom_carrer` varchar(90) NOT NULL COMMENT 'Per si de cas ens trobem una adreça tipus Moll de la fusta, espigo "Joan Maragall i Plà" , escala esquerra.\n\nhttps://es.wikipedia.org/wiki/Odonimia_de_Barcelona\n\n',
  `num_carrer` varchar(10) NOT NULL COMMENT 'carrer mes llarg barcelona : Gran Via num + alt 1198 i si son estrangers?',
  `planta` varchar(3) DEFAULT NULL COMMENT '(planta == 0) ? null : not null;\n\n',
  `pis` varchar(2) DEFAULT NULL COMMENT 'mateix cas que planta',
  `ciutat` varchar(45) NOT NULL,
  `codi_postal` varchar(10) NOT NULL COMMENT 'https://www.grcdi.nl/pidm//postal%20code.html#:~:text=Field%20lengths%20%3A%20the%20longest%20postal,world%20is%2010%20digits%20long.\n\nel més llarg del món es de 10 digits',
  `brands_idBrands` int(11) NOT NULL,
  PRIMARY KEY (`idProveidor`,`brands_idBrands`),
  UNIQUE KEY `idProveidor_UNIQUE` (`idProveidor`),
  KEY `fk_proveidor_brands1_idx` (`brands_idBrands`),
  KEY `nom` (`nomProv`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`idProveidor`, `nomProv`, `tipus_carrer`, `nom_carrer`, `num_carrer`, `planta`, `pis`, `ciutat`, `codi_postal`, `brands_idBrands`) VALUES
(1, 'Sunny Days', 'Avda.', 'Diagonal', '785', '1', NULL, 'Barcelona', '08015', 1),
(2, 'GlassesXlife', 'Avne', 'Coronado', '89', '1', NULL, 'Coronado', '123456', 3),
(3, 'GlassesXlife', 'Avne', 'Coronado', '89', '1', NULL, 'Coronado', '123456', 6),
(4, 'GAFA S.A.', 'Carrer', 'Joanot Martorell', '15', '1', NULL, 'Sabadell', '08203', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
CREATE TABLE IF NOT EXISTS `ulleres` (
  `idGlasses` int(10) UNSIGNED NOT NULL,
  `montura` varchar(11) NOT NULL COMMENT 'el codi numeric ens dirà els egüents paragrams:\n\n(montura == 1) ? pasta :\n(montura == 2) ? metàl.lica :\n(montura == 3) ? flotant : false;',
  `tipusVidre` varchar(8) NOT NULL COMMENT 'el codi numeric ens dirà els egüents paragrams:\n\n(tipusVidre == 4) ? lectura :\n(tipusVidre == 5) ? sol : false;',
  `colorVidre` varchar(13) NOT NULL COMMENT 'el codi numeric ens dirà els egüents paragrams:\n(color == 0) ? transparent :\n(color == 6) ? negre :\n(color == 7) ? blau :\n(color == 8) ? groc :\n(color == 9) ? marró :\n(color == 10) ? reflectants : false;\n',
  `colorMontura` varchar(9) NOT NULL COMMENT 'el codi numeric ens dirà els egüents paragrams:\n\n(color == 11) ? negre :\n(color == 12) ? blau :\n(color == 13) ? vermell :\n(color == 14) ? groc :\n(color == 15) ? marró : false;',
  `preu` decimal(5,2) NOT NULL COMMENT '195,95€ jo no em puc permetre ulleres mes cares de 999.99€. Unsigned , no venen ulleres mes barates de 0.0€, peró per si de cas(ofertes, promocions) on hagin d''escriure (-25€) ho deixaré signed.',
  PRIMARY KEY (`idGlasses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`idGlasses`, `montura`, `tipusVidre`, `colorVidre`, `colorMontura`, `preu`) VALUES
(1, '1(pasta)', '4(lect)', '0(trans)', '12(blue)', '25.95'),
(2, '2(metal)', '4(sun)', '6(blck)', '11(blck)', '45.95'),
(3, '3(flot)', '4(sun)', '9(brwn)', '14(yllw)', '35.95');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres_ddbb`
--

DROP TABLE IF EXISTS `ulleres_ddbb`;
CREATE TABLE IF NOT EXISTS `ulleres_ddbb` (
  `idUlleresBD` int(11) NOT NULL AUTO_INCREMENT,
  `ulleresCodi` decimal(20,0) UNSIGNED NOT NULL COMMENT 'el codi numeric ens dirà els egüents paragrams:\n\n(montura == 1) ? pasta :\n(montura == 2) ? metàl.lica :\n(montura == 3) ? flotant : false;',
  `proveidor_idProveidor` int(11) NOT NULL,
  PRIMARY KEY (`idUlleresBD`),
  UNIQUE KEY `idUlleresBD_UNIQUE` (`idUlleresBD`),
  UNIQUE KEY `ulleresCodi_UNIQUE` (`ulleresCodi`),
  KEY `fk_ulleres_ddbb_proveidor1_idx` (`proveidor_idProveidor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ulleres_ddbb`
--

INSERT INTO `ulleres_ddbb` (`idUlleresBD`, `ulleresCodi`, `proveidor_idProveidor`) VALUES
(1, '123456', 1),
(2, '987654', 3),
(3, '456789', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands` ADD FULLTEXT KEY `name` (`name`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `fk_brands_ulleres1` FOREIGN KEY (`ulleres_idGlasses`) REFERENCES `ulleres` (`idGlasses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_compra_ulleres_ddbb1` FOREIGN KEY (`ulleres_ddbb_idUlleresBD`) REFERENCES `ulleres_ddbb` (`idUlleresBD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_compra1` FOREIGN KEY (`compra_idCompra`) REFERENCES `compra` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_factura_empleats1` FOREIGN KEY (`empleats_idEmpleats`) REFERENCES `empleats` (`idEmpleats`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `fk_proveidor_brands1` FOREIGN KEY (`brands_idBrands`) REFERENCES `brands` (`idBrands`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ulleres_ddbb`
--
ALTER TABLE `ulleres_ddbb`
  ADD CONSTRAINT `fk_ulleres_ddbb_proveidor1` FOREIGN KEY (`proveidor_idProveidor`) REFERENCES `proveidor` (`idProveidor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
