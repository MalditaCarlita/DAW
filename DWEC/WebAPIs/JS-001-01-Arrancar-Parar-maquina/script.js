const boton = document.querySelector("button");
const texto = document.querySelector("p");

boton.addEventListener("click", actualizarBoton);

function actualizarBoton() {
  if (boton.textContent === "Arrancar máquina") {
    boton.textContent = "Detener máquina";
    texto.textContent = "¡La máquina ha arrancado!";
	texto.style.color = "green";
  } else {
    boton.textContent = "Arrancar máquina";
    texto.textContent = "¡La máquina se ha detenido!";
	texto.style.color = "red";

  }
}

