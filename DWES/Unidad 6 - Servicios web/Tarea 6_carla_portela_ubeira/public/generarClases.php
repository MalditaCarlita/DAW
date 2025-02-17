<?php
//Fichero para generar las clases
require '../vendor/autoload.php';

use Wsdl2PhpGenerator\Generator;//Invocamos las herramientas necesarias
use Wsdl2PhpGenerator\Config;

$generator = new Generator();
$generator->generate(
    new Config([
        'inputFile' => 'http://127.0.0.1/dwes_tema_06/TAREA_06/servidorSoap/servicio.wsdl',
        //Toma las funciones de la clase operaciones de este servicio
        'outputDir' => '../src/Clases1',
        //General las clases en este directorio
        'namespaceName' => 'Clases\Clases1'
    ])
);
