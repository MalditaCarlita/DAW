const aliciaRotacion = [
  { transform: 'rotate(0) scale(1)' },
  { transform: 'rotate(360deg) scale(0)' }
];

const aliciaTemporizador = {
  duration: 2000,
  iterations: 1,
  fill: 'forwards'
}

const alicia1 = document.querySelector("#alicia1");
const alicia2 = document.querySelector("#alicia2");
const alicia3 = document.querySelector("#alicia3");

// Esto utiliza JavaScript asíncrono (Promise)
alicia1.animate(aliciaRotacion, aliciaTemporizador).finished
  .then(() => alicia2.animate(aliciaRotacion, aliciaTemporizador).finished)
  .then(() => alicia3.animate(aliciaRotacion, aliciaTemporizador).finished)
  .catch(error => console.error(`Error al animar a las Alicias: ${error}`));