const boton = document.querySelector('button');

function obtenerValorAlAzar(number) {
  return Math.floor(Math.random() * (number+1));
}

boton.addEventListener('click', () => {
  const colorAlAzar = `rgb(${obtenerValorAlAzar(255)}, ${obtenerValorAlAzar(255)}, ${obtenerValorAlAzar(255)})`;
  console.log(colorAlAzar);
  document.body.style.backgroundColor = colorAlAzar;
});