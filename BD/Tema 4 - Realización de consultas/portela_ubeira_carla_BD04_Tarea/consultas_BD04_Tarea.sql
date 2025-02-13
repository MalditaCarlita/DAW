-- CONSULTAS
-- Ver el usuario conectado:
SELECT user FROM dual;
/*Oracle proporciona la tabla DUAL, una tabla de pruebas que contiene un único campo (DUMMY)
y una sola fila*/
-- Ver tablas
SELECT table_name FROM tabs;
SELECT * FROM centro;
SELECT * FROM dpto;
SELECT * FROM empleado;
SELECT * FROM categoria;

-- 1.Obtener los nombres y salarios de los empleados con más de 1000 euros de salario por orden alfabético.
SELECT nombre, salario || ' €' AS salario FROM empleado WHERE salario > 1000 ORDER BY nombre;

/* Al ser ordenación ascendente no es necesario especificarlo*/

-- 2.Obtener el nombre de los empleados cuya comisión es superior al 20% de su salario.
SELECT nombre, comision, salario FROM empleado WHERE (comision > 20 * salario / 100);

-- 3.Obtener el código de empleado, código de departamento, nombre y sueldo total en pesetas de aquellos empleados cuyo sueldo total (salario más comisión) supera los 1800 euros. Presentarlos ordenados por código de departamento y dentro de éstos por orden alfabético.
SELECT codemple AS id_empleado, coddpto AS departamento, nombre, ((salario+comision)*166.386)||' pesetas' AS total_salario_pesetas FROM empleado empleados WHERE (empleados.salario + empleados.comision > 1800) ORDER BY coddpto, nombre;

-- 4.Obtener por orden alfabético los nombres de empleados cuyo salario igualen o superen en más de un 5% al salario de la empleada ‘MARIA JAZMIN’.
SELECT nombre FROM empleado empleados WHERE empleados.salario >= (SELECT 1.05 * empleados.salario FROM empleado empleados WHERE (empleados.nombre = 'MARIA' AND empleados.Ape1= 'JAZMIN')) ORDER BY nombre;

/*Utilizamos el operador de comparación '>=' y el operador lógico 'AND' para evaluar si se cumple una condición establecida en la cláusula WHERE
  Y además realizamos una subconsulta (del salario de María Jazmín, más el incremento del 5% de su salario) que nos devuelve un valor único 
  que ha de ser del mismo tipo que los datos de la columna con la que se compara.
  Se multiplica por 1.05 ya que sería la suma de una unidad de salario más el 5% calculado sobre ese salario*/

-- 5.Obtener una listado ordenado por años en la empresa con los nombres, y apellidos de los empleados y los años de antigüedad en la empresa
SELECT ROUND((SYSDATE-FechaIngreso)/365)||' años' AS "ANTIGÜEDAD", nombre, Ape1||' '||Ape2 AS apellidos FROM empleado empleados ORDER BY "ANTIGÜEDAD";
SELECT (EXTRACT (year FROM SYSDATE)- EXTRACT (year FROM FechaIngreso)) AS antiguedad, nombre, ape1 || ' ' || ape2 FROM EMPLEADO ORDER BY antiguedad; 
/*Utilizamos la función ROUND para redondear el cálculo de años de antigüedad a partir de la diferencia entre la fecha actual y la fecha de ingreso
  La cual nos devuelve un valor en días que dividimos entre 365 para obtener los años
  Para proporcionar un alias literal a una columna, que por ejemplo conste de caracteres especiales, lo hacemos mediante el uso de comillas dobles*/
  
-- 6.Obtener el nombre de los empleados que trabajan en un departamento con presupuesto superior a 50.000 euros. Hay que usar predicado cuantificado
SELECT nombre FROM empleado empleados WHERE (empleados.coddpto = ANY (SELECT departamentos.coddpto FROM dpto departamentos WHERE (departamentos.presupuesto > 50000)));
SELECT nombre FROM EMPLEADO, DPTO WHERE dpto.presupuesto > 50000 AND dpto.coddpto = empleado.coddpto;
/*Un predicado cuantificado compara un valor o valores con una colección de valores.
  Si el valor que devuelve una subconsulta no es único, como en este caso, debemos de utilizar las palabras reservadas como ANY, ALL, IN o NOT IN.
  Cuando se especifica ALL el resultado es verdadero si la relación especificada es verdadera para cada valor que devuelva la selección completa.
  Cuando se especifica SOME o ANY el resultado es verdadero si la relación especificada es verdadera para cada valor de una fila como mínimo.*/
  
-- 7.Obtener los nombres y apellidos de empleados que más cobran en la empresa.Considerar el salario más la comisión,
SELECT nombre, Ape1 || ' ' || Ape2 AS apellidos FROM empleado WHERE (salario + comision = ANY (SELECT MAX (salario + comision) FROM empleado));


/*Realizamos una subconsulta del salario total más alto de entre todos los empleados mediante la función MAX*/ 

-- 8.Obtener en orden alfabético los nombres de empleado cuyo salario es inferior al mínimo de los empleados del departamento 1.
SELECT nombre || ' ' || ape1 || ' '|| ape2 AS nombre_y_apellidos FROM empleado empleados WHERE ((salario < ANY (SELECT MIN(salario) FROM empleado empleados WHERE empleados.coddpto = 1))) ORDER BY nombre;
SELECT nombre FROM EMPLEADO WHERE salario < (SELECT MIN(salario) FROM EMPLEADO WHERE coddpto = 1);

/*Realizamos una subconsulta del salario más bajo de entre todos los empleados del departamento con código 1, mediante la función MIN*/

-- 9.Obtener los nombre de empleados que trabajan en el departamento del cuál es jefe el empleado con código 1.
SELECT nombre FROM empleado empleados WHERE (coddpto = ANY (SELECT coddpto FROM dpto departamentos WHERE codemplejefe = 1));

/*Realizamos una subconsulta por la que obtenemos el código del departamento cuyo jefe tiene el identificador de empleado 1*/

-- 10.Obtener los nombres de los empleados cuyo primer apellido empiece por las letras p, q, r, s.
SELECT nombre FROM empleado empleados WHERE (LOWER(SUBSTR(Ape1,1,1)) IN ('p', 'q', 'r', 's'));
SELECT nombre FROM EMPLEADO WHERE REGEXP_LIKE(LOWER(ape1),'^[pqrs]');
/*Mediante la función SUBSTR se obtiene una subcadena a partir de la posicion m con longitud n
  Mediante la funcion LOWER Obtenemos la cadena de caracteres en minúsculas*/
  
-- 11.Obtener los empleados cuyo nombre de pila contenga el nombre JUAN.
SELECT nombre || ' ' || ape1 || ' '|| ape2 AS empleado FROM empleado empleados WHERE (nombre LIKE('%JUAN%'));
SELECT nombre FROM EMPLEADO WHERE REGEXP_LIKE(UPPER(nombre),'(JUAN)+');

/*Utilizo el operador de comparación LIKE y mediante % indico que puede haber caracteres antes y despuesta de la cadena de caracteres JUAN
  Además empleo los alias en columnas y tablas para mejorar la legibilidad y suprimir ambigüedades en los nombres de columnas y tablas,
  mediante el uso de AS en el caso de columnas, y dejando un espacio entre el nombre de la tabla y el alias de la misma*/
  
-- 12.Obtener los nombres de los empleados que viven en ciudades en las que hay algún centro de trabajo
SELECT nombre FROM empleado empleados, centro centros WHERE (UPPER(empleados.localidad) = SOME UPPER(centros.localidad));
SELECT nombre FROM EMPLEADO WHERE localidad = ANY (SELECT UPPER(localidad) FROM CENTRO);
/*Para evitar ambigüedad en columnas con misma denominación de tablas diferentes, especificamos el alias de la tabla a la que pertenece cada columna.
  Además mediante la función UPPER nos cercioramos de que no exista discriminación de coincidencias por minúsculas*/
  
-- 13.Obtener el nombre del jefe de departamento que tiene mayor salario de entre los jefes de departamento.
SELECT nombre AS jefe_departamento FROM empleado empleados WHERE empleados.salario = (SELECT MAX(empleados.salario) FROM empleado empleados WHERE (empleados.codemple IN (SELECT departamentos.codemplejefe FROM dpto departamentos)));
SELECT nombre FROM EMPLEADO, DPTO WHERE empleado.codemple = dpto.codemplejefe AND salario = (SELECT MAX(salario) FROM EMPLEADO);

/*Realizamos subconsultas para seleccionar los id de empleados que coincidan con los id de jefe y cuyo salario sea el mayor de entre todos los jefes de */

-- 14.Obtener en orden alfabético los salarios y nombres de los empleados cuyo salario sea superior al 60% del máximo salario de la empresa.
SELECT salario || ' €', nombre AS nombre_empleado FROM empleado empleados WHERE (salario > 0.6*(SELECT MAX(empleados.salario) AS salario_maximo FROM empleado empleados)) ORDER BY nombre;
SELECT salario, nombre from EMPLEADO WHERE salario > 0.6 *(SELECT MAX(salario) FROM EMPLEADO) ORDER BY nombre;
-- 15.Obtener en cuántas ciudades distintas viven los empleados
SELECT COUNT(DISTINCT empleados.localidad) AS numero_ciudades_distintas FROM empleado empleados;

/*Mediante la función COUNT contamos los elementos del campo localidad, con el modificador DISTINCT todas las repeticiones se consideran un único valor y le agregamos un alias a la columna mediante AS*/

-- 16.El nombre y apellidos del empleado que más salario cobra
SELECT nombre||' '||ape1||' ' ||ape2 AS nombre_y_apellidos FROM empleado empleados WHERE salario = (SELECT MAX(salario) FROM empleado empleados);

-- 17.Obtener las localidades y número de empleados de aquellas en las que viven más de 3 empleados
SELECT localidad, COUNT(*) AS numero_empleados FROM empleado empleados GROUP BY localidad HAVING COUNT(*) > 3;
SELECT localidad, COUNT (codemple) AS empleados FROM EMPLEADO GROUP BY localidad HAVING COUNT(codemple)>3;

/*Mediante el '*' seleccionamos todas las registros*/

-- 18.Obtener para cada departamento cuántos empleados trabajan, la suma de sus salarios y la suma de sus comisiones para aquellos departamentos en los que hay algún empleado cuyo salario es superior a 1700 euros.
SELECT coddpto AS departamento, COUNT(*) AS num_empleados, SUM(salario) AS total_salarios, SUM(COALESCE(comision, 0)) AS total_comisiones FROM empleado empleados WHERE salario > 1700 GROUP BY coddpto;
SELECT coddpto, COUNT(codemple) AS empleados, SUM(salario) AS salarios, SUM(COALESCE(comision,0)) AS comisiones FROM EMPLEADO GROUP BY coddpto HAVING coddpto = ANY(SELECT coddpto FROM EMPLEADO WHERE salario >1700);
/*Mediante la función COALESCE manejamos valores nulos (durante el proceso de evaluación de expresiones, los valores nulos se reemplazan con el valor definido)*/

-- 19.Obtener el departamento que más empleados tiene
SELECT coddpto AS departamento, COUNT(*) AS numero_empleados FROM empleado empleados GROUP BY coddpto ORDER BY COUNT(*) DESC FETCH FIRST 1 ROW ONLY;
SELECT coddpto FROM EMPLEADO GROUP BY coddpto ORDER BY COUNT(*) DESC Fetch FIRST 1 ROW ONLY  ;

/*Se emplea FETCH FIRST n ROWS ONLY para especificar el número de resgistros que queremos que se nos devuelvan y DESC para ordenarlos de manera descendente (los que tengan más número de empleados primero*/

-- 20.Obtener los nombres de todos los centros y los departamentos que se ubican en cada uno,así como aquellos centros que no tienen departamentos.
SELECT centros.direccion AS nombre_centro, departamentos.denominacion AS nombre_departamento FROM dpto departamentos, centro centros WHERE centros.codcentro=departamentos.codcentro;
SELECT centro.codcentro, coddpto FROM CENTRO RIGHT OUTER JOIN DPTO ON centro.codcentro = dpto.codcentro;
-- 21.Obtener el nombre del departamento de más alto nivel, es decir, aquel que no depende de ningún otro.
SELECT denominacion AS departamento FROM dpto departamentos WHERE coddptodepende IS NULL;

/*Mediante el operador de comparación IS NULL obtenemos true si el valor de la columna es nulo */

-- 22.Obtener todos los departamentos existentes en la empresa y los empleados (si los tiene) que pertenecen a él.
SELECT departamentos.denominacion AS departamento, empleados.nombre || ' ' || empleados.ape1 || ' ' || empleados.ape2 as empleado FROM dpto departamentos, empleado empleados WHERE (departamentos.coddpto = empleados.coddpto) ORDER BY departamento;
SELECT denominacion, nombre, ape1 || ' ' || ape2 as apellidos FROM DPTO, EMPLEADO WHERE dpto.coddpto = empleado.coddpto ORDER BY denominacion;
SELECT  denominacion, nombre, ape1 || ' ' || ape2 as apellidos FROM EMPLEADO INNER JOIN DPTO ON dpto.coddpto = empleado.coddpto ORDER BY denominacion;
-- 23.Obtener un listado en el que aparezcan todos los departamentos existentes y el departamento del cual depende,si depende de alguno.
SELECT d1.denominacion as departamento, NVL(d2.denominacion, '---') AS depende_de FROM dpto d1 left join dpto d2 on d2.coddpto = d1.coddptodepende;
SELECT d1.denominacion, d2.denominacion FROM DPTO d1 LEFT OUTER JOIN DPTO d2 ON d1.coddptodepende = d2.coddpto ORDER BY d1.denominacion;
/*Utilizamos la composición JOIN ON de la versión SQL99 para unir varias tablas y 
  mediante la función con nulos NVL devolvemos la expresión establecida cuando el valor es nulo*/

-- 24.Obtener un listado ordenado alfabéticamente donde aparezcan los nombres de los empleados y a continuación el literal "tiene comisión" si la tiene,y "no tiene comisión" si no la tiene.
SELECT nombre || ' ' || ape1  || ' ' || ape2 AS empleado, 
    CASE
        WHEN comision IS NOT NULL THEN 'tiene comisión'
        ELSE 'no tiene comisión'
    END AS comision FROM empleado empleados ORDER BY nombre, ape1;
SELECT nombre,
        CASE
            WHEN comision IS NOT NULL THEN 'tiene comision'
            ELSE 'no tiene comision'
        END AS comision FROM EMPLEADO ORDER BY nombre;    
/*La declaración de la sentencia CASE retorna un valor en una condición especificada;
  en este caso, si el valor del campo comision no es nulo retornará un cadena y en caso contrario, retornara otra cadena de caracteres*/
  
-- 25.Obtener un listado de las localidades en las que hay centros y no vive ningún empleado ordenado alfabéticamente.
SELECT DISTINCT centros.localidad AS localidad FROM centro centros, empleado empleados WHERE centros.localidad != empleados.localidad ORDER BY localidad;
SELECT DISTINCT centro.localidad FROM CENTRO INNER JOIN EMPLEADO ON centro.localidad != empleado.localidad;
/*Mediante DISTINCT se suprimen aquellas filas que tengan igual valor que otras*/

-- 26.Obtener un listado de las localidades en las que hay centros y además vive al menos un empleado ordenado alfabéticamente.

SELECT DISTINCT centros.localidad AS localidad FROM centro centros, empleado empleados WHERE centros.localidad = empleados.localidad ORDER BY localidad;

-- 27.Esta cuestión puntúa por 2. Se desea dar una gratificación por navidades en función de la antigüedad en la empresa siguiendo estas pautas:
-- Si lleva entre 1 y 5 años, se le dará 100 euros
-- Si lleva entre 6 y 10 años, se le dará 50 euros por año
-- Si lleva entre 11 y 20 años, se le dará 70 euros por año
-- Si lleva más de 21 años, se le dará 100 euros por año
-- Obtener un listado de los empleados,ordenado alfabéticamente,indicando cuánto le corresponde de gratificación.
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
 

/*Con el operador de comparación NOT IN obtenemos los resultados que son distintos al contenido del paréntesis*/
