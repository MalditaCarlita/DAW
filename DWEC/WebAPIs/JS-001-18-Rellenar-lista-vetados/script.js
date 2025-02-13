
const listaDeGente = ['Juan', 'Ana', 'Mónica', 'Alfonso', 'Patricia', 'Jennifer', 'Montana', 'Jana', 'Carlos'];
const listaVetados = ['Juan',  'Mónica', 'Luis', ];

const admitido = document.querySelector('.admitido');
const rechazado = document.querySelector('.rechazado');

admitido.textContent = 'Admitir a: ';
rechazado.textContent = 'Rechazar a: ';

for (const persona of listaDeGente) {
  if (listaVetados.find( vetado => vetado === persona )) {
    rechazado.textContent += `${persona}, `;
  } else {
    admitido.textContent += `${persona}, `;
  }
}

rechazado.textContent = rechazado.textContent.slice(0,rechazado.textContent.length-2) + '.';
admitido.textContent = admitido.textContent.slice(0,admitido.textContent.length-2) + '.';

