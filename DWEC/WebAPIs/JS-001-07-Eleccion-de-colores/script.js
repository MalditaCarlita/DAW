const select = document.querySelector('select');
const html = document.querySelector('.salida');

select.addEventListener('change', () => {
  const seleccion = select.value;

  switch(seleccion) {
    case 'negro':
      actualizarColor('black','white');
      break;
    case 'blanco':
      actualizarColor('white','black');
      break;
    case 'purpura':
      actualizarColor('purple','white');
      break;
    case 'amarillo':
      actualizarColor('yellow','darkgray');
      break;
    case 'psicodelico':
      actualizarColor('lime','purple');
      break;
  }
});

function actualizarColor(colorFondo, colorTexto) {
  html.style.backgroundColor = colorFondo;
  html.style.color = colorTexto;
}