const boton    = document.querySelector('button');
const canvas   = document.querySelector('canvas');
const contexto2D = canvas.getContext('2d');

document.addEventListener('DOMContentLoaded', () => {
  canvas.width = document.documentElement.clientWidth;
  canvas.height = document.documentElement.clientHeight;
});

function random(numero) {
  return Math.floor( Math.random() * numero);
}

function dibujar() {
  contexto2D.clearRect(0, 0, canvas.width, canvas.height);
  for (let i = 0; i < 100; i++) {
    contexto2D.beginPath();
    contexto2D.fillStyle = 'rgba(255,0,0,0.5)';
    contexto2D.arc(random(canvas.width), random(canvas.height), random(50), 0, 2 * Math.PI);
    contexto2D.fill();
  }
}

boton.addEventListener('click',dibujar);

window.addEventListener ('load', dibujar);
