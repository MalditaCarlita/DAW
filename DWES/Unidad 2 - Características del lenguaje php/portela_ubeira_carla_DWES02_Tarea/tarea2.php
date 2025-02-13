<!DOCTYPE html>
<html lang="es-ES">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos.css">
    <link rel="icon" type="image/png" href="favicon.png" />
    <title>DWES Tarea 02</title>
</head>

<body>
    <h1>Agenda</h1>
    <form action="tarea2.php" method="post">
        <?php
        if (isset($_POST['agenda'])) {//Si agenda está definida en $_POST
            $agenda = $_POST['agenda'];//Asignamos el valor de $_POST['agenda'] a la variable agenda
        }else {//sino, definimos agenda como array vacío
            $agenda = [];
        }
        if(isset($_POST['nombre'])) {
            if (isset($_POST['nombre']) && !isset($agenda[$_POST['nombre']]) && !empty($_POST['telefono'])) {//si nombre está definido en $_POST
                $nombre = $_POST['nombre'];//definimos la variable nombre con el valor $_POST['nombre']
                $telefono = $_POST['telefono'];//y la misma forma la variable teléfono
                $agenda[$nombre] = $telefono;//y definimos la variable agenda con $key de nombre y $value de telefono
            }
            if ((isset($agenda[$_POST['nombre']])) && !empty($_POST['telefono'])) {
                $nombre = $_POST['nombre'];
                $agenda[$nombre] = $_POST['telefono'];
            }
            if ((isset($agenda[$_POST['nombre']])) && empty($_POST['telefono'])) {
                $nombre = $_POST['nombre'];
                unset($agenda[$nombre]);
            }
        }
        if (count($agenda) > 0) {//si hay algún elemento en la agenda
        ?>
            <fieldset>
                <legend>Contactos Agenda</legend>
                <table>
                    <?php
                    
                    foreach ($agenda as $nombre => $telefono) {
                    ?>
                        <tr>
                            <td>
                                <?php echo $nombre ?>
                            </td>
                            <td>
                                <?php echo $telefono ?>
                            </td>
                        </tr>
                        <input type="hidden" value="<?php echo $telefono ?>" name="agenda[<?php echo $nombre ?>]" />
                    <?php
                    }
                    ?>
                </table>
            </fieldset>
        <?php
        } else {
            $agenda = [];
        }
        ?>
        <fieldset>
            <legend style="font-weight: bold;">Nuevo Contacto</legend>
            <label>Nombre:&nbsp; &nbsp;&nbsp;</label>
            <input type="text" name="nombre" minlength="1" maxlength="50" placeholder="Nombre" required="true" /><br>
            <label>Teléfono:&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="tel" name="telefono" maxlength="9" placeholder="Teléfono" /><br><br>
            <button type="submit" name=enviar style="color: #2D70B7">Añadir contacto</button>
            <button type="reset" style="color: #45818e">Limpiar campos</button>

        </fieldset>
    </form>
    <?php 
        if(count($agenda) > 0) {
    ?>
    <fieldset>
        <legend style="font-weight: bold;">Vaciar Contactos</legend><br>
        <form action=tarea2.php method="get" />
        <button type="submit" value="1" name="limpiar" style="color: #CD919E" />Vaciar</button>
        </form>
    </fieldset>
    <?php
        }
    ?>
    <?php
    if (isset($_GET['limpiar'])) { //si pulsamos el botón de vaciar, se borran los datos guardados en la agenda
        unset($nombre, $telefono);
     } ?>
</body>
</html>