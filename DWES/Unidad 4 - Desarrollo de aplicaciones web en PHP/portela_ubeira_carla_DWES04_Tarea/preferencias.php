<?php
//Iniciamos sesión o recuperamos la sesión anterior disponible
session_start();
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="./style.css">
<link rel="stylesheet" href="./node_modules/bootstrap-icons/font/bootstrap-icons.css">
<title>Preferencias</title>
</head>
<body>
    <div class="card">
        <div class="card-header">
            Preferencias de usuario
        </div>
<?php
//Si se presiona el botón de "Establecer preferencias", se guardan las preferencias en la sesión del usuario
if(isset($_POST['establecer'])){
    $_SESSION['idioma']=$_POST['idioma'];
    $_SESSION['publico']=$_POST['publico'];
    $_SESSION['zona']=$_POST['zona'];
    //Y se lanza un mensaje indicando que se han guardado correctamente
    echo"<p>Preferencias guardadas</p>";
}
if(isset($_POST['mostrar'])){
    header("location:mostrar.php");
}
//Si no se han establecido las preferencias, se muestra el formulario correspondiente
?>
        <div class="card-body">
            <form action="preferencias.php" method="post">
                <div class="col-auto">
                    <label class="sr-only" for="idioma">Idioma</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                        <div class="input-group-text"><i class="bi bi-translate"></i></div>
                        </div>
                        <select id="idioma" name="idioma" class="form-control">
                            <!--Si se han establecido las preferencias, se muestran las preferencias como valores por defecto-->
                            <option class="card-text" value="Inglés" <?php if($_SESSION['idioma']=="inglés") echo"selected=true";?>>Inglés</option>
                            <option class="card-text" value="Español" <?php if($_SESSION['idioma']=="español") echo"selected=true";?>>Español</option>
                        </select>
                    </div>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="publico">Perfil público</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                        <div class="input-group-text"><i class="bi bi-people"></i></div>
                        </div>
                        <select id="publico" name="publico" class="form-control">
                            <option class="card-text" value="Sí" <?php if($_SESSION['publico']=="si") echo"selected=true";?>>Si</option>
                            <option class="card-text" value="No" <?php if($_SESSION['publico']=="no") echo"selected=true";?>>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="zona">Zona horaria</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                        <div class="input-group-text"><i class="bi bi-globe"></i></div>
                        </div>
                        <select id="zona" name="zona" class="form-control">
                            <option class="card-text" value="GMT-2" <?php if($_SESSION['zona']=="GMT-2") echo"selected=true";?>>GMT-2</option>
                            <option class="card-text" value="GMT-1" <?php if($_SESSION['zona']=="GMT-1") echo"selected=true";?>>GMT-1</option>
                            <option class="card-text" value="GMT" <?php if($_SESSION['zona']=="GMT") echo"selected=true";?>>GMT</option>
                            <option class="card-text" value="GMT+1" <?php if($_SESSION['zona']=="GMT+1") echo"selected=true";?>>GMT+1</option>
                            <option class="card-text" value="GMT+2"<?php if($_SESSION['zona']=="GMT+2") echo"selected=true";?>>GMT+2</option>
                        </select>
                    </div>
                </div>
                <div class="col-auto">
                    <button class="btn btn-primary" type="submit" name="establecer">Establecer preferencias</button>
                    <!--Si se presiona el botón de "Mostrar", se redirecciona a mostrar.php-->
                    <button class="btn btn-success" type="submit" name="mostrar">Mostrar preferencias</button>
                </div>
            </form>
        </div>
    </div>
    <link src="./node_modules/bootstrap/dist/js/bootstrap.min.js">
</body>
</html>
