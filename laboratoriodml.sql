-- LDTS Academy. https://academy.ldts.us
-- All Rights Reserved

-- Curso DB123
-- Ejercicio Laboratorio DML

-- RESPONDE RAZONADAMENTE A ESTAS PREGUNTAS...
--- ¿Por qué razón fallará el último INSERT?
-- Porque solo hay definidos dos valores en Pruebas (1 y 2)
--- ¿y el penúltimo?
-- La fecha se repite y es un UNIQUE KEY, no se puede repetir

INSERT INTO `pruebas`
VALUES (1,'Medir Temperatura Radiador Andres'),
(2,'Medir Consumo Monitor TFT');
 
INSERT INTO `ensayosprueba`
VALUES (1,'2012-11-17',1),(2,'2012-11-18',1),
(3,'2012-11-20',2),(40,'2012-11-21',2);

INSERT INTO `ensayosprueba` 
  VALUES (87,'2012-11-17',2);
INSERT INTO `ensayosprueba` 
  VALUES (145,'2012-09-13',3);

