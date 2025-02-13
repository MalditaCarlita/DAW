<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>Actualizar - CRUD PHP</title>
</head>
<body>
    <h1>Modificar Producto</h1>
    <form method="post" action="">
<?php
   require_once('conexion.php');
   //comprobamos si existe la variable
   if(!empty($_GET['id'])) {
    $id=$_GET['id'];
    //preparamos la consulta
    $stmt=$conProyecto->prepare("SELECT * FROM productos WHERE id = '$id' ");
    //ejecutamos la consulta
    $stmt->execute();
    while($fila=$stmt->fetch(PDO::FETCH_OBJ)) {
?>
    <div>
        <label for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre" value="<?php echo "$fila->nombre"?>">
    </div>
    <div>    
        <label for="nombre_corto">Nombre Corto</label>
        <input type="text" id="nombre_corto" name="nombre_corto" value="<?php echo "$fila->nombre_corto"?>">
    </div>
    <div> 
        <label for="pvp">Precio(€)</label>
        <input type="text" id="pvp" name="pvp" value="<?php echo "$fila->pvp"?>">
    </div>
    <div>
        <label for="familia">Familia</label>
        <select id="familia" name="familia" value="<?php echo "$fila->familia"?>">
            <option value="CAMARA">Cámaras digitales</option>
            <option value="CONSOL">Consolas</option>
            <option value="MULTIF">Equipos multifunción</option>
            <option value="IMPRES">Impresoras</option>
            <option value="EBOOK">Libros electrónicos</option>
            <option value="MEMFLA">Memorias flash</option>
            <option value="NETBOOK">Netbooks</option>
            <option value="ORDENA">Ordenadores</option>
            <option value="PORTAT">Ordenadores portátiles</option>
            <option value="MP3">Reproductores MP3</option>
            <option value="ROUTER">Routers</option>
            <option value="SAI">Sistemas de alimentación ininterrumpida</option>
            <option value="SOFTWARE">Software</option>
            <option value="TV">Televisores</option>
            <option value="VIDEOC">Videocámaras</option>
        </select>
    </div>
    <div>
        <label for="descripcion">Descripción</label>
        <textarea type="text" id="descripcion" name="descripcion"><?php echo "$fila->descripcion"?></textarea><br>
        <button type="submit" name="modificar" id="modificar">Modificar</button>
        <a href="listado.php"><button id="volver">Volver</button></a>
    </div>
    <?php 
        }
        if(isset($_POST['modificar'])) {
            $nombre=$_POST['nombre'];
            $nombre_corto=$_POST['nombre_corto'];
            $pvp=$_POST['pvp'];
            $familia=$_POST['familia'];
            $descripcion=$_POST['descripcion'];
        //Se podria generar antes una variable $sql="UPDATE productos SET nombre = :nombre, nombre_corto = :nombre_corto, pvp = :pvp, familia = :familia, descripcion = :descripcion"
        //Y hacer el insert $insertProyecto=$conProyecto->prepare($sql);
        //O también podría ser $sql="UPDATE productos SET nombre = ?, nombre_corto = ?, pvp = ?, familia = ?, descripcion = ?"
        //hacer igual el $insertProyecto, pero en el bindParam(1, $nombre); y así sucesivamente
        $update=$conProyecto->prepare("UPDATE productos SET nombre = :nombre, nombre_corto = :nombre_corto, pvp = :pvp, familia = :familia, descripcion = :descripcion");
        //Es necesario realizar bindParam antes del execute
        $update->bindParam(':nombre', $nombre);
        $update->bindParam(':nombre_corto', $nombre_corto);//(2, $nombre_corto);
        $update->bindParam(':pvp', $pvp);//(3, $pvp);
        $update->bindParam(':familia', $familia);//(4, $familia)
        $update->bindParam(':descripcion', $descripcion);//(5, $descripcion)
        $update->execute();

        }} else {
            header('Location: listado.php');
        }
    ?>
    </form>
</body>
</html>