<?php
//Declaramos en la primera linea el namespace para estructurar mejor el código y evitar conflicto de nombre, por ejemplo, entre dos funciones
namespace Clases;
use PDO;
use PDOException;
//Creamos una clase conexión que extiende de PDO(El nombre del archivo tiene que coincidir en mayúsculas y minúsculas con la clase que contiene)
//el nombre de la clase y del archivo que lo contienen ha de ser igual en mayúsculas y minúsculas
class Conexion extends PDO {
    //definimos atributos para realizar la conexión sólo accesibles dentro de la clase
    private $dsn="mysql";
    private $host="localhost";
    private $dbname="practicaUnidad5";
    private $user="gestor";
    private $password="secreto";

    //sobreescribimos el constructor de la clase PDO
    public function __construct() {
        try{
            //LLamamos al constructor padre de la clase PDO
            parent::__construct("{$this->dsn}:dbname={$this->dbname};host={$this->host};charset=utf8",$this->user,$this->password);
        }catch(PDOException $e){
            //manejamos el error
            echo "Ha surgido un error. No se pudo conectar a la base de datos. Error: ".$e->getMessage();
            exit;
        }
    }     
}

