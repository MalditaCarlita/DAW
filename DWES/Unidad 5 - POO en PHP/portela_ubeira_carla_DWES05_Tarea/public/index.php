<?php
require '../vendor/autoload.php';
use Clases\Jugador;
use Clases\Conexion;
//Inicializamos la conexión
$conexion = new Conexion(); 

//Método para comprobar si existen registros
function existeRegistros(){
    global $conexion;
    $existe = false;        
    $resultado = $conexion->prepare("SELECT COUNT(*) FROM jugadores");
    while ($registro = $resultado->fetch()) {
        if($registro[0] != 0)  {
            $existe = true;
        }         
    }
    return $existe;
}

//Si existe registros dirijimos al usuario a la tabla donde se muestran
if(existeRegistros()){
    header('Location:jugadores.php');
}else{
    //sino se dirige a la página de instalacion para crear datos de prueba
    header('Location:instalacion.php');
}

