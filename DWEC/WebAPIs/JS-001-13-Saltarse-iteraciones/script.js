const parrafo = document.querySelector('p');
const campoNumero = document.querySelector('input');
const boton = document.querySelector('button');

boton.addEventListener('click', () => {
  parrafo.textContent = 'Salida: ';
  const numero = campoNumero.value;
  campoNumero.value = '';
  campoNumero.focus();
  
  for (let i = 1; i <= numero; i++) {
    let raizCuadrada = Math.sqrt(i);
    if (Math.floor(raizCuadrada) !== raizCuadrada) {
      continue;
    }
    parrafo.textContent += `${i} `;
  }
  
});
