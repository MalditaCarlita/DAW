/*Base de datos para almacenar la información necesaria para gestionar la venta automática de entradas
para diferentes espectáculos*/

/*Creación de tablas con sus respectivos campos*/

CREATE TABLE espectaculos (
    cod_espectaculo VARCHAR2(8) NOT NULL,
    nombre VARCHAR2(80) NOT NULL,
    tipo VARCHAR2(80) NOT NULL,
    fecha_inicial DATE,
    fecha_final DATE,
    interprete VARCHAR2(60) NOT NULL,
    cod_recinto VARCHAR2(8)NOT NULL);
    
CREATE TABLE precios_espectaculos (
    cod_espectaculo VARCHAR2(8) NOT NULL,
    cod_recinto VARCHAR2(8) NOT NULL,
    zona VARCHAR2(80) NOT NULL,
    precio DECIMAL NOT NULL);  
    
CREATE TABLE recintos (
    cod_recinto VARCHAR2(8) NOT NULL,
    nombre VARCHAR2(80) NOT NULL,
    direccion VARCHAR2(80) NOT NULL,
    ciudad VARCHAR2(80) NOT NULL,
    telefono VARCHAR2(20),
    horario VARCHAR2(80) NOT NULL);    
    
CREATE TABLE zonas_recintos (
    cod_recinto VARCHAR2(8) NOT NULL,
    zona VARCHAR2(80) NOT NULL,
    capacidad INTEGER NOT NULL);  
    
CREATE TABLE asientos (
    cod_recinto VARCHAR2(8) NOT NULL,
    zona VARCHAR2(80) NOT NULL,
    fila INTEGER NOT NULL,
    numero INTEGER NOT NULL);    
    
CREATE TABLE representaciones (
    cod_espectaculo VARCHAR2(8) NOT NULL,
    fecha DATE NOT NULL,
    hora VARCHAR2(8) NOT NULL);    
    
CREATE TABLE entradas (
    cod_espectaculo VARCHAR2(8) NOT NULL,
    fecha DATE NOT NULL,
    hora VARCHAR2(8) NOT NULL,
    cod_recinto VARCHAR2(8) NOT NULL,
    fila INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    zona VARCHAR2(80) NOT NULL,
    dni_cliente VARCHAR2(9) NOT NULL);
    
CREATE TABLE espectadores (
    dni_cliente VARCHAR2(9) NOT NULL,
    nombre VARCHAR2(80),
    direccion VARCHAR2(80),
    telefono VARCHAR2(80),
    ciudad VARCHAR2(80),
    ntarjeta VARCHAR2(20) NOT NULL);   
    
/*Sentencias SQL para creación de restricciones*/
/*Establecimiento de claves primarias*/

ALTER TABLE espectaculos ADD CONSTRAINT pk_espectaculos
    PRIMARY KEY (cod_espectaculo);
    
ALTER TABLE precios_espectaculos ADD CONSTRAINT pk_precios_espectaculos
    PRIMARY KEY (cod_espectaculo, cod_recinto, zona);
    
ALTER TABLE recintos ADD CONSTRAINT pk_recintos
    PRIMARY KEY (cod_recinto);
    
ALTER TABLE zonas_recintos ADD CONSTRAINT pk_zonas_recintos
    PRIMARY KEY (cod_recinto, zona);
    
ALTER TABLE asientos ADD CONSTRAINT pk_asientos
    PRIMARY KEY (cod_recinto, zona, fila, numero);
    
ALTER TABLE representaciones ADD CONSTRAINT pk_representaciones
    PRIMARY KEY (cod_espectaculo, fecha, hora);
    
ALTER TABLE entradas ADD CONSTRAINT pk_entradas
    PRIMARY KEY (cod_espectaculo, fecha, hora, dni_cliente, cod_recinto, fila, zona, numero);
    
ALTER TABLE espectadores ADD CONSTRAINT pk_espectadores
    PRIMARY KEY (dni_cliente);
    
/*Establecimiento de claves ajenas*/ 

ALTER TABLE espectaculos ADD CONSTRAINT fk_espectaculos_recintos
    FOREIGN KEY (cod_recinto)
    REFERENCES recintos (cod_recinto);
    
ALTER TABLE precios_espectaculos ADD CONSTRAINT fk_precios_esp_espectaculos
    FOREIGN KEY (cod_espectaculo)
    REFERENCES espectaculos (cod_espectaculo);
    
ALTER TABLE precios_espectaculos ADD CONSTRAINT fk_precios_esp_recintos
    FOREIGN KEY (cod_recinto, zona)
    REFERENCES zonas_recintos (cod_recinto, zona);    
    
ALTER TABLE zonas_recintos ADD CONSTRAINT fk_zonas_recintos_recintos
    FOREIGN KEY (cod_recinto)
    REFERENCES recintos (cod_recinto);
    
ALTER TABLE asientos ADD CONSTRAINT fk_asientos_recintos
    FOREIGN KEY (cod_recinto, zona)
    REFERENCES zonas_recintos (cod_recinto, zona);
    
ALTER TABLE representaciones ADD CONSTRAINT fk_representaciones_espectaculos
    FOREIGN KEY (cod_espectaculo)
    REFERENCES espectaculos (cod_espectaculo);
    
ALTER TABLE entradas ADD CONSTRAINT fk_entradas_espectaculos
    FOREIGN KEY (cod_espectaculo)
    REFERENCES espectaculos (cod_espectaculo);
    
ALTER TABLE entradas ADD CONSTRAINT fk_entradas_asientos
    FOREIGN KEY (cod_recinto, zona, fila, numero)
    REFERENCES asientos (cod_recinto, zona, fila, numero);  
    
ALTER TABLE entradas ADD CONSTRAINT fk_entradas_espectadores
    FOREIGN KEY (dni_cliente)
    REFERENCES espectadores (dni_cliente);    