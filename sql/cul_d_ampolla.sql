-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-04-2020 a las 23:49:23
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_d_ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adreca` varchar(50) NOT NULL,
  `telefon` int(9) NOT NULL,
  `data_registre` date NOT NULL,
  `qui_recomana` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `nom`, `adreca`, `telefon`, `data_registre`, `qui_recomana`) VALUES
(1, 'tony', 'hospitalet 200 4 5', 931001010, '2020-04-25', 'hector'),
(2, 'tere', 'industria 200 4 5', 931001010, '2020-04-25', 'tony'),
(3, 'hector', 'gran de gracia 200 4 5', 931001010, '2020-04-25', 'tere');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(15) NOT NULL,
  `cognom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleat`
--

INSERT INTO `empleat` (`id_empleat`, `nom`, `cognom`) VALUES
(1, 'elena', 'piaggio'),
(2, 'sophia', 'collins'),
(3, 'sergio', 'estrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `montura`
--

CREATE TABLE `montura` (
  `id_montura` int(11) NOT NULL,
  `tipus_montura` enum('flotant','pasta','metallica','') NOT NULL,
  `color_montura` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `montura`
--

INSERT INTO `montura` (`id_montura`, `tipus_montura`, `color_montura`) VALUES
(1, 'pasta', 'blau'),
(2, 'flotant', 'vermell'),
(3, 'metallica', 'gris'),
(4, 'metallica', 'negre'),
(5, 'flotant', 'gris');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `carrer` varchar(20) NOT NULL,
  `numero` int(4) NOT NULL,
  `pis` int(1) NOT NULL,
  `porta` int(1) NOT NULL,
  `ciutat` varchar(15) NOT NULL,
  `cp` int(5) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `telefon` int(9) NOT NULL,
  `fax` int(9) NOT NULL,
  `NIF` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `cp`, `pais`, `telefon`, `fax`, `NIF`) VALUES
(1, 'mango', 'travessera de gracia', 100, 1, 2, 'barcelona', 8010, 'españa', 931881918, 931231414, 'A23232323D'),
(2, 'tree', 'nacio', 100, 1, 2, 'barcelona', 8010, 'españa', 931881918, 931231414, 'J23232323H'),
(3, 'sos', 'peru', 100, 1, 2, 'barcelona', 8010, 'españa', 931881918, 931231414, 'K23232323Z'),
(4, 'fashion', 'les corts', 100, 1, 2, 'barcelona', 8010, 'españa', 931881918, 931231414, 'F23232323A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ullera` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `graduacio_esq` decimal(2,0) NOT NULL,
  `graduacio_dreta` decimal(2,0) NOT NULL,
  `color_esq` varchar(10) NOT NULL,
  `color_dreta` varchar(10) NOT NULL,
  `preu` float NOT NULL,
  `montura_id` int(11) NOT NULL,
  `proveidor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ullera`, `marca`, `graduacio_esq`, `graduacio_dreta`, `color_esq`, `color_dreta`, `preu`, `montura_id`, `proveidor_id`) VALUES
(5, 'mango', '1', '2', 'blanc', 'gris', 20, 1, 4),
(6, 'sephora', '1', '2', 'vermell', 'verd', 50, 2, 1),
(7, 'woman secret', '1', '2', 'groc', 'blau', 90, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `ullera_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `empleat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `ullera_id`, `client_id`, `empleat_id`) VALUES
(1, 7, 3, 1),
(2, 6, 1, 2),
(3, 7, 1, 1),
(4, 6, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `montura`
--
ALTER TABLE `montura`
  ADD PRIMARY KEY (`id_montura`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ullera`),
  ADD KEY `id_montura` (`montura_id`),
  ADD KEY `id_proveidor` (`proveidor_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_ullera` (`ullera_id`),
  ADD KEY `id_client` (`client_id`),
  ADD KEY `id_empleat` (`empleat_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `montura`
--
ALTER TABLE `montura`
  MODIFY `id_montura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ullera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id_proveidor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`montura_id`) REFERENCES `montura` (`id_montura`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ullera_id`) REFERENCES `ulleres` (`id_ullera`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`id_empleat`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
