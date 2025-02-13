const formulario = document.querySelector('form');
const nombre = document.getElementById('nombreFormulario');
const apellidos = document.getElementById('apellidosFormulario');
const parrafo = document.querySelector('p');

formulario.addEventListener('submit', (evento) => {
  if (nombre.value === '' || apellidos.value === '') {
    evento.preventDefault();
    parrafo.textContent = '¡Debe incluir ambos!';
  }
});