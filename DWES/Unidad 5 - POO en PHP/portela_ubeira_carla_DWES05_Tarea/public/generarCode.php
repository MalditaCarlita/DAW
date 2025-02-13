<?php
//Está página genera un código de barras EAN-13 válido y que además no existe en la base de datos
session_start();
require '../vendor/autoload.php';
use Clases\Jugador;
use Clases\Conexion;
use Philo\Blade\Blade;
use \Milon\Barcode\DNS1D;
$views = '../views';
$cache = '../cache';
$conexion = new Conexion();

//Mediante el buble do while, nos aseguramos de que se genere por lo menos un código
//Si este existe, continua el bucle hasta que genera un código que no exista en la base de datos
do{
    //Generamos un código de barras de 13 dígitos para cada jugador
    $digitos = null;
    for ($i = 0; $i < 12; $i++) {
        $digitos .= mt_rand(0, 9);
    }
    } while(existeCodigodeBarras($digitos));
    //Si no existe el codigo se introduce en una variable de sesión para poder operar con ella entre páginas
        $_SESSION['codigoGenerado']=$digitos;
        echo $digitos;
        header('Location: fcrear.php');

//Método para saber si el código de barras ya existe
function existeCodigodeBarras($barcode){
    global $conexion;
    $existe = false;        
    $resultado = $conexion->prepare("SELECT barcode FROM jugadores where barcode = :barcode");
    $resultado->bindParam(':barcode', $barcode);
    while ($registro = $resultado->fetch()) {
        $existe = true;            
    }
    return $existe;
}
?>