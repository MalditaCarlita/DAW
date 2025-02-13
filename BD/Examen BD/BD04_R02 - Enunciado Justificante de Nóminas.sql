0---------------------------------------------------------------------
--  EMPRESA CON EMPLEADOS, DEPARTAMENTOS Y JUSTIFICANTES DE NÓMINAS
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Borramos las tablas de la base de datos
---------------------------------------------------------------------
DROP TABLE Empleados        CASCADE CONSTRAINTS PURGE;
DROP TABLE Departamentos    CASCADE CONSTRAINTS PURGE;
DROP TABLE Trabajan         CASCADE CONSTRAINTS PURGE;
DROP TABLE Just_nóminas     CASCADE CONSTRAINTS PURGE;
DROP TABLE Líneas           CASCADE CONSTRAINTS PURGE;

---------------------------------------------------------------------
-- Creamos la tabla Empleados
---------------------------------------------------------------------
CREATE TABLE    Empleados(
	Código		number(5,0),
	Nombre		varchar2(30)    NOT NULL,
	Hijos		number(2,0)     NOT NULL,
	Retención	number(2,0)     NOT NULL,
	Cuenta		char(20)        NOT NULL    UNIQUE,
	CONSTRAINT  PK_Empleados    PRIMARY KEY ( Código )
);

---------------------------------------------------------------------
-- Creamos la tabla Departamentos
---------------------------------------------------------------------
CREATE TABLE    Departamentos (
	Código		number(5,0),
	Nombre		varchar2(20)        NOT NULL    UNIQUE,
	CONSTRAINT  PK_Departamentos    PRIMARY KEY ( Código )
);

---------------------------------------------------------------------
-- Creamos la tabla Trabajan
---------------------------------------------------------------------
CREATE TABLE    Trabajan (
	cod_emp		number(5,0),
	cod_dep		number(5,0),
	Función		varchar2(30)    NOT NULL,
	CONSTRAINT  PK_Trabajan                 PRIMARY KEY ( cod_emp, cod_dep ),
	CONSTRAINT  FK_Trabajan_Empleados       FOREIGN KEY ( cod_emp ) REFERENCES Empleados( Código ),
	CONSTRAINT  FK_Trabajan_Departamentos   FOREIGN KEY ( cod_dep ) REFERENCES Departamentos( Código )
);
    
    
---------------------------------------------------------------------
-- Creamos la tabla Just_nóminas
---------------------------------------------------------------------
CREATE TABLE    Just_nóminas (
	Mes		number(2,0),
	Ejercicio	number(4,0),
	Ingreso		number(8,0)     NOT NULL,
	Descuento	number(8,0)     NOT NULL,
	cod_emp		number(5,0),
	CONSTRAINT  PK_Jus_nóminas              PRIMARY KEY ( Mes, Ejercicio, cod_emp ),
	CONSTRAINT  FK_Just_nóminas_Empleados   FOREIGN KEY ( cod_emp ) REFERENCES Empleados( Código )
);

---------------------------------------------------------------------
-- Creamos la tabla Líneas
---------------------------------------------------------------------
CREATE TABLE    Líneas (
	Número		number(5,0),
	Cantidad	number(8,0)     NOT NULL,
	Base		number(8,0),
	Porcentaje	number(2,0),
	Mes		    number(2,0),
	Ejercicio	number(4,0),
	cod_emp		number(5,0),
	CONSTRAINT  PK_Líneas               PRIMARY KEY ( Número, Mes, Ejercicio, cod_emp ),
	CONSTRAINT  FK_Líneas_Just_nóminas  FOREIGN KEY ( Mes, Ejercicio, cod_emp ) REFERENCES Just_nóminas( Mes, Ejercicio, cod_emp )
);


---------------------------------------------------------------------
-- Agregamos datos a la tabla Empleados
---------------------------------------------------------------------
INSERT INTO Empleados VALUES (00011, 'Juan Ignacio Martinez', 0, 10, '12341234121234567890');
INSERT INTO Empleados VALUES (00001, 'José Luis Pérez', 2, 12, '12342233121122334455');
INSERT INTO Empleados VALUES (02341, 'Fernando Romero Días', 1, 8, '21341234560987654321');
INSERT INTO Empleados VALUES (11223, 'Manuel Lopez Marín', 0, 10, '55443322110099887766');
INSERT INTO Empleados VALUES (67890, 'Alfonso Gutierrez Lopez', 1, 12, '12563478001234567890');
INSERT INTO Empleados VALUES (00111, 'Encarna Lopez Lopez', 0, 10, '99118822773344665500');
INSERT INTO Empleados VALUES (02031, 'Ines Montero Zafra', 1, 8, '42341534129234567890');
INSERT INTO Empleados VALUES (09876, 'Rosa Lorite Lopez', 0, 10, '52341234521214567890');
INSERT INTO Empleados VALUES (96352, 'Lola Martinez Contreras', 1, 11, '22341224121224567820');
INSERT INTO Empleados VALUES (76543, 'Francisca Colate Gonzalez', 3, 7, '12343234121334567893');
INSERT INTO Empleados VALUES (73152, 'María Pascual Rojo', 3, 7, '12351234151234567590');
INSERT INTO Empleados VALUES (64738, 'Andrés Morales Martín', 3, 7, '22341154116231563690');

---------------------------------------------------------------------
-- Agregamos datos a la tabla Departamentos
---------------------------------------------------------------------
INSERT INTO Departamentos VALUES (00001, 'Ventas');
INSERT INTO Departamentos VALUES (00002, 'Compras');
INSERT INTO Departamentos VALUES (00003, 'Marketing');
INSERT INTO Departamentos VALUES (00004, 'Recursos Humanos');
INSERT INTO Departamentos VALUES (00005, 'Administración');
INSERT INTO Departamentos VALUES (00006, 'Dirección');

---------------------------------------------------------------------
-- Agregamos datos a la tabla Trabajan
---------------------------------------------------------------------
INSERT INTO Trabajan VALUES (00001, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (00001, 00003, 'Diseñador');
INSERT INTO Trabajan VALUES (02341, 00005, 'Administrativo');
INSERT INTO Trabajan VALUES (11223, 00006, 'Asesor Dirección');
INSERT INTO Trabajan VALUES (11223, 00005, 'Administrativo');
INSERT INTO Trabajan VALUES (11223, 00004, 'Selección de Personal');
INSERT INTO Trabajan VALUES (67890, 00002, 'Gestor de compras');
INSERT INTO Trabajan VALUES (00111, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (02031, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (09876, 00006, 'Director');
INSERT INTO Trabajan VALUES (96352, 00003, 'Publicista');
INSERT INTO Trabajan VALUES (96352, 00004, 'Encuestador');
INSERT INTO Trabajan VALUES (96352, 00005, 'Secretaria de Dirección');
INSERT INTO Trabajan VALUES (76543, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (73152, 00005, 'Administrativo');
INSERT INTO Trabajan VALUES (73152, 00003, 'Publicista');
INSERT INTO Trabajan VALUES (64738, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (64738, 00004, 'Selección de Personal');
INSERT INTO Trabajan VALUES (64738, 00002, 'Gestor de compras');
INSERT INTO Trabajan VALUES (64738, 00003, 'Diseñador');

---------------------------------------------------------------------
-- Agregamos datos a la tabla Just_nóminas
---------------------------------------------------------------------
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 00001);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 00001);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 00001);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 00001);
INSERT INTO Just_nóminas VALUES (10, 2006, 1500, 300, 02341);
INSERT INTO Just_nóminas VALUES (11, 2006, 1500, 300, 02341);
INSERT INTO Just_nóminas VALUES (12, 2006, 1500, 300, 02341);
INSERT INTO Just_nóminas VALUES (01, 2007, 1500, 300, 02341);
INSERT INTO Just_nóminas VALUES (10, 2006, 1000, 100, 11223);
INSERT INTO Just_nóminas VALUES (11, 2006, 1000, 100, 11223);
INSERT INTO Just_nóminas VALUES (12, 2006, 1000, 100, 11223);
INSERT INTO Just_nóminas VALUES (01, 2007, 1000, 100, 11223);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 67890);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 67890);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 67890);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 67890);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 00111);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 00111);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 00111);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 00111);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 02031);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 02031);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 02031);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 02031);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 09876);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 09876);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 09876);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 09876);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 96352);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 96352);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 96352);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 96352);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 76543);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 76543);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 76543);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 76543);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 73152);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 73152);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 73152);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 73152);
INSERT INTO Just_nóminas VALUES (10, 2006, 1200, 200, 64738);
INSERT INTO Just_nóminas VALUES (11, 2006, 1200, 200, 64738);
INSERT INTO Just_nóminas VALUES (12, 2006, 1200, 200, 64738);
INSERT INTO Just_nóminas VALUES (01, 2007, 1200, 200, 64738);

---------------------------------------------------------------------
-- Agregamos datos a la tabla Líneas
---------------------------------------------------------------------
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 00001);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 00001);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 00001);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 00001);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 00001);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 00001);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 00001);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 00001);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 02341);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 02341);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 02341);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 02341);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 02341);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 02341);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 02341);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 02341);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 11223);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 11223);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 11223);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 11223);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 11223);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 11223);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 11223);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 11223);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 67890);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 67890);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 67890);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 67890);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 67890);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 67890);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 67890);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 67890);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 00111);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 00111);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 00111);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 00111);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 00111);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 00111);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 00111);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 00111);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 02031);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 02031);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 02031);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 02031);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 02031);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 02031);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 02031);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 02031);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 09876);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 09876);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 09876);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 09876);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 09876);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 09876);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 09876);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 09876);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 96352);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 96352);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 96352);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 96352);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 96352);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 96352);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 96352);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 96352);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 76543);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 76543);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 76543);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 76543);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 76543);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 76543);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 76543);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 76543);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 73152);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 73152);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 73152);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 73152);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 73152);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 73152);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 73152);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 73152);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 10, 2006, 64738);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 10, 2006, 64738);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 11, 2006, 64738);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 11, 2006, 64738);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 12, 2006, 64738);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 12, 2006, 64738);
INSERT INTO Líneas VALUES (00001, 1200, NULL, NULL, 01, 2007, 64738);
INSERT INTO Líneas VALUES (00002, -200, 1200, 10, 01, 2007, 64738);

---------------------------------------------------------------------
-- Agregamos el atributo Fnacimiento y le damos el formato 'DD/MM/YYYY'
---------------------------------------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
ALTER TABLE Empleados add Fnacimiento date;

---------------------------------------------------------------------
-- Agregamos el atributo Fnacimiento con el nuevo formato a la tabla Empleados
---------------------------------------------------------------------
update Empleados set Fnacimiento = to_date('01/02/1960', 'DD/MM/YYYY') where Código = 00011;
update Empleados set Fnacimiento = to_date('12/04/1964', 'DD/MM/YYYY') where Código = 00001;
update Empleados set Fnacimiento = to_date('25/09/1955', 'DD/MM/YYYY') where Código = 02341;
update Empleados set Fnacimiento = to_date('13/12/1963', 'DD/MM/YYYY') where Código = 11223;
update Empleados set Fnacimiento = to_date('05/11/1967', 'DD/MM/YYYY') where Código = 67890;
update Empleados set Fnacimiento = to_date('15/03/1968', 'DD/MM/YYYY') where Código = 00111;
update Empleados set Fnacimiento = to_date('22/02/1972', 'DD/MM/YYYY') where Código = 02031;
update Empleados set Fnacimiento = to_date('18/08/1975', 'DD/MM/YYYY') where Código = 09876;
update Empleados set Fnacimiento = to_date('09/03/1975', 'DD/MM/YYYY') where Código = 96352;
update Empleados set Fnacimiento = to_date('02/03/1969', 'DD/MM/YYYY') where Código = 76543;
update Empleados set Fnacimiento = to_date('09/12/1973', 'DD/MM/YYYY') where Código = 73152;
update Empleados set Fnacimiento = to_date('20/01/1964', 'DD/MM/YYYY') where Código = 64738;

---------------------------------------------------------------------
--  1. Obtenemos el código y nombre de todos los departamentos
---------------------------------------------------------------------
SELECT nombre, código FROM DEPARTAMENTOS;
---------------------------------------------------------------------
--  2. Obtenemos mes y ejercicio de los justificantes de nómina del
--     empleado cuyo código es 1
---------------------------------------------------------------------
SELECT mes, ejercicio FROM JUST_NóMINAS, EMPLEADOS WHERE código = 1 AND empleados.código = just_nóminas.cod_emp;
---------------------------------------------------------------------
--  3. Obtenemos número de cuenta y nombre de los empleados cuya
--     retención sea mayor o igual a 10
---------------------------------------------------------------------
SELECT cuenta, nombre FROM EMPLEADOS WHERE retención >= 10;
---------------------------------------------------------------------
--  4. Obtenemos el código y nombre de los empleados, ordenados
--     ascendentemente según el nombre
---------------------------------------------------------------------
SELECT código, nombre FROM EMPLEADOS ORDER BY nombre;
---------------------------------------------------------------------
--  5. Obtenemos el nombre de los empleados con más de 2 hijos
---------------------------------------------------------------------
SELECT nombre FROM EMPLEADOS WHERE hijos >2;
---------------------------------------------------------------------
--  6. Obtenemos el código y nombre de cuenta de los empleados cuyo
--     nombre empiece por 'A' o 'J'
---------------------------------------------------------------------
SELECT código, nombre AS "nombre de cuenta" FROM EMPLEADOS WHERE REGEXP_LIKE(nombre,'^A|J');
---------------------------------------------------------------------
--  7. Obtenemos el número de empleados que hay en la base de datos
---------------------------------------------------------------------
SELECT COUNT(*) FROM EMPLEADOS;
---------------------------------------------------------------------
--  8. Obtenemos el nombre del primer y del último empleado, ordenados
--     alfabéticamente
---------------------------------------------------------------------
SELECT nombre FROM EMPLEADOS WHERE código IN (1,(SELECT MAX(código) FROM EMPLEADOS));
---------------------------------------------------------------------
--  9. Obtenemos el nombre y el número de hijos de los empleados cuya
--     retención sea 8, 10 ó 12
---------------------------------------------------------------------
SELECT nombre, hijos FROM EMPLEADOS WHERE retención IN(8,10,12);
---------------------------------------------------------------------
-- 10. Obtenemos el número de hijos y el número de empleados, agrupados
--     por hijos, mostrando sólo los grupos con más de un empleado
---------------------------------------------------------------------
SELECT hijos, COUNT(*) AS empleados FROM EMPLEADOS GROUP BY hijos  HAVING COUNT(*) > 1;
---------------------------------------------------------------------
-- 11. Obtenemos el número de hijos, la retención máxima, mínima y 
--     media de los empleados agrupados por el número de hijos
---------------------------------------------------------------------
SELECT hijos, MAX(retención) AS "Máxima re
tención", MIN(retención) AS "Mínima retención", AVG(retención) AS "retención media" FROM EMPLEADOS GROUP BY hijos;
---------------------------------------------------------------------
-- 12. Obtenemos el nombre y la función de los empleados que han
--     trabajado en el departamento número 1
---------------------------------------------------------------------
SELECT nombre, función FROM EMPLEADOS, TRABAJAN WHERE empleados.código = trabajan.cod_emp AND cod_dep=1;
---------------------------------------------------------------------
-- 13. Obtenemos el nombre del empleado, el nombre del departamento y
--     la función realizada por los empleados con un hijo
---------------------------------------------------------------------
SELECT empleados.nombre, departamentos.nombre AS departamento, función FROM EMPLEADOS, DEPARTAMENTOS, TRABAJAN WHERE empleados.código = trabajan.cod_emp AND trabajan.cod_dep = departamentos.código AND hijos = 1;
---------------------------------------------------------------------
-- 14. Obtenemos el nombre del empleado y el del departamento en el
--     que han trabajado empleados sin hijos
---------------------------------------------------------------------
SELECT empleados.nombre, departamentos.nombre AS departamento FROM EMPLEADOS, DEPARTAMENTOS, TRABAJAN WHERE empleados.código = trabajan.cod_emp AND trabajan.cod_dep = departamentos.código AND hijos = 0;
---------------------------------------------------------------------
-- 15. Obtenemos el nombre del empleado, mes y ejercicio de sus justificantes
--     de nómina, número de línea y cantidad de líneas de los justificantes
--     del empleado con el código 1
---------------------------------------------------------------------
SELECT nombre, just_nóminas.mes, just_nóminas.ejercicio, número AS línea, cantidad FROM EMPLEADOS, JUST_NÓMINAS, LÍNEAS WHERE código = 1;
---------------------------------------------------------------------
-- 16. Obtenemos el nombre del empleado, el mes y el ejercicio de sus
--     justificantes de nómina para los empleados que han trabajado
--     en el departamento de Ventas
---------------------------------------------------------------------
SELECT DISTINCT empleados.nombre, just_nóminas.mes, just_nóminas.ejercicio, departamentos.nombre FROM EMPLEADOS, DEPARTAMENTOS, JUST_NÓMINAS, TRABAJAN WHERE departamentos.nombre= 'Ventas' AND departamentos.código = trabajan.cod_dep AND empleados.código=trabajan.cod_emp;
---------------------------------------------------------------------
-- 17. Obtenemos el nombre del empleado y los ingresos percibidos
--     agrupados por nombre
---------------------------------------------------------------------
SELECT nombre, SUM(ingreso) FROM EMPLEADOS, JUST_NÓMINAS WHERE código = cod_emp GROUP BY nombre;
---------------------------------------------------------------------
-- 18. Obtenemos el nombre de los empleados que han ganado más de
--     2000€ en el año 2006
---------------------------------------------------------------------
SELECT DISTINCT nombre FROM EMPLEADOS, JUST_NÓMINAS WHERE empleados.código = (SELECT cod_emp FROM JUST_NÓMINAS HAVING SUM(ingreso) > 2000);  
SELECT cod_emp,  FROM just_nóminas WHERE ejercicio = 2006 AND SUM(ingreso) >2000 GROUP BY cod_emp;
---------------------------------------------------------------------
-- 19. Obtenemos el número de empleados con el número de hijos mayor
--     a la media de los hijos de los empleados
---------------------------------------------------------------------
SELECT COUNT(*) AS empleados FROM EMPLEADOS WHERE hijos > (SELECT AVG(hijos) FROM EMPLEADOS);
---------------------------------------------------------------------
-- 20. Obtenemos el nombre de los empleados con más y menos hijos
---------------------------------------------------------------------
SELECT nombre FROM EMPLEADOS WHERE hijos = (SELECT MAX(hijos) FROM EMPLEADOS) OR hijos = (SELECT MIN(hijos) FROM EMPLEADOS);
---------------------------------------------------------------------
-- 21. Obtenemos el nombre de los empleados que no tienen ningún
--     justificante de nóminas
---------------------------------------------------------------------
SELECT DISTINCT nombre FROM EMPLEADOS, JUST_NÓMINAS WHERE empleados.código NOT IN(SELECT cod_emp FROM JUST_NÓMINAS);
---------------------------------------------------------------------
-- 22. Obtenemos el nombre y la fecha de nacimineto de todos los empleados
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR(fnacimiento),'-') FROM EMPLEADOS;
---------------------------------------------------------------------
-- 23. Obtenemos el nombre y la fecha de nacimiento con formato "1 de
--     Enero de 2000" y etiquetada la columna como fecha, de todos los 
--     empleados
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR(TO_DATE(fnacimiento), 'D de MM de YYYY'), '-----') AS fecha FROM EMPLEADOS;
---------------------------------------------------------------------
-- 24. Obtenemos el nombre de los empleados, el nombre de los departamentos
--     en los que ha trabajado y la función (en mayúsculas) que ha 
--     realizado en cada departamento
---------------------------------------------------------------------
SELECT DISTINCT empleados.nombre, departamentos.nombre AS departamento, UPPER(función) AS función FROM DEPARTAMENTOS, EMPLEADOS, TRABAJAN WHERE empleados.código = trabajan.cod_emp AND cod_dep = departamentos.código;
---------------------------------------------------------------------
-- 25. Obtenemos el nombre, la fecha de nacimiento y el nombre del día
--     de la semana de la fecha de nacimiento de todos los empleados
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR(fnacimiento),'-') AS nacimiento, NVL(TO_CHAR((EXTRACT (DAY FROM fnacimiento))), '-') AS día FROM EMPLEADOS;
---------------------------------------------------------------------
-- 26. Obtenemos el nombre y la edad de los empleados
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR((EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento)))), '---') AS edad FROM EMPLEADOS;
---------------------------------------------------------------------
-- 27. Obtenemos el nombre, la edad y el número de hijos de los empleados
--     que tienen más de 40 años y con hijos
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR((EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento)))), '---') AS edad, hijos FROM EMPLEADOS WHERE (EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento))) > 40 and hijos >=1;
---------------------------------------------------------------------
-- 28. Obtenemos el nombre y la edad de los empleados, y, también el
--     nombre del departamento de los empleados que han trabajado en
--     más de un departamento
---------------------------------------------------------------------
SELECT nombre AS empleados FROM EMPLEADOS WHERE código IN ((SELECT trabajan.cod_emp AS trabajador FROM TRABAJAN GROUP BY trabajan.cod_emp HAVING COUNT(cod_dep) > 1));
---------------------------------------------------------------------
-- 29. Obtenemos el nombre, la edad y el número de cuenta de los empleados
--     cuya edad sea múltiplo de 3
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR((EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento)))), '---') AS edad, cuenta FROM EMPLEADOS WHERE (EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento))/3) = 0;
---------------------------------------------------------------------
-- 30. Obtenemos el nombre y los ingresos percibidos del empleado
--     más joven y del más longevo
---------------------------------------------------------------------
SELECT nombre AS EMPLEADOS, SUM(ingreso) FROM EMPLEADOS, JUST_NÓMINAS WHERE fnacimiento = (SELECT MAX(fnacimiento)FROM EMPLEADOS) AND fnacimiento = (SELECT MAX(fnacimiento)FROM EMPLEADOS) GROUP BY nombre;
SELECT nombre, SUM(ingreso) AS ingresos FROM EMPLEADOS, JUST_NÓMINAS GROUP BY nombre HAVING fnacimiento = (SELECT MAX(fnacimiento)FROM EMPLEADOS) OR fnacimiento = (SELECT MIN(fnacimiento)FROM EMPLEADOS);