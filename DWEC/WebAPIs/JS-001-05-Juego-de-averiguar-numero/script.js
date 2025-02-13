let numeroAlAzar      = Math.floor(Math.random() * 100) + 1;
const intentos        = document.querySelector('.intentos');
const ultimoResultado = document.querySelector('.ultimoResultado');
const informeIntento  = document.querySelector('.informeIntento');
const campoIntento    = document.querySelector('.campoIntento');
let contadorIntentos  = 1;
let botonBorrar;



function comprobarIntento() {
  const intentoUsuario = Number(campoIntento.value);
  if (contadorIntentos === 1) {
    intentos.textContent = 'Intentos previos: ';
  }

  intentos.textContent += intentoUsuario + ' ';

  if (intentoUsuario === numeroAlAzar) {
    ultimoResultado.textContent = '¡Enhorabuena! ¡Has acertado!';
    ultimoResultado.style.backgroundColor = 'green';
    informeIntento.textContent = '';
    informarFinJuego();
  } else if (contadorIntentos === 10) {
    ultimoResultado.textContent = '!!!UPSS, PERDISTE!!!';
    informeIntento.textContent = '';
    informarFinJuego();
  } else {
    ultimoResultado.textContent = '¡Fallo!';
    ultimoResultado.style.backgroundColor = 'red';
    if(intentoUsuario < numeroAlAzar) {
    informeIntento.textContent = 'Te quedaste por debajo...' ;
    } else if(intentoUsuario > numeroAlAzar) {
    informeIntento.textContent = 'Te has pasado...';
    }
  }

  contadorIntentos++;
  campoIntento.value = '';
  campoIntento.focus();
}


function informarFinJuego() {
  campoIntento.disabled = true;
  envioIntento.disabled = true;
  botonBorrar = document.createElement('button');
  botonBorrar.textContent = 'Comenzar de nuevo juego';
  document.body.appendChild(botonBorrar);
  botonBorrar.addEventListener('click', reiniciarJuego);
}

function reiniciarJuego() {
  contadorIntentos = 1;
  const parrafosABorrar = document.querySelectorAll('.parrafosResultados p');
  for (const borrarParrafo of parrafosABorrar) {
    borrarParrafo.textContent = '';
  }

  botonBorrar.parentNode.removeChild(botonBorrar);
  campoIntento.disabled = false;
  envioIntento.disabled = false;
  campoIntento.value = '';
  campoIntento.focus();
  ultimoResultado.style.backgroundColor = 'white';
  numeroAlAzar = Math.floor(Math.random() * 100) + 1;
}

const envioIntento = document.querySelector('.envioIntento');
envioIntento.addEventListener('click', comprobarIntento);