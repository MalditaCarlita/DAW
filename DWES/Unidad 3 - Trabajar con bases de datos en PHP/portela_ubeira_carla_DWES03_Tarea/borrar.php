<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>Borrar - CRUD PHP</title>
</head>
<body>
<?php 
    require_once ('conexion.php');
    if(!empty($_GET['id'])) {
        $id=$_GET['id'];
        //preparamos la consulta
        $delete=$conProyecto->prepare("DELETE FROM productos WHERE id = :id ");
        //Es necesario realizar antes del execute el bindParam
        $delete->bindParam(':id', $id);
        //ejecutamos la consulta
        $delete->execute();
        echo "<p>Producto de código: ".$id ." Borrado correctamente";
    }
?>
    <a href="listado.php"><button id="volver">Volver</button></a>
</body>
</html>