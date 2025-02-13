const imagenMostrada = document.querySelector('.imagenMostrada');
const barraMiniaturas = document.querySelector('.barraMiniaturas');

const boton = document.querySelector('button');
const sobreimpreso = document.querySelector('.sobreimpreso');

/* Declaramos los arrays con información de imagenes */
const images = ['imagen1.jpg', `imagen2.jpg`, `imagen3.jpg`, `imagen4.jpg`, `imagen5.jpg`];
const textosAlternativos = {
  'imagen1.jpg' : 'Primer plano de ojo humano',
  'imagen2.jpg' : 'Roca que parece una ola',
  'imagen3.jpg' : 'Pensamientos blancos y púrpura',
  'imagen4.jpg' : 'Parte de la tumba del Faraón',
  'imagen5.jpg' : 'Polilla grande sobre hoja'
}

/* Recorremos todas las imágenes con un bucle: */
for (const imagen of images) {
  const imagenNueva = document.createElement('img');
  imagenNueva.setAttribute('src', `imagenes/${imagen}`);
  imagenNueva.setAttribute('alt', textosAlternativos[imagen]);
  barraMiniaturas.appendChild(imagenNueva);
  imagenNueva.addEventListener('click', e => {
    imagenMostrada.src = e.target.src;
    imagenMostrada.alt = e.target.alt;
  });
}

/* Nos enganchamos al botón de Oscurecer/Brillante */
boton.addEventListener('click', () => {
  const claseDelBoton = boton.getAttribute('class');
  if (claseDelBoton === 'oscuro') {
    boton.setAttribute('class','luminoso');
    boton.textContent = 'Dar brillo';
    sobreimpreso.style.backgroundColor = 'rgba(0,0,0,0.5)';
  } else {
    boton.setAttribute('class','oscuro');
    boton.textContent = 'Oscurecer';
    sobreimpreso.style.backgroundColor = 'rgba(0,0,0,0)';
  }
});