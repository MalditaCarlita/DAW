
localStorage.setItem('clave1', 'valor1');
const clave = localStorage.getItem('clave1');
localStorage.removeItem('clave1');
localStorage.clear();

// una clave también se crea automáticamente al asignar a localStorage.clave
function contadordeClicks() {
    if (localStorage.contador) {
      localStorage.contador = Number(localStorage.contador) + 1;
    } else {
      localStorage.contador = 1;
    }
    document.getElementById("resultado").innerHTML = "Has clickado en boton  " + localStorage.contador + " veces, esta sesion.";
  }