 --SELECT * FROM "PREPAS".solicitud;
-- SELECT * FROM "PREPAS".equipo;
-- SELECT * FROM "PREPAS".proveedor;
 --SELECT * FROM "PREPAS".contiene;
--
SELECT * FROM "PREPAS".usuario;
--INSERT INTO "PREPAS".unidadAdscripcion (nombre) VALUES ('prueba');
--DELETE FROM "PREPAS".unidadAdscripcion WHERE id = 4 ;             
--SELECT * FROM "PREPAS".unidadadscripcion;


/*SELECT serial,imagen,nombre_vista,funcionalidad FROM "PREPAS".equipo
EXCEPT
SELECT E.serial,E.imagen,E.nombre_vista,E.funcionalidad
FROM "PREPAS".solicitud S,"PREPAS".contiene C,"PREPAS".equipo E
WHERE S.usuario = 'mgomez@usb.ve' AND C.id=S.id AND E.serial=C.serial*/

/*SELECT * 
FROM "PREPAS".solicitud NATURAL JOIN "PREPAS".contiene
WHERE usuario = 'mgomez@usb.ve'*/

/*SELECT * 
FROM "PREPAS".contiene C, "PREPAS".equipo E
WHERE E.serial=C.serial*/

--DROP SCHEMA "PREPAS".contiene;

--SELECT C.id, C.cantidad,C.frecuencia, E.nombre_vista, E.imagen 
--FROM "PREPAS".solicitud S,"PREPAS".contiene C,"PREPAS".equipo E
--WHERE S.usuario = 'mgomez@usb.ve' AND C.id = S.id AND E.serial = C.serial

/*
SELECT *
FROM "PREPAS".solicitud
WHERE usuario='mgomez@usb.ve' and fecha_solicitud= CURRENT_DATE and id IN
(SELECT MAX(id)
FROM "PREPAS".solicitud 
WHERE usuario='mgomez@usb' and fecha_solicitud= CURRENT_DATE)
*/
-- SELECT U.usuario, U.nombre, U.apellido, U.sexo, U.area_laboral, U.email,
--         S.id,S.fecha_solicitud,S.modificada,C.serial,C.cantidad,C.talla,C.frecuencia,
--         E.nombre_vista,E.sector
-- FROM "PREPAS".usuario U,"PREPAS".solicitud S,"PREPAS".contiene C, "PREPAS".equipo E
-- WHERE U.usuario = S.usuario AND S.id = '1'AND S.id = C.id AND C.serial = E.serial
