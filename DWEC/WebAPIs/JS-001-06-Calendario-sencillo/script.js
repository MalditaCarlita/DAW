const campoSelect = document.querySelector('select');
const listaDias = document.querySelector('ul');
const h1 = document.querySelector('h1');

campoSelect.addEventListener('change', () => {
  const eleccion = campoSelect.value;

  let numeroDiasMes = 31;
  if (eleccion === 'Febrero') {
    numeroDiasMes = 28;
  } else if (eleccion === 'Abril' || eleccion === 'Junio' || eleccion === 'Septiembre'|| eleccion === 'Noviembre') {
    numeroDiasMes = 30;
  }

  crearCalendario(numeroDiasMes, eleccion);
});

function crearCalendario(numeroDiasMes, eleccion) {
  listaDias.innerHTML = '';
  h1.textContent = eleccion;
  for (let i = 1; i <= numeroDiasMes; i++) {
    const elementoDia = document.createElement('li');
    elementoDia.textContent = i;
    listaDias.appendChild(elementoDia);
  }
}

crearCalendario(31,'Enero');