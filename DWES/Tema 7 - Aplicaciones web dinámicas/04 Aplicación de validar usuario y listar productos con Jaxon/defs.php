<?php
require (__DIR__ . '/vendor/autoload.php');//Se cargan las librerías de composer
require (__DIR__ . '/include/Usuario.php');//Se carga la clase Usuario
//Clase en la que se implementa la validación del usurio que srá en php y será llamada por Jaxon desde Js
use Jaxon\Jaxon;
// use Jaxon\Response\Response;
use function Jaxon\jaxon;

$jaxon = jaxon();

// Opciones de configuración Jaxon: 
$jaxon->setOption('js.app.minify', false);
$jaxon->setOption('core.decode_utf8', true);
$jaxon->setOption('core.debug.on', false);
$jaxon->setOption('core.debug.verbose', false);

// URI que se encarga de procesar solicitudes
$jaxon->setOption('core.request.uri', 'ajax.php');

function vUsuario($u, $p){
        $resp = jaxon()->newResponse();//Creamos una nueva respuestade Jaxon
       
        if ( strlen($u)==0 || strlen($p)==0 ){//Si no se han introducido datos
            $resp->call('noValidado');//Llama a la función Js de noValidado
        } else {  // comprobar en base de datos si existe el usuario
            $usuario = new Usuario();
            if (!$usuario->isValido($u, $p)) {//Esta función llama a la función de la clase Usuario que valida al usuario
                $resp->call('noValidado');//Lama a la función que lanza un alert
            } else {
                session_start();//Inicia la sesión del usuario
                $_SESSION['usu'] = $u;//Pasa el parámetro usuario a la sesión
                $resp->call('validado');//LLama a la función que redirige a la página listado.php
            }
            $usuario = null;
        }
        
        return $resp;
    }

$jaxon->register(Jaxon::CALLABLE_FUNCTION, 'vUsuario');//Registramos la función en Jaxon

?>

