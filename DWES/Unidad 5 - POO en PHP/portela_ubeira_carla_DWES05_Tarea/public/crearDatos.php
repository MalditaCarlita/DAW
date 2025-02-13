<?php
//Esta página me genera los datos de ejemplo
require '../vendor/autoload.php';

use Clases\Jugador;
use Philo\Blade\Blade;
use \Milon\Barcode\DNS1D;
$views = '../views';
$cache = '../cache';
//Instancio objeto de Fzaninotto faker
$faker = Faker\Factory::create();
//Creo array para guardar los nº aleatorios para dorsal que genero. Evita duplicados 
$valores = array(); 
//Variable de control para el método que genera números aleatorios para dorsales
$x = 0; 

//Para crear 10 jugadores con datos aleatorios
for ($i = 0; $i <10; $i++) {
    //Instancio un objeto de tipo Jugador y le inserto atributos aleatorios
    $jugadorRandom=new Jugador($faker->firstname, $faker->lastname, posicionAleatoria(), dorsalAleatorio(), codigoBarras());
    //Inserto el jugador en la base de datos
    $jugadorRandom->insertarJugador($jugadorRandom); 
}

echo "<script>alert('Se han instalado los datos de prueba. Redirigiendo a jugadores...')
window.location.href=\"jugadores.php\";
</script>"; 

//Método para crear un número de posición aleatorio entre 1 y 6 equivalente al enum de la base de datos 
function posicionAleatoria(){
    $posicion=rand(1,6);
    return $posicion ;
}

//Método para crear un número de dorsal aleatorio del 1 al 10 evitando que se repitan 
function dorsalAleatorio(){
    global $valores;
    global $x;
    //Mientras existan menos de 10 jugadores (que es el máximo), creamos un dorsal aleatorio
    while ($x<10) { 
        $dorsal = rand(1,10);
        //Compruebamos que no exista en el array
        if (!in_array($dorsal,$valores)) { 
        array_push($valores,$dorsal);
        $x++; 
        return $dorsal; 
        }  
    }
}

//Método para generar un código de barras para cada jugador
function codigoBarras(){
    $digitos = null;
    for($i = 0; $i < 12; $i++){
       $digitos .= mt_rand(0,9);
    }
    return $digitos;
  } 

?>