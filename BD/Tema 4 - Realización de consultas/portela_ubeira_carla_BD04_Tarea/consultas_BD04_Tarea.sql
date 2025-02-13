-- CONSULTAS
-- Ver el usuario conectado:
SELECT user FROM dual;
/*Oracle proporciona la tabla DUAL, una tabla de pruebas que contiene un �nico campo (DUMMY)
y una sola fila*/
-- Ver tablas
SELECT table_name FROM tabs;
SELECT * FROM centro;
SELECT * FROM dpto;
SELECT * FROM empleado;
SELECT * FROM categoria;

-- 1.Obtener los nombres y salarios de los empleados con m�s de 1000 euros de salario por orden alfab�tico.
SELECT nombre, salario || ' �' AS salario FROM empleado WHERE salario > 1000 ORDER BY nombre;

/* Al ser ordenaci�n ascendente no es necesario especificarlo*/

-- 2.Obtener el nombre de los empleados cuya comisi�n es superior al 20% de su salario.
SELECT nombre, comision, salario FROM empleado WHERE (comision > 20 * salario / 100);

-- 3.Obtener el c�digo de empleado, c�digo de departamento, nombre y sueldo total en pesetas de aquellos empleados cuyo sueldo total (salario m�s comisi�n) supera los 1800 euros. Presentarlos ordenados por c�digo de departamento y dentro de �stos por orden alfab�tico.
SELECT codemple AS id_empleado, coddpto AS departamento, nombre, ((salario+comision)*166.386)||' pesetas' AS total_salario_pesetas FROM empleado empleados WHERE (empleados.salario + empleados.comision > 1800) ORDER BY coddpto, nombre;

-- 4.Obtener por orden alfab�tico los nombres de empleados cuyo salario igualen o superen en m�s de un 5% al salario de la empleada �MARIA JAZMIN�.
SELECT nombre FROM empleado empleados WHERE empleados.salario >= (SELECT 1.05 * empleados.salario FROM empleado empleados WHERE (empleados.nombre = 'MARIA' AND empleados.Ape1= 'JAZMIN')) ORDER BY nombre;

/*Utilizamos el operador de comparaci�n '>=' y el operador l�gico 'AND' para evaluar si se cumple una condici�n establecida en la cl�usula WHERE
  Y adem�s realizamos una subconsulta (del salario de Mar�a Jazm�n, m�s el incremento del 5% de su salario) que nos devuelve un valor �nico 
  que ha de ser del mismo tipo que los datos de la columna con la que se compara.
  Se multiplica por 1.05 ya que ser�a la suma de una unidad de salario m�s el 5% calculado sobre ese salario*/

-- 5.Obtener una listado ordenado por a�os en la empresa con los nombres, y apellidos de los empleados y los a�os de antig�edad en la empresa
SELECT ROUND((SYSDATE-FechaIngreso)/365)||' a�os' AS "ANTIG�EDAD", nombre, Ape1||' '||Ape2 AS apellidos FROM empleado empleados ORDER BY "ANTIG�EDAD";
SELECT (EXTRACT (year FROM SYSDATE)- EXTRACT (year FROM FechaIngreso)) AS antiguedad, nombre, ape1 || ' ' || ape2 FROM EMPLEADO ORDER BY antiguedad; 
/*Utilizamos la funci�n ROUND para redondear el c�lculo de a�os de antig�edad a partir de la diferencia entre la fecha actual y la fecha de ingreso
  La cual nos devuelve un valor en d�as que dividimos entre 365 para obtener los a�os
  Para proporcionar un alias literal a una columna, que por ejemplo conste de caracteres especiales, lo hacemos mediante el uso de comillas dobles*/
  
-- 6.Obtener el nombre de los empleados que trabajan en un departamento con presupuesto superior a 50.000 euros. Hay que usar predicado cuantificado
SELECT nombre FROM empleado empleados WHERE (empleados.coddpto = ANY (SELECT departamentos.coddpto FROM dpto departamentos WHERE (departamentos.presupuesto > 50000)));
SELECT nombre FROM EMPLEADO, DPTO WHERE dpto.presupuesto > 50000 AND dpto.coddpto = empleado.coddpto;
/*Un predicado cuantificado compara un valor o valores con una colecci�n de valores.
  Si el valor que devuelve una subconsulta no es �nico, como en este caso, debemos de utilizar las palabras reservadas como ANY, ALL, IN o NOT IN.
  Cuando se especifica ALL el resultado es verdadero si la relaci�n especificada es verdadera para cada valor que devuelva la selecci�n completa.
  Cuando se especifica SOME o ANY el resultado es verdadero si la relaci�n especificada es verdadera para cada valor de una fila como m�nimo.*/
  
-- 7.Obtener los nombres y apellidos de empleados que m�s cobran en la empresa.Considerar el salario m�s la comisi�n,
SELECT nombre, Ape1 || ' ' || Ape2 AS apellidos FROM empleado WHERE (salario + comision = ANY (SELECT MAX (salario + comision) FROM empleado));


/*Realizamos una subconsulta del salario total m�s alto de entre todos los empleados mediante la funci�n MAX*/ 

-- 8.Obtener en orden alfab�tico los nombres de empleado cuyo salario es inferior al m�nimo de los empleados del departamento 1.
SELECT nombre || ' ' || ape1 || ' '|| ape2 AS nombre_y_apellidos FROM empleado empleados WHERE ((salario < ANY (SELECT MIN(salario) FROM empleado empleados WHERE empleados.coddpto = 1))) ORDER BY nombre;
SELECT nombre FROM EMPLEADO WHERE salario < (SELECT MIN(salario) FROM EMPLEADO WHERE coddpto = 1);

/*Realizamos una subconsulta del salario m�s bajo de entre todos los empleados del departamento con c�digo 1, mediante la funci�n MIN*/

-- 9.Obtener los nombre de empleados que trabajan en el departamento del cu�l es jefe el empleado con c�digo 1.
SELECT nombre FROM empleado empleados WHERE (coddpto = ANY (SELECT coddpto FROM dpto departamentos WHERE codemplejefe = 1));

/*Realizamos una subconsulta por la que obtenemos el c�digo del departamento cuyo jefe tiene el identificador de empleado 1*/

-- 10.Obtener los nombres de los empleados cuyo primer apellido empiece por las letras p, q, r, s.
SELECT nombre FROM empleado empleados WHERE (LOWER(SUBSTR(Ape1,1,1)) IN ('p', 'q', 'r', 's'));
SELECT nombre FROM EMPLEADO WHERE REGEXP_LIKE(LOWER(ape1),'^[pqrs]');
/*Mediante la funci�n SUBSTR se obtiene una subcadena a partir de la posicion m con longitud n
  Mediante la funcion LOWER Obtenemos la cadena de caracteres en min�sculas*/
  
-- 11.Obtener los empleados cuyo nombre de pila contenga el nombre JUAN.
SELECT nombre || ' ' || ape1 || ' '|| ape2 AS empleado FROM empleado empleados WHERE (nombre LIKE('%JUAN%'));
SELECT nombre FROM EMPLEADO WHERE REGEXP_LIKE(UPPER(nombre),'(JUAN)+');

/*Utilizo el operador de comparaci�n LIKE y mediante % indico que puede haber caracteres antes y despuesta de la cadena de caracteres JUAN
  Adem�s empleo los alias en columnas y tablas para mejorar la legibilidad y suprimir ambig�edades en los nombres de columnas y tablas,
  mediante el uso de AS en el caso de columnas, y dejando un espacio entre el nombre de la tabla y el alias de la misma*/
  
-- 12.Obtener los nombres de los empleados que viven en ciudades en las que hay alg�n centro de trabajo
SELECT nombre FROM empleado empleados, centro centros WHERE (UPPER(empleados.localidad) = SOME UPPER(centros.localidad));
SELECT nombre FROM EMPLEADO WHERE localidad = ANY (SELECT UPPER(localidad) FROM CENTRO);
/*Para evitar ambig�edad en columnas con misma denominaci�n de tablas diferentes, especificamos el alias de la tabla a la que pertenece cada columna.
  Adem�s mediante la funci�n UPPER nos cercioramos de que no exista discriminaci�n de coincidencias por min�sculas*/
  
-- 13.Obtener el nombre del jefe de departamento que tiene mayor salario de entre los jefes de departamento.
SELECT nombre AS jefe_departamento FROM empleado empleados WHERE empleados.salario = (SELECT MAX(empleados.salario) FROM empleado empleados WHERE (empleados.codemple IN (SELECT departamentos.codemplejefe FROM dpto departamentos)));
SELECT nombre FROM EMPLEADO, DPTO WHERE empleado.codemple = dpto.codemplejefe AND salario = (SELECT MAX(salario) FROM EMPLEADO);

/*Realizamos subconsultas para seleccionar los id de empleados que coincidan con los id de jefe y cuyo salario sea el mayor de entre todos los jefes de */

-- 14.Obtener en orden alfab�tico los salarios y nombres de los empleados cuyo salario sea superior al 60% del m�ximo salario de la empresa.
SELECT salario || ' �', nombre AS nombre_empleado FROM empleado empleados WHERE (salario > 0.6*(SELECT MAX(empleados.salario) AS salario_maximo FROM empleado empleados)) ORDER BY nombre;
SELECT salario, nombre from EMPLEADO WHERE salario > 0.6 *(SELECT MAX(salario) FROM EMPLEADO) ORDER BY nombre;
-- 15.Obtener en cu�ntas ciudades distintas viven los empleados
SELECT COUNT(DISTINCT empleados.localidad) AS numero_ciudades_distintas FROM empleado empleados;

/*Mediante la funci�n COUNT contamos los elementos del campo localidad, con el modificador DISTINCT todas las repeticiones se consideran un �nico valor y le agregamos un alias a la columna mediante AS*/

-- 16.El nombre y apellidos del empleado que m�s salario cobra
SELECT nombre||' '||ape1||' ' ||ape2 AS nombre_y_apellidos FROM empleado empleados WHERE salario = (SELECT MAX(salario) FROM empleado empleados);

-- 17.Obtener las localidades y n�mero de empleados de aquellas en las que viven m�s de 3 empleados
SELECT localidad, COUNT(*) AS numero_empleados FROM empleado empleados GROUP BY localidad HAVING COUNT(*) > 3;
SELECT localidad, COUNT (codemple) AS empleados FROM EMPLEADO GROUP BY localidad HAVING COUNT(codemple)>3;

/*Mediante el '*' seleccionamos todas las registros*/

-- 18.Obtener para cada departamento cu�ntos empleados trabajan, la suma de sus salarios y la suma de sus comisiones para aquellos departamentos en los que hay alg�n empleado cuyo salario es superior a 1700 euros.
SELECT coddpto AS departamento, COUNT(*) AS num_empleados, SUM(salario) AS total_salarios, SUM(COALESCE(comision, 0)) AS total_comisiones FROM empleado empleados WHERE salario > 1700 GROUP BY coddpto;
SELECT coddpto, COUNT(codemple) AS empleados, SUM(salario) AS salarios, SUM(COALESCE(comision,0)) AS comisiones FROM EMPLEADO GROUP BY coddpto HAVING coddpto = ANY(SELECT coddpto FROM EMPLEADO WHERE salario >1700);
/*Mediante la funci�n COALESCE manejamos valores nulos (durante el proceso de evaluaci�n de expresiones, los valores nulos se reemplazan con el valor definido)*/

-- 19.Obtener el departamento que m�s empleados tiene
SELECT coddpto AS departamento, COUNT(*) AS numero_empleados FROM empleado empleados GROUP BY coddpto ORDER BY COUNT(*) DESC FETCH FIRST 1 ROW ONLY;
SELECT coddpto FROM EMPLEADO GROUP BY coddpto ORDER BY COUNT(*) DESC Fetch FIRST 1 ROW ONLY  ;

/*Se emplea FETCH FIRST n ROWS ONLY para especificar el n�mero de resgistros que queremos que se nos devuelvan y DESC para ordenarlos de manera descendente (los que tengan m�s n�mero de empleados primero*/

-- 20.Obtener los nombres de todos los centros y los departamentos que se ubican en cada uno,as� como aquellos centros que no tienen departamentos.
SELECT centros.direccion AS nombre_centro, departamentos.denominacion AS nombre_departamento FROM dpto departamentos, centro centros WHERE centros.codcentro=departamentos.codcentro;
SELECT centro.codcentro, coddpto FROM CENTRO RIGHT OUTER JOIN DPTO ON centro.codcentro = dpto.codcentro;
-- 21.Obtener el nombre del departamento de m�s alto nivel, es decir, aquel que no depende de ning�n otro.
SELECT denominacion AS departamento FROM dpto departamentos WHERE coddptodepende IS NULL;

/*Mediante el operador de comparaci�n IS NULL obtenemos true si el valor de la columna es nulo */

-- 22.Obtener todos los departamentos existentes en la empresa y los empleados (si los tiene) que pertenecen a �l.
SELECT departamentos.denominacion AS departamento, empleados.nombre || ' ' || empleados.ape1 || ' ' || empleados.ape2 as empleado FROM dpto departamentos, empleado empleados WHERE (departamentos.coddpto = empleados.coddpto) ORDER BY departamento;
SELECT denominacion, nombre, ape1 || ' ' || ape2 as apellidos FROM DPTO, EMPLEADO WHERE dpto.coddpto = empleado.coddpto ORDER BY denominacion;
SELECT  denominacion, nombre, ape1 || ' ' || ape2 as apellidos FROM EMPLEADO INNER JOIN DPTO ON dpto.coddpto = empleado.coddpto ORDER BY denominacion;
-- 23.Obtener un listado en el que aparezcan todos los departamentos existentes y el departamento del cual depende,si depende de alguno.
SELECT d1.denominacion as departamento, NVL(d2.denominacion, '---') AS depende_de FROM dpto d1 left join dpto d2 on d2.coddpto = d1.coddptodepende;
SELECT d1.denominacion, d2.denominacion FROM DPTO d1 LEFT OUTER JOIN DPTO d2 ON d1.coddptodepende = d2.coddpto ORDER BY d1.denominacion;
/*Utilizamos la composici�n JOIN ON de la versi�n SQL99 para unir varias tablas y 
  mediante la funci�n con nulos NVL devolvemos la expresi�n establecida cuando el valor es nulo*/

-- 24.Obtener un listado ordenado alfab�ticamente donde aparezcan los nombres de los empleados y a continuaci�n el literal "tiene comisi�n" si la tiene,y "no tiene comisi�n" si no la tiene.
SELECT nombre || ' ' || ape1  || ' ' || ape2 AS empleado, 
    CASE
        WHEN comision IS NOT NULL THEN 'tiene comisi�n'
        ELSE 'no tiene comisi�n'
    END AS comision FROM empleado empleados ORDER BY nombre, ape1;
SELECT nombre,
        CASE
            WHEN comision IS NOT NULL THEN 'tiene comision'
            ELSE 'no tiene comision'
        END AS comision FROM EMPLEADO ORDER BY nombre;    
/*La declaraci�n de la sentencia CASE retorna un valor en una condici�n especificada;
  en este caso, si el valor del campo comision no es nulo retornar� un cadena y en caso contrario, retornara otra cadena de caracteres*/
  
-- 25.Obtener un listado de las localidades en las que hay centros y no vive ning�n empleado ordenado alfab�ticamente.
SELECT DISTINCT centros.localidad AS localidad FROM centro centros, empleado empleados WHERE centros.localidad != empleados.localidad ORDER BY localidad;
SELECT DISTINCT centro.localidad FROM CENTRO INNER JOIN EMPLEADO ON centro.localidad != empleado.localidad;
/*Mediante DISTINCT se suprimen aquellas filas que tengan igual valor que otras*/

-- 26.Obtener un listado de las localidades en las que hay centros y adem�s vive al menos un empleado ordenado alfab�ticamente.

SELECT DISTINCT centros.localidad AS localidad FROM centro centros, empleado empleados WHERE centros.localidad = empleados.localidad ORDER BY localidad;

-- 27.Esta cuesti�n punt�a por 2. Se desea dar una gratificaci�n por navidades en funci�n de la antig�edad en la empresa siguiendo estas pautas:
-- Si lleva entre 1 y 5 a�os, se le dar� 100 euros
-- Si lleva entre 6 y 10 a�os, se le dar� 50 euros por a�o
-- Si lleva entre 11 y 20 a�os, se le dar� 70 euros por a�o
-- Si lleva m�s de 21 a�os, se le dar� 100 euros por a�o
-- Obtener un listado de los empleados,ordenado alfab�ticamente,indicando cu�nto le corresponde de gratificaci�n.
SELECT nombre || ' ' || ape1 || ' ' || ape2 AS empleado,
    CASE
        WHEN ROUND((SYSDATE - fechaingreso)/365) BETWEEN 1 AND 5 THEN 100
        WHEN ROUND((SYSDATE - fechaingreso)/365) BETWEEN 6 AND 10 THEN 50*(ROUND((SYSDATE - fechaingreso)/365))
        WHEN ROUND((SYSDATE - fechaingreso)/365) BETWEEN 11 AND 20 THEN 70*(ROUND((SYSDATE - fechaingreso)/365))
        WHEN ROUND((SYSDATE - fechaingreso)/365) >= 21 THEN 100*(ROUND((SYSDATE - fechaingreso)/365))
        ELSE 0
    END AS gratificacion FROM empleado empleados ORDER BY nombre;   
    
-- 28.Obtener a los nombres, apellidos de los empleados que no son jefes de departamento.
SELECT nombre, ape1 || ' ' || ape2 AS apellidos FROM empleado empleados WHERE empleados.codemple NOT IN (SELECT departamentos.codemplejefe FROM dpto departamentos) ;
 

/*Con el operador de comparaci�n NOT IN obtenemos los resultados que son distintos al contenido del par�ntesis*/
