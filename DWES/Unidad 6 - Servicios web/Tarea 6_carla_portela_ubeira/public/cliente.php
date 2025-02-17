<?php
$url = 'http://127.0.0.1/dwes_tema_06/TAREA_06/servidorSoap/servicio.php';
$uri = 'http://127.0.0.1/dwes_tema_06/TAREA_06/servidorSoap';


try {
    //Se instancia un nuevo clente Soap
    $cliente = new SoapClient(null, ['location' => $url, 'uri' => $uri]);
} catch (SoapFault $f) {
    die("Error en cliente SOAP:" . $f->getMessage());
}
$codP = 2;
$codT = 14;
$codF = 'CONSOL';
//Se realiza una llamada a cada una de las funciones programadas y se muestra el resultado obtenido
//funcion getPvp ----------------------------------------------------------------------------
//Se realiza una llamada con el método mágico __soapCall para pasarle el método al que se está llamando y los parámetros en un array
$pvp = $cliente->__soapCall('getPvp', ['id' => $codP]);
$precio = ($pvp == null) ? "No existe es Producto" : $pvp;
//se muestra el resultado obtenido
echo "Código de producto de Código $codP: $precio";


//funcion getFamilias -----------------------------------------------------------------------
echo "<br>Código de Familas";
$familias = $cliente->__soapCall('getFamilias', []);
echo "<ul>";
foreach ($familias as $k => $v) {
    echo "<code><li>$v</li></code>";
}
echo "</ul>";

//funcion getProductosFamila ----------------------------------------------------------------
$productos = $cliente->__soapCall('getProductosFamilia', ['codF' => $codF]);
echo "<br>Productos de la Famila $codF:";
echo "<ul>";
foreach ($productos as $k => $v) {
    echo "<code><li>$v</li></code>";
}
echo "</ul>";

// funcion getStock -------------------------------------------------------------------------
$unidades = $cliente->__soapCall('getStock', ['codP' => $codP, 'codT' => $codT]);
echo "<br>Unidades del producto de código; $codP en la tienda de código: $codT: $unidades";

// funcion stockTienda ----------------------------------------------------------------------
$stocks = $cliente->__soapCall('stockTienda', ['codT' => $codT]);
echo "<br>Stock de productos de la tienda $codT:<br>";
echo "<ul>";
foreach($stocks as $producto=>$unidades){
    echo"<li>Producto $producto: $unidades unidades</li>";
}
echo"</ul>";