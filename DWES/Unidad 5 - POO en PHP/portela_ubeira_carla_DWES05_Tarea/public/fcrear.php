<?php
//Es el formulario para crear el jugador
use \Milon\Barcode\DNS1D;
use Philo\Blade\Blade;
//Llama a la vista: "vcrear.blade.php".
require '../vendor/autoload.php';
$views = '../views';
$cache = '../cache';
$blade = new Blade($views, $cache);

$titulo = 'Crear jugador';
$encabezado = 'Crear jugador';
echo $blade
    ->view()
    ->make('vcrear', compact('titulo', 'encabezado'))
    ->render();
?>