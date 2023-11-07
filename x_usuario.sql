-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2023 a las 13:37:25
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `conecta_mayor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_usuario`
--

CREATE TABLE `x_usuario` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_pass` varchar(200) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `x_usuario`
--

INSERT INTO `x_usuario` (`user_id`, `user_email`, `user_pass`, `last_login`) VALUES
(1, 'juan@jara.cl', 'juan2023', '2023-11-07 01:01:29'),
(2, 'paty@parra.cl', 'patty2023', NULL),
(3, 'nelly@nunez.cl', 'nelly2023', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `x_usuario`
--
ALTER TABLE `x_usuario`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `u_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `x_usuario`
--
ALTER TABLE `x_usuario`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
