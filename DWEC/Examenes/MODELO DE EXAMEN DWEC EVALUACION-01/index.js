let tema = document.getElementById('tema');
let salida = document.querySelector('.salida');
let h1 = document.querySelector('h1');

tema.addEventListener('change', function() {
        if(tema.value == "negro") {
          salida.style = "background-color : white; color : black height = 300 px";
          h1.style = " color : black; background-color : white";
        }
        if(tema.value == "purpura") {
            salida.style = "background-color : purple; color : white; height = 300 px";
            h1.style = " color : white; background-color : purple;";
        }
        if(tema.value == "blanco") {
            salida.style = "background-color : black; color : white; height = 300 px";
            h1.style = " color : white; background-color : black;";
        }
        if(tema.value == "amarillo")  {
            salida.style = "background-color : yellow; color : darkgray; height = 300 px";
            h1.style =  "color : darkgray; background-color : yellow;"; 
        }
    });