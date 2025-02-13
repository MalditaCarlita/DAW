const boton = document.querySelector("button");

function saludar() {
  const nombre = prompt("¿Cómo te llamas?");
  alert(`¡Hola ${nombre}, encantado de conocerte!`);
}

boton.addEventListener("click", saludar);