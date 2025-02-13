/*-------------------------------------Actividad 1--------------------------------------------------------
    
    Crear un procedimiento que permita cambiar a todos los agentes de una familia determinada (familia origen) a otra familia (familia destino).    
    El procedimiento tendrá la siguiente cabecera CambiarAgentesFamilia( id_FamiliaOrigen, id_FamiliaDestino), donde cada uno de los argumentos corresponde a un identificador de Familia. 
    Cambiará la columna  Identificador de Familia de todos los agentes, de la tabla AGENTES, que pertenecen a la Familia con código id_FamiliaOrigen por el código id_FamiliaDestino.*/
 
CREATE OR REPLACE PROCEDURE CambiarAgentesFamilia (id_FamiliaOrigen NUMBER, id_FamiliaDestino NUMBER) IS
BEGIN  
    UPDATE agentes 
    SET familia = id_FamiliaDestino 
    WHERE familia = id_FamiliaOrigen;
END CambiarAgentesFamilia;

/*  Previamente comprobará que ambas familias existen y que no son iguales.
    Para la comprobación de la existencia de las familias se puede utilizar un cursor variable, o contar el número de filas y en caso de que no exista, se visualizará el mensaje correspondiente mediante una excepción del tipo RAISE_APPLICATION_ERROR. 
    También se mostrará un mensaje en caso de que ambos argumentos tengan el mismo valor.         */ 
    
-- Creamnos una función que devuelve un valor booleano ( TRUE si existen las familias y FALSE sino existen o son iguales)
CREATE OR REPLACE FUNCTION VerificarFamilias (id_FamiliaOrigen NUMBER, id_FamiliaDestino NUMBER) RETURN BOOLEAN IS
    -- Declaramos un cursor variable, que es un puntero a cursores y es dinámico. Para ello:
        -- 1.Definimos un tipo REF CURSOR
    TYPE cursor_familias IS REF CURSOR RETURN familias%ROWTYPE; 
        -- 2.Declaramos una variable de este tipo
    cFamilias cursor_familias;
        -- 3.Declaramos las variables locales donde guardaremos los resultados de la búsqueda
    familiaOrigen cFamilias%ROWTYPE;
    familiaDestino cFamilias%ROWTYPE;
        -- 4.Declaramos variable local donde guardamos el resultado de la verificación. La inicializamos a false.
    verifica BOOLEAN := FALSE;
BEGIN
    -- Verificamos que la familia de origen y la de destino no son las mismas
    IF id_FamiliaOrigen = id_FamiliaDestino THEN
        -- El procedimiento RAISE_APPLICATION_ERROR genera una excepción basada en un código de error y un mensaje proporcionados por el usuario. El número de error debe estar comprendido entre 200000 y 20999, ambos incluidos.
        RAISE_APPLICATION_ERROR(-20002, 'La familia de orígen y la de destino no pueden ser iguales');
    ELSE
    --Verificamos que la familia de destino y la de origen existen
        -- Abrimos el cursor y lo asociamos a una consulta mediante OPEN-FOR
        OPEN cFamilias FOR SELECT * FROM familias WHERE identificador = id_FamiliaOrigen;  
        -- Una vez abierto el cursor variable, su manejo es idéntico a un cursor. Usaremos FETCH para traernos las filas.
        LOOP
            FETCH cFamilias INTO familiaOrigen;
            EXIT WHEN cFamilias%NOTFOUND;
        END LOOP;
         -- Mediante los atributos del cursor comprobamos que ninguna fila ha sido devuelta
        IF cFamilias%ROWCOUNT = 0 THEN
            OPEN cFamilias FOR SELECT * FROM familias WHERE identificador = id_FamiliaDestino;
            LOOP
                FETCH cFamilias INTO familiaDestino;
                EXIT WHEN cFamilias%NOTFOUND;
            END LOOP;
            IF cFamilias%ROWCOUNT = 0 THEN
                RAISE_APPLICATION_ERROR(-20002, 'No existe la familia '|| id_FamiliaOrigen || ' ni ' || id_familiaDestino);
            ELSE RAISE_APPLICATION_ERROR(-20001, 'No existe la familia '|| id_FamiliaOrigen);
            END IF;
        END IF;    
        -- Podemos usar varios OPEN-FOR para abrir el mismo cursor variable para diferentes consultas. No necesitamos cerrarlo antes de reabrirlo. Cuando abrimos un cursor variable para una consulta diferente, la consulta previa se pierde.
        OPEN cFamilias FOR SELECT * FROM familias WHERE identificador = id_FamiliaDestino;
        LOOP
            FETCH cFamilias INTO familiaDestino;
            EXIT WHEN cFamilias%NOTFOUND;
        END LOOP;
        -- Comprobamos que no se ha devuelto ninguna fila para la consulta
        IF cFamilias%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'No existe la familia ' || id_FamiliaDestino);
        END IF; 
        CLOSE cFamilias;
        verifica := TRUE;
    END IF;  
    -- Devolvemos la variable de verificación
    RETURN verifica;
END VerificarFamilias;

-- Comprobamos el correcto funcionamiento llamando al procedimiento y pasándole los parámteros mediante EXECUTE verificarfamilias(115,116);

-- Modificamos el primer procedimiento creado para que verifique que ambas familias existen y que no son igualmente de forma previa a la actualización de las familias
CREATE OR REPLACE PROCEDURE CambiarAgentesFamilia (id_FamiliaOrigen NUMBER, id_FamiliaDestino NUMBER) IS
BEGIN  
    IF VerificarFamilias(id_Familiaorigen, id_FamiliaDestino) THEN
        UPDATE agentes 
        SET familia = id_FamiliaDestino 
        WHERE familia = id_FamiliaOrigen;
    END IF;    
END CambiarAgentesFamilia;

/*El procedimiento visualizará  el mensaje "Se han trasladado XXX agentes de la familia  XXXXXX a la familia ZZZZZZ" donde XXX es el número de agentes que se han cambiado de familia, XXXXXX es el nombre de la familia origen y ZZZZZZ es el nombre de la familia destino.*/

--PL/SQL no proporciona funcionalidad de entrada o salida directamente siendo necesario utilizar paquetes predefinidos de Oracle (DBMS_OUTPUT). Para ello:
SET SERVEROUTPUT ON;

-- Modificamos el primer procedimiento creado para que obtenga el número de agentes de una familia (mediante un cursor variable) y  que muestre el correspondiente mensaje cuando se realiza la actualización o no.
CREATE OR REPLACE PROCEDURE CambiarAgentesFamilia (id_FamiliaOrigen NUMBER, id_FamiliaDestino NUMBER) IS
 -- 1.Definimos un tipo REF CURSOR
    TYPE cursor_agentes IS REF CURSOR RETURN agentes%ROWTYPE; 
    -- 2.Declaramos una variable de este tipo
    cAgentes cursor_agentes;
    -- 3.Declaramos una variable local donde guardaremos los resultados de la búsqueda
    agente cAgentes%ROWTYPE;
    -- SI se verifica que las familias existen (TRUE), entonces actualizamos su valor
BEGIN 
    IF VerificarFamilias(id_Familiaorigen, id_FamiliaDestino) THEN
        -- Abrimos el cursor y lo asociamos a una consulta mediante OPEN-FOR
        OPEN cAgentes FOR SELECT * FROM agentes WHERE familia = id_FamiliaOrigen;  
        -- Una vez abierto el cursor variable usaremos FETCH para traernos las filas.
        LOOP
            FETCH cAgentes INTO agente;
            EXIT WHEN cAgentes%NOTFOUND;
        END LOOP;
        -- Actualizamos la familia de los agentes cuya familia de origen sea igual a la familia de origen insertada
        UPDATE agentes 
        SET familia = id_FamiliaDestino 
        WHERE familia = id_FamiliaOrigen;
        -- Proporcionamos el mensaje
         DBMS_OUTPUT.PUT_LINE('Se han trasladado '||cAgentes%ROWCOUNT||' agentes de la familia  '|| id_FamiliaOrigen||' a la familia ' || id_FamiliaDestino);
     ELSE 
        -- Sino se verifica, se proporciona el mensaje de que no se han podido realizar los cambios.
        DBMS_OUTPUT.PUT_LINE('No se han podido realizar los cambios');    
    END IF;    
END CambiarAgentesFamilia;

-- Comprobamos el correcto funcionamiento llamando al procedimiento y pasándole los parámteros mediante EXECUTE CambiarAgentesFamilia (31,112);

/*-------------------------------------Actividad 2--------------------------------------------------------
    
    Queremos controlar algunas restricciones a la hora de trabajar con agentes.
    Se pide crear un disparador para asegurar estas restricciones. 
    El disparador deberá lanzar todos los errores que se puedan producir en su ejecución mediante errores que identifiquen con un mensaje adecuado por qué se ha producido dicho error.
    Algunas de las restricciones implementadas con el disparador se pueden incorporar a la definición del esquema de la tabla utilizando el Lenguaje de Definición de Datos (Check,Unique,..).Identifica cuáles son y con qué tipo de restricciones las implementarías.*/
    
CREATE OR REPLACE TRIGGER restricciones_agentes 
BEFORE INSERT OR UPDATE ON agentes
FOR EACH ROW
BEGIN
    -- La longitud de la clave de un agente no puede ser inferior a 6.
    IF (LENGTH(TO_CHAR(:new.identificador)) < 6) THEN
        RAISE_APPLICATION_ERROR(-20004,'El identificador introducido no puede ser inferior a 6 dígitos');
        -- NO Podría restringirse mediante DDL, como por ejemplo mediante ALTER TABLE agentes ALTER COLUMN identificador NUMBER(6,0); ya que 6 indica el número máximo de dígitos que puede tomar el identificador (no el mínimo) y 0 el número de decimales.
    -- La habilidad de un agente debe estar comprendida entre 0 y 9 (ambos inclusive).
    ELSIF (:new.habilidad NOT BETWEEN 0 AND 9) THEN
        RAISE_APPLICATION_ERROR(-20005,'La habilidad de un agente debe estar comprendida entre 0 y 9 (ambos inclusives)');
        -- Podría restringirse mediante DDL mediante ALTER TABLE agentes ADD CONSTRAINT CHK_Habilidad CHECK (habilidad >=0 AND habilidad <=9);
    -- La categoría de un agente sólo puede ser igual a 0, 1 o 2.
    ELSIF (:new.categoria NOT IN(0,1,2)) THEN
        RAISE_APPLICATION_ERROR(-20006,'La categoría de un agente sçolo puede ser igual a 0, 1 o 2');
        -- Podría restringirse mediante DDL mediante ALTER TABLE agentes ADD CONSTRAINT CHK_Categoria CHECK (categoria = 0 OR categoria = 1 OR categoria = 2); 
    -- Si un agente tiene categoría 2 no puede pertenecer a ninguna familia y debe pertenecer a una oficina.  
    ELSIF (:new.categoria = 2 AND :new.familia IS NOT NULL AND :new.oficina IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20007,'Si un agente tiene categoría 2 no puede pertenecer a ninguna familia y debe pertenecer a una oficina');
    -- Si un agente tiene categoría 1 no puede pertenecer a ninguna oficina y debe pertenecer  a una familia.  
    ELSIF (:new.categoria = 1 AND :new.oficina IS NOT NULL AND :new.familia IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20008,'Si un agente tiene categoría 1 no puede pertenecer a ninguna oficina y debe pertenecer  a una familia.');
    -- No se puede restringir mediante DDL.
    -- Todos los agentes deben pertenecer  a una oficina o a una familia pero nunca a ambas a la vez.
    ELSIF ((:new.oficina IS NOT NULL AND :new.familia IS NOT NULL) OR (:new.oficina IS NULL AND :new.familia IS NULL)) THEN
        RAISE_APPLICATION_ERROR(-20009,'Todos los agentes deben pertenecer a una oficina o a una familia pero nunca a ambas a la vez');
    -- No se puede restringir mediante DDL.
    END IF;     
END;

/* Comprobamos intentando insertar valores erróneos para comprobar que funciona el trigger y que se obtienen los mensajes de error correspondiente.
insert into agentes values (1,'prueba1', 'p1', 'p1', 9, 2, NULL, 3);
insert into agentes values (111111,'prueba2', 'p2', 'p', -1, 2, NULL, 3);
insert into agentes values (111111,'prueba3', 'p3', 'p', 9, 3, NULL, 3);
insert into agentes values (111111,'prueba4', 'p4', 'p', 9, 2, NULL, NULL);
insert into agentes values (111111,'prueba5', 'p5', 'p', 9, 2, 3, 3); */