<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>Detalle - CRUD PHP</title>
</head>
<body>
<?php 
    require_once('conexion.php');
    //comprobamos si existe la variable id con el código del producto
    if(!empty($_GET['id'])) {
        $id=$_GET['id'];
        //preparamos la consulta
        //Se puede inicializar una variable $sql="SELECT * FROM productos WHERE id = :id ";
        //Y luego realizar $stmt=$conProyecto->prepare($sql);
        $stmt=$conProyecto->prepare("SELECT * FROM productos WHERE id = :id ");
        //Es necesario realizar el bindParam
        $stmt->bindParam(':id', $id);
        //ejecutamos la consulta
        $stmt->execute();
        while($fila=$stmt->fetch(PDO::FETCH_OBJ)) {
?>
    <h1>Detalle Producto</h1>
    <fieldset>
        <legend><?php echo "$fila->nombre"?></legend>
        <p id="p_codigo">Código: <?php echo "$fila->id"?></p>
        <p>Nombre: <?php echo "$fila->nombre"?></p>
        <p>Nombre_corto: <?php echo "$fila->nombre_corto"?>
        <p>Código Familia: <?php echo "$fila->familia"?></p>
        <p>PVP (€): <?php echo "$fila->pvp"?></p>
        <p>Descripción: <?php echo "$fila->descripcion"?></p>
    </fieldset>
<?php }} else {
        header('Location: listado.php');
        }
?>
<div class="detalle">
    <a href="listado.php"><button id="volver">Volver</button></a>  
</div class="detalle">
</body>
</html>