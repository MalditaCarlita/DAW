/*Base de datos que almacene la información sobre los empleados de una empresa,
los departamentos con los que trabajan y los estudios de que disponene.
Además se guardará un historial laboral y salarial de todos los empleados*/

/*Creación de las tablas*/

CREATE TABLE empleados (
    dni NUMBER(8),
    nombre VARCHAR(10),
    apellido1 VARCHAR(15),
    apellido2 VARCHAR(15),
    direcc1 VARCHAR(25),
    direcc2 VARCHAR(20),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    cod_postal VARCHAR(5),
    sexo VARCHAR(1),
    fecha_nac DATE);
    
CREATE TABLE departamentos (
    dpto_cod NUMBER(5),
    nombre_dpto VARCHAR(30),
    dpto_padre number(5),
    presupuesto NUMBER,
    pres_actual NUMBER);
    
CREATE TABLE universidades (
    univ_cod NUMBER(5),
    nombre_univ VARCHAR(25),
    ciudad VARCHAR(20),
    municipio VARCHAR(2),
    cod_postal VARCHAR (20));    
    
CREATE TABLE estudios (
    empleado_dni NUMBER(8),
    universidad NUMBER(5),
    año NUMBER,
    grado VARCHAR(3),
    especialidad VARCHAR(20));
    
CREATE TABLE trabajos (
    trabajo_cod NUMBER(5),
    nombre_trab VARCHAR(20),
    salario_min NUMBER(2),
    salario_max NUMBER(2));   
    
CREATE TABLE  historial_laboral (
    empleado_dni NUMBER(8),
    trabajo_cod NUMBER(5),
    fecha_inicio DATE,
    fecha_fin DATE,
    dpto_cod NUMBER(5),
    supervisor_dni NUMBER(8));  
    
CREATE TABLE historial_salarial (
    empleado_dni NUMBER(8),
    salario NUMBER,
    fecha_comienzo DATE,
    fecha_fin DATE); 
    
/*Son obligatorios los atributos nombre y apellido1 en EMPLEADOS, presupuesto en DEPARTAMENTOS, salario en HISTORIAL_SALARIAL
y salario_min y salario_max en TRABAJOS*/

/*Modificamos los campos creados en cada tabla*/

ALTER TABLE empleados 
    MODIFY nombre VARCHAR(10) NOT NULL;
    
ALTER TABLE empleados
    MODIFY apellido1 VARCHAR(15) NOT NULL;
    
ALTER TABLE departamentos
    MODIFY presupuesto NUMBER NOT NULL;
    
ALTER TABLE historial_salarial
    MODIFY salario NUMBER NOT NULL;
    
ALTER TABLE trabajos
    MODIFY salario_min NUMBER(2) NOT NULL;
    
ALTER TABLE trabajos 
    MODIFY salario_max NUMBER(2) NOT NULL;
    
/*El atributo sexo en EMPLEADOS solo puede tomar los valores H para hombre y M para mujer*/

ALTER TABLE empleados ADD CONSTRAINT ck_empleados
    CHECK (sexo='H' OR sexo='M');
    
/*Dos DEPARTAMENTOS no se llaman igual*/

ALTER TABLE departamentos ADD CONSTRAINT uk_departamentos
    UNIQUE (nombre_dpto);
    
/*Dos TRABAJOS no se llaman igual*/

ALTER TABLE trabajos ADD CONSTRAINT uk_trabajos
    UNIQUE (nombre_trab);
    
/*Cada empleado tiene un solo salario y un solo trabajo en cada momento*/  

ALTER TABLE historial_salarial ADD CONSTRAINT pk_historial_salarial
    PRIMARY KEY(empleado_dni, salario, fecha_comienzo);
    
ALTER TABLE historial_laboral ADD CONSTRAINT pk_historial_laboral
    PRIMARY KEY(empleado_dni, trabajo_cod, fecha_inicio);
    
    
/*Mantener regla de integridad referencial y clave primaria para cada tabla*/

/*Claves primarias*/

ALTER TABLE empleados ADD CONSTRAINT pk_empleados
    PRIMARY KEY (dni);
    
ALTER TABLE departamentos ADD CONSTRAINT pk_departamentos
    PRIMARY KEY (dpto_cod);

ALTER TABLE estudios ADD CONSTRAINT pk_estudios
    PRIMARY KEY (empleado_dni, especialidad, universidad);
    
ALTER TABLE universidades ADD CONSTRAINT pk_universidades
    PRIMARY KEY (univ_cod);
    
ALTER TABLE trabajos ADD CONSTRAINT pk_trabajos
    PRIMARY KEY (trabajo_cod);

/*Claves ajenas*/

ALTER TABLE estudios ADD CONSTRAINT fk_estudios_empleados
    FOREIGN KEY (empleado_dni)
    REFERENCES empleados (dni);
    
ALTER TABLE estudios ADD CONSTRAINT fk_estudios_universidades
    FOREIGN KEY (universidad)
    REFERENCES universidades (univ_cod);
    
ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_empleados
    FOREIGN KEY (empleado_dni)
    REFERENCES empleados (dni);
    
ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_trabajos
    FOREIGN KEY (trabajo_cod)
    REFERENCES trabajos (trabajo_cod);
    
ALTER TABLE historial_laboral ADD CONSTRAINT fk_historial_laboral_departamentos
    FOREIGN KEY (dpto_cod)
    REFERENCES departamentos (dpto_cod);

ALTER TABLE historial_salarial ADD CONSTRAINT fk_historial_salarial_empleados
    FOREIGN KEY (empleado_dni)
    REFERENCES empleados (dni);
    
