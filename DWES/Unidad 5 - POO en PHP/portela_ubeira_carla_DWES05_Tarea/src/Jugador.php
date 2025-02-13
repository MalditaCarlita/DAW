<?php
//Declaramos en la primera linea el namespace para estructurar mejor el código y evitar conflicto de nombre, por ejemplo, entre dos funciones
namespace Clases;
use Clases\Conexion;//Importamos la clase COnexión
use PDO;
use PDOException;
//Para generar los códigos de barra (Se utilizara el formato EAN-13, que utiliza 13 números)
use Milon\Barcode\DNS1D;

//Creamos la clase jugador
class jugador extends PDO{
    //definimos atributos sólo accesibles para la clase
    private $nombre;
    private $apellidos;
    private $posicion;
    private $dorsal;
    private $barcode;

    //declaramos un constructor al que se le pasan todos los atributos como parámetros
    public function __construct($nombre, $apellidos, $posicion, $dorsal, $barcode){
        $this->nombre=$nombre;
        $this->apellidos=$apellidos;
        $this->posicion=$posicion;
        $this->dorsal=$dorsal;
        $this->barcode=$barcode;
    }
    //definimos los métodos getter y setter para acceder a los atributos
    public function getNombre()
    {
        return $this->nombre;
    }
    public function setNombre($nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }
    public function getApellidos()
    {
        return $this->apellidos;
    }
    public function setApellidos($apellidos): self
    {
        $this->apellidos = $apellidos;

        return $this;
    }
    public function getPosicion()
    {
        return $this->posicion;
    }
    public function setPosicion($posicion): self
    {
        $this->posicion = $posicion;

        return $this;
    }
    public function getDorsal()
    {
        return $this->dorsal;
    }
    public function setDorsal($dorsal): self
    {
        $this->dorsal = $dorsal;

        return $this;
    }
    public function getBarCode()
    {
        return $this->barcode;
    }
    public function setBarCode($barcode): self
    {
        $this->barcode = $barcode;

        return $this;
    }
    /*Definimos los métodos necesarios:
       - Un método que compruebe si existe un jugador antes de insertarlo, para evitar copias
       - Un método que compruebe si existe un código de barras, ya que no puede haber dos jugadores con el mismo código
       - Un método para insertar al jugador
       - Un método para generar el código de barras, pasándole el dorsal como parámetro
       - Un método que muestre el listado de jugadores
       - Un método que devuelva en formato string todos los atributos
    */

    public static function existeJugador($dorsal){
        //se pasa como parámetro el dorsal porque es único para cada jugador y no se repite
        //Inicializamos conexión y la variable existe
        $conexion=new Conexion();
        $existe=false;
        $resultado=$conexion->query("SELECT * FROM jugadores WHERE dorsal=$dorsal");
        while($registro=$resultado->fetch()){
            $existe=true;
        }
        return $existe;
    }

    public static function existeCodigodeBarras($barcode){
        //Inicializamos la conexión y la variable existe
        $conexion=new Conexion();
        $existe=false;
        $resultado=$conexion->query("SELECT * FROM jugadores WHERE barcode=$barcode");
        while($registro=$resultado->fetch()){
            $existe=true;
        }
        return $existe;
    }

    public static function insertarJugador(Jugador $jugador){
        if(!Jugador::existeJugador($jugador->getDorsal())){
            if(!Jugador::existeCodigodeBarras($jugador->getBarCode())){
                //Inicializamos la conexión
                $conexion=new Conexion();
                //configuramos el atributo para que muestre los errores
                $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                try{
                    //Abrimos la transacción y preparamos la consulta
                    $conexion->beginTransaction();
                    $stmt=$conexion->prepare("INSERT INTO jugadores (nombre, apellidos, posicion, dorsal, barcode) VALUES (:nombre, :apellidos, :posicion, :dorsal, :barcode)");
                    $stmt->execute([
                        'nombre' => $jugador->getNombre(),
                        'apellidos' => $jugador->getApellidos(),
                        'dorsal' => $jugador->getDorsal(),
                        'posicion' => $jugador->getPosicion(),
                        'barcode'=> $jugador->getBarCode()
                    ]);
                    $resultado = 0; //Indica que la insercion se ha hecho bien
                    $conexion->commit();//Una vez realizada la inserción
                }  catch (PDOException $e){
                    echo "Ha surgido un error. No se pudo añadir el jugador. Error: ".$e->getMessage();
                }
            } else {
                $resultado = 1; //Indica que ya existe el codigo de barras
            }
        }   else {
            $resultado = 2; //Indica que ya existe el jugador en la base de datos
        }
        return $resultado;
    }

    public static function mostrarBarcode($dorsal){
        //Inicializamos la conexión
        $conexion=new Conexion();
        $codigo=null;
        $resultado=$conexion->query("SELECT barcode FROM jugadores WHERE dorsal = $dorsal");
        while($registro=$resultado->fetch()) {
            $codigo=$registro[0];
        }
        //Se crea un objeto y le pasamos el código de barras obtenido de la base datos y se imprime en pantalla
        $d=new DNS1D();
        $d->setStorPath(__DIR__."/cache");
        echo $d->getBarcodeHTML($codigo, "EAN13");
    }

    public function mostrarJugadores(){
        //Inicializamos la conexión
        $conexion=new Conexion();
        $resultado=$conexion->query("SELECT * FROM jugadores");
        while($registro = $resultado->fetch()){
            echo $registro[0], $registro [1], $registro[2], $registro[3], $registro[4], Jugador::mostrarBarcode($registro[3]);
        }
    }

    public function __toString(){
        echo $this->nombre."<br>";
        echo $this->apellidos."<br>";
        echo $this->dorsal."<br>";
        echo $this->posicion."<br>";
        echo $this->barcode."<br>";
    }
}