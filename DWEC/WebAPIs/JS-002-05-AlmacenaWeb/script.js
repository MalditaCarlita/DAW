
let htmlElem = document.querySelector('html');
let pElem    = document.querySelector('p');
let imgElem  = document.querySelector('img');

let colorFondo = document.getElementById('colorFondo');
let fuente     = document.getElementById('fuente');
let imagen     = document.getElementById('imagen');

if(!localStorage.getItem('colorFondo')) {
  rellenarAlmacenamiento();
} else {
  configurarEstilos();
}

function rellenarAlmacenamiento() {
  localStorage.setItem('colorFondo', document.getElementById('colorFondo').value);
  localStorage.setItem('fuente',     document.getElementById('fuente').value);
  localStorage.setItem('imagen',     document.getElementById('imagen').value);

  configurarEstilos();
}

function configurarEstilos() {
  let colorActual  = localStorage.getItem('colorFondo');
  let fuenteActual = localStorage.getItem('fuente');
  let imagenActual = localStorage.getItem('imagen');

  document.getElementById('colorFondo').value = colorActual;
  document.getElementById('fuente').value     = fuenteActual;
  document.getElementById('imagen').value     = imagenActual;

  htmlElem.style.backgroundColor = '#' + colorActual;
  pElem.style.fontFamily = fuenteActual;
  imgElem.setAttribute('src', imagenActual);
}

colorFondo.onchange = rellenarAlmacenamiento;
fuente.onchange     = rellenarAlmacenamiento;
imagen.onchange     = rellenarAlmacenamiento;