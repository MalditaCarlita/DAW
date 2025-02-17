<?php
//Este primer servidor no tiene ningún documento WSDL
require '../vendor/autoload.php';

//$uri=$_SERVER['PHP_SELF'];
$uri = "http://127.0.0.1/dwes_tema_06/TAREA_06/servidorSoap";
$parametros = ['uri' => $uri];

try {
    //El primer parámtero es null al no indicar la url de un documento wsdl y el segundo es un array que contiene la URI
    $server = new SoapServer(NULL, $parametros);
    //
    $server->setClass('Clases\Operaciones');
    //ofrecerá las funciones implementadas en "src/Operaciones.php"
    $server->handle();
} catch (SoapFault $f) {
    die("error en server: " . $f->getMessage());
}
