/*EJERCICIO2*/
/*A) Modificar las tablas creadas en el ejercicio anterior siguiendo las indicaciones.*/
/*A�adir a la tabla STOCK*/    

/*Una columna de tipo fecha llamada FechaUltimaEntrada que por defecto tome el valor de la fecha actual.*/

ALTER TABLE stock ADD "FechaUltimaEntrada" DATE DEFAULT SYSDATE ;

/*Una columna llamada Beneficio que contendr� el tipo de porcentaje de beneficio que esa tienda aplica en ese producto. Se debe controlar que el valor que almacene sea 1,2, 3, 4 o 5.*/

ALTER TABLE stock ADD "Beneficio" NUMBER(1);

COMMENT ON COLUMN stock."Beneficio" IS 'Tipo de porcentaje de beneficio que esa tienda aplica en ese producto';

ALTER TABLE stock ADD CONSTRAINT ck_stock_beneficio
    CHECK("Beneficio" IN(1, 2, 3, 4, 5));

/*En la tabla PRODUCTO*/  

/*Eliminar de la tabla producto la columna Descripci�n.*/

ALTER TABLE producto DROP COLUMN "Descripcion";

/*A�adir una columna llamada perecedero que �nicamente acepte los valores: S o N.*/

ALTER TABLE producto ADD "perecedero" VARCHAR(1);

ALTER TABLE producto ADD CONSTRAINT ck_producto_perecedero
    CHECK("perecedero"='S' OR "perecedero"='N');
    
/*Modificar el tama�o de la columna Denoproducto a 50.*/   

ALTER TABLE producto MODIFY "Denoproducto" VARCHAR2(50);

/*En la tabla FAMILIA*/

/*A�adir una columna llamada IVA, que represente el porcentaje de IVA y �nicamente pueda contener los valores 21,10,� 4.*/

ALTER TABLE familia ADD iva NUMBER(2);

COMMENT ON COLUMN familia.iva IS 'Porcentaje de IVA';

ALTER TABLE familia ADD CONSTRAINT ck_familia_iva
    CHECK(iva IN(21, 10, 4));

/*En la tabla TIENDA*/

/*La empresa desea restringir el n�mero de tiendas con las que trabaja, de forma que no pueda haber m�s de una tienda en una misma zona (la zona se identifica por el c�digo postal). 
Definir mediante DDL las restricciones necesarias para que se cumpla en el campo correspondiente..*/

ALTER TABLE tienda ADD CONSTRAINT uk_tienda_zona
    UNIQUE ("CodigoPostal");
    
/*B) Renombra la tabla STOCK por PRODXTIENDAS.*/ 

RENAME stock TO prodxtiendas; 

/*C) Elimina la tabla FAMILIA y su contenido si lo tuviera.*/

DROP TABLE familia;

/*D) Crea un usuario llamado C##INVITADO siguiendo los pasos de la unidad 1 y dale todos los privilegios sobre la tabla PRODUCTO.*/

CREATE USER c##invitado IDENTIFIED BY invitado;
GRANT ALL PRIVILEGES ON producto TO c##invitado;

/*E) Retira los permisos de modificar la estructura de la tabla y borrar contenido de la tabla PRODUCTO al usuario anterior.*/

REVOKE ALTER, DELETE ON producto FROM c##invitado;
    