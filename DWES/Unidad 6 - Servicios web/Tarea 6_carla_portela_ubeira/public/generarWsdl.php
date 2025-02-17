<?php
require '../vendor/autoload.php';

use PHP2WSDL\PHPClass2WSDL;//COn la extensión, crearemos el documento wsdl en la carpeta servidorSoap

$class = "Clases\\Operaciones";
$uri = 'http://127.0.0.1/dwes_tema_06/TAREA_06/servidorSoap/servicioW.php';//URI el servidorSOAP, para lo que haremos una copia de servicio.php y la renombraremos
$wsdlGenerator = new PHPClass2WSDL($class, $uri);
$wsdlGenerator->generateWSDL(true);
$fichero = $wsdlGenerator->save('../servidorSoap/servicio.wsdl');
