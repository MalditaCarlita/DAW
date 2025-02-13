<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>Crear-CRUD PHP</title>
</head>
<body>
    <h1>Crear Producto</h1>
    <?php 
    if((!empty($_POST['nombre']))&&(!empty($_POST['nombre_corto']))&&(!empty($_POST['pvp']))&&(!empty($_POST['familia']))&&(!empty($_POST['descripcion']))) {
        require_once('conexion.php');
        $nombre=$_POST['nombre'];
        $nombre_corto=$_POST['nombre_corto'];
        $pvp=$_POST['pvp'];
        $familia=$_POST['familia'];
        $descripcion=$_POST['descripcion'];
        //Se podria generar antes una variable $sql="INSERT INTO productos (nombre, nombre_corto, pvp, familia, descripcion) VALUES (:nombre, :nombre_corto, :pvp, :familia, :descripcion) "
        //Y hacer el insert $insertProyecto=$conProyecto->prepare($sql);
        //O también podría ser $sql="INSERT INTO productos (nombre, nombre_corto, pvp, familia, descripcion) VALUES (?, ?, ?, ?, ?);
        //hacer igual el $insertProyecto, pero en el bindParam(1, $nombre); y así sucesivamente
        $insertProyecto=$conProyecto->prepare("INSERT INTO productos (nombre, nombre_corto, pvp, familia, descripcion) VALUES (:nombre, :nombre_corto, :pvp, :familia, :descripcion) ");
        //Hay que hacer bindParam de cada valor antes del execute
        $insertProyecto->bindParam(':nombre', $nombre);
        $insertProyecto->bindParam(':nombre_corto', $nombre_corto);//(2, $nombre_corto);
        $insertProyecto->bindParam(':pvp', $pvp);//(3, $pvp);
        $insertProyecto->bindParam(':familia', $familia);//(4, $familia)
        $insertProyecto->bindParam(':descripcion', $descripcion);//(5, $descripcion)
        $insertProyecto->execute();
        //Una vez creado el  nuevo producto, nos redirecciona a la página principal 'listado.php'
        header('Location: listado.php');
    }
    ?>
    <form method="post" action="">
        <div>
            <label for="nombre">Nombre</label>
            <input placeholder="Nombre" type="text" id="nombre" name="nombre">
        </div>
        <div>
            <label for="nombre_corto">Nombre Corto</label>
            <input  placeholder="Nombre corto" type="text" id="nombre_corto" name="nombre_corto"><br>
        </div>
        <div>
            <label for="pvp">Precio(€)</label>
            <input placeholder="Precio(€)" type="text" id="pvp" name="pvp">
        </div>
        <div>
            <label for="familia">Familia</label>
            <select id="familia" name="familia">
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
        <div class="textarea">
            <label for="descripcion">Descripción</label>
            <textarea type="text" id="descripcion" name="descripcion"></textarea><br>
            <button type="submit" value="submit" id="crear_crear">Crear</button>
            <button type="reset" value="reset" id="limpiar">Limpiar</button>
            <a href="listado.php"><button type="submit" value="back" id="volver">Volver</button></a>
        </div>
    </form>
</body>
</html>