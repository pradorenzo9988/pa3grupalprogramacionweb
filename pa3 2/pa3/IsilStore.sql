-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 22-05-2025 a las 06:30:15
-- Versión del servidor: 11.5.2-MariaDB-ubu2404
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `IsilStore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(1, 'Tecnología', 'Dispositivos electrónicos y accesorios'),
(2, 'Papelería', 'Materiales de estudio y oficina'),
(3, 'Libros', 'Libros académicos y de desarrollo personal'),
(4, 'Merch ISIL', 'Productos personalizados con logo de ISIL'),
(5, 'Ropa', 'Prendas de vestir y accesorios de moda'),
(6, 'Hogar', 'Artículos para el hogar y decoración'),
(7, 'Deportes', 'Equipos y accesorios deportivos'),
(8, 'Salud', 'Productos de cuidado personal y bienestar'),
(9, 'Belleza', 'Cosméticos y productos de cuidado facial'),
(10, 'Alimentos', 'Snacks, bebidas y alimentos variados'),
(11, 'Bebidas', 'Bebidas naturales y energéticas'),
(12, 'Mascotas', 'Accesorios y alimentos para mascotas'),
(13, 'Arte y diseño', 'Materiales artísticos y creativos'),
(14, 'Juguetes', 'Juguetes didácticos y recreativos'),
(15, 'Electrodomésticos', 'Equipos para el hogar y cocina'),
(16, 'Música', 'Instrumentos y accesorios musicales'),
(17, 'Videojuegos', 'Juegos y consolas'),
(18, 'Cine y TV', 'Películas, series y coleccionables'),
(19, 'Viajes', 'Artículos de viaje y maletas'),
(20, 'Accesorios', 'Bolsos, relojes y joyería'),
(21, 'Estudios', 'Guías, cuadernos y libros de ayuda académica'),
(22, 'Instrumentos', 'Herramientas para estudiantes técnicos'),
(23, 'Ofertas', 'Promociones y productos con descuento'),
(24, 'Novedades', 'Últimos productos incorporados'),
(25, 'Sostenibles', 'Productos ecológicos y reutilizables'),
(26, 'Eventos ISIL', 'Souvenirs y material para eventos académicos'),
(27, 'Tecnología educativa', 'Herramientas digitales para el aprendizaje'),
(28, 'Emprendimiento', 'Recursos y materiales para emprendedores'),
(29, 'Realidad virtual', 'Dispositivos y accesorios de RV'),
(30, 'Robótica', 'Kits y componentes para proyectos robóticos'),
(31, 'Servicios ISIL', 'Categorías relacionadas a servicios institucionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Compras`
--

CREATE TABLE `Compras` (
  `id_compra` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Compras`
--

INSERT INTO `Compras` (`id_compra`, `id_usuario`, `id_producto`, `fecha_compra`, `cantidad`) VALUES
(1, 12, 3, '2025-01-15 10:45:00', 1),
(2, 5, 16, '2025-02-03 14:20:00', 2),
(3, 18, 1, '2025-01-22 09:10:00', 1),
(4, 27, 20, '2025-03-12 13:05:00', 3),
(5, 9, 6, '2025-02-18 16:30:00', 1),
(6, 23, 11, '2025-01-30 11:40:00', 2),
(7, 2, 7, '2025-02-14 12:15:00', 1),
(8, 8, 28, '2025-03-01 09:25:00', 1),
(9, 15, 34, '2025-03-22 17:00:00', 4),
(10, 1, 19, '2025-04-05 15:45:00', 2),
(11, 4, 8, '2025-04-10 10:30:00', 1),
(12, 30, 25, '2025-04-12 12:10:00', 3),
(13, 17, 2, '2025-05-01 08:50:00', 1),
(14, 6, 13, '2025-05-04 14:00:00', 1),
(15, 20, 22, '2025-05-10 10:15:00', 2),
(16, 13, 10, '2025-05-12 11:55:00', 2),
(17, 29, 15, '2025-05-14 09:35:00', 5),
(18, 26, 17, '2025-05-17 13:45:00', 2),
(19, 19, 21, '2025-05-18 14:30:00', 3),
(20, 10, 5, '2025-05-20 10:00:00', 1),
(21, 11, 23, '2025-05-21 15:25:00', 1),
(22, 7, 30, '2025-05-21 10:40:00', 2),
(23, 3, 4, '2025-05-21 16:50:00', 3),
(24, 16, 18, '2025-05-21 18:15:00', 1),
(25, 14, 32, '2025-05-21 19:00:00', 1),
(26, 22, 14, '2025-05-21 17:40:00', 1),
(27, 21, 26, '2025-05-21 16:20:00', 2),
(28, 24, 9, '2025-05-21 14:45:00', 1),
(29, 25, 12, '2025-05-21 13:30:00', 1),
(30, 28, 33, '2025-05-21 12:50:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `caracteristicas` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` enum('Disponible','Agotado','Descontinuado') DEFAULT NULL,
  `edad_recomendada` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`id_producto`, `nombre`, `caracteristicas`, `precio`, `estado`, `edad_recomendada`, `id_categoria`) VALUES
(1, 'Audífonos Bluetooth', 'Inalámbricos, cancelación de ruido', 89.90, 'Disponible', 17, 1),
(2, 'Teclado Mecánico', 'Retroiluminado RGB', 120.00, 'Disponible', 18, 1),
(3, 'Mouse Ergonómico', 'Diseño para largas sesiones de estudio', 45.00, 'Agotado', 18, 1),
(4, 'Agenda Universitaria', 'Diseño ISIL, con calendario académico', 25.00, 'Disponible', 17, 2),
(5, 'Libreta de Apuntes', 'Tamaño A5, tapa dura', 10.00, 'Disponible', 17, 2),
(6, 'Libro de Liderazgo', 'Autor: John C. Maxwell', 49.90, 'Descontinuado', 19, 3),
(7, 'Camiseta ISIL', '100% algodón, tallas variadas', 35.00, 'Disponible', 18, 4),
(8, 'Taza ISIL', 'Cerámica, personalizada con tu nombre', 20.00, 'Disponible', 16, 4),
(9, 'USB 64GB', 'Marca Kingston, velocidad 3.0', 35.90, 'Disponible', 18, 1),
(10, 'Cuaderno ISIL', 'Con diseño institucional', 18.00, 'Disponible', 17, 2),
(11, 'Soporte para Laptop', 'Ajustable, aluminio', 65.00, 'Disponible', 18, 1),
(12, 'Audífonos con cable', 'Estéreo, micrófono incluido', 25.00, 'Disponible', 17, 1),
(13, 'Cargador portátil', '10,000 mAh, doble salida USB', 50.00, 'Disponible', 18, 1),
(14, 'Mousepad ISIL', 'Antideslizante', 15.00, 'Disponible', 16, 4),
(15, 'Pack de resaltadores', '5 colores pastel', 9.50, 'Disponible', 17, 2),
(16, 'Libro de Python', 'Guía práctica para principiantes', 60.00, 'Agotado', 19, 3),
(17, 'Planner mensual', 'Con metas y hábitos', 19.90, 'Disponible', 17, 2),
(18, 'Tomatodo ISIL', '500ml, BPA Free', 22.00, 'Disponible', 16, 4),
(19, 'Cámara Web HD', '1080p, ideal para clases online', 85.00, 'Disponible', 18, 1),
(20, 'Bolígrafos x10', 'Punta fina, colores surtidos', 12.00, 'Disponible', 17, 2),
(21, 'Cinta adhesiva ISIL', 'Ideal para proyectos creativos', 6.50, 'Disponible', 16, 4),
(22, 'Lámpara LED de Escritorio', 'Luz blanca, 3 niveles de intensidad', 42.00, 'Disponible', 18, 1),
(23, 'Libro de Marketing Digital', 'Incluye acceso a plataforma online', 55.00, 'Disponible', 19, 3),
(24, 'Bolso ISIL', 'Compartimentos para laptop y libros', 65.00, 'Disponible', 18, 4),
(25, 'Calcetines ISIL', 'Con logo bordado, talla única', 12.00, 'Disponible', 16, 4),
(26, 'Estuche para útiles', 'Con cierre doble y separadores', 18.50, 'Disponible', 17, 2),
(27, 'Rotuladores permanentes', 'Pack x4, punta fina', 9.90, 'Disponible', 17, 2),
(28, 'Libro de Inteligencia Emocional', 'Autor: Daniel Goleman', 48.00, 'Disponible', 19, 3),
(29, 'Lentes para Pantalla', 'Con filtro de luz azul', 75.00, 'Disponible', 18, 1),
(30, 'Sticker Pack ISIL', 'Diseños personalizados por carrera', 8.00, 'Disponible', 16, 4),
(31, 'Post-its en forma de laptop', 'Paquete de 100 hojas', 7.50, 'Disponible', 16, 2),
(32, 'Audífonos Gamer', 'Con micrófono y luz LED', 98.00, 'Disponible', 18, 1),
(33, 'Mini pizarra acrílica', 'Ideal para repasos rápidos', 14.00, 'Disponible', 17, 2),
(34, 'Cuaderno de programación', 'Con hojas cuadriculadas y tips de código', 22.00, 'Disponible', 17, 2),
(35, 'Llavero ISIL metálico', 'Con grabado láser personalizado', 10.00, 'Disponible', 16, 4),
(36, 'Mini altavoz Bluetooth', 'Batería de larga duración', 49.00, 'Disponible', 18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `nivel_academico` enum('Primero','Segundo','Tercero','Cuarto','Quinto','Sexto','Egresado') DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id_usuario`, `nombre_completo`, `correo`, `carrera`, `nivel_academico`, `fecha_registro`) VALUES
(1, 'María Fernanda Ruiz', 'maria.ruiz1@isil.edu.pe', 'Ingeniería de Sistemas', 'Primero', '2025-03-15'),
(2, 'Juan Carlos Pérez', 'juan.perez2@isil.edu.pe', 'Marketing Digital', 'Segundo', '2025-03-16'),
(3, 'Ana Lucía Torres', 'ana.torres3@isil.edu.pe', 'Diseño Gráfico', 'Tercero', '2025-03-17'),
(4, 'Carlos Alberto Gómez', 'carlos.gomez4@isil.edu.pe', 'Administración de Empresas', 'Cuarto', '2025-03-18'),
(5, 'Valeria Martínez', 'valeria.martinez5@isil.edu.pe', 'Negocios Internacionales', 'Quinto', '2025-03-19'),
(6, 'Luis Miguel Ramírez', 'luis.ramirez6@isil.edu.pe', 'Contabilidad', 'Sexto', '2025-03-20'),
(7, 'Sandra Milagros León', 'sandra.leon7@isil.edu.pe', 'Publicidad y Medios Digitales', 'Egresado', '2025-03-21'),
(8, 'Diego Armando Salas', 'diego.salas8@isil.edu.pe', 'Ingeniería Industrial', 'Primero', '2025-03-22'),
(9, 'Isabella Castro', 'isabella.castro9@isil.edu.pe', 'Psicología Organizacional', 'Segundo', '2025-03-23'),
(10, 'Matías Herrera', 'matias.herrera10@isil.edu.pe', 'Marketing Digital', 'Tercero', '2025-03-24'),
(11, 'Renata López', 'renata.lopez11@isil.edu.pe', 'Diseño Gráfico', 'Cuarto', '2025-03-25'),
(12, 'Santiago Ríos', 'santiago.rios12@isil.edu.pe', 'Ingeniería de Software', 'Quinto', '2025-03-26'),
(13, 'Camila Mendoza', 'camila.mendoza13@isil.edu.pe', 'Contabilidad', 'Sexto', '2025-03-27'),
(14, 'Sebastián Núñez', 'sebastian.nunez14@isil.edu.pe', 'Administración de Empresas', 'Egresado', '2025-03-28'),
(15, 'Luciana Vega', 'luciana.vega15@isil.edu.pe', 'Negocios Internacionales', 'Primero', '2025-03-29'),
(16, 'Gabriel Paredes', 'gabriel.paredes16@isil.edu.pe', 'Psicología Organizacional', 'Segundo', '2025-03-30'),
(17, 'Mía Aguilar', 'mia.aguilar17@isil.edu.pe', 'Publicidad y Medios Digitales', 'Tercero', '2025-03-31'),
(18, 'Daniel Bravo', 'daniel.bravo18@isil.edu.pe', 'Ingeniería de Software', 'Cuarto', '2025-04-01'),
(19, 'Sofía Villanueva', 'sofia.villanueva19@isil.edu.pe', 'Marketing Digital', 'Quinto', '2025-04-02'),
(20, 'Emilio Chávez', 'emilio.chavez20@isil.edu.pe', 'Diseño Gráfico', 'Sexto', '2025-04-03'),
(21, 'Antonia Salazar', 'antonia.salazar21@isil.edu.pe', 'Contabilidad', 'Egresado', '2025-04-04'),
(22, 'Tomás Ibarra', 'tomas.ibarra22@isil.edu.pe', 'Negocios Internacionales', 'Primero', '2025-04-05'),
(23, 'Emma Reyes', 'emma.reyes23@isil.edu.pe', 'Ingeniería Industrial', 'Segundo', '2025-04-06'),
(24, 'Martín Arce', 'martin.arce24@isil.edu.pe', 'Publicidad y Medios Digitales', 'Tercero', '2025-04-07'),
(25, 'Florencia Zúñiga', 'florencia.zuniga25@isil.edu.pe', 'Ingeniería de Sistemas', 'Cuarto', '2025-04-08'),
(26, 'Joaquín Castañeda', 'joaquin.castaneda26@isil.edu.pe', 'Administración de Empresas', 'Quinto', '2025-04-09'),
(27, 'Valentina Navarro', 'valentina.navarro27@isil.edu.pe', 'Psicología Organizacional', 'Sexto', '2025-04-10'),
(28, 'Franco Silva', 'franco.silva28@isil.edu.pe', 'Marketing Digital', 'Egresado', '2025-04-11'),
(29, 'Paula Rivas', 'paula.rivas29@isil.edu.pe', 'Contabilidad', 'Primero', '2025-04-12'),
(30, 'Marco Gutiérrez', 'marco.gutierrez30@isil.edu.pe', 'Ingeniería Industrial', 'Segundo', '2025-04-13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `Compras`
--
ALTER TABLE `Compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `Compras`
--
ALTER TABLE `Compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Compras`
--
ALTER TABLE `Compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `Productos` (`id_producto`);

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
