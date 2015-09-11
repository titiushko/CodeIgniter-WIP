-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-09-2012 a las 21:13:54
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `crud_db`
--

DROP DATABASE IF EXISTS ci_crud_grocery;
CREATE DATABASE IF NOT EXISTS ci_crud_grocery DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE ci_crud_grocery;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(50) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `existencia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `proveedor`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `existencia`) VALUES
(1, 'Apple', 'Macbook Pro ', 'Nueva macbook pro con pantalla retina', 1100, 1300, 30),
(2, 'Toshiba', 'Disco duro externo', 'Disco duro externo 1 TB', 84, 98, 15),
(3, 'HP', 'Monitor LED', 'Monitor HP con resolución hasta de 1600x900 de 24"', 50, 65, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
