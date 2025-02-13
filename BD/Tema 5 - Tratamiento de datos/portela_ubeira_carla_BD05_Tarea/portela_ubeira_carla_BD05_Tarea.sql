//1.Inserta un registro nuevo en la tabla PROFESORADO utilizando la herramienta gráfica SQLDeveloper

//2.Inserta varios registros más en la tabla PROFESORADO utilizando sentencias SQL. 
INSERT INTO PROFESORADO (Codigo, Nombre, Apellidos, DNI, Especialidad, Fecha_Nac, Antiguedad) VALUES (2, 'MARIA LUISA', 'FABRE BERDUN', '51083099F', 'TECNOLOGIA', '31/03/1975', 4);
//Es posible omitir la lista de campos si se indican todos los valores de cada campo y en el orden en el que se encuentran en la tabla
//INSERT INTO profesorado (2, 'MARIA LUISA', 'FABRE BERDUN', '51083099F', 'TECNOLOGIA', '31/03/1975', 4);
INSERT INTO PROFESORADO (Codigo, Nombre, Apellidos, Especialidad, Fecha_Nac, Antiguedad) VALUES (3, 'JAVIER', 'JIMENEZ HERNANDO', 'LENGUA', '04/05/1969', 10);
INSERT INTO PROFESORADO (Codigo, Nombre, Apellidos, DNI, Especialidad, Fecha_Nac, Antiguedad) VALUES (4, 'ESTEFANIA', 'FERNANDEZ MARTINEZ', '19964324W', 'INGLES', '22/06/1973', 5);
INSERT INTO PROFESORADO (Codigo, Nombre, Apellidos) VALUES (5, 'JOSE M.', 'ANERO PAYAN');

//3.Modifica los registros de la tabla CURSOS para asignar a cada curso un profesor o profesora. Utiliza para ello la herramienta gráfica, entregando con la tarea una captura de pantalla de la pestaña Datos de esa tabla, donde se aprecien todos los cambios que has realizado. 

//4.Modifica el registro del profesor cuyo Codigo es 3  usando sentencias SQL, y cambia su especialidad a Informática  y su DNI a 9876543C. En la entrega de la tarea debes copiar la sentencia que has utilizado.
UPDATE PROFESORADO SET Especialidad = 'INFORMÁTICA' , Dni = '9876543C' WHERE Codigo = 3;

//5.Modifica las antigüedades de todos los profesores y profesoras decrementándolas en 2 en todos los registros en los que la antigüedad superior a 2. Debes hacerlo usando un sola sentencia SQL que debes copiar para la entrega de la tarea.
UPDATE PROFESORADO SET Antiguedad = (Antiguedad - 2) WHERE Antiguedad > 2;

//6.Elimina, de la tabla CURSOS, el registro del curso que tiene el código 6. Debes realizar esta acción desde la herramienta gráfica. Debes entregar una captura de pantalla de la ventana en la que vas a borrar el registro, justo antes de pulsar el botón Aceptar para confirmar el borrado.
DELETE FROM CURSOS WHERE Codigo = 6;

//7.Elimina, de la tabla ALUMNADO, aquellos registros asociados al curso con código 2 cuyo sexo sea H. Debes hacerlo usando un sola sentencia SQL que debes copiar para la entrega de la tarea..
DELETE FROM ALUMNADO WHERE Cod_Curso = 2 AND Sexo = 'H';

//8.Inserta los registros de la tabla ALUMNADO_NUEVO en la tabla ALUMNADO asociándole el código de curso 1, es decir, cod_curso con el valor 1. Debes hacerlo usando un sola sentencia SQL que debes copiar para la entrega de la tarea.
INSERT INTO ALUMNADO SELECT((SELECT MAX(Codigo) AS Codigo FROM ALUMNADO)), Nombre, Apellidos, Sexo, Fecha_Nac, (1) FROM ALUMNADO_NUEVO;

//9.En la tabla CURSOS, actualiza el campo Max_Alumn del registro del curso con código 1, asignándole el valor correspondiente al número total de alumnos y alumnas que hay en la tabla ALUMNADO y que tienen asignado ese mismo curso.

UPDATE CURSOS SET Max_Alumn = (SELECT COUNT (*) FROM ALUMNADO WHERE Cod_Curso = 1) WHERE Codigo = 1;
//10.Elimina de la tabla ALUMNADO todos los registros asociados a los cursos que imparte el profesor cuyo codigo es 3

DELETE FROM ALUMNADO WHERE cod_curso = (SELECT cod_curso FROM CURSOS WHERE cod_profe = 3);