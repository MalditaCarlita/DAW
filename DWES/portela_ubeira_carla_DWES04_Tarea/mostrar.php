<?php
//Iniciamos sesión o recuperamos la sesión anterior disponible
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Mostrar</title>
</head>
<body>
<div class="card">
    <div class="card-header">
        Preferencias
    </div>
<?php 
//Si se presiona el botón de "Borrar",
//si no se han establecido las preferencias, se lanza un mensaje de advertencia;
//si se han establecido, se borran las preferencias de la sesión del usuario
if(isset($_POST['borrar'])){
    if(($_SESSION['idioma']==null)||($_SESSION['publico']==null)||($_SESSION==null)){
        echo"<p style=\"color:red\">Debes fijar primero las preferencias</p>";
    } else {
    unset($_SESSION['idioma']);
    unset($_SESSION['publico']);
    unset($_SESSION['zona']);
    //y se lanza un mensaje indicando que se han borrado correctamente
    echo "<p>Preferencias borradas</p>";
}}
//Si se presiona el botón "Establecer", se redirecciona a la página preferencias.php
if(isset($_POST['establecer'])){
    header("location:preferencias.php");
}
?>
<!-- Se muestran las preferencias establecidas y sus valores; en caso de no estar establecidas, no se muestran -->
    <div class="card-body">
        <form method="post" action="mostrar.php">
        <div class="col-auto">
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                <div class="input-group-text" style="width:115px;"><label for="idioma">Idioma</label></div>
                </div>
                <input type="text" class="form-control" value="<?php echo $_SESSION['idioma']?>">
            </div>
        </div>
        <div class="col-auto">
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                <div class="input-group-text" style="width:115px;"><label for="publico">Perfil público</label></div>
                </div>
                <input type="text" class="form-control" value="<?php echo $_SESSION['publico']?>">
            </div>
        </div>
        <div class="col-auto">
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                <div class="input-group-text" style="width:115px;"><label for="zona">Zona Horaria</label></div>
                </div>
                <input type="text" class="form-control" value="<?php echo $_SESSION['zona']?>">
            </div>
        </div>
        <div class="col-auto">
            <button class="btn btn-primary" type="submit" name="establecer">Establecer</button>
                    <!--Si se presiona el botón de "Mostrar", se redirecciona a mostrar.php-->
            <button class="btn btn-danger" type="submit" name="borrar">Borrar</button>        
        </div>
        </form>
    </div>
    </div>
    <link src="./node_modules/bootstrap/dist/js/bootstrap.min.js">
    </div>
</body>
</html>