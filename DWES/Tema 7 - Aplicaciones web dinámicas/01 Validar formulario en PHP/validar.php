<?php
function validarNombre($nombre){
    return !(strlen($nombre)<4);//Devuelve false si la longitud de la variable nombre es menor que 4
    
}

function validarEmail($email){
    return preg_match("/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,}$/i", $email);//Devuelve el resultado de comparar la expresión regular con la variable email
}

function validarPasswords($pass1, $pass2) {
    return ($pass1 == $pass2) && (strlen($pass1) > 5);//Devuelve el resultado de los dos passwords son iguales y que la longitud del password tiene que ser mayor que 5
}
