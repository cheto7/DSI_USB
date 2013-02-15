--SELECT * FROM "PREPAS".solicitud;
--SELECT * FROM "PREPAS".equipo;
--SELECT * FROM "PREPAS".contiene;
--SELECT * FROM "PREPAS".usuario;

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