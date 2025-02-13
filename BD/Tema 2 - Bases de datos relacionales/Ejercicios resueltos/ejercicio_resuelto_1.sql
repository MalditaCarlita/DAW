/* Sentencias SQL para la creación de las tablas pub, titular, empleado, existencias, localidad y pub_empleado.
    Todos los valores son de tipo carácter excepto fecha_apertura, cantidad, precio y cod_localidad (numéricos)
    El único campo que no es obligatorio es domicilio*/ 
    
CREATE TABLE pub (
    cod_pub VARCHAR2(5) NOT NULL,
    nombre VARCHAR2(60) NOT NULL,
    licencia_fiscal VARCHAR2(60) NOT NULL,
    domicilio VARCHAR2(60),
    fecha_apertura DATE NOT NULL,
    horario VARCHAR2(60) NOT NULL,
    cod_localidad INTEGER NOT NULL); /*INTEGER es sinónimo de NUMBER(38), SMALLINT e INT*/

CREATE TABLE titular (
    dni_titular VARCHAR2(9) NOT NULL,
    nombre VARCHAR2(60) NOT NULL,
    domicilio VARCHAR2(60),
    cod_pub VARCHAR2(5) NOT NULL);

CREATE TABLE empleado (
    dni_empleado VARCHAR2(9) NOT NULL,
    nombre VARCHAR2(60) NOT NULL,
    domicilio VARCHAR2(60));

CREATE TABLE existencias (
    cod_articulo VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(60) NOT NULL,
    cantidad INTEGER NOT NULL,
    precio DECIMAL NOT NULL, /*Son sinónimos DEC y NUMERIC, para números de coma fija. También NUMBER(nº dígitos, de los cuales nº decimales)*/
    cod_pub VARCHAR2(5) NOT NULL);

CREATE TABLE localidad (
    cod_localidad INTEGER NOT NULL,
    nombre VARCHAR2(60) NOT NULL);

CREATE TABLE pub_empleado (
    cod_pub VARCHAR2(5) NOT NULL,
    dni_empleado VARCHAR2(9) NOT NULL,
    funcion VARCHAR2(9) NOT NULL);

/*Sentencias SQL de creación de restricciones*/
/*Establecemos las claves primarias de cada tabla*/

ALTER TABLE pub ADD CONSTRAINT pk_pub 
    PRIMARY KEY (cod_pub);
    
ALTER TABLE titular ADD CONSTRAINT pk_titular 
    PRIMARY KEY (dni_titular);
    
ALTER TABLE empleado ADD CONSTRAINT pk_empleado 
    PRIMARY KEY (dni_empleado);
    
ALTER TABLE existencias ADD CONSTRAINT pk_existencias 
    PRIMARY KEY (cod_articulo);
    
ALTER TABLE localidad ADD CONSTRAINT pk_localidad 
    PRIMARY KEY (cod_localidad);
    
ALTER TABLE pub_empleado ADD CONSTRAINT pk_pub_empleado 
    PRIMARY KEY (cod_pub, dni_empleado, funcion);

/*Establecemos las claves foráneas de cada tabla*/

ALTER TABLE pub ADD CONSTRAINT fk_pub_localidad 
    FOREIGN KEY (cod_localidad)
    REFERENCES localidad (cod_localidad); /*Hace referencia a la tabla localidad y al campo cod_localidad*/

ALTER TABLE titular ADD CONSTRAINT fk_titular_pub
    FOREIGN KEY (cod_pub)
    REFERENCES pub (cod_pub);

ALTER TABLE existencias ADD CONSTRAINT fk_existencias_pub
    FOREIGN KEY (cod_pub)
    REFERENCES pub (cod_pub);

ALTER TABLE pub_empleado ADD CONSTRAINT fk_pub_empleado_pub
    FOREIGN KEY (cod_pub)
    REFERENCES pub (cod_pub);

ALTER TABLE empleado ADD CONSTRAINT fk_pub_empleado_empleado
    FOREIGN KEY (dni_empleado)
    REFERENCES empleado (dni_empleado);
    
/*Establecemos mediante CHECK que los valores del campo horario sólo pueden ser HOR1, HOR2, HOR3*/    

ALTER TABLE pub ADD CONSTRAINT ck_horario
    CHECK (horario IN ('HOR1', 'HOR2', 'HOR3'));
    
/*Establecemos mediante CHECK que no es posible dar de alta existencias a precio 0*/  

ALTER TABLE existencias ADD CONSTRAINT ck_precio
    CHECK (precio > 0);
    
/*Establecemos mediante CHECK que el campo función en la tabla pub_empleado sólo puede tener los valores CAMARERO, SEGURIDAD, LIMPIEZA*/ 

ALTER TABLE pub_empleado ADD CONSTRAINT ck_funcion
    CHECK (funcion IN ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA'));