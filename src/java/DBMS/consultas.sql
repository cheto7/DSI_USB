--SELECT * FROM "PREPAS".solicitud;
--SELECT * FROM "PREPAS".equipo;
--SELECT * FROM "PREPAS".proveedor;
--SELECT * FROM "PREPAS".contiene;
--SELECT * FROM "PREPAS".periodo;
--SELECT * FROM "PREPAS".noticia;
SELECT * FROM "PREPAS".usuario;
--SELECT * FROM "PREPAS".unidadAdscripcion;

--SELECT E.serial as serial,E.imagen as imagen,E.nombre_vista as nombre_vista,P.puntuacion as puntuacion,E.tipo_talla as tipo_talla 
--FROM "PREPAS".tiene T, "PREPAS".usuario U, ("PREPAS".equipo E left join "PREPAS".puntuacion P on E.serial = P.serial) 
--WHERE E.serial = T.serial AND U.usuario = T.usuario AND (U.usuario = P.usuario OR P.usuario = null) AND U.usuario = 'cheto@usb.ve'

/*SELECT E.serial as serial,E.imagen as imagen,E.nombre_vista as nombre_vista,AUX.puntuacion + 1 as puntuacion,E.tipo_talla as tipo_talla
FROM "PREPAS".equipo E left join (SELECT P.serial as serial, U.usuario as usuario, P.puntuacion as puntuacion 
FROM "PREPAS".tiene T, ("PREPAS".usuario U left join "PREPAS".puntuacion P on U.usuario = P.usuario)
WHERE T.usuario = U.usuario AND U.usuario = '') AS AUX on E.serial = AUX.serial*/

--DELETE FROM "PREPAS".usuario;



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


 --SELECT * FROM "PREPAS".equipoTalla;
--SELECT * FROM "PREPAS".factura;
--SELECT * FROM "PREPAS".facturado;
/*SELECT E.nombre_vista, C.talla, SUM(C.cantidad) as cantidad
FROM "PREPAS".periodo P, "PREPAS".solicitud S, "PREPAS".contiene C, "PREPAS".equipo E
WHERE P.fecha_inicio='31-07-2013' AND P.fecha_fin = '31-11-2018' AND P.id = S.id_periodo AND C.id = S.id AND C.serial = E.serial
GROUP BY E.nombre_vista, C.talla
ORDER BY E.nombre_vista;*/

/*SELECT U.area_laboral, E.nombre_vista, C.talla, SUM(C.cantidad) AS cantidad, E.funcionalidad, E.norma, Q.cantidad AS existencia
FROM "PREPAS".periodo P, "PREPAS".solicitud S, "PREPAS".contiene C, "PREPAS".equipo E, "PREPAS".equipoTalla Q, "PREPAS".usuario U
WHERE P.fecha_inicio='07-10-2013' AND P.fecha_fin = '31-10-2013' AND P.id = S.id_periodo AND S.modificada = 'true' AND C.id = S.id AND C.serial = E.serial AND
      U.usuario = S.usuario AND E.serial = Q.serial AND C.talla = Q.talla
GROUP BY U.area_laboral, E.nombre_vista, C.talla,E.funcionalidad,E.norma, Q.cantidad
ORDER BY U.area_laboral, E.nombre_vista*/


/*SELECT U.area_laboral, E.nombre_vista, C.talla, SUM(C.cantidad) AS cantidad
FROM "PREPAS".periodo P, "PREPAS".solicitud S, "PREPAS".contiene C, "PREPAS".equipo E, "PREPAS".usuario U
WHERE P.fecha_inicio='07-10-2013' AND P.fecha_fin = '31-10-2013' AND P.id = S.id_periodo AND S.modificada = 'true' AND C.id = S.id AND C.serial = E.serial AND
      U.usuario = S.usuario
GROUP BY U.area_laboral, E.nombre_vista, C.talla
ORDER BY U.area_laboral, E.nombre_vista*/
-- CP 54 - 121
-- GN 105 - 110