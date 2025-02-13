const boton = document.querySelector('button');
boton.addEventListener('click', () => mostrarMensaje('Muy buenas, ¿cómo estás hoy?', 'bocadillo'));

function mostrarMensaje(textoDelMensaje,tipoDelMensaje) {
	const html = document.querySelector('html');

	const cajaMensaje = document.createElement('div');
	cajaMensaje.setAttribute('class','estiloCajaMensaje');
	html.appendChild(cajaMensaje);

	const mensaje = document.createElement('p');
	mensaje.textContent = textoDelMensaje;
	cajaMensaje.appendChild(mensaje);

	const botonCerrar = document.createElement('button');
	botonCerrar.textContent = 'x';
	cajaMensaje.appendChild(botonCerrar);

	botonCerrar.onclick = function() {
	  cajaMensaje.parentNode.removeChild(cajaMensaje);
	}

	if(tipoDelMensaje === 'aviso') {
	  mensaje.style.backgroundImage = 'url(aviso.png)';
	  cajaMensaje.style.backgroundColor = 'red';
	} else if(tipoDelMensaje === 'bocadillo') {
	  mensaje.style.backgroundImage = 'url(bocadillo.png)';
	  cajaMensaje.style.backgroundColor = 'aqua';
	} else {
	  mensaje.style.paddingLeft = '20px';
	}
}