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

CREATE TABLE "PREPAS".director (
    usuario VARCHAR NOT NULL,
    
    CONSTRAINT PK_director PRIMARY KEY (usuario),
  CONSTRAINT FK_director_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".inspector (
    usuario VARCHAR NOT NULL,
    
    CONSTRAINT PK_inspector PRIMARY KEY (usuario),
  CONSTRAINT FK_inspector_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".supervisor (
    usuario VARCHAR NOT NULL,
    
    CONSTRAINT PK_supervisor PRIMARY KEY (usuario),
  CONSTRAINT FK_supervisor_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".individuo (
    usuario VARCHAR NOT NULL,
    
    CONSTRAINT PK_individuo PRIMARY KEY (usuario),
  CONSTRAINT FK_individuo_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".equipo (
  serial SERIAL,
  imagen VARCHAR NOT NULL,
  tipo VARCHAR,
  nombre_vista VARCHAR,
  cantidad NUMERIC,
  evaluacion NUMERIC,
  funcionalidad VARCHAR,

  CONSTRAINT PK_equipo PRIMARY KEY (serial)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".proveedor (
    RIF VARCHAR NOT NULL,
    nombre VARCHAR,
    telefono VARCHAR,
    email VARCHAR,
    contacto VARCHAR,
    direccion VARCHAR,

    CONSTRAINT PK_proveedor PRIMARY KEY (RIF)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".factura (
    numero_factura SERIAL,
    RIF VARCHAR,
    fecha DATE NOT NULL,

    CONSTRAINT PK_factura PRIMARY KEY (numero_factura),
    CONSTRAINT FK_factura_proveedor FOREIGN KEY (RIF) REFERENCES "PREPAS".proveedor (RIF)

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

CREATE TABLE "PREPAS".solicitud (
    id SERIAL,
  usuario VARCHAR NOT NULL,
  fecha_solicitud DATE NOT NULL,

  CONSTRAINT PK_solicitud PRIMARY KEY (id),
  CONSTRAINT FK_solicitud_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".contiene (
    id INT NOT NULL,
    serial INT NOT NULL,
    cantidad INT,
    talla VARCHAR, 
    frecuencia INT,

    CONSTRAINT PK_contiene PRIMARY KEY (id,serial),
    CONSTRAINT FK_contiene_solicitud FOREIGN KEY (id) REFERENCES "PREPAS".solicitud (id),
    CONSTRAINT FK_contiene_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial)

) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".vende (
    RIF VARCHAR NOT NULL,
    serial INT NOT NULL,
    costo NUMERIC,

    CONSTRAINT PK_vende PRIMARY KEY (RIF,serial),
    CONSTRAINT FK_vende_proveedor FOREIGN KEY (RIF) REFERENCES "PREPAS".proveedor (RIF),
    CONSTRAINT FK_vende_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".facturado (
    numero_factura INT NOT NULL,
    serial INT NOT NULL,
    cantidad INT NOT NULL,
    costo_unidad NUMERIC NOT NULL,

    CONSTRAINT PK_facturado PRIMARY KEY (numero_factura,serial),
    CONSTRAINT FK_facturado_factura FOREIGN KEY (numero_factura) REFERENCES "PREPAS".factura (numero_factura),
    CONSTRAINT FK_facturado_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial)
) WITH (
OIDS = FALSE
);