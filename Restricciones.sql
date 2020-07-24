--  Restricciones : Constraint
CREATE TABLE IF NOT EXISTS autor(
  autor_id INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  apellido VARCHAR(25) NOT NULL,
  seudonimo VARCHAR(50) UNIQUE,
  genero CHAR(1) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  pais_origen VARCHAR(15) NOT NULL
);

-- Valores unicos y nulos
--  NOT NULL  campo obligatorio, no puede ser nulo
--  UNIQUE   valor unico
