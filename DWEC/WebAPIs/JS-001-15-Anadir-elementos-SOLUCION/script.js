const boton = document.querySelector('button');
let estado = 'bocadillo';
let mensajeCambiante = 'Muy buenas, ¿cómo estás hoy?';
const cajaMensaje = document.createElement('div');
const mensaje = document.createElement('p');
const botonCerrar = document.createElement('button');



boton.addEventListener('click', () => mostrarMensaje(mensajeCambiante, estado));

function mostrarMensaje(textoDelMensaje,tipoDelMensaje) {
	const html = document.querySelector('html');

	cajaMensaje.setAttribute('class','estiloCajaMensaje');
	html.appendChild(cajaMensaje);

	mensaje.textContent = textoDelMensaje;
	cajaMensaje.appendChild(mensaje);

	botonCerrar.textContent = 'x';
	cajaMensaje.appendChild(botonCerrar);

	botonCerrar.onclick = function() {
	  cajaMensaje.parentNode.removeChild(cajaMensaje);
	}

	if(tipoDelMensaje === 'aviso') {
	  mensaje.style.backgroundImage = 'url(aviso.png)';
	  cajaMensaje.style.backgroundColor = 'red';
	  estado = 'bocadillo';
	  mensajeCambiante = 'Muy buenas, ¿cómo estás hoy?';
	} else if(tipoDelMensaje === 'bocadillo') {
	  mensaje.style.backgroundImage = 'url(bocadillo.png)';
	  cajaMensaje.style.backgroundColor = 'aqua';
	  estado = 'otro';
	  mensajeCambiante = 'Ciao!';
	} else {
	  // mensaje.style.paddingLeft = '20px';
	  mensaje.style.backgroundImage = 'url(bocata.png)';
	  cajaMensaje.style.backgroundColor = 'yellow';
	  estado = 'aviso';
	  mensajeCambiante = 'Me levanté con el pie izquierdo!!!';

	}
}