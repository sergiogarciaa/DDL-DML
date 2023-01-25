-- LDTS Academy. https://academy.ldts.us
-- All Rights Reserved

-- Curso DB123
-- Ejercicio Laboratorio Comentado

-- Vamos a crear una base de datos llamada "laboratorio". Esta base de datos estará compuesta de 2 tablas.

-- Lo primero es crear la base de datos -SCHEMA es sinónimo de DATABASE
CREATE SCHEMA IF NOT EXISTS laboratorio;
-- Si la base de datos ya existiera, CREATE daría error. Por eso se intercala "IF NOT EXITS"
 
-- Una vez creada, la abrimos:
USE laboratorio;
-- A partir de esta línea todas las operaciones tendrán lugar por defecto en la base de datos abierta: "laboratorio".


-- Vamos a crear la tabla "pruebas". Si existiera, CREATE daría error. Por este motivo ejecutamos antes un DROP.
-- A su vez, DROP daría error si intentamos borrar algo no creado... por eso intercalamos "IF EXISTS"
DROP TABLE IF EXISTS pruebas;
-- Ahora estamos 100% seguros de que "pruebas" no existe, y lo podemos crear.
CREATE TABLE `pruebas` (
`idprueba` INT(11) NOT NULL,
`descripcion` VARCHAR(100) DEFAULT NULL,
PRIMARY KEY (`idprueba`)
) ENGINE=InnoDB;

-- Si te fijas, hacemos lo mismo que con la tabla anterior: DROP_IF_EXISTS + CREATE
DROP TABLE IF EXISTS ensayosprueba;
-- Ahora vamos a detenernos en el interior de la tabla:
-- Tiene 3 Campos: dos numéricos enteros y otro tipo fecha -que no puede ser nulo.
CREATE TABLE ensayosprueba (
idensayo INT,
fecha DATE NOT NULL,
pru_idprueba INT,
PRIMARY KEY (idensayo),
CONSTRAINT UNIQUE KEY `fecha_idx` (`fecha`),
CONSTRAINT ens_pru_fk FOREIGN KEY (pru_idprueba)
  REFERENCES pruebas (idprueba)
) ENGINE=InnoDB;
-- A parte de los 3 campos se definen 3 detalles más:
---- El campo idensayo será el ID principal -PRIMARY KEY
---- La fecha no se puede repetir; los valores son únicos (como si fuera el DNI en la tabla clientes: no puede haber 2 iguales).
---- Y lo más interesante: el último campo (pru_idprueba) hace referencia al campo id de la otra tabla -pruebas.
------ Esto último implica que pru_idprueba SÓLO PUEDE ALMACENAR VALORES QUE YÁ EXISTAN EN LA TABLA PRUEBA-CAMPO IDPRUEBA.
------ Dicho de otro modo: ensayosprueba.pru_idprueba ES UN FOREING KEY de la pruebas.idprueba


-- Un último apunte.
-- Quizá te hayas fijado: todos los CREATE TABLE acaban diciendo ENGINE=InnoDB
---- MySQL no sólo tiene un motor -engine- de base de datos. Se pueden elegir entre varios. 
---- Los más habituales son MyISAM e InnoDB. La diferencia fundamental es que MyISAM no permite restricciones tipo Foreign Key.