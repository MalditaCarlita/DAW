<?php
//script para la conexión con la base de datos
try{
    //variables
    $host="localhost";
    $db="proyecto";
    $user="gestor";
    $pass="secreto";
    //conexión con la base de datos
    $dsn="mysql:host=$host;dbname=$db;";
    $conProyecto=new PDO($dsn,$user,$pass);
    $conProyecto->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //se comprueba si se ha establecido la conexión, sino lanza una excepción
} catch (PDOException $e) {
    $conProyecto=$e->getMessage();
    echo "Se ha producido el error: ".$e->getMessage();
}
?>