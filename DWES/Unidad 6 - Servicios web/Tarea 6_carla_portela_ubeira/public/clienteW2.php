<?php
require '../vendor/autoload.php';

use Clases\Clases1\ClasesOperacionesService;

$url = 'http://127.0.0.1/dwes_tema_06/TAREA_06/servidorSoap/servicio.wsdl';
try {
    //Se instancia un nuevo cliente Soap
    $cliente = new SoapClient($url);
} catch (SoapFault $f) {
    die("Error en cliente SOAP:" . $f->getMessage());
}

$codP = 2;
$codT = 1;
$codF = 'MP3';

//---------------------------------------------------------------------------------------
$objeto = new ClasesOperacionesService();
//En lugar de utilizar la $cliente y emplear el método mágico __soapCall()
//instanciamos un objeto para procesar las peticiones SOAP de la clase ClasesOperacionesService que hereda de la clase SoapClient
//de la carpeta /src/Clases1/

//funcion getPvp ------------------------------------------------------------------------
//Se accede a las funciones como métodos del objeto creado
$pvp = $objeto->getPvp($codP);
$precio = ($pvp == null) ? "No existe es Producto" : $pvp;
//Se muestra el resultado obtenido
echo "Código de producto de Código $codP: $precio";


//funcion getFamilias -------------------------------------------------------------------
echo "<br>Códigos de Familas:";
$prueba = $objeto->getFamilias();
echo "<ul>";
foreach ($prueba as $k => $v) {
    echo "<code><li>$v</li></code>";
}
echo "</ul>";


//funcion getProductosFamila ------------------------------------------------------------
$productos = $objeto->getProductosFamilia($codF);
echo "<br>Productos de la Famila $codF:";
$prueba = $objeto->getProductosFamilia($codF);
echo "<ul>";
foreach ($prueba as $k => $v) {
    echo "<code><li>$v</li></code>";
}
echo "</ul>";


// funcion getStock ---------------------------------------------------------------------
$unidades = $objeto->getStock($codP, $codT);
echo "<br>Unidades del producto de código $codP en la tienda de código $codT: $unidades";
