-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2024 a las 13:37:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `book_loans`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(1, 'Pedro Mairal'),
(2, 'Eduardo Sacheri'),
(3, 'Hernán Casciari'),
(4, 'Carlos Martínez'),
(5, 'Ana Sánchez'),
(6, 'Javier González'),
(7, 'Laura Rodríguez'),
(8, 'David Pérez'),
(9, 'Marta Gómez'),
(10, 'Alejandro López'),
(11, 'María García'),
(12, 'Juan Martín'),
(13, 'Sofía Fernández');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `code` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `price` float NOT NULL,
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`code`, `title`, `price`, `publisher_id`) VALUES
(1000, 'La uruguaya', 10.49, 1),
(1001, 'El secreto de la montaña', 8.49, 1),
(1002, 'Caminos de papel', 5.49, 2),
(1003, 'Sueños de cristal', 10.99, 3),
(1004, 'Salvatierra', 17.49, 1),
(1005, 'El funcionamiento general del mundo', 7.99, 2),
(1006, 'Ser feliz era esto', 8.99, 3),
(1007, 'Cuentos cortos', 16.49, 2),
(1008, 'Amanecer de fuego', 7.99, 4),
(1009, 'El vuelo del colibrí', 12.99, 5),
(1010, 'Sombras en la noche', 6.99, 6),
(1011, 'El eco del silencio', 18.49, 7),
(1012, 'Flores de invierno', 8.99, 8),
(1013, 'El susurro del viento', 13.49, 6),
(1014, 'El laberinto de los sueños', 6.99, 1),
(1015, 'La senda de los recuerdos', 16.49, 2),
(1016, 'Travesía sin fin', 14.99, 3),
(1017, 'Cielos de esperanza', 18.49, 4),
(1018, 'El despertar de la oscuridad', 14.49, 5),
(1019, 'Voces en la neblina', 12.49, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_authors`
--

CREATE TABLE `book_authors` (
  `book_code` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `book_authors`
--

INSERT INTO `book_authors` (`book_code`, `author_id`) VALUES
(1000, 1),
(1001, 1),
(1001, 2),
(1001, 3),
(1002, 4),
(1002, 5),
(1003, 6),
(1003, 7),
(1004, 1),
(1005, 1),
(1005, 2),
(1006, 2),
(1007, 1),
(1007, 2),
(1007, 3),
(1008, 8),
(1009, 10),
(1010, 11),
(1011, 12),
(1012, 13),
(1013, 1),
(1013, 3),
(1014, 5),
(1015, 6),
(1015, 7),
(1016, 8),
(1017, 9),
(1018, 10),
(1019, 12),
(1019, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `firstname` longtext DEFAULT NULL,
  `lastname` longtext DEFAULT NULL,
  `address` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id`, `firstname`, `lastname`, `address`) VALUES
(1, 'Ana', 'Gómez', 'Calle Falsa 123'),
(2, 'Juan', 'Pérez', 'Avenida Rivadavia 456'),
(3, 'José', 'Sánchez', 'Calle Corrientes 789'),
(4, 'Juan', 'Martínez', 'Avenida de Mayo 1011'),
(5, 'María', 'Gómez', 'Calle Florida 1213'),
(6, 'Pedro', 'Rodríguez', 'Avenida 9 de Julio 1415'),
(7, 'Laura', 'Fernández', 'Calle Lavalle 1617'),
(8, 'Carlos', 'López', 'Avenida Santa Fe 1819'),
(9, 'Ana', 'Díaz', 'Calle Reconquista 2021'),
(10, 'Miguel', 'Hernández', 'Avenida Córdoba 2223'),
(11, 'Sofía', 'Pérez', 'Calle San Martín 2425'),
(12, 'Luis', 'García', 'Avenida Belgrano 2627'),
(13, 'Elena', 'Martín', 'Calle Sarmiento 2829'),
(14, 'David', 'Ruiz', 'Avenida Callao 3031'),
(15, 'Paula', 'Jiménez', 'Calle Pellegrini 3233'),
(16, 'Javier', 'Moreno', 'Avenida Libertador 3435'),
(17, 'Lucía', 'Álvarez', 'Calle Alsina 3637'),
(18, 'Diego', 'Romero', 'Avenida Juan B. Justo 3839'),
(19, 'Carmen', 'Sánchez', 'Calle Paraguay 4041'),
(20, 'Alejandro', 'Torres', 'Avenida Brasil 4243'),
(21, 'Eva', 'Flores', 'Calle Uruguay 4445'),
(22, 'Antonio', 'Morales', 'Avenida Chile 4647'),
(23, 'Isabel', 'Ortega', 'Calle Perú 4849'),
(24, 'Francisco', 'Díaz', 'Avenida Venezuela 5051'),
(25, 'Patricia', 'Gutiérrez', 'Calle Bolivia 5253'),
(26, 'Pablo', 'Vázquez', 'Avenida Colombia 5455'),
(27, 'Rosa', 'Serrano', 'Calle Ecuador 5657'),
(28, 'Manuel', 'Blanco', 'Avenida Paraguay 5859'),
(29, 'Teresa', 'Suárez', 'Calle Brasil 6061'),
(30, 'Andrés', 'Molina', 'Avenida Uruguay 6263'),
(31, 'Beatriz', 'Ramírez', 'Calle Chile 6465'),
(32, 'Fernando', 'Navarro', 'Avenida Perú 6667'),
(33, 'Marta', 'Iglesias', 'Calle Venezuela 6869'),
(34, 'Adrián', 'Ortiz', 'Avenida Bolivia 7071'),
(35, 'Cristina', 'Garrido', 'Calle Colombia 7273'),
(36, 'Jorge', 'Rubio', 'Avenida Ecuador 7475'),
(37, 'Raquel', 'Cabrera', 'Calle Paraguay 7677'),
(38, 'Roberto', 'Méndez', 'Avenida Brasil 7881'),
(39, 'Natalia', 'León', 'Calle Uruguay 8083'),
(40, 'Daniel', 'Herrera', 'Avenida Chile 8285'),
(41, 'Silvia', 'Pardo', 'Calle Perú 8487'),
(42, 'Rafael', 'Cruz', 'Avenida Venezuela 8689'),
(43, 'Marina', 'Gallego', 'Calle Bolivia 9091'),
(44, 'José', 'Reyes', 'Avenida Colombia 9293'),
(45, 'Raúl', 'Moya', 'Calle Ecuador 9495'),
(46, 'Sara', 'Peña', 'Avenida Paraguay 9697'),
(47, 'Guillermo', 'Rivas', 'Calle Brasil 9899'),
(48, 'Verónica', 'Esteban', 'Avenida Uruguay 100101'),
(49, 'Alicia', 'Castro', 'Calle Chile 102103'),
(50, 'Oscar', 'Núñez', 'Avenida Perú 104105'),
(51, 'Miriam', 'Vidal', 'Calle Venezuela 106107');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoiceitems`
--

CREATE TABLE `invoiceitems` (
  `item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publisher`
--

INSERT INTO `publisher` (`id`, `name`) VALUES
(1, 'EMECE'),
(2, 'Planeta'),
(3, 'Alfaguara'),
(4, 'Editorial Estrella'),
(5, 'Libros del Sur'),
(6, 'Ediciones Brillantes'),
(7, 'Editorial del Bosque'),
(8, 'Mundo de Letras');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`code`),
  ADD KEY `fk_publisher_id` (`publisher_id`);

--
-- Indices de la tabla `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`book_code`,`author_id`),
  ADD KEY `fk_book_authors` (`author_id`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invoiceitems`
--
ALTER TABLE `invoiceitems`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IX_InvoiceItems_invoice_id` (`invoice_id`),
  ADD KEY `FK_InvoiceItems_Books_book_id` (`product_code`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_Invoices_CustomerId` (`CustomerId`);

--
-- Indices de la tabla `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1020;

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `invoiceitems`
--
ALTER TABLE `invoiceitems`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`);

--
-- Filtros para la tabla `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `fk_book_authors` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `fk_book_code_authors` FOREIGN KEY (`book_code`) REFERENCES `book` (`code`);

--
-- Filtros para la tabla `invoiceitems`
--
ALTER TABLE `invoiceitems`
  ADD CONSTRAINT `FK_InvoiceItems_Books_book_id` FOREIGN KEY (`product_code`) REFERENCES `book` (`code`),
  ADD CONSTRAINT `FK_InvoiceItems_Invoices_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `FK_Invoices_Customer_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
