/*EJERCICIO 1*/
/*Crear las tablas para una tienda virtual que distribuye productos agrupados en familias en varias tiendas.
  Con las sentencias DDL de SQL crea la tablas especificadas a continuaci�n aplicando las restricciones (constraints) pedidas. 
  Se debe cumplir la integridad referencial.*/
  
/*Creamos la tabla FAMILIA: Contiene las familias a las que pertenecen los productos, como por ejemplo ordenadores, impresoras,etc.*/ 

CREATE TABLE familia (
    "Codfamilia" NUMBER(3),
    "Denofamilia" VARCHAR2(50));
    
/*A�adimos la descripci�n de cada campo(columna) creado en la tabla*/
COMMENT ON COLUMN familia."Codfamilia" IS 'C�digo que distingue una familia de otra';   
COMMENT ON COLUMN familia."Denofamilia" IS 'Denominaci�n de la familia';
    
/*Establecemos restricciones*/ 

ALTER TABLE familia ADD CONSTRAINT pk_familia
    PRIMARY KEY ("Codfamilia");
    
ALTER TABLE familia ADD CONSTRAINT uk_familia
    UNIQUE ("Denofamilia");
    
ALTER TABLE familia MODIFY "Denofamilia" VARCHAR2(50) NOT NULL;    

/*Creamos la tabla PRODUCTO: Contiene informaci�n general sobre los productos que distribuye la empresa*/

CREATE TABLE producto (
    "Codproducto" NUMBER(5),
    "Denoproducto" VARCHAR2(20),
    "Descripcion" VARCHAR2(100),
    "PrecioBase" NUMBER(8,2),
    "PorcReposici�n" NUMBER(3),
    "UnidadesMinimas" NUMBER(4),
    "Codfamilia" NUMBER(3));
    
/*A�adimos la descripci�n de cada campo(columna) creado en la tabla*/

COMMENT ON COLUMN producto."Codproducto" IS 'C�digo que distingue un producto de otro';

COMMENT ON COLUMN producto."Denoproducto" IS 'Denominaci�n del producto';

COMMENT ON COLUMN producto."Descripcion" IS 'Descripci�n del producto';

COMMENT ON COLUMN producto."PrecioBase" IS 'Precio base del producto';

COMMENT ON COLUMN producto."PorcReposici�n" IS 'Porcentaje de reposici�n aplicado a ese producto. Se utilizar� para aplicar a las unidades m�nimas y obtener el n�mero total de unidades a reponer cuando el stock est� bajo m�nimo';

COMMENT ON COLUMN producto."UnidadesMinimas" IS 'Unidades m�nimas recomendables en almacen';

COMMENT ON COLUMN producto."Codfamilia" IS 'C�digo de la familia a la que pertenece el producto';

/*Establecemos restricciones*/

ALTER TABLE producto ADD CONSTRAINT pk_producto
    PRIMARY KEY ("Codproducto");
    
ALTER TABLE producto MODIFY "Denoproducto" VARCHAR2(20) NOT NULL;

ALTER TABLE producto ADD CONSTRAINT ck_producto_precio
    CHECK("PrecioBase" > 0);

ALTER TABLE producto ADD CONSTRAINT ck_producto_porc
    CHECK("PorcReposici�n" > 0); 
    
ALTER TABLE producto ADD CONSTRAINT ck_producto_unidades
    CHECK("UnidadesMinimas" > 0);    
    
ALTER TABLE producto MODIFY "PrecioBase" NUMBER(8,2) NOT NULL;  

ALTER TABLE producto MODIFY "UnidadesMinimas" NUMBER(4) NOT NULL;  

ALTER TABLE producto MODIFY "Codfamilia" NUMBER(3) NOT NULL; 

ALTER TABLE producto ADD CONSTRAINT fk_producto_familia
    FOREIGN KEY ("Codfamilia")
    REFERENCES familia ("Codfamilia");
    
/*Creamos la tabla TIENDA: contiene infomraci�n b�sica sobre las tiendas que distribuyen los productos*/

CREATE TABLE tienda (
    "Codtienda" NUMBER(3),
    "Denotienda" VARCHAR2(20),
    "Telefono" VARCHAR2(11),
    "CodigoPostal" VARCHAR2(50),
    "Provincia" VARCHAR2(5));
    
/*A�adimos la descripci�n de cada campo(columna) creado en la tabla*/

COMMENT ON COLUMN tienda."Codtienda" IS 'C�digo que distingue una tienda de otra.';  

COMMENT ON COLUMN tienda."Denotienda" IS 'Denominaci�n o nombre de la tienda.';  

COMMENT ON COLUMN tienda."Telefono" IS 'Tel�fono de la tienda';  

COMMENT ON COLUMN tienda."CodigoPostal" IS 'Codigo Postal donde se ubica la tienda'; 

COMMENT ON COLUMN tienda."Provincia" IS 'Provincia donde se ubica la tienda'; 

/*Establecemos restricciones*/

ALTER TABLE tienda ADD CONSTRAINT pk_tienda
    PRIMARY KEY("Codtienda");
    
ALTER TABLE tienda MODIFY "Denotienda" VARCHAR2(20) NOT NULL;  

ALTER TABLE tienda MODIFY "CodigoPostal" VARCHAR2(50) NOT NULL; 

ALTER TABLE tienda MODIFY "Provincia" VARCHAR2(5) NOT NULL; 

/*Creamos la tabla STOCK: contiene para cada tienda el n�mero de unidades disponibles de cada producto. */

CREATE table stock (
    "Codtienda" NUMBER(3),
    "Codproducto" NUMBER(5),
    "Unidades" NUMBER(6));

/*A�adimos la descripci�n de cada campo(columna) creado en la tabla*/

COMMENT ON COLUMN stock."Codtienda" IS 'C�digo de la tienda.';

COMMENT ON COLUMN stock."Codproducto" IS 'C�digo del producto';

COMMENT ON COLUMN stock."Unidades" IS 'Unidades de ese producto en esa tienda';

/*Establecemos restricciones*/

/*La clave primaria est� formada por la concatenaci�n de los campos Codtienda y Codproducto.*/

ALTER TABLE stock ADD CONSTRAINT pk_stock
    PRIMARY KEY ("Codtienda", "Codproducto");
    
ALTER TABLE stock ADD CONSTRAINT fk_stock_tienda
    FOREIGN KEY ("Codtienda")
    REFERENCES tienda ("Codtienda");

ALTER TABLE stock ADD CONSTRAINT fk_stock_producto
    FOREIGN KEY ("Codproducto")
    REFERENCES producto ("Codproducto");    
    
ALTER TABLE stock MODIFY "Codtienda" NUMBER(3) NOT NULL;

ALTER TABLE stock MODIFY "Codproducto" NUMBER(5) NOT NULL;

ALTER TABLE stock MODIFY "Unidades" NUMBER(6) NOT NULL;

ALTER TABLE stock ADD CONSTRAINT ck_stock
    CHECK("Unidades" >=0);