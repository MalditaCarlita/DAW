<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css" media="all">
    <title>Listado - CRUD PHP</title>
</head>
<body>
    <h1>Gestión de productos</h1>
    <a href="crear.php"><button id="crear">Crear</button></a> 
    
    <table class="table table-striped">
<?php
//establecemos la conexión con la base de datos
require_once('conexion.php');
?>
        <thead>
            <tr>
                <th>Detalle</th>
                <th>Código</th>
                <th>Nombre</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
<?php
    //preparamos la consulta
    $stmt=$conProyecto->prepare("SELECT * FROM productos");
    //ejecutamos la consulta
    $stmt->execute();
    while($fila=$stmt->fetch(PDO::FETCH_OBJ)) {?>
            <tr>
                <td><a href="detalle.php?id=<?php echo "$fila->id"?>"><button id="detalle">Detalle</button></a>
                <td><?php echo "$fila->id"?></td>
                <td><?php echo "$fila->nombre"?></td>
                <td>
                    <a href="update.php?id=<?php echo "$fila->id"?>"><button id="actualizar">Actualizar</button></a>
                    <a href="borrar.php?id=<?php echo "$fila->id"?>"><button id="borrar">Borrar</button></a>
                </td>
            </tr>
<?php } ?>
        </tbody>
    </table>
</body>
</html>