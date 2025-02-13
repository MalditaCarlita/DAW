0---------------------------------------------------------------------
--  EMPRESA CON EMPLEADOS, DEPARTAMENTOS Y JUSTIFICANTES DE N�MINAS
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Borramos las tablas de la base de datos
---------------------------------------------------------------------
DROP TABLE Empleados        CASCADE CONSTRAINTS PURGE;
DROP TABLE Departamentos    CASCADE CONSTRAINTS PURGE;
DROP TABLE Trabajan         CASCADE CONSTRAINTS PURGE;
DROP TABLE Just_n�minas     CASCADE CONSTRAINTS PURGE;
DROP TABLE L�neas           CASCADE CONSTRAINTS PURGE;

---------------------------------------------------------------------
-- Creamos la tabla Empleados
---------------------------------------------------------------------
CREATE TABLE    Empleados(
	C�digo		number(5,0),
	Nombre		varchar2(30)    NOT NULL,
	Hijos		number(2,0)     NOT NULL,
	Retenci�n	number(2,0)     NOT NULL,
	Cuenta		char(20)        NOT NULL    UNIQUE,
	CONSTRAINT  PK_Empleados    PRIMARY KEY ( C�digo )
);

---------------------------------------------------------------------
-- Creamos la tabla Departamentos
---------------------------------------------------------------------
CREATE TABLE    Departamentos (
	C�digo		number(5,0),
	Nombre		varchar2(20)        NOT NULL    UNIQUE,
	CONSTRAINT  PK_Departamentos    PRIMARY KEY ( C�digo )
);

---------------------------------------------------------------------
-- Creamos la tabla Trabajan
---------------------------------------------------------------------
CREATE TABLE    Trabajan (
	cod_emp		number(5,0),
	cod_dep		number(5,0),
	Funci�n		varchar2(30)    NOT NULL,
	CONSTRAINT  PK_Trabajan                 PRIMARY KEY ( cod_emp, cod_dep ),
	CONSTRAINT  FK_Trabajan_Empleados       FOREIGN KEY ( cod_emp ) REFERENCES Empleados( C�digo ),
	CONSTRAINT  FK_Trabajan_Departamentos   FOREIGN KEY ( cod_dep ) REFERENCES Departamentos( C�digo )
);
    
    
---------------------------------------------------------------------
-- Creamos la tabla Just_n�minas
---------------------------------------------------------------------
CREATE TABLE    Just_n�minas (
	Mes		number(2,0),
	Ejercicio	number(4,0),
	Ingreso		number(8,0)     NOT NULL,
	Descuento	number(8,0)     NOT NULL,
	cod_emp		number(5,0),
	CONSTRAINT  PK_Jus_n�minas              PRIMARY KEY ( Mes, Ejercicio, cod_emp ),
	CONSTRAINT  FK_Just_n�minas_Empleados   FOREIGN KEY ( cod_emp ) REFERENCES Empleados( C�digo )
);

---------------------------------------------------------------------
-- Creamos la tabla L�neas
---------------------------------------------------------------------
CREATE TABLE    L�neas (
	N�mero		number(5,0),
	Cantidad	number(8,0)     NOT NULL,
	Base		number(8,0),
	Porcentaje	number(2,0),
	Mes		    number(2,0),
	Ejercicio	number(4,0),
	cod_emp		number(5,0),
	CONSTRAINT  PK_L�neas               PRIMARY KEY ( N�mero, Mes, Ejercicio, cod_emp ),
	CONSTRAINT  FK_L�neas_Just_n�minas  FOREIGN KEY ( Mes, Ejercicio, cod_emp ) REFERENCES Just_n�minas( Mes, Ejercicio, cod_emp )
);


---------------------------------------------------------------------
-- Agregamos datos a la tabla Empleados
---------------------------------------------------------------------
INSERT INTO Empleados VALUES (00011, 'Juan Ignacio Martinez', 0, 10, '12341234121234567890');
INSERT INTO Empleados VALUES (00001, 'Jos� Luis P�rez', 2, 12, '12342233121122334455');
INSERT INTO Empleados VALUES (02341, 'Fernando Romero D�as', 1, 8, '21341234560987654321');
INSERT INTO Empleados VALUES (11223, 'Manuel Lopez Mar�n', 0, 10, '55443322110099887766');
INSERT INTO Empleados VALUES (67890, 'Alfonso Gutierrez Lopez', 1, 12, '12563478001234567890');
INSERT INTO Empleados VALUES (00111, 'Encarna Lopez Lopez', 0, 10, '99118822773344665500');
INSERT INTO Empleados VALUES (02031, 'Ines Montero Zafra', 1, 8, '42341534129234567890');
INSERT INTO Empleados VALUES (09876, 'Rosa Lorite Lopez', 0, 10, '52341234521214567890');
INSERT INTO Empleados VALUES (96352, 'Lola Martinez Contreras', 1, 11, '22341224121224567820');
INSERT INTO Empleados VALUES (76543, 'Francisca Colate Gonzalez', 3, 7, '12343234121334567893');
INSERT INTO Empleados VALUES (73152, 'Mar�a Pascual Rojo', 3, 7, '12351234151234567590');
INSERT INTO Empleados VALUES (64738, 'Andr�s Morales Mart�n', 3, 7, '22341154116231563690');

---------------------------------------------------------------------
-- Agregamos datos a la tabla Departamentos
---------------------------------------------------------------------
INSERT INTO Departamentos VALUES (00001, 'Ventas');
INSERT INTO Departamentos VALUES (00002, 'Compras');
INSERT INTO Departamentos VALUES (00003, 'Marketing');
INSERT INTO Departamentos VALUES (00004, 'Recursos Humanos');
INSERT INTO Departamentos VALUES (00005, 'Administraci�n');
INSERT INTO Departamentos VALUES (00006, 'Direcci�n');

---------------------------------------------------------------------
-- Agregamos datos a la tabla Trabajan
---------------------------------------------------------------------
INSERT INTO Trabajan VALUES (00001, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (00001, 00003, 'Dise�ador');
INSERT INTO Trabajan VALUES (02341, 00005, 'Administrativo');
INSERT INTO Trabajan VALUES (11223, 00006, 'Asesor Direcci�n');
INSERT INTO Trabajan VALUES (11223, 00005, 'Administrativo');
INSERT INTO Trabajan VALUES (11223, 00004, 'Selecci�n de Personal');
INSERT INTO Trabajan VALUES (67890, 00002, 'Gestor de compras');
INSERT INTO Trabajan VALUES (00111, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (02031, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (09876, 00006, 'Director');
INSERT INTO Trabajan VALUES (96352, 00003, 'Publicista');
INSERT INTO Trabajan VALUES (96352, 00004, 'Encuestador');
INSERT INTO Trabajan VALUES (96352, 00005, 'Secretaria de Direcci�n');
INSERT INTO Trabajan VALUES (76543, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (73152, 00005, 'Administrativo');
INSERT INTO Trabajan VALUES (73152, 00003, 'Publicista');
INSERT INTO Trabajan VALUES (64738, 00001, 'Vendedor');
INSERT INTO Trabajan VALUES (64738, 00004, 'Selecci�n de Personal');
INSERT INTO Trabajan VALUES (64738, 00002, 'Gestor de compras');
INSERT INTO Trabajan VALUES (64738, 00003, 'Dise�ador');

---------------------------------------------------------------------
-- Agregamos datos a la tabla Just_n�minas
---------------------------------------------------------------------
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 00001);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 00001);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 00001);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 00001);
INSERT INTO Just_n�minas VALUES (10, 2006, 1500, 300, 02341);
INSERT INTO Just_n�minas VALUES (11, 2006, 1500, 300, 02341);
INSERT INTO Just_n�minas VALUES (12, 2006, 1500, 300, 02341);
INSERT INTO Just_n�minas VALUES (01, 2007, 1500, 300, 02341);
INSERT INTO Just_n�minas VALUES (10, 2006, 1000, 100, 11223);
INSERT INTO Just_n�minas VALUES (11, 2006, 1000, 100, 11223);
INSERT INTO Just_n�minas VALUES (12, 2006, 1000, 100, 11223);
INSERT INTO Just_n�minas VALUES (01, 2007, 1000, 100, 11223);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 67890);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 67890);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 67890);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 67890);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 00111);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 00111);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 00111);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 00111);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 02031);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 02031);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 02031);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 02031);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 09876);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 09876);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 09876);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 09876);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 96352);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 96352);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 96352);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 96352);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 76543);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 76543);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 76543);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 76543);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 73152);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 73152);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 73152);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 73152);
INSERT INTO Just_n�minas VALUES (10, 2006, 1200, 200, 64738);
INSERT INTO Just_n�minas VALUES (11, 2006, 1200, 200, 64738);
INSERT INTO Just_n�minas VALUES (12, 2006, 1200, 200, 64738);
INSERT INTO Just_n�minas VALUES (01, 2007, 1200, 200, 64738);

---------------------------------------------------------------------
-- Agregamos datos a la tabla L�neas
---------------------------------------------------------------------
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 00001);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 00001);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 00001);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 00001);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 00001);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 00001);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 00001);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 00001);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 02341);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 02341);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 02341);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 02341);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 02341);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 02341);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 02341);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 02341);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 11223);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 11223);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 11223);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 11223);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 11223);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 11223);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 11223);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 11223);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 67890);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 67890);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 67890);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 67890);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 67890);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 67890);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 67890);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 67890);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 00111);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 00111);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 00111);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 00111);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 00111);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 00111);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 00111);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 00111);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 02031);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 02031);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 02031);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 02031);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 02031);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 02031);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 02031);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 02031);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 09876);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 09876);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 09876);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 09876);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 09876);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 09876);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 09876);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 09876);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 96352);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 96352);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 96352);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 96352);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 96352);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 96352);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 96352);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 96352);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 76543);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 76543);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 76543);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 76543);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 76543);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 76543);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 76543);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 76543);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 73152);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 73152);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 73152);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 73152);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 73152);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 73152);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 73152);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 73152);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 10, 2006, 64738);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 10, 2006, 64738);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 11, 2006, 64738);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 11, 2006, 64738);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 12, 2006, 64738);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 12, 2006, 64738);
INSERT INTO L�neas VALUES (00001, 1200, NULL, NULL, 01, 2007, 64738);
INSERT INTO L�neas VALUES (00002, -200, 1200, 10, 01, 2007, 64738);

---------------------------------------------------------------------
-- Agregamos el atributo Fnacimiento y le damos el formato 'DD/MM/YYYY'
---------------------------------------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
ALTER TABLE Empleados add Fnacimiento date;

---------------------------------------------------------------------
-- Agregamos el atributo Fnacimiento con el nuevo formato a la tabla Empleados
---------------------------------------------------------------------
update Empleados set Fnacimiento = to_date('01/02/1960', 'DD/MM/YYYY') where C�digo = 00011;
update Empleados set Fnacimiento = to_date('12/04/1964', 'DD/MM/YYYY') where C�digo = 00001;
update Empleados set Fnacimiento = to_date('25/09/1955', 'DD/MM/YYYY') where C�digo = 02341;
update Empleados set Fnacimiento = to_date('13/12/1963', 'DD/MM/YYYY') where C�digo = 11223;
update Empleados set Fnacimiento = to_date('05/11/1967', 'DD/MM/YYYY') where C�digo = 67890;
update Empleados set Fnacimiento = to_date('15/03/1968', 'DD/MM/YYYY') where C�digo = 00111;
update Empleados set Fnacimiento = to_date('22/02/1972', 'DD/MM/YYYY') where C�digo = 02031;
update Empleados set Fnacimiento = to_date('18/08/1975', 'DD/MM/YYYY') where C�digo = 09876;
update Empleados set Fnacimiento = to_date('09/03/1975', 'DD/MM/YYYY') where C�digo = 96352;
update Empleados set Fnacimiento = to_date('02/03/1969', 'DD/MM/YYYY') where C�digo = 76543;
update Empleados set Fnacimiento = to_date('09/12/1973', 'DD/MM/YYYY') where C�digo = 73152;
update Empleados set Fnacimiento = to_date('20/01/1964', 'DD/MM/YYYY') where C�digo = 64738;

---------------------------------------------------------------------
--  1. Obtenemos el c�digo y nombre de todos los departamentos
---------------------------------------------------------------------
SELECT nombre, c�digo FROM DEPARTAMENTOS;
---------------------------------------------------------------------
--  2. Obtenemos mes y ejercicio de los justificantes de n�mina del
--     empleado cuyo c�digo es 1
---------------------------------------------------------------------
SELECT mes, ejercicio FROM JUST_N�MINAS, EMPLEADOS WHERE c�digo = 1 AND empleados.c�digo = just_n�minas.cod_emp;
---------------------------------------------------------------------
--  3. Obtenemos n�mero de cuenta y nombre de los empleados cuya
--     retenci�n sea mayor o igual a 10
---------------------------------------------------------------------
SELECT cuenta, nombre FROM EMPLEADOS WHERE retenci�n >= 10;
---------------------------------------------------------------------
--  4. Obtenemos el c�digo y nombre de los empleados, ordenados
--     ascendentemente seg�n el nombre
---------------------------------------------------------------------
SELECT c�digo, nombre FROM EMPLEADOS ORDER BY nombre;
---------------------------------------------------------------------
--  5. Obtenemos el nombre de los empleados con m�s de 2 hijos
---------------------------------------------------------------------
SELECT nombre FROM EMPLEADOS WHERE hijos >2;
---------------------------------------------------------------------
--  6. Obtenemos el c�digo y nombre de cuenta de los empleados cuyo
--     nombre empiece por 'A' o 'J'
---------------------------------------------------------------------
SELECT c�digo, nombre AS "nombre de cuenta" FROM EMPLEADOS WHERE REGEXP_LIKE(nombre,'^A|J');
---------------------------------------------------------------------
--  7. Obtenemos el n�mero de empleados que hay en la base de datos
---------------------------------------------------------------------
SELECT COUNT(*) FROM EMPLEADOS;
---------------------------------------------------------------------
--  8. Obtenemos el nombre del primer y del �ltimo empleado, ordenados
--     alfab�ticamente
---------------------------------------------------------------------
SELECT nombre FROM EMPLEADOS WHERE c�digo IN (1,(SELECT MAX(c�digo) FROM EMPLEADOS));
---------------------------------------------------------------------
--  9. Obtenemos el nombre y el n�mero de hijos de los empleados cuya
--     retenci�n sea 8, 10 � 12
---------------------------------------------------------------------
SELECT nombre, hijos FROM EMPLEADOS WHERE retenci�n IN(8,10,12);
---------------------------------------------------------------------
-- 10. Obtenemos el n�mero de hijos y el n�mero de empleados, agrupados
--     por hijos, mostrando s�lo los grupos con m�s de un empleado
---------------------------------------------------------------------
SELECT hijos, COUNT(*) AS empleados FROM EMPLEADOS GROUP BY hijos  HAVING COUNT(*) > 1;
---------------------------------------------------------------------
-- 11. Obtenemos el n�mero de hijos, la retenci�n m�xima, m�nima y 
--     media de los empleados agrupados por el n�mero de hijos
---------------------------------------------------------------------
SELECT hijos, MAX(retenci�n) AS "M�xima re
tenci�n", MIN(retenci�n) AS "M�nima retenci�n", AVG(retenci�n) AS "retenci�n media" FROM EMPLEADOS GROUP BY hijos;
---------------------------------------------------------------------
-- 12. Obtenemos el nombre y la funci�n de los empleados que han
--     trabajado en el departamento n�mero 1
---------------------------------------------------------------------
SELECT nombre, funci�n FROM EMPLEADOS, TRABAJAN WHERE empleados.c�digo = trabajan.cod_emp AND cod_dep=1;
---------------------------------------------------------------------
-- 13. Obtenemos el nombre del empleado, el nombre del departamento y
--     la funci�n realizada por los empleados con un hijo
---------------------------------------------------------------------
SELECT empleados.nombre, departamentos.nombre AS departamento, funci�n FROM EMPLEADOS, DEPARTAMENTOS, TRABAJAN WHERE empleados.c�digo = trabajan.cod_emp AND trabajan.cod_dep = departamentos.c�digo AND hijos = 1;
---------------------------------------------------------------------
-- 14. Obtenemos el nombre del empleado y el del departamento en el
--     que han trabajado empleados sin hijos
---------------------------------------------------------------------
SELECT empleados.nombre, departamentos.nombre AS departamento FROM EMPLEADOS, DEPARTAMENTOS, TRABAJAN WHERE empleados.c�digo = trabajan.cod_emp AND trabajan.cod_dep = departamentos.c�digo AND hijos = 0;
---------------------------------------------------------------------
-- 15. Obtenemos el nombre del empleado, mes y ejercicio de sus justificantes
--     de n�mina, n�mero de l�nea y cantidad de l�neas de los justificantes
--     del empleado con el c�digo 1
---------------------------------------------------------------------
SELECT nombre, just_n�minas.mes, just_n�minas.ejercicio, n�mero AS l�nea, cantidad FROM EMPLEADOS, JUST_N�MINAS, L�NEAS WHERE c�digo = 1;
---------------------------------------------------------------------
-- 16. Obtenemos el nombre del empleado, el mes y el ejercicio de sus
--     justificantes de n�mina para los empleados que han trabajado
--     en el departamento de Ventas
---------------------------------------------------------------------
SELECT DISTINCT empleados.nombre, just_n�minas.mes, just_n�minas.ejercicio, departamentos.nombre FROM EMPLEADOS, DEPARTAMENTOS, JUST_N�MINAS, TRABAJAN WHERE departamentos.nombre= 'Ventas' AND departamentos.c�digo = trabajan.cod_dep AND empleados.c�digo=trabajan.cod_emp;
---------------------------------------------------------------------
-- 17. Obtenemos el nombre del empleado y los ingresos percibidos
--     agrupados por nombre
---------------------------------------------------------------------
SELECT nombre, SUM(ingreso) FROM EMPLEADOS, JUST_N�MINAS WHERE c�digo = cod_emp GROUP BY nombre;
---------------------------------------------------------------------
-- 18. Obtenemos el nombre de los empleados que han ganado m�s de
--     2000� en el a�o 2006
---------------------------------------------------------------------
SELECT DISTINCT nombre FROM EMPLEADOS, JUST_N�MINAS WHERE empleados.c�digo = (SELECT cod_emp FROM JUST_N�MINAS HAVING SUM(ingreso) > 2000);  
SELECT cod_emp,  FROM just_n�minas WHERE ejercicio = 2006 AND SUM(ingreso) >2000 GROUP BY cod_emp;
---------------------------------------------------------------------
-- 19. Obtenemos el n�mero de empleados con el n�mero de hijos mayor
--     a la media de los hijos de los empleados
---------------------------------------------------------------------
SELECT COUNT(*) AS empleados FROM EMPLEADOS WHERE hijos > (SELECT AVG(hijos) FROM EMPLEADOS);
---------------------------------------------------------------------
-- 20. Obtenemos el nombre de los empleados con m�s y menos hijos
---------------------------------------------------------------------
SELECT nombre FROM EMPLEADOS WHERE hijos = (SELECT MAX(hijos) FROM EMPLEADOS) OR hijos = (SELECT MIN(hijos) FROM EMPLEADOS);
---------------------------------------------------------------------
-- 21. Obtenemos el nombre de los empleados que no tienen ning�n
--     justificante de n�minas
---------------------------------------------------------------------
SELECT DISTINCT nombre FROM EMPLEADOS, JUST_N�MINAS WHERE empleados.c�digo NOT IN(SELECT cod_emp FROM JUST_N�MINAS);
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
--     en los que ha trabajado y la funci�n (en may�sculas) que ha 
--     realizado en cada departamento
---------------------------------------------------------------------
SELECT DISTINCT empleados.nombre, departamentos.nombre AS departamento, UPPER(funci�n) AS funci�n FROM DEPARTAMENTOS, EMPLEADOS, TRABAJAN WHERE empleados.c�digo = trabajan.cod_emp AND cod_dep = departamentos.c�digo;
---------------------------------------------------------------------
-- 25. Obtenemos el nombre, la fecha de nacimiento y el nombre del d�a
--     de la semana de la fecha de nacimiento de todos los empleados
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR(fnacimiento),'-') AS nacimiento, NVL(TO_CHAR((EXTRACT (DAY FROM fnacimiento))), '-') AS d�a FROM EMPLEADOS;
---------------------------------------------------------------------
-- 26. Obtenemos el nombre y la edad de los empleados
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR((EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento)))), '---') AS edad FROM EMPLEADOS;
---------------------------------------------------------------------
-- 27. Obtenemos el nombre, la edad y el n�mero de hijos de los empleados
--     que tienen m�s de 40 a�os y con hijos
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR((EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento)))), '---') AS edad, hijos FROM EMPLEADOS WHERE (EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento))) > 40 and hijos >=1;
---------------------------------------------------------------------
-- 28. Obtenemos el nombre y la edad de los empleados, y, tambi�n el
--     nombre del departamento de los empleados que han trabajado en
--     m�s de un departamento
---------------------------------------------------------------------
SELECT nombre AS empleados FROM EMPLEADOS WHERE c�digo IN ((SELECT trabajan.cod_emp AS trabajador FROM TRABAJAN GROUP BY trabajan.cod_emp HAVING COUNT(cod_dep) > 1));
---------------------------------------------------------------------
-- 29. Obtenemos el nombre, la edad y el n�mero de cuenta de los empleados
--     cuya edad sea m�ltiplo de 3
---------------------------------------------------------------------
SELECT nombre, NVL(TO_CHAR((EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento)))), '---') AS edad, cuenta FROM EMPLEADOS WHERE (EXTRACT(YEAR FROM SYSDATE)-(EXTRACT (YEAR FROM fnacimiento))/3) = 0;
---------------------------------------------------------------------
-- 30. Obtenemos el nombre y los ingresos percibidos del empleado
--     m�s joven y del m�s longevo
---------------------------------------------------------------------
SELECT nombre AS EMPLEADOS, SUM(ingreso) FROM EMPLEADOS, JUST_N�MINAS WHERE fnacimiento = (SELECT MAX(fnacimiento)FROM EMPLEADOS) AND fnacimiento = (SELECT MAX(fnacimiento)FROM EMPLEADOS) GROUP BY nombre;
SELECT nombre, SUM(ingreso) AS ingresos FROM EMPLEADOS, JUST_N�MINAS GROUP BY nombre HAVING fnacimiento = (SELECT MAX(fnacimiento)FROM EMPLEADOS) OR fnacimiento = (SELECT MIN(fnacimiento)FROM EMPLEADOS);