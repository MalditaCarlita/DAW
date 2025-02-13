const resultados = document.querySelector('#resultados');

function calcularTabla() {
  for (let i = 1; i < 10; i++) {
    const resultadoNuevo = `${i} x ${i} = ${i * i}`;
    resultados.textContent += `${resultadoNuevo}\n`;
  }
  resultados.textContent += '\n¡Completado!';
}

const botonCalcularTabla = document.querySelector('#calcular');
const botonBorrar = document.querySelector('#borrar');

botonCalcularTabla.addEventListener('click', calcularTabla);
botonBorrar.addEventListener('click', () => resultados.textContent = '');
