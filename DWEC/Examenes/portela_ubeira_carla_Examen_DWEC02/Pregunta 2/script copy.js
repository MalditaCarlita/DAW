//Botones
const enviar=document.getElementById("B1");
const borrar=document.getElementById("borrar");
const color=document.getElementById("B2");

//Inputs y salidas
const numero=document.getElementById("numero");
let salida=document.getElementById("salida");

//Funciones
function calcularFibonacci(termino) {
    if ( termino < 2 ) {
        return termino;
    } else {
        return  calcularFibonacci(termino - 1) + calcularFibonacci(termino - 2);
    }
}


function limpiarEntradas(){
    numero.value="";
    num.value="";
    colorSpan.value=""
    salida.innerHTML="";
    numero.focus();
}


//Eventos
enviar.addEventListener("click", function(){
    let num=Number(numero.value);
    //Creamos un array de colores
    if(numero.value==""){
        alert("Por favor, introduce un número");
        numero.focus();
    } else if(num < 1 || num > 20|| numero > Number.MAX_SAFE_INTEGER){
        alert("El número introducido debe de estar comprendido entre 1 y 20");
        numero.focus();
    } else {
        //Si está el número introducido validado imprimimos los números con la funcion calcularFibonacci
        let termino=0;
        for(let i=0; i<=num;i++){
            let fibonacci=calcularFibonacci(termino);
            salida.innerHTML+=`<span> ${fibonacci} </span>`;
            termino++;
        }
    }
});

color.addEventListener("click", function(){
    salida.innerHTML="";
    let num=Number(numero.value);
    let colorArray=new Array();
    for(let j=0; j<10; j++){
        let randomColour= "#" + Math.floor(Math.random()*16777215).toString(16);
        colorArray[j]=randomColour;
    }
    let termino=0;
        for(let i=0; i<=num;i++){
            let fibonacci=calcularFibonacci(termino);
            salida.innerHTML+=`<span> ${fibonacci} </span>`;
            let colorSpan=document.querySelectorAll("span");
            colorSpan[i].style.color=colorArray[i];
            termino++;
        }
});

borrar.addEventListener("click", limpiarEntradas);


