DELETE FROM "PREPAS".usuario;
DELETE FROM "PREPAS".noticia;
DELETE FROM "PREPAS".proveedor;

INSERT INTO "PREPAS".usuario VALUES ('cheto@usb.ve','$2a$06$VPlSQ3I4V1qA9IqzY900Quq4s85qRvdg5MS70vZh8gdzYW90XAYXi','cheto1@usb.ve','cheto','rodriguez','19227483','','04262047676','DSI','masculino','S','S','28','S','36','true','administrador');
INSERT INTO "PREPAS".usuario VALUES ('azocar@usb.ve','$2a$06$VPlSQ3I4V1qA9IqzY900Quq4s85qRvdg5MS70vZh8gdzYW90XAYXi','azocar@usb.ve','Daniel','Azocar','19227484','','04262047676','DSI','masculino','S','S','28','S','36','true','inspector');
INSERT INTO "PREPAS".usuario VALUES ('karen@usb.ve','$2a$06$VPlSQ3I4V1qA9IqzY900Quq4s85qRvdg5MS70vZh8gdzYW90XAYXi','karen@usb.ve','Karen','Da Silva','19227485','','04262047676','DSI','femenino','S','S','28','S','36','true','inspector');
INSERT INTO "PREPAS".usuario VALUES ('ivan@usb.ve','$2a$06$VPlSQ3I4V1qA9IqzY900Quq4s85qRvdg5MS70vZh8gdzYW90XAYXi','ivan@usb.ve','Ivan','Travecedo','19227486','','04262047676','DSI','masculino','S','S','28','S','36','true','supervisor');
INSERT INTO "PREPAS".usuario VALUES ('octavio@usb.ve','$2a$06$VPlSQ3I4V1qA9IqzY900Quq4s85qRvdg5MS70vZh8gdzYW90XAYXi','octavio@usb.ve','Octavio','Manzano','19227487','','04262047676','DSI','masculino','S','S','28','S','36','false','usuario');

INSERT INTO "PREPAS".noticia VALUES ('cheto@usb.ve','Inician trabajos','Inician actividades de implementacion del 60% del sistema de la DSI ','2012-11-29');
INSERT INTO "PREPAS".noticia VALUES ('mgomez@usb.ve','Entrega 30%','Ya se encuentra habilitado el sistema para la DSI con el 30% de los casos de uso implementados. ','2012-11-29');

INSERT INTO "PREPAS".proveedor VALUES ('J-001','Proveedor1','0212-3624566','correo@correo.com','yo','caracas','true');
INSERT INTO "PREPAS".proveedor VALUES ('J-002','Proveedor2','0212-3624566','correo@correo.com','yo','caracas','true');
INSERT INTO "PREPAS".proveedor VALUES ('J-003','Proveedor3','0212-3624566','correo@correo.com','yo','caracas','true');
