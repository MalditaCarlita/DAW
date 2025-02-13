const campoTexto = document.querySelector("#campoTexto");
const salida = document.querySelector("#salida");

campoTexto.addEventListener('keydown', (evento) => salida.textContent = `Has presionado la "${evento.key}".`);