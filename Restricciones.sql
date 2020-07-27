--  Restricciones : Constraint --
CREATE TABLE IF NOT EXISTS autor(
  autor_id INT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(25) NOT NULL,
  apellido VARCHAR(25) NOT NULL,
  seudonimo VARCHAR(50) UNIQUE,
  genero ENUM('M', 'F'), -- Unicos valores que se pueden almacenar
  fecha_nacimiento DATE NOT NULL,
  pais_origen VARCHAR(15) NOT NULL,
  fecha:cración DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE libro(
  libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(30) NOT NULL,
  autor_id INT UNSIGNED NOT NULL,
  descripcion VARCHAR(250)
  FOREIGN KEY(autor_id) REFERENCES autor(autor_id)
);
-- Valores unicos y nulos
--  NOT NULL  campo obligatorio, no puede ser nulo
--  UNIQUE   valor unico
--  Valores por default -- 10
--  Numeros positivos -- UNSIGNED
--  Tipo EMUN  Lista de la cual una columna puede tomar el valor
--  Llaves primarias --
--  Llaves Foraneas -- Referencias entre tablas
--  Modificar tablas --
ALTER TABLE libro ADD venta INT UNSIGNED NOT NULL;
ALTER TABLE libro ADD stock INT UNSIGNED NOT NULL DEFAULT 10;
--  Eliminar columna
ALTER TABLE libro DROP COLUNM stock;
--  Registros mediante condiciones --
SELECT * FROM libro\G; -- Despliega los registros en forma de cartas.
SELECT * FROM libro WHERE titulo = "";
--  OPERADORES LOGICOS --
AND
OR
NOT
SELECT * FROM libro WHERE titulo = "Carl" AND autor_id = 1;
--  Registros Nulos --
SELECT * FROM libro WHERE titulo IS NULL;
SELECT * FROM libro WHERE titulo IS NOT NULL;
SELECT * FROM libro WHERE titulo <=> NULL; -- Operador de seguridad <=>
--  Regustros mediante Rangos --
SELECT titulo FROM libro WHERE fecha_nacimiento BETWEEN '1997-09-12' AND '1090-09-12';
--  Busquedas por listas --
SELECT * FROM libro WHERE titulo = "" OR titulo = "" OR titulo = "";
SELECT * FROM libro WHERE titulo IN ("", "", "", "","");
-- Registros unicos --
SELECT DISTINCT titulo FROM libro;
-- Alias --
SELECT autor_id AS autor, titulo AS nombre FROM libro
-- ACTUALIZAR Registros --
UPDATE libro SET descripcion = "Nuevo descripcion", ventas = 100 WHERE titulo = "El Hobbit";
--  Borrar registros --
DELETE FROM libro WHERE autor_id = 1;
