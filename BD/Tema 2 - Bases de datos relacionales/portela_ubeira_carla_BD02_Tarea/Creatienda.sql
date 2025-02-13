/*EJERCICIO 1*/
/*Crear las tablas para una tienda virtual que distribuye productos agrupados en familias en varias tiendas.
  Con las sentencias DDL de SQL crea la tablas especificadas a continuación aplicando las restricciones (constraints) pedidas. 
  Se debe cumplir la integridad referencial.*/
  
/*Creamos la tabla FAMILIA: Contiene las familias a las que pertenecen los productos, como por ejemplo ordenadores, impresoras,etc.*/ 

CREATE TABLE familia (
    "Codfamilia" NUMBER(3),
    "Denofamilia" VARCHAR2(50));
    
/*Añadimos la descripción de cada campo(columna) creado en la tabla*/
COMMENT ON COLUMN familia."Codfamilia" IS 'Código que distingue una familia de otra';   
COMMENT ON COLUMN familia."Denofamilia" IS 'Denominación de la familia';
    
/*Establecemos restricciones*/ 

ALTER TABLE familia ADD CONSTRAINT pk_familia
    PRIMARY KEY ("Codfamilia");
    
ALTER TABLE familia ADD CONSTRAINT uk_familia
    UNIQUE ("Denofamilia");
    
ALTER TABLE familia MODIFY "Denofamilia" VARCHAR2(50) NOT NULL;    

/*Creamos la tabla PRODUCTO: Contiene información general sobre los productos que distribuye la empresa*/

CREATE TABLE producto (
    "Codproducto" NUMBER(5),
    "Denoproducto" VARCHAR2(20),
    "Descripcion" VARCHAR2(100),
    "PrecioBase" NUMBER(8,2),
    "PorcReposición" NUMBER(3),
    "UnidadesMinimas" NUMBER(4),
    "Codfamilia" NUMBER(3));
    
/*Añadimos la descripción de cada campo(columna) creado en la tabla*/

COMMENT ON COLUMN producto."Codproducto" IS 'Código que distingue un producto de otro';

COMMENT ON COLUMN producto."Denoproducto" IS 'Denominación del producto';

COMMENT ON COLUMN producto."Descripcion" IS 'Descripción del producto';

COMMENT ON COLUMN producto."PrecioBase" IS 'Precio base del producto';

COMMENT ON COLUMN producto."PorcReposición" IS 'Porcentaje de reposición aplicado a ese producto. Se utilizará para aplicar a las unidades mínimas y obtener el número total de unidades a reponer cuando el stock esté bajo mínimo';

COMMENT ON COLUMN producto."UnidadesMinimas" IS 'Unidades mínimas recomendables en almacen';

COMMENT ON COLUMN producto."Codfamilia" IS 'Código de la familia a la que pertenece el producto';

/*Establecemos restricciones*/

ALTER TABLE producto ADD CONSTRAINT pk_producto
    PRIMARY KEY ("Codproducto");
    
ALTER TABLE producto MODIFY "Denoproducto" VARCHAR2(20) NOT NULL;

ALTER TABLE producto ADD CONSTRAINT ck_producto_precio
    CHECK("PrecioBase" > 0);

ALTER TABLE producto ADD CONSTRAINT ck_producto_porc
    CHECK("PorcReposición" > 0); 
    
ALTER TABLE producto ADD CONSTRAINT ck_producto_unidades
    CHECK("UnidadesMinimas" > 0);    
    
ALTER TABLE producto MODIFY "PrecioBase" NUMBER(8,2) NOT NULL;  

ALTER TABLE producto MODIFY "UnidadesMinimas" NUMBER(4) NOT NULL;  

ALTER TABLE producto MODIFY "Codfamilia" NUMBER(3) NOT NULL; 

ALTER TABLE producto ADD CONSTRAINT fk_producto_familia
    FOREIGN KEY ("Codfamilia")
    REFERENCES familia ("Codfamilia");
    
/*Creamos la tabla TIENDA: contiene infomración básica sobre las tiendas que distribuyen los productos*/

CREATE TABLE tienda (
    "Codtienda" NUMBER(3),
    "Denotienda" VARCHAR2(20),
    "Telefono" VARCHAR2(11),
    "CodigoPostal" VARCHAR2(50),
    "Provincia" VARCHAR2(5));
    
/*Añadimos la descripción de cada campo(columna) creado en la tabla*/

COMMENT ON COLUMN tienda."Codtienda" IS 'Código que distingue una tienda de otra.';  

COMMENT ON COLUMN tienda."Denotienda" IS 'Denominación o nombre de la tienda.';  

COMMENT ON COLUMN tienda."Telefono" IS 'Teléfono de la tienda';  

COMMENT ON COLUMN tienda."CodigoPostal" IS 'Codigo Postal donde se ubica la tienda'; 

COMMENT ON COLUMN tienda."Provincia" IS 'Provincia donde se ubica la tienda'; 

/*Establecemos restricciones*/

ALTER TABLE tienda ADD CONSTRAINT pk_tienda
    PRIMARY KEY("Codtienda");
    
ALTER TABLE tienda MODIFY "Denotienda" VARCHAR2(20) NOT NULL;  

ALTER TABLE tienda MODIFY "CodigoPostal" VARCHAR2(50) NOT NULL; 

ALTER TABLE tienda MODIFY "Provincia" VARCHAR2(5) NOT NULL; 

/*Creamos la tabla STOCK: contiene para cada tienda el número de unidades disponibles de cada producto. */

CREATE table stock (
    "Codtienda" NUMBER(3),
    "Codproducto" NUMBER(5),
    "Unidades" NUMBER(6));

/*Añadimos la descripción de cada campo(columna) creado en la tabla*/

COMMENT ON COLUMN stock."Codtienda" IS 'Código de la tienda.';

COMMENT ON COLUMN stock."Codproducto" IS 'Código del producto';

COMMENT ON COLUMN stock."Unidades" IS 'Unidades de ese producto en esa tienda';

/*Establecemos restricciones*/

/*La clave primaria está formada por la concatenación de los campos Codtienda y Codproducto.*/

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