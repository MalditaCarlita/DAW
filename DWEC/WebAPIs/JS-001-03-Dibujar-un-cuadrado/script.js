const canvas  = document.getElementById('canvas');
const parrafo = document.querySelector('p');
const ancho   = document.getElementById('ancho');
const alto    = document.getElementById('alto');
const ctx     = canvas.getContext('2d');


function limpiarCanvas() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  parrafo.textContent = `El rectángulo es ${ancho.value}pixeles de ancho y ${alto.value}pixeles de alto.`;
}

function dibujarCuadrado() {
  limpiarCanvas();
  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, ancho.value, alto.value);  
}

const dibujar = document.getElementById('dibujar');
dibujar.addEventListener('click', dibujarCuadrado);

const botonBorrar = document.getElementById('borrar');
botonBorrar.addEventListener('click', function() {
  ancho.value = 100;
  alto.value = 100;

  dibujarCuadrado();
});

window.addEventListener('load', dibujarCuadrado);
