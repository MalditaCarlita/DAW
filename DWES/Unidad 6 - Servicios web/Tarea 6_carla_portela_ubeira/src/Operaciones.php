<?php


namespace Clases;

require '../vendor/autoload.php';


use Clases\{Producto, Stock, Familia};

class Operaciones
{
    //php2wsdl es una librería que revisa los comentarios que hayas añadido al código de la clase que quieras a publicar 
    //(debe ser una clase, no funciones aisladas), y genera como salida el documento WSDL correspondiente.
    //Para que funcione correctamente, es necesario que los comentarios de las clases sigan un formato específico: el mismo que utiliza la herramienta de documentación PHPDocumentor.
    /**
     * Obtiene el PVP de un producto a partir de su codigo
     * @soap            //Para indicar métodos que se generen en el documento WSDL
     * @param int $codP //Para indicar parametros
     * @return float    //Para indicar valor
     */
    public function getPvp($codP)
    {
        $producto = new Producto();
        $producto->setId($codP);
        $precio = $producto->getPrecio();
        $producto = null;
        return $precio;
    }
    /**
     * Devuelve el numero de unidades que existen en una tienda de un producto
     * @soap
     * @param int $codP
     * @param int $codT
     * @return int
     */
    public function getStock($codP, $codT)
    {
        $stock = new Stock();
        $stock->setProducto($codP);
        $stock->setTienda($codT);
        $uni = $stock->getUnidadesTienda();
        $stock = null;
        return $uni;
    }
    /**
     * Devuelve un array con los codigos de todas las familias
     * @soap
     * @param
     * @return string[]
     */
    public function getFamilias()
    {
        $familas = new Familia();
        $valores = $familas->getFamilias();
        $familas = null;
        return $valores;
    }
    /**
     * Devuelve un array con los nombres de los productos de una familia
     * @soap
     * @param string $codF
     * @return string[]
     */
    public function getProductosFamilia($codF)
    {
        $productos = new Producto();
        $datos = $productos->productoFamila($codF);
        $productos = null;
        return $datos;
    }
    /**
     * Devuelve un int con el stock total de todos los productos de todas las familias de una tienda
     * @soap
     * @param int $codT
     * @return int
     */
    public function stockTienda($codT){
        $stocks = new Stock();
        $totalStock=$stocks->getStockTienda($codT);
        $stocks=null;
        return $totalStock;
    }
}
