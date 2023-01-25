-- LDTS Academy. https://academy.ldts.us
-- All Rights Reserved

-- Curso DB123
-- Ejercicio Biblioteca

-- Dada esta tabla, haz 2 ejercicios:
--- 1/Dibuja un diagrama -como los que hay en https://sql.ldts.es- en un papel.

https://imgur.com/HBcSTKO

--- 2/En una query, ¿cómo sería un FROM que uniera las 3 tablas?

SELECT autor, apellidos, fecha FROM libros JOIN prestamos ON (id_libro = libro_id) JOIN usuarios ON (id_usuario = usuario_id)


----- Crea la base de datos en tu servidor y ejecuta la query para comprobar que no falla.



CREATE SCHEMA IF NOT EXISTS biblioteca;
USE biblioteca;
 
DROP TABLE IF EXISTS libros;
CREATE TABLE `libros` (
`id_libro` INT(11) NOT NULL,
`titulo` VARCHAR(100) NOT NULL,
`autor` VARCHAR(100) NOT NULL,
`ISBN` INT(11) DEFAULT NULL,
PRIMARY KEY (`id_libro`)
) ENGINE=InnoDB;
 
DROP TABLE IF EXISTS usuarios;
CREATE TABLE `usuarios` (
`id_usuario` INT(11) NOT NULL,
`nombre` VARCHAR(100) NOT NULL,
`apellidos` VARCHAR(100) NOT NULL,
`dni` VARCHAR(100) DEFAULT NULL,
`telefono` INT(11) DEFAULT NULL,
PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB;
 
DROP TABLE IF EXISTS prestamos;
CREATE TABLE prestamos (
id_prestamo INT(11),
fecha DATE NOT NULL,
libro_id INT(11),
usuario_id INT(11),
PRIMARY KEY (id_prestamo),
UNIQUE KEY `fecha` (`fecha`),
CONSTRAINT FOREIGN KEY (libro_id) REFERENCES libros (id_libro),
CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario)
ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;