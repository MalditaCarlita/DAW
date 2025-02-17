function envForm() {
    let usu = document.getElementById("usu").value;//Tomamos el valor de los inputs y los pasamos como parámetro a la función registrada php con Jaxon
    let pass = document.getElementById('pass').value;

    // llamamos por AJAX al php:
    jaxon_vUsuario(usu, pass);
    
    // anulamos la acción por defecto del formulario:
    return false;
}

function validado() {
    window.open("listado.php", "_self");//La función abre un nueva ventana que dirige a listado.php, en la misma ventana
}

function noValidado() {
    alert("¡¡Usuario o contraseña no válidos!!!");//La función lanza un alert
}