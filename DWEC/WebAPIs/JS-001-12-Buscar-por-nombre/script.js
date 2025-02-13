const agendaContactos = ['Roberto:986232323', 'Ana:986767676', 'Benito Roberto:616070707', 'Juan:91343434', 'Diana:986696969'];
const parrafo = document.querySelector('p');
const textoEntradaContacto = document.querySelector('input');
const boton = document.querySelector('button');

boton.addEventListener('click', () => {
  const nombreABuscar = textoEntradaContacto.value.toLowerCase();
  textoEntradaContacto.value = '';
  textoEntradaContacto.focus();
  parrafo.textContent = '';
  
  for (const contacto of agendaContactos) {
    const parteNombre = contacto.split(':');
    if (parteNombre[0].toLowerCase() === nombreABuscar) {
      parrafo.textContent = `El número de teléfono de ${parteNombre[0]} es ${parteNombre[1]}.`;
      break;
    }
  }
  
  if (parrafo.textContent === '') {
   parrafo.textContent = '🤷Lo sentimos, este contacto no está en la agenda.';
 }
 
});
