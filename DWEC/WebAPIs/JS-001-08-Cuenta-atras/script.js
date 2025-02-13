const salida = document.querySelector('.salida');
salida.innerHTML = '';

let i = 10;

while (i >= 0) {
  const parrafo = document.createElement('p');
  if (i === 10) {
    parrafo.textContent = `Cuenta atrás ${i}`;
  } else if (i === 0) {
    parrafo.textContent = '¡Despegue!';
  } else {
    parrafo.textContent = i;
  }

  salida.appendChild(parrafo);

  i--;
}