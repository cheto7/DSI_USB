DROP SCHEMA "PREPAS" CASCADE;

 CREATE SCHEMA "PREPAS" AUTHORIZATION dsisistema;
 CREATE EXTENSION PGCRYPTO;

 GRANT ALL ON SCHEMA "PREPAS" TO dsisistema;

CREATE TABLE "PREPAS".usuario (
  usuario VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR NOT NULL UNIQUE,
  nombre VARCHAR NOT NULL,
  apellido VARCHAR NOT NULL,
  ci VARCHAR NOT NULL UNIQUE,
  fecha VARCHAR NOT NULL,
  telefono VARCHAR NOT NULL,
  unidad_adscripcion VARCHAR NOT NULL,
  sexo VARCHAR NOT NULL,
  talla_mascara VARCHAR NOT NULL,
  talla_camisa VARCHAR NOT NULL,
  talla_pantalon VARCHAR NOT NULL,
  talla_guantes VARCHAR NOT NULL,
  talla_zapato VARCHAR NOT NULL,
  habilitado VARCHAR NOT NULL,
  administrador VARCHAR DEFAULT 'usuario',
  area_laboral   VARCHAR,
  cargo VARCHAR,

  
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
  nombre_vista VARCHAR UNIQUE,
  cantidad INT default 0,
  evaluacion NUMERIC default 0,
  funcionalidad VARCHAR,
  habilitado VARCHAR DEFAULT 'true',
  tiempo_vida VARCHAR,
  sector    VARCHAR,
  norma     VARCHAR,
  tipo_talla VARCHAR,
  puntuacion FLOAT4 default 0.0,
  usuarios_puntuando INT default 0,
  CONSTRAINT PK_equipo PRIMARY KEY (serial)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".equipoTalla (
  serial SERIAL,
  talla VARCHAR,
  cantidad INT default 0,
  CONSTRAINT PK_equipoTalla PRIMARY KEY (serial,talla),
  CONSTRAINT FK_equipoTalla_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".puntuacion (
  serial SERIAL,
  usuario VARCHAR,
  puntuacion INT default 0,
  CONSTRAINT PK_puntuacion PRIMARY KEY (serial,usuario),
  CONSTRAINT FK_puntuacion_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial),
  CONSTRAINT FK_puntuacion_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".proveedor (
    RIF VARCHAR NOT NULL,
    nombre VARCHAR UNIQUE,
    telefono VARCHAR,
    email VARCHAR,
    contacto VARCHAR,
    direccion VARCHAR,
    habilitado VARCHAR,
    evaluacion VARCHAR,

    CONSTRAINT PK_proveedor PRIMARY KEY (RIF)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".factura (
    numero_factura SERIAL,
    nombre_proveedor VARCHAR,
    validado VARCHAR, -- FALSO si aun se esta modificando, VERDAD si ya esta comprometido.
    fecha DATE NOT NULL,

    CONSTRAINT PK_factura PRIMARY KEY (numero_factura),
    CONSTRAINT FK_factura_proveedor FOREIGN KEY (nombre_proveedor) REFERENCES "PREPAS".proveedor (nombre)

) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".noticia (
  id SERIAL NOT NULL,
  usuario VARCHAR NOT NULL,
  titulo VARCHAR NOT NULL,
  contenido VARCHAR NOT NULL,
  fechaNoticia VARCHAR NOT NULL
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".periodo (
  id                    SERIAL,
  fecha_inicio          VARCHAR NOT NULL,
  fecha_fin             VARCHAR,
  cantidad_recibida     INT DEFAULT '0',
  cantidad_procesada    INT DEFAULT '0',
  habilitado            VARCHAR DEFAULT 'true',
  ultimo                VARCHAR DEFAULT 'true',
  CONSTRAINT PK_periodo PRIMARY KEY (id)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".solicitud (
  id SERIAL,
  id_periodo SERIAL,
  usuario VARCHAR NOT NULL,
  fecha_solicitud DATE NOT NULL,
  modificada    VARCHAR DEFAULT 'false',
  CONSTRAINT PK_solicitud PRIMARY KEY (id),
  CONSTRAINT FK_solicitud_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario),
  CONSTRAINT FK_solicitud_periodo FOREIGN KEY (id_periodo) REFERENCES "PREPAS".periodo (id)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".contiene (
    id INT NOT NULL,
    serial INT NOT NULL,
    cantidad INT,
    talla VARCHAR, 
    frecuencia VARCHAR,

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
    costo_unidad NUMERIC DEFAULT 0,
    talla VARCHAR,
    validado VARCHAR, -- FALSO si aun se esta modificando, VERDAD si ya esta comprometido. 

    CONSTRAINT PK_facturado PRIMARY KEY (numero_factura,serial,talla),
    CONSTRAINT FK_facturado_factura FOREIGN KEY (numero_factura) REFERENCES "PREPAS".factura (numero_factura),
    CONSTRAINT FK_facturado_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial)
) WITH (
OIDS = FALSE
);


CREATE TABLE "PREPAS".supervisa (
    supervisor VARCHAR NOT NULL,
    individuo VARCHAR NOT NULL,

    CONSTRAINT PK_supervisa PRIMARY KEY (supervisor,individuo),
    CONSTRAINT FK_supervisa_supervisor FOREIGN KEY (supervisor) REFERENCES "PREPAS".supervisor (usuario),
    CONSTRAINT FK_supervisa_individuo FOREIGN KEY (individuo) REFERENCES "PREPAS".individuo (usuario)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".unidadAdscripcion (
    id SERIAL,
    nombre VARCHAR NOT NULL,
    CONSTRAINT PK_unidadAdscripcion PRIMARY KEY (id) 
)   WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".tiene (
    idTiene SERIAL NOT NULL,
    id INT NOT NULL,
    usuario VARCHAR NOT NULL, 
    serial  INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_entrega DATE NOT NULL,

    CONSTRAINT PK_tiene PRIMARY KEY (idTiene),
    CONSTRAINT FK_tiene_solicitud FOREIGN KEY (id) REFERENCES "PREPAS".solicitud (id),
    CONSTRAINT FK_tiene_equipo FOREIGN KEY (serial) REFERENCES "PREPAS".equipo (serial),
    CONSTRAINT FK_tiene_usuario FOREIGN KEY (usuario) REFERENCES "PREPAS".usuario (usuario)

) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".mensaje (
    id VARCHAR NOT NULL,
    mensaje VARCHAR NOT NULL, 

    CONSTRAINT PK_mensaje PRIMARY KEY (id)
) WITH (
OIDS = FALSE
);

CREATE TABLE "PREPAS".cargo (
    id SERIAL NOT NULL,
    cargo VARCHAR NOT NULL, 

    CONSTRAINT PK_cargo PRIMARY KEY (id)
) WITH (
OIDS = FALSE
);
