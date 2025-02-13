//Botones
const enviar=document.getElementById("enviar");
const borrar=document.getElementById("borrar");
//inputs y salidas
const frase=document.getElementById("frase");
const salida=document.getElementById("salida");

//Función para invertir el texto
function invertirCadena(cad) {
	return cad.split('').reverse().join('');//Separa la cadena en arrays separados por espacio, le da la vuelta y lo une con separadores
}

//Función para validar si son letras minúsculas y espacios
function validar(str) {
	var regex = /^[a-z\s]+$/;//Expresion regular
	if (regex.test(str)) {
		return true;
	} else {
		return false;
	}
}

//Eventos
enviar.addEventListener("click", function(){
    let fraseSinEspacios=frase.value.trim();//Primero le quitamos lo espacios
    if(!validar(fraseSinEspacios)){
        alert("La frase no puede contener mayúsculas ni caracteres especiales");
    } else {
        let fraseReves= invertirCadena(frase.value);
        salida.innerText=`La frase al revés sería: ${fraseReves}\n`;
        if(frase.value==fraseReves){
            salida.innerText+= `Es un palíndromo`;
        }else{
            salida.innerText+= `No es un palíndromo`;
        }
       
    }

});
borrar.addEventListener("click", () =>  {
    frase.value="";
    salida.innerText="";
    frase.focus();
});