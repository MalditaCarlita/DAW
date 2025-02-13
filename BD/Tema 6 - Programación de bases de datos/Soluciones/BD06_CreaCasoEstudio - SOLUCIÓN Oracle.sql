---------------------------------------------------------------------------------------
-- CREACIÓN DE LA BASE DE DATOS Empresa
---------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- BORRAMOS LAS TABLAS
------------------------------------------------------------------------------------------------------
DROP TABLE agentes;     DROP TABLE agentesCopia;    DROP TABLE agentesOLD;
DROP TABLE familias;    DROP TABLE familiasCopia;   DROP TABLE familiasOLD;
DROP TABLE oficinas;    DROP TABLE oficinasCopia;   DROP TABLE oficinasOLD;

------------------------------------------------------------------------------------------------------
-- CREAMOS LAS TABLAS
------------------------------------------------------------------------------------------------------
CREATE TABLE oficinas (
    identificador     	NUMBER(6),
    nombre          	VARCHAR2(40),
    domicilio     	    VARCHAR2(40),
    localidad     	    VARCHAR2(20),
    codigo_postal       VARCHAR2(5),
    CONSTRAINT	PK_oficinas				PRIMARY KEY( identificador ),
    --CONSTRAINT	UQ_oficinas_nombre		UNIQUE( nombre ),
    CONSTRAINT oficinas_nombre_NULO	    CHECK( nombre IS NOT NULL )
);

CREATE TABLE familias (
    identificador     	NUMBER(6),
    nombre         	    VARCHAR2(40),
    familia          	NUMBER(6),
    oficina          	NUMBER(6),
    CONSTRAINT	PK_familias				PRIMARY KEY( identificador ),
    CONSTRAINT	FK_familias_familias	FOREIGN KEY( familia )		REFERENCES familias( identificador )	ON DELETE CASCADE,
    CONSTRAINT	FK_familias_oficinas	FOREIGN KEY( oficina )		REFERENCES oficinas( identificador )	ON DELETE CASCADE,
    --CONSTRAINT	UQ_familias_nombre		UNIQUE( nombre ),
    CONSTRAINT	familia_nombre_NULO		CHECK( nombre IS NOT NULL )
);

CREATE TABLE agentes (
    identificador    	NUMBER(6),
    nombre          	VARCHAR2(60),
    usuario          	VARCHAR2(20),
    clave          	    VARCHAR2(20),
    habilidad     	    NUMBER(1),
    categoria     	    NUMBER(1),
    familia          	NUMBER(6),
    oficina          	NUMBER(6),
    CONSTRAINT	PK_agentes				PRIMARY KEY( identificador ),
    CONSTRAINT FK_agentes_familias		FOREIGN KEY( familia )		REFERENCES familias( identificador )	ON DELETE CASCADE,
    CONSTRAINT FK_agentes_oficinas		FOREIGN KEY( oficina )		REFERENCES oficinas( identificador )	ON DELETE CASCADE,
    --CONSTRAINT UQ_agentes_usuario		UNIQUE( usuario ),
    CONSTRAINT agentes_nombre_NULO		CHECK( nombre IS NOT NULL ),
    CONSTRAINT agentes_usuario_NULO	    CHECK( usuario IS NOT NULL ),
    CONSTRAINT agentes_clave_NULA		CHECK( clave IS NOT NULL ),
    CONSTRAINT agentes_habilidad_NULA	CHECK( habilidad IS NOT NULL ),
    CONSTRAINT agentes_categoria_NULA	CHECK( categoria IS NOT NULL )
);

------------------------------------------------------------------------------------------------------
-- CREAMOS LAS TABLAS COPIA
------------------------------------------------------------------------------------------------------
CREATE TABLE oficinasCopia AS SELECT * FROM oficinas;   CREATE TABLE oficinasOLD AS SELECT * FROM oficinas;
CREATE TABLE familiasCopia AS SELECT * FROM familias;   CREATE TABLE familiasOLD AS SELECT * FROM familias;
CREATE TABLE agentesCopia  AS SELECT * FROM agentes;    CREATE TABLE agentesOLD  AS SELECT * FROM agentes;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- GUIONES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Secuencia de instrucciones que se ejecutarán de forma ordenada


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de una nueva Oficina
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarOficina ( 
    id      NUMBER,
    Nom     VARCHAR2,
    Dom     VARCHAR2,
    Loc     VARCHAR2,
    CP      VARCHAR2
) 
IS 
BEGIN
    INSERT INTO oficinas (identificador, nombre, domicilio, localidad, codigo_postal) 
    VALUES (id, Nom, Dom, Loc, CP);
END;
/

#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todas las oficinas en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarOficinas
IS
BEGIN
    agregarOficina( 1, 'Madrid', 'Gran vía, 37', 'Madrid', '28000' );
    agregarOficina( 2, 'Granada', 'Camino Ronda, 50', 'Granada', '36000' );
    agregarOficina( 3, 'Jaén', 'Gran Eje, 80', 'Jaén', '27000' );
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de una nueva Familia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarFamilia (
    id     NUMBER,
    Nom    VARCHAR2,
    Fam    NUMBER,
    Ofi    NUMBER
) 
IS 
BEGIN
    INSERT INTO familias VALUES (id, Nom, Fam, Ofi);
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos todas las familias en función del procedimiento creado previamente
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarFamilias
IS
BEGIN
    agregarFamilia(11, 'Madrid-1', NULL, 1);
    agregarFamilia(111, 'Madrid-1.1', 11, NULL);
    agregarFamilia(112, 'Madrid-1.2', 11, NULL);
    agregarFamilia(1121, 'Madrid-1.2.1', 112, NULL);
    agregarFamilia(1122, 'Madrid-1.2.2', 112, NULL);
    agregarFamilia(1123, 'Madrid-1.2.3', 112, NULL);
    agregarFamilia(21, 'Granada-1', NULL, 2);
    agregarFamilia(211, 'Granada-1.1', 21, NULL);
    agregarFamilia(212, 'Granada-1.2', 21, NULL);
    agregarFamilia(213, 'Granada-1.3', 21, NULL);
    agregarFamilia(31, 'Jaén-1', NULL, 3);
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de un nuevo agente
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarAgente (
    id     NUMBER,
    Nom    VARCHAR2,
    Usu    VARCHAR2,
    Cla    VARCHAR2,
    Hab    NUMBER,
    Cat    NUMBER,
    Fam    NUMBER,
    Ofi    NUMBER
)
IS 
BEGIN
    INSERT INTO agentes VALUES (id, Nom, Usu, Cla, Hab, Cat, Fam, Ofi);
END;
/

#------------------------------------------------------------------------------------------------------
#	- Procedimiento para añadir los datos todos los agentes en función del procedimiento creado previamente
#------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarAgentes  IS
BEGIN
        agregarAgente( 31, 'José Ramón Jiménez Reyes', 'jrjr', 'sup31', 9, 2, NULL, 3);
        agregarAgente( 311, 'Pedro Fernández Arias', 'pfa', 'ag311', 5, 0, 31, NULL);
        agregarAgente( 312, 'Vanesa Sánchez Rojo', 'vsr', 'ag312', 5, 0, 31, NULL);
        agregarAgente( 313, 'Francisco Javier García Escobedo', 'fjge', 'ag313', 5, 0, 31, NULL);
        agregarAgente( 314, 'Pilar Ramirez Pérez', 'prp', 'ag314', 5, 0, 31, NULL);
        agregarAgente( 315, 'José Luis García Martínez', 'jlgm', 'ag315', 5, 0, 31, NULL);
        agregarAgente( 21, 'Sebastián López Ojeda', 'slo', 'sup21', 9, 2, NULL, 2);
        agregarAgente( 211, 'Diosdado Sánchez Hernández', 'dsh', 'ag211', 8, 1, 21, NULL);
        agregarAgente( 2111, 'José Juan Cano Pardo', 'jjcp', 'ag2111', 5, 0, 211, NULL);
        agregarAgente( 2112, 'Flor Moncada Añón', 'ag2112', 'fma', 5, 0, 211, NULL);
        agregarAgente( 2113, 'Juan Manuel Alcazar Donaire', 'jmad', 'ag2113', 5, 0, 211, NULL);
        agregarAgente( 2121, 'Manuel Jesús Rubia Mateos', 'mjrm', 'ag2121', 5, 0, 212, NULL);
        agregarAgente( 2122, 'Esther López Delgado', 'eld', 'ag2122', 5, 0, 212, NULL);
        agregarAgente( 2123, 'Francisco Javier Cabrerizo Membrilla', 'fjcm', 'ag2123', 5, 0, 212, NULL);
        agregarAgente( 2124, 'Verónica Cabrerizo Menbrilla', 'vcm', 'ag2124', 5, 0, 212, NULL);
        agregarAgente( 2125, 'María José Navascués Morales', 'mjnm', 'ag2125', 5, 0, 212, NULL);
        agregarAgente( 2131, 'Isabel Cruz Granados', 'icg', 'ag2131', 5, 0, 213, NULL);
        agregarAgente( 2132, 'Antonio Casado Fernández', 'acf', 'ag2132', 5, 0, 213, NULL);
        agregarAgente( 2133, 'Gabriel Callejón García', 'gcg', 'ag2133', 5, 0, 213, NULL);
        agregarAgente( 2134, 'Enrique Cano Balsera', 'ecb', 'ag2134', 5, 0, 213, NULL);
        agregarAgente( 11, 'Narciso Jáimez Toro', 'njt', 'sup11', 9, 2, NULL, 1);
        agregarAgente( 111, 'Jesús Baños Sancho', 'jbs', 'ag111', 8, 1, 11, NULL);
        agregarAgente( 1111, 'Salvador Romero Villegas', 'srv', 'ag1111', 7, 1, 111, NULL);
        agregarAgente( 1112, 'José Javier Bermúdez Hernández', 'jjbh', 'ag1112', 7, 1, 111, NULL);
        agregarAgente( 1113, 'Alfonso Bonillo Sierra', 'abs', 'ag1113', 7, 1, 111, NULL);
        agregarAgente( 1121, 'Silvia Thomas Barrós', 'stb', 'ag1121', 7, 1, 112, NULL);
        agregarAgente( 11211, 'Ernesto Osoro Gorrotxategi', 'eog', 'ag11211', 5, 0, 1121, NULL);
        agregarAgente( 11212, 'Guillermo Campos Guillén', 'gcag', 'ag11212', 5, 0, 1121, NULL);
        agregarAgente( 11213, 'Antonio Fernández Ruíz', 'afr', 'ag11213', 5, 0, 1121, NULL);
        agregarAgente( 11214, 'María Luisa López Caballero', 'mllc', 'ag11214', 5, 0, 1121, NULL);
        agregarAgente( 11221, 'Virginia Morenas Rubio', 'vmr', 'ag11221', 5, 0, 1121, NULL);
        agregarAgente( 11222, 'Rosario Castro García', 'rcg', 'ag11222', 5, 0, 1122, NULL);
        agregarAgente( 11223, 'Antonio Álvarez Palomeque', 'aap', 'ag11223', 5, 0, 1122, NULL);
        agregarAgente( 11224, 'David Martínez Martínez', 'dmm', 'ag11224', 5, 0, 1122, NULL);
        agregarAgente( 11225, 'Juan Corral González', 'jcg', 'ag11225', 5, 0, 1122, NULL);
        agregarAgente( 11226, 'Eduardo Alfada Pereira', 'eap', 'ag11226', 5, 0, 1122, NULL);
        agregarAgente( 11231, 'Cayetano García Herrera', 'cgh', 'ag11231', 5, 0, 1123, NULL);
        agregarAgente( 11232, 'José Antonio Sieres Vega', 'jasv', 'ag11232', 5, 0, 1123, NULL);
        agregarAgente( 11233, 'Juan Manuel Guzmán García', 'jmgg', 'ag11233', 5, 0, 1123, NULL);
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento para añadir los datos de todas las tablas creadas, es decir invocar desde aquí
--		a los tres procedimientos agregar
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE agregarDatos IS
BEGIN
    agregarOficinas;
    agregarFamilias;
    agregarAgentes;
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- FUNCIONES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Función que va a devolver el número de miembros de la familia cuyo nombre se pase como parámetro
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION contarMiembrosFamilia( familiaContar INT ) RETURN INT IS
    numMiembros INT;
BEGIN
    SELECT COUNT(*) INTO numMiembros FROM agentes WHERE familia = familiaContar;

    RETURN numMiembros;
END;
/

------------------------------------------------------------------------------------------------------
--	Función que va a devolver el nombre de la familia cuyo identificador se pasa como parámetro
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION obtenerNombreFamilia( idFamilia INT ) RETURN VARCHAR IS
    nombreFamilia VARCHAR(40);
BEGIN
    SELECT nombre INTO nombreFamilia FROM familias WHERE identificador = idFamilia;
            
    IF nombreFamilia IS NULL THEN
        RETURN 'Identificador no válido'; -- Mensaje de identificador no válido
    ELSE
        RETURN nombreFamilia;
    END IF;
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Procedimiento cuya finalidad es mostrar todos los datos de las oficinas
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarOficinas IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('MOSTRAMOS LAS OFICINAS');
    DBMS_OUTPUT.PUT_LINE('----------------------');    
    FOR oficina IN (SELECT * FROM oficinas) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || oficina.identificador || ', Nombre: ' || oficina.nombre || ', Domicilio: ' || oficina.domicilio || ', Localidad: ' || oficina.localidad || ', Código Postal: ' || oficina.codigo_postal );
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No hay datos en la tabla Oficinas.' );
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'Error: ' || SQLERRM );
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento cuya finalidad es mostrar todos los datos de las familias
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarFamilias IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('MOSTRAMOS LAS FAMILIAS');
    DBMS_OUTPUT.PUT_LINE('----------------------');    
    FOR familia IN (SELECT * FROM familias) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || familia.identificador || ', Nombre: ' || familia.nombre || ', Familia: ' || familia.familia || ', Oficina: ' || familia.oficina );
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No hay datos en la tabla familias.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento cuya finalidad es mostrar todos los datos de los agentes
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarAgentes IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('MOSTRAMOS LOS AGENTES');
    DBMS_OUTPUT.PUT_LINE('----------------------');    
    FOR agente IN (SELECT * FROM agentes) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificador: ' || agente.identificador || ', Nombre: ' || agente.nombre || ', Usuario: ' || agente.usuario || ', Clave: ' || agente.clave || ', Habilidad: ' || agente.habilidad || ', Categoría: ' || agente.categoria || ', Familia: ' || agente.familia || ', Oficina: ' || agente.oficina );
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No hay datos en la tabla agentes.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

------------------------------------------------------------------------------------------------------
--	Procedimiento sencillo cuya finalidad es invocar a los tres procedimientos anteriores para
--		mostrar los datos de las Oficinas, Familias y Agentes. Pero de forma independiente
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrarDatos IS
BEGIN
    mostrarOficinas;
    mostrarFamilias;
    mostrarAgentes;
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- DISPARADORES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al agregar una tupla en la tabla Oficinas, cuya finalidad es volcar esos datos
--		sobre la tabla oficinasCopia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_OFICINA
	AFTER INSERT ON oficinas	FOR EACH ROW
BEGIN
    INSERT INTO oficinasCopia VALUES ( :NEW.identificador, :NEW.nombre, :NEW.domicilio, :NEW.localidad, :NEW.codigo_postal );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al agregar una tupla en la tabla Familias, cuya finalidad es volcar esos datos
--		sobre la tabla familiasCopia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_FAMILIA
	AFTER INSERT ON familias	FOR EACH ROW
BEGIN
    INSERT INTO familiasCopia VALUES ( :NEW.identificador, :NEW.nombre, :NEW.familia, :NEW.oficina );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al agregar una tupla en la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_AGREGAR_AGENTE
	AFTER INSERT ON agentes		FOR EACH ROW
BEGIN
    INSERT INTO agentesCopia VALUES ( :NEW.identificador, :NEW.nombre, :NEW.usuario, :NEW.clave, :NEW.habilidad, :NEW.categoria, :NEW.familia, :NEW.oficina );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al modificar datos de la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla oficinasOLD se volcarán los datos que van a ser modificados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_OFICINA
	AFTER UPDATE ON oficinas	FOR EACH ROW
BEGIN
    UPDATE oficinasCopia
    SET nombre = :NEW.nombre, domicilio = :NEW.domicilio, localidad = :NEW.localidad, codigo_postal = :NEW.codigo_postal
    	WHERE identificador = :OLD.identificador;
    INSERT INTO oficinasOLD VALUES ( :OLD.identificador, :OLD.nombre, :OLD.domicilio, :OLD.localidad, :OLD.codigo_postal );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al modificar datos de la tabla Familias, cuya finalidad es volcar esos datos
--		sobre la tabla familiasCopia. En la tabla familiasOLD se volcarán los datos que van a ser modificados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_FAMILIA
	AFTER UPDATE ON familias	FOR EACH ROW
BEGIN
    UPDATE familiasCopia
    SET nombre = :NEW.nombre, familia = :NEW.familia, oficina = :NEW.oficina
    	WHERE identificador = :OLD.identificador;
    INSERT INTO familiasOLD VALUES ( :OLD.identificador, :OLD.nombre, :OLD.familia, :OLD.oficina );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al modificar datos de la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser modificados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_MODIFICAR_AGENTE
	AFTER UPDATE ON agentes		FOR EACH ROW
BEGIN
    UPDATE agentesCopia
    SET nombre = :NEW.nombre, usuario = :NEW.usuario, clave = :NEW.clave, habilidad = :NEW.habilidad, categoria = :NEW.categoria, familia = :NEW.familia, oficina = :NEW.oficina
    	WHERE identificador = :OLD.identificador;
    INSERT INTO agentesOLD VALUES ( :OLD.identificador, :OLD.nombre, :OLD.usuario, :OLD.clave, :OLD.habilidad, :OLD.categoria, :OLD.familia, :OLD.oficina );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al borrar datos de la tabla Oficinas, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser eliminados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_BORRAR_OFICINA
    AFTER DELETE ON oficinas    FOR EACH ROW
BEGIN
    DELETE FROM oficinasCopia WHERE identificador = :OLD.identificador;
    INSERT INTO oficinasOLD VALUES ( :OLD.identificador, :OLD.nombre, :OLD.domicilio, :OLD.localidad, :OLD.codigo_postal );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al borrar datos de la tabla Familias, cuya finalidad es volcar esos datos
--		sobre la tabla familiasCopia. En la tabla familiasOLD se volcarán los datos que van a ser eliminados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_BORRAR_FAMILIA
    AFTER DELETE ON familias    FOR EACH ROW
BEGIN
    DELETE FROM familiasCopia WHERE identificador = :OLD.identificador;
    INSERT INTO familiasOLD VALUES ( :OLD.identificador, :OLD.nombre, :OLD.familia, :OLD.oficina );
END;
/

------------------------------------------------------------------------------------------------------
--	Código que se ejecuta al borrar datos de la tabla Agentes, cuya finalidad es volcar esos datos
--		sobre la tabla agentesCopia. En la tabla agentesOLD se volcarán los datos que van a ser eliminados
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRAS_BORRAR_AGENTE
    AFTER DELETE ON agentes     FOR EACH ROW
BEGIN
    DELETE FROM agentesCopia WHERE identificador = :OLD.identificador;
    INSERT INTO agentesOLD VALUES ( :OLD.identificador, :OLD.nombre, :OLD.usuario, :OLD.clave, :OLD.habilidad, :OLD.categoria, :OLD.familia, :OLD.oficina );
END;
/
------------------------------------------------------------------------------------------------------
-- CURSORES
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	Creamos un cursor cuya finalidad será restaurar la tabla oficinas tras un borrado a partir de las
--		tuplas que hay en la tabla oficinasOLD
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarOficinas IS
    var_id oficinas.identificador%TYPE;
    var_nom oficinas.nombre%TYPE;
    var_dom oficinas.domicilio%TYPE;
    var_loc oficinas.localidad%TYPE;
    var_cp oficinas.codigo_postal%TYPE;
    FIN INT := 0;
    CURSOR cursorOficinas IS SELECT * FROM oficinasOLD;
BEGIN
    OPEN cursorOficinas;
    LOOP
        FETCH cursorOficinas INTO var_id, var_nom, var_dom, var_loc, var_cp;
        EXIT WHEN cursorOficinas%NOTFOUND;

        BEGIN
            SELECT COUNT(*)
            INTO FIN
            FROM oficinas
            WHERE identificador = var_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                FIN := 0;
        END;

        IF FIN = 1 THEN
            UPDATE oficinas
            SET nombre = var_nom,
                domicilio = var_dom,
                localidad = var_loc,
                codigo_postal = var_cp
            WHERE identificador = var_id;
        ELSE
            INSERT INTO oficinas VALUES (var_id, var_nom, var_dom, var_loc, var_cp);
        END IF;
    END LOOP;
    CLOSE cursorOficinas;
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Creamos un cursor cuya finalidad será restaurar la tabla familias tras un borrado a partir de las
--		tuplas que hay en la tabla familiasOLD
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarFamilias IS
    var_id familias.identificador%TYPE;
    var_nom familias.nombre%TYPE;
    var_fam familias.familia%TYPE;
    var_ofi familias.oficina%TYPE;
BEGIN
    FOR rec IN (SELECT * FROM familiasOLD) LOOP
        BEGIN
            SELECT 1 INTO var_id FROM familias WHERE identificador = rec.identificador;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                var_id := 0;
        END;

        IF var_id = 1 THEN
            UPDATE familias SET nombre = rec.nombre, familia = rec.familia, oficina = rec.oficina
            WHERE identificador = rec.identificador;
        ELSE
            INSERT INTO familias VALUES (rec.identificador, rec.nombre, rec.familia, rec.oficina);
        END IF;
    END LOOP;
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Creamos un cursor cuya finalidad será restaurar la tabla agentes tras un borrado a partir de las
--		tuplas que hay en la tabla agentesOLD
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarAgentes IS
    FIN INT := 0;
    var_id agentes.identificador%TYPE;
    var_nom agentes.nombre%TYPE;
    var_usu agentes.usuario%TYPE;
    var_cla agentes.clave%TYPE;
    var_hab agentes.habilidad%TYPE;
    var_cat agentes.categoria%TYPE;
    var_fam agentes.familia%TYPE;
    var_ofi agentes.oficina%TYPE;

    CURSOR cursorAgentes IS SELECT * FROM agentesOLD;
BEGIN
    FOR rec IN cursorAgentes LOOP
        BEGIN
            SELECT 1 INTO var_id FROM agentes WHERE identificador = rec.identificador;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                var_id := 0;
        END;

        IF var_id = 1 THEN
            UPDATE agentes SET nombre = rec.nombre, usuario = rec.usuario, clave = rec.clave,
                                habilidad = rec.habilidad, categoria = rec.categoria,
                                familia = rec.familia, oficina = rec.oficina
            WHERE identificador = rec.identificador;
        ELSE
            INSERT INTO agentes VALUES (rec.identificador, rec.nombre, rec.usuario,
                                        rec.clave, rec.habilidad, rec.categoria,
                                        rec.familia, rec.oficina);
        END IF;
    END LOOP;
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es borrar todas las tuplas de las tablas agentes, familias 
--		y oficinas (son tres sentencias básicas de sql).
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE borrarDatos IS
BEGIN
    DELETE FROM agentes;
    DELETE FROM familias;
    DELETE FROM oficinas;
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es restaurar las tuplas de las tablas agentes, familias 
--		y oficinas (son llamadas a los tres procedimientos de restaurar creados previamente).
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE restaurarDatos IS
BEGIN
    restaurarOficinas;
    restaurarFamilias;
    restaurarAgentes;
END;
/

------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es incrementar la categoría de los agentes en una unidad.
--		El procedimiento se realizará a través del cursor
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE aumentarCategoriaAgentes IS
BEGIN
    FOR rec IN (SELECT identificador, categoria FROM agentes) LOOP
        UPDATE agentes SET categoria = rec.categoria + 1 WHERE identificador = rec.identificador;
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    COMMIT; -- hacemos permanentes los cambios
END;
/

------------------------------------------------------------------------------------------------------
--	Creamos un procedimiento cuya finalidad es decrementar la categoría de los agentes en una unidad.
--		El procedimiento se realizará a través del cursor
------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE decrementarCategoriaAgentes IS
BEGIN
    FOR rec IN (SELECT identificador, categoria FROM agentes) LOOP
        UPDATE agentes SET categoria = rec.categoria - 1 WHERE identificador = rec.identificador;
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    COMMIT; -- hacemos permanentes los cambios
END;
/
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
EXEC agregarDatos;
EXEC mostrarDatos;

SELECT obtenerNombreFamilia(10) AS "Nombre de Familia"  FROM DUAL;
SELECT obtenerNombreFamilia(11) AS "Nombre de Familia"  FROM DUAL;

-- Modificamos los atributos nombre
UPDATE oficinas SET nombre = 'Vigo' WHERE nombre = 'Madrid';
UPDATE familias SET nombre = REPLACE(nombre, 'a', 'e');
UPDATE agentes SET nombre = REPLACE(nombre, ' ', '');
COMMIT; -- hacemos permanentes los cambios

EXEC mostrarDatos;     
EXEC restaurarDatos;
EXEC mostrarDatos;     
EXEC borrarDatos;       
EXEC mostrarDatos;
EXEC restaurarDatos;
EXEC mostrarDatos;
