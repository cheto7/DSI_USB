 DROP SCHEMA "PREPAS" CASCADE;

 CREATE SCHEMA "PREPAS"
  AUTHORIZATION postgres;

 GRANT ALL ON SCHEMA "PREPAS" TO postgres;

CREATE TABLE "PREPAS".usuario (
  usuario VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  nombre VARCHAR NOT NULL,
  apellido VARCHAR NOT NULL,
  fecha VARCHAR NOT NULL,
  telefono VARCHAR NOT NULL,
  direccion VARCHAR NOT NULL,
  sexo VARCHAR NOT NULL,
  talla_mascara VARCHAR NOT NULL,
  talla_camisa VARCHAR NOT NULL,
  talla_pantalon VARCHAR NOT NULL,
  talla_guantes VARCHAR NOT NULL,
  talla_zapato VARCHAR NOT NULL,
  habilitado VARCHAR NOT NULL,
  administrador VARCHAR DEFAULT 'usuario',
  
  CONSTRAINT PK_usuario PRIMARY KEY (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".equipo (
  equipo VARCHAR NOT NULL,
  imagen VARCHAR NOT NULL,
  tipo VARCHAR,
  nombre_vista VARCHAR,

  CONSTRAINT PK_equipo PRIMARY KEY (equipo)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".noticia (
  usuario VARCHAR NOT NULL,
  titulo VARCHAR NOT NULL,
  contenido VARCHAR NOT NULL,
  fechaNoticia VARCHAR NOT NULL
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".proveedor (
  rif           VARCHAR NOT NULL,
  nombre        VARCHAR,
  telefono      VARCHAR,
  email         VARCHAR,
  contacto      VARCHAR,
  direccion     VARCHAR,
  habilitado    VARCHAR,
  CONSTRAINT PK_proveedor PRIMARY KEY (rif)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".solicitud (
  usuario VARCHAR NOT NULL,
  equipo VARCHAR NOT NULL,
  fecha_solicitud VARCHAR NOT NULL,
  nombre_vista VARCHAR NOT NULL,
  cantidad NUMERIC DEFAULT 1,
  frecuencia VARCHAR,

  CONSTRAINT PK_solicitud PRIMARY KEY (usuario,equipo),
  CONSTRAINT FK_solicitud_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario),
  CONSTRAINT FK_solicitud_equipo FOREIGN KEY (equipo) REFERENCES "PREPAS".equipo (equipo)
) WITH (
OIDS = FALSE
);