-- Los ejercicios se basan en un Sistema de Informaci�n de una empresa de ventas que gestiona los comerciales y las zonas que tienen asignadas. Una zona puede estar asignada a varios comerciales. Cada zona tiene un �nico jefe que es el responsable de zona, pudi�ndo encargarse de varias zonas.

-- Creamos un usuario c##empresa que administrar� la base de datos de la empresa
    CREATE USER c##empresa IDENTIFIED BY empresa DEFAULT TABLESPACE USERS;

-- Le damos permisos en la base de datos
    GRANT CONNECT,RESOURCE,DBA TO c##empresa;

-- Nos conectamos con el usuario c##empresa
    CONNECT c##empresa/empresa;

-- Activamos la opci�n de mostrar datos en pantalla
    SET SERVEROUTPUT ON
    
-- 1.1 Crea el tipo de objetos "Personal" con los siguientes atributos
    CREATE OR REPLACE TYPE Personal AS OBJECT (
        codigo INTEGER,
        dni VARCHAR2(10),
        nombre VARCHAR2(30),
        apellidos VARCHAR2(30),
        sexo VARCHAR2(1),
        fecha_nac DATE 
    ) NOT FINAL;
    
    -- El tipo de objeto del que hereda debe tener la propiedad NOT FINAL, ya que por defecto, todos los objetos se declaran FINAL.

-- 1.2 Crea, como tipo heredado de "Personal", el tipo de objeto "Responsable" con los siguientes atributos
    CREATE OR REPLACE TYPE Responsable UNDER Personal (
        tipo  CHAR ,
        antiguedad INTEGER 
    );

-- 1.3 Crea el tipo de objeto "Zonas" con los siguientes atributos:
    CREATE OR REPLACE TYPE Zonas AS OBJECT (
        codigo INTEGER, 
        nombre VARCHAR2(20), 
        refRespon REF Responsable, 
        codigoPostal CHAR(5)
    );
    
    -- 1.4 Crea, como tipo heredado de "Personal", el tipo de objeto "Comercial" con los siguientes atributos:
    CREATE OR REPLACE TYPE Comercial UNDER Personal (
        zonaComercial Zonas
    );

-- 2. Crea un m�todo constructor para el tipo de objetos "Responsable", en el que se indiquen como par�metros el c�digo, nombre, primer apellido, segundo apellido y tipo. Este m�todo debe asignar al atributo apellidos los datos de primer apellido y segundo apellido que se han pasado como par�metros, uni�ndolos con un espacio entre ellos.

    -- Oracle crea un m�todo constructor por defecto para cada tipo de objeto creado. Se pueden declarar m�todos constructores redefiniendo el m�todo declarado por el sistema o definiendo uno nuevo con otros par�nmetros.
    -- Para reemplazar el m�todo constructor por defecto se usa la sentencia CONSTRUCTOR FUNCTION, seguido del nombre del tipo de objeto, par�metros necesarios e indicar el valor de retorno mediante RETURN SELF AS RESULT. 
    -- Primero debemos declarar el m�todo constructor en la declaraci�n del tipo de objeto Responsable (modificamos el tipo Responsable y le a�adimos en la declaraci�n el constructor con su nombre, par�metros y tipo devuelto)*/
    ALTER TYPE Responsable ADD CONSTRUCTOR FUNCTION Responsable (
        codigo INTEGER, 
        nombre VARCHAR2, 
        primerApellido VARCHAR2, 
        segundoApellido VARCHAR2, 
        tipo CHAR) 
        RETURN SELF AS RESULT 
        CASCADE;
    
    -- Y una vez declarado el constructor, lo implementamos en el cuerpo del tipo de objeto Responsable
    CREATE OR REPLACE TYPE BODY Responsable AS
        -- Implementamos el constructor
        CONSTRUCTOR FUNCTION Responsable (
        codigo INTEGER, 
        nombre VARCHAR2, 
        primerApellido VARCHAR2, 
        segundoApellido VARCHAR2, 
        tipo CHAR) 
        RETURN SELF AS RESULT IS
        BEGIN
            SELF.codigo := codigo;
            SELF.nombre := nombre;
            SELF.apellidos := primerApellido || ' ' || segundoApellido;
            SELF.tipo := tipo;
            RETURN;
        END;
    END;  

-- 3. Crea un m�todo getNombreCompleto para el tipo de objetos Responsable que permita obtener su nombre completo con el formato apellidos nombre.
    -- Primero declaramos el m�todo en la declaraci�n del tipo de objeto responsable.
    -- Para ello, modificamos el tipo Responsable y le a�adimos el m�todo, su nombre y el tipo devuelto (no se le pasan par�metros.
    ALTER TYPE Responsable ADD MEMBER FUNCTION getNombreCompleto RETURN VARCHAR2 CASCADE;

    -- Y una vez declarado el m�todo, lo implementamos en el cuerpo del tipo Responsable
    CREATE OR REPLACE TYPE BODY Responsable AS
        -- Implementamos el constructor anterior
        CONSTRUCTOR FUNCTION Responsable (
        codigo INTEGER, 
        nombre VARCHAR2, 
        primerApellido VARCHAR2, 
        segundoApellido VARCHAR2, 
        tipo CHAR) 
        RETURN SELF AS RESULT IS
        BEGIN
            SELF.codigo := codigo;
            SELF.nombre := nombre;
            SELF.apellidos := primerApellido || ' ' || segundoApellido;
            SELF.tipo := tipo;
            RETURN;
        END;
        /*A�adimos la implementaci�n del m�todo*/
        MEMBER FUNCTION getNombreCompleto RETURN VARCHAR2 IS
        BEGIN
            RETURN SELF.apellidos || ' ' || SELF.nombre;
        END getNombreCompleto;
    END;    

-- 4.1 Crea un tabla TablaResponsables de objetos  Responsable. 
    CREATE TABLE TablaResponsable OF Responsable;

-- 4.2 Inserta en dicha tabla dos objetos  Responsable.
    -- A�adimos los objetos a la tabla mediante sentencia INSERT y llamando al constructor e introduciendo los par�metros*/
    INSERT INTO TablaResponsable VALUES (Responsable(5,NULL, 'ELENA', 'POSTA LLANOS', 'F', '31/03/1975','N',4));
    
-- 4.3 El segundo objeto "Responsable" debes crearlo usando el m�todo constructor que has realizado anteriormente. Debes usar los siguientes datos:
    INSERT INTO TablaResponsable VALUES (Responsable(6, 'JAVIER', 'JARAMILLO', 'HERNANDEZ', 'F'));
    -- Hay que poner ESPECIAL ATENCI�N al orden y tipo de los par�metros de los constructores.

-- 5.1 Crea una colecci�n VARRAY llamada ListaZonas en la que se puedan almacenar hasta 10 objetos Zonas.
    -- VARRAY es una colecci�n de elementos de tama�o fijo (tama�o m�ximo), que debe indicarse al declararla*/
    CREATE TYPE ListaZonas IS VARRAY (10) OF Zonas;

-- 5.2 Guarda en una instancia listaZonas1 de dicha lista, dos Zonas
    -- Para inicializar las colecciones deben llamarse a los constructores expl�citamente, a�adiendo los objetos en sus respectivas posiciones para que estas tambi�n se creen.
    -- Para obtener la variable refResponsable que es una variable REF de tipo de objeto Responsable, declaramos una variable donde guardaremos dicha referencia, que obtendremos mediante un SELECT a la tabla TablaResponsable de objetos de tipo Responsable.
    DECLARE
        r_ref REF Responsable; 
        r2_ref REF Responsable;
        listaZonas1 ListaZonas;
    BEGIN
        SELECT REF(r) INTO r_ref FROM TablaResponsable r WHERE r.codigo = 5;
        -- En este caso, he tenido que a�adir el DNI que se buscaba en la referencia de la segunda zona creada previamente, ya que no exist�a.
        --UPDATE TablaResponsable SET dni = '51083099F' WHERE codigo = 6;
        SELECT REF(r) INTO r2_ref FROM TablaResponsable r WHERE r.dni = '51083099F';
        listaZonas1 := ListaZonas((Zonas(1, 'zona 1',r_ref, '06834')), (Zonas(2, 'zona 2', r2_ref, '28003')));
    END;   
     
-- 6.1 Crea una tabla TablaComerciales de objetos Comercial. 
    CREATE TABLE TablaComerciales OF Comercial; 

-- 6.2 Inserta en dicha tabla las siguientes filas
    -- Como la variable listaZonas1 de tipo ListaZonas, no es accesible desde fuera de su bloque, tenemos que volver a crearla e introducir los dos objetos Zonas dentro para poder introducirlos en la tabla TablaComerciales. 
    DECLARE
        r_ref REF Responsable; 
        r2_ref REF Responsable;
        listaZonas1 ListaZonas;
    BEGIN  
        SELECT REF(r) INTO r_ref FROM TablaResponsable r WHERE r.codigo = 5;
        SELECT REF(r) INTO r2_ref FROM TablaResponsable r WHERE r.dni = '51083099F';
        listaZonas1 := ListaZonas((Zonas(1, 'zona 1',r_ref, '06834')), (Zonas(2, 'zona 2', r2_ref, '28003')));
        -- Una vez creada, y dentro del mismo bloque, para obtener los elementos de la colecci�n (o modificar su contenido) indicamos el nombre de la colecci�n seguido, entre par�ntesis, del �ndice que ocupa el elemento deseado. Tanto en los VARRAY como en NESTED TABLE, el primer elemento tiene el �ndice 1.
        INSERT INTO TablaComerciales VALUES (Comercial(100,'23401092Z', 'MARCOS', 'SUAREZ LOPEZ', 'M', '30/03/1990', listaZonas1(1)));
        INSERT INTO TablaComerciales VALUES (Comercial(102, '6932288V', 'ANASTASIA', 'GOMES PEREZ', 'F', '28/11/1984',listaZonas1(2)));
    END;

-- 7.Obtener, de la tabla TablaComerciales, el Comercial que tiene el c�digo 100, asign�ndoselo a una variable unComercial 
    DECLARE
        unComercial Comercial;
    BEGIN
        -- Cuando necesitemos hacer referencia a un objeto en lugar de alguno de sus atributos, puedes utilizar la funci�n VALUE junto con el nombre de la tabla de objetos o su alias, dentro de una sentencia SELECT.
        -- Usando la cl�usula INTO guardamos en la variable el objeto obtenido en las consulta usando la funci�n VALUE.
        SELECT VALUE(c) INTO unComercial FROM TablaComerciales c WHERE c.codigo = 100;
    END;
    
-- 8.1 Modifica el c�digo del Comercial guardado en esa variable unComercial asignando el valor 101, y su zona debe ser la segunda que se hab�a creado anteriormente. Inserta ese Comercial en la tabla TablaComerciales  
    DECLARE
        r_ref REF Responsable; 
        r2_ref REF Responsable;
        listaZonas1 ListaZonas;
        unComercial Comercial;
        zonaNueva Zonas;
    BEGIN
        SELECT REF(r) INTO r_ref FROM TablaResponsable r WHERE r.codigo = 5;
        SELECT REF(r) INTO r2_ref FROM TablaResponsable r WHERE r.dni = '51083099F';
        listaZonas1 := ListaZonas((Zonas(1, 'zona 1',r_ref, '06834')), (Zonas(2, 'zona 2', r2_ref, '28003')));
        -- Cuando necesitemos hacer referencia a un objeto en lugar de alguno de sus atributos, puedes utilizar la funci�n VALUE junto con el nombre de la tabla de objetos o su alias, dentro de una sentencia SELECT.
        -- Usando la cl�usula INTO guardamos en la variable el objeto obtenido en las consulta usando la funci�n VALUE.
        SELECT VALUE(c) INTO unComercial FROM TablaComerciales c WHERE c.codigo = 100;
        -- Para hacer referencia a un atributo de un objeto debes utilizar el nombre de dicho atributo, utilizando el punto para acceder al valor que contiene o bien para modificarlo. Antes debe ir precedido del objeto cuyo atributo deseas conocer o modificar.
        unComercial.codigo := '101';
        unComercial.zonaComercial := listaZonas1(2);
        INSERT INTO TablaComerciales VALUES (unComercial);
    END;
    
-- 9. Crea un m�todo MAP ordenarZonas para el tipo Zonas. Este m�todo debe retornar el nombre completo del Responsable al que hace referencia cada zona. Para obtener el nombre debes utilizar el m�todo getNombreCompleto que se ha creado anteriormente
    -- Declaramos el m�todo MAP en el tipo Zonas.
    DROP TYPE Zonas FORCE;
    ALTER TYPE Zonas ADD MAP MEMBER FUNCTION ordenarZonas RETURN VARCHAR2 CASCADE;
    -- Implementamos en el cuerpo del tipo Zonas, el m�todo MAP declarado.
    CREATE OR REPLACE TYPE BODY Zonas AS
        MAP MEMBER FUNCTION ordenarZonas RETURN VARCHAR2 IS
            respons Responsable;
        BEGIN
            SELECT DEREF(refRespon) INTO respons FROM DUAL;
            RETURN respons.getNombreCOmpleto();
        END ordenarZonas;
    END;  
    
-- 10. Realiza una consulta de la tabla TablaComerciales ordenada por zonaComercial para comprobar el funcionamiento del m�todo MAP.  
SELECT * FROM TablaComerciales ORDER BY zonaComercial.ordenarZonas();

