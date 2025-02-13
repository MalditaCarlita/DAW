// Más adelante se explicará el significado de async y await
//  cuando veamos el tema de JavaScript asíncrono (y Promises)
async function rellenar() { 

  const uRLSolicitud = 'superheroes.json';
  const solicitud = new Request(uRLSolicitud);

  const respuesta = await fetch(solicitud);
  const superHeroes = await respuesta.json();

  rellenarCabecera(superHeroes);
  rellenarHeroes(superHeroes);

}

function rellenarCabecera(obj) {
  const cabecera = document.querySelector('header');
  const miH1    = document.createElement('h1');
  miH1.textContent = obj.nombreEscuadron;
  cabecera.appendChild(miH1);

  const miParrafo = document.createElement('p');
  miParrafo.textContent = `Ciudad: ${obj.ciudadNatal} // Formado: ${obj.formado}`;
  cabecera.appendChild(miParrafo);
}

function rellenarHeroes(obj) {
  const seccion = document.querySelector('section');
  const heroes  = obj.miembros;

  for (const heroe of heroes) {
	const miArticulo = document.createElement('article');
	const miH2        = document.createElement('h2');
	const miParrafo1 = document.createElement('p');
	const miParrafo2 = document.createElement('p');
	const miParrafo3 = document.createElement('p');
	const miLista    = document.createElement('ul');

	miH2.textContent = heroe.nombre;
	miParrafo1.textContent = `Identidad secreta: ${heroe.identidadSecreta}`;
	miParrafo2.textContent = `Edad: ${heroe.edad}`;
	miParrafo3.textContent = 'Superpoderes:';

	const superPoderes = heroe.poderes;
	for (const poder of superPoderes) {
	  const elementoLista = document.createElement('li');
	  elementoLista.textContent = poder;
	  miLista.appendChild(elementoLista);
	}

	miArticulo.appendChild(miParrafo1);
	miArticulo.appendChild(miH2);
	miArticulo.appendChild(miParrafo2);
	miArticulo.appendChild(miParrafo3);
	miArticulo.appendChild(miLista);

	seccion.appendChild(miArticulo);
  }
}

rellenar();