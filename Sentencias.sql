DROP DATABASE IF EXISTS libreria; --Condicionar sentencias
CREATE TABLE IF NOT EXISTS libreria;
USE libreria;
CREATE TABLE IF NOT EXISTS autor(
  autor_id INT,
  nombre VARCHAR(25),
  apellido VARCHAR(25),
  genero CHAR(1),
  fecha_nacimiento DATE,
  pais_origen VARCHAR(15)
);
-- SHOW TABLES;
-- SELECT DATABSE();
-- DROP TABLE autor;
-- SHOW COLUMNS FROM autor;
-- DESC autor; abrebiatura de show columns FROM
-- CREATE TABLE usuario LIKE autor; crear tablas apartir de otras
-- INSERTAR REGISTROS
 INSERT INTO autor(autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen)
 VALUES(1, 'Test autor', 'Test autor','M', '2020-07-23', 'México');

 /*
 Para ejecurar archivos .SQL
1° Forma
 mysql -u root -p < CursoDB/sentencias.sql
2° Forma
 SOURCE CursoDB/sentencias.sql;
 */

-- CONSULTAS RAPIDAS
-- mysql -u root -p libreria -e 'SELECT * FROM autor;'



/*
  Funciones sobre strings
*/
SELECT CONCATC(nombre,' ',apellido) AS nombre_completo FROM autor; -- Concatenar
SELECT LENGTH("Hola mundo"); -- muestra la cantidad de caracteres
SELECT UPER(nombre), LOWER(nombre) FROM autor; -- UPER mayusculas  LOWER minusculas
SELECT TRIM("  con espacios al inicio y al final  "); -- Los espacios son removidos
SELECT LEFT("Esta es una cadena de caracteres", 5) AS subsstring_izquierdo, RIGHT("Esta es una cadena", 10) AS subsytring_derecho; -- Retorna los primeros 5 caracteres
SELECT * FROM libro WHERE LEFT(titulo, 12) = "Harry Poter";
/*
  Funciones sobre numeros
*/
SELECT RAND(); -- Numero randon
SELECT RAND(RAND() * 100); --
SELECT TRUNCATE(1.12133455, 3); -- Me permite dejar solo 3 decimales o segun lo desee
SELECT POWER(2, 16); -- ELEva un numero a una potencia
/*
  FUNCIONES SoBRE FECHAS
*/
SELECT NOW();
SELECT @now = NOW();
SELECT SECOND(@now), MINUTE(@now), HOUR(@now), MONTH(@now), YEAR(@now);
SELECT DATEOFWEEK(@now), DAYOFMONTH(@now), DATEOFYEAR(@@now);
SELECT DATE(@now);
SELECT CURDATE();
SELECT @now + INTERVAL 30 DAY;

/*
Funciones sobre condiciones
*/
SELECT IF(10>9, "El numero si es mayor", "El numero no es mayor");
SELECT IF(paginas = 0, "El libro no posee paginas", paginas) FROM libro;
SELECT IFNULL(seudonimo, "El autor no cuenta con seudonimo") FROM autor;
/*
  CREAR FUNCIONES
  */
  DELIMITER //   -- para terminar la sentencia se usara doble slash
  CREATE FUNCTION agregar_dias(fecha DATE, dias INT)
  RETURNS DATE
  BEGIN
  RETURN fecha + INTERVAL dias DAY;
  END//
  DELIMITER ;
/*
Listar Funciones
*/
SELECT name FROM mysql.proc WHERE db = database() AND type = 'FUNCTION';
DROP FUNCTION agregar_dias;
/*
Ejecutar sentencias dentro de FUNCIONES
*/
DELIMITER //
CREATE FUNCTION obtener_paginas()
RETURNS INT
BEGIN
  SET @paginas = (SELECT (ROUND(RAND() * 100) * 4));
  RETURN @paginas;
END //

DELIMITER ;
UPDATE libro SET  paginas = obtener_paginas();
/*
Mostar contenido de tabla en forma de cartas
*/
SELECT * FROM libro\G;
/*
Sentencias avanzadas
*/
--  busqueda mediante strings
SELECT * FROM libro WHERE titulo LIKE 'Harry Potter%'\G;
SELECT * FROM libro WHERE titulo LIKE '%anillo';
SELECT * FROM libro WHERE titulo LIKE '%la%';
SELECT * FROM libro WHERE titulo LIKE '_a%';
SELECT * FROM libro WHERE titulo LIKE '__b__';
SELECT * FROM libro WHERE titulo LIKE '_a__o%';

-- Expresiones regulares
SELECT titulo FROM libro WHERE titulo REGEXP '^[HL]' -- titulos que comiencen con  H o L

-- ORdenar REGISTROS
SELECT * FROM libro ORDER BY titulo AND id_libro ASC; -- ascendente
SELECT * FROM libro ORDER BY titulo DESC; -- Desendente

-- Limitar REGISTROS
SELECT titulo FROM libro LIMIT 10;
SELECT titulo FROM libro WHERE autor_id = 2 LIMIT 50;
SELECT libro_id, titulo FROM libro LIMIT 0, 5; -- limitar por partes comienza en la posicion 0 y me muestra 5
