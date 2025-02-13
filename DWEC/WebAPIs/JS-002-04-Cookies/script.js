// Modificar cookie: volver a crearla con nuevos datos
// Borrar cookie: volver a crearla con fecha pasada ( o usar parámetro max-age: "usuario=; max-age=0")
function miraCookies() {
    var text = "";
    if (navigator.cookieEnabled == true) {
        text = "Las cookies están habilitadas.";
    } else {
        text = "Las cookies están deshabilitadas.";
    }
    document.getElementById("muestracookies").innerHTML = text;
 }

const cookies = document.cookie; // leer cookies
const estado = cookies.split("; ");

for (const cookie of estado) {
    const info = cookie.split("=");
    alert("Variable: " + info[0] + "   valor = " + decodeURIComponent(info[1]));
}

const fecha = new Date(2023, 7, 6).toUTCString() ;  // el mes (y día) comienza a contar desde 0 = Enero, ..., 7 = agosto
document.cookie="usuario=" + encodeURIComponent("Elena es la niña de mis hojos") + ";expires=" + fecha;
document.cookie="click1=1100x2333;expires=Sun, 6 Aug 2023 12:15:00 GMT"