//Capturamos el submit. Si no cumple validar no hacemos el submit
$("#registro").submit(function (event) {
    if (!validar()) event.preventDefault();//Si no se ha validad, no permite hacer el submit
});

function validarNombre() {
    var usu = $("#usu");//Captura el input con id usu
    var errUsu = $("#errUsu");//Capura el span del error de usuario
    if (usu.val().length < 4) {//Si la variable tiene menos de 4 caracteres
        errUsu.removeClass("d-none").addClass("input-group form-group text-danger");//Se le quita la clase d-none y se añade la clase que muestra el texto en rojo y avisa del error
        return false;
    }
    errUsu.last().addClass("d-none");//Sino, la añade la clase d-none y devuelve que la validación se ha producido
    return true;

}
function validarPass() {
    var pass1 = $("#pass1");
    var pass2 = $("#pass2");
    var errPass = $("#errPass");
    if (pass1.val().length < 6 || pass1.val() != pass2.val()) {
        errPass.removeClass("d-none").addClass("input-group form-group text-danger");
        return false;
    }
    errPass.last().addClass("d-none");
    return true;

}
function validarMail() {
    var mail = $("#mail")
    var errMail = $("#errMail");
    if (!mail.val().match("^[a-zA-Z0-9]+[a-zA-Z0-9_-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{2,4}$")) {
        errMail.removeClass("d-none").addClass("input-group form-group text-danger");
        return false;
    }
    errMail.last().addClass("d-none");
    return true;
}
function validar() {//Para que validad sea true, tienen que ser true las tres validaciones
    return validarNombre() & validarMail() & validarPass();
}