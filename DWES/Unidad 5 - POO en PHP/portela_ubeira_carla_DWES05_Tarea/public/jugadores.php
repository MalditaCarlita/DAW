<?php
//Llama a la vista "vjugadores.blade.php" y muestra en una tabla los datos de los jugadores
//Tiene un botón crear que llama al formulario para crear un jugador nuevo
require '../vendor/autoload.php';

use Clases\Jugador;
use Clases\Conexion;
use \Milon\Barcode\DNS1D;
use Philo\Blade\Blade;

$views = '../views';
$cache = '../cache';
$blade = new Blade($views, $cache);
$pinta = (new pintaDatosJugadores())->listadoJugadores();
$titulo = 'Listado de jugadores';
$encabezado = 'Listado de jugadores';

echo $blade
    ->view()
    ->make('vjugadores', compact('titulo', 'encabezado', 'pinta'))
    ->render();

class pintaDatosJugadores
{
    private $nombre;
    private $apellidos;
    private $posicion;
    private $dorsal;
    private $codigoBarras;

    //Para pintar el codigo de barras del usuario con el nº de dorsal que le pasamos
    public static function pintaCodigobarras($dorsal)
    {
        $conexion = new Conexion();
        $cod = null;
        //Consultala base de datos para comprobar si existe el código de barras
        $resultado = $conexion->prepare("SELECT barcode FROM jugadores where dorsal = :dorsal");
        $resultado->bindParam(':dorsal', $dorsal);
        //Ejecuto la consulta y en función de lo obtenido creo un objeto DNS1D que posteriormente
        //pinto por pantalla con echo y también retorno para que sea visible en la vista.
        try {
            $d = new DNS1D();
            while ($registro = $resultado->fetch()) {
                $cod = $registro[0]; //Cod equivale al barcode almacenado en la base de datos
                $d->setStorPath(__DIR__ . '/cache/');
                echo  $d->getBarcodeHTML($cod, 'EAN13');
            }
        } catch (PDOException $ex) {
            die("Error al recuperar: " . $ex->getMessage());
        }
        return $d;
    }

    //Devuelve un listado de todos los jugadores
    public function listadoJugadores()
    {
        $conexion = new Conexion();
        $resultado = $conexion->prepare("SELECT * FROM jugadores order by dorsal");
        try {
            $resultado->execute();
        } catch (PDOException $ex) {
            die("Error al recuperar: " . $ex->getMessage());
        }
        return $resultado->fetchAll(PDO::FETCH_OBJ);
    }
}