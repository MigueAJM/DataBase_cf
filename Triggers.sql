ALTER TABLE autor ADD COLUMN cantidad_libros INT DEFAULT 0;
DELIMITER //
--
CREATE TRIGGER after_insert_actualizacion_libro -- estructura para dar nombre a un trigger
AFTER INSERT ON libro -- o BEFORE
FOR EACH ROW  -- DEfinimos que hcaer en cda registro afectado
BEGIN
  UPDATE actores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id -- NEW hace referencia al registro actual
END;
//
DELIMITER;

-- Evento delete
CREATE TRIGGER after_delete_actualizacion_libro
AFTER DELETE ON libro
FOR EACH ROW
BEGIN
  UPDATE autor SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
END;

-- EVento UPDATE
CREATE TRIGGER after_update_actualizacion_libro
AFTER UPDATE ON libro
FOR EACH ROW
BEGIN
  IF(NEW.autor_id != OLD.autor_id) THEN
    UPDATE autor SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
    UPDATE autor SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
END;

-- Listado y Eliminacion de triggers
SHOW TRIGGERS\G; -- Listar triggers
DROP TIGGERS IF EXISTS libreria.after_delete_actualizacion_libro; -- DROP TRIGGERS DAtabase.triggers
