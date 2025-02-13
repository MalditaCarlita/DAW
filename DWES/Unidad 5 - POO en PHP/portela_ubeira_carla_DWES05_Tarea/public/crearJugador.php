<?php
//Ssta página es el "action" del formulario para crear un jugador.
session_start();
require '../vendor/autoload.php';

use \Milon\Barcode\DNS1D;
use Philo\Blade\Blade;
use Clases\Conexion;
use Clases\Jugador;

//Recojo los datos en variables de sesión para que no se pierdan los datos aunque se pulse sobre el enlace de generar código
if (isset($_POST['nombre'])) {
    $_SESSION['Nombre'] = $_POST['nombre'];
}

if (isset($_POST['apellidos'])) {
    $_SESSION['Apellidos'] = $_POST['apellidos'];
}

if (isset($_POST['dorsal'])) {
    $_SESSION['Dorsal'] = $_POST['dorsal'];
}

if (isset($_POST['posicion'])) {
    $_SESSION['Posicion'] = $_POST['posicion'];
}

if(isset($_POST['volverDeCrear'])){
    session_unset();
    header('Location: jugadores.php');
}


//Si se pulsa el botón de crear
if (isset($_POST['crear'])) {
    //Compruebamos si hay algún código de barras en la variable de sesión
    if(isset($_SESSION['codigoGenerado'])){
        //Creo un jugador con los datos recogidos de las variables de sesión
        $jugadorNuevo = new Jugador(
            $_SESSION['Nombre'],
            $_SESSION['Apellidos'],
            $_SESSION['Posicion'],
            $_SESSION['Dorsal'],
            $_SESSION['codigoGenerado']
        );

        //En resultado guardamos lo que nos devuelve el método insertarJugador
    $resultado = $jugadorNuevo->insertarJugador($jugadorNuevo);

    //Si me devuelve 0, significa que se ha insertado bien  Vuelvo a fcrear.php para ver el formulario
        if($resultado == 0){
            //Se muestra un alert al usuario y se redirige al formulario
            echo "<script> alert('Jugador insertado');
            window.location.href=\"fcrear.php\";
            </script>";
            //Se borran los datos de las variables de sesión
            session_unset();
        }
        
        //Si devuelve 1 significa que el cñodigo de barras ya existe
    if($resultado == 1){
        //Se muestra un alert al usuario y se redirige al formulario
        echo "<script> alert('El código de barras ya existe, por favor genere otro'); 
        window.location.href=\"fcrear.php\";
        </script>";
        }

        //Si devuelve 2 significa que el jugador ya existe en la base de datos
        if($resultado == 2){
            //Se muestra un alert y se redirige al formulario
            echo "<script> alert('El jugador que intenta añadir ya existe.');
            window.location.href=\"fcrear.php\";
            </script>";     
        }
        //Si no existe ningún código de barras se alerta al usuario y se redirige al formulario
    }else{
        echo "<script> alert('Genere un código para el jugador por favor');
        window.location.href=\"fcrear.php\";
         </script>";
    }
  

   

}

//Pinta el código de barras en el formulario de crear jugador
function pintaCodBarras($cod)
{
    if(isset($_SESSION['codigoGenerado'])){
        $d = new DNS1D();
        $d->setStorPath(__DIR__ . '/cache/');
        echo $d->getBarcodeHTML($cod, 'EAN13');
    }else{
        echo "";
    }  
}
?>