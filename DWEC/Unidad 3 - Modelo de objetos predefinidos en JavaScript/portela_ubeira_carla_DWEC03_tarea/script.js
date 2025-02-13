//botones
const crear=document.getElementById("botonCrear");

let ventana;

crear.addEventListener("click", ()=>{
    let url=window.location.href;
    let protocolo=window.location.protocol;
    let navegador=window.location.hostname;
    let java=navigator.javaEnabled();
    let javaDisponible;
    if(java==true){
        javaDisponible="SI";
    } else {
        javaDisponible="NO";
    }
    ventana=window.open("","Nueva ventana", "resizable=no");
    ventana.document.write(
       `<body style="background-color:gray;">
        <h3>Ejemplo de Ventana Nueva</h3>
        <p>URL completa: ${url}</p>
        <p>Protocolo utilizado: ${protocolo}</p>
        <p>Nombre del código del navegador: ${navegador}</p>
        <p>Java <strong>${javaDisponible}</strong> disponible en esta ventana</p>
        <iframe style="width=800px, height=600px" src="https://www.google.es" title="google.es"></iframe>
        </body>`);   
});
const cerrar=document.getElementById("botonCerrar");
cerrar.addEventListener("click", function(){
    ventana.close();
});

//Mostrar formulario
let mostrarFormulario=document.getElementById("mostrarFormulario");
mostrarFormulario.innerHTML+=
   `    <p>
        <label for="nombreApellidos" style="display:inline-block;width:150px;height:30px;">Nombre y Apellidos</label>
        <input type="text" style="border-radius:4px; border-width: 1px;" id="nombreApellidos" name="nombreApellidos" placeholder="Nombre y apellidos"></br>
        </p>
        <p>
        <label for="dia" style="display: inline-block;width:150px;height:30px;">Día de nacimiento</label>
        <input type="number" style="border-radius:4px; border-width: 1px;" id="dia" name="dia" placeholder="Día de nacimiento"></br>
        </p>
        <p>
        <label for="mes" style="display: inline-block;width:150px;height:30px;">Mes de nacimiento</label>
        <input type="number" style="border-radius:4px; border-width: 1px;" id="mes" name="mes" placeholder="Mes de nacimiento"></br>
        </p>
        <p>
        <label for="anio" style="display: inline-block;width:150px;height:30px;">Año de nacimiento</label>
        <input type="number" style="border-radius:4px; border-width: 1px;" id="anio" name="anio" placeholder="Año de nacimiento"></br>
        </p>
        <button type="submit" id="botonEnviar" value="Enviar" style="border-radius:4px; border-width: 1px;">Enviar</button>`;
const enviar=document.getElementById("botonEnviar");
enviar.addEventListener("click", function() {
    //variables del formulario
    let nombreApellidos=document.getElementById("nombreApellidos").value;
    //Para obtener el nombre, dividiremos el String en palabras usando el espacio en blanco como separador, con el método split()
    //Obtenemos del array de palabras, la primera con index =
    let nombre=nombreApellidos.split(' ')[0];
    let dia=Number(document.getElementById("dia").value);
    let mes=Number(document.getElementById("mes").value);
    let anio=Number(document.getElementById("anio").value);
    //calculamos la edad
    let hoy= new Date;
    let calcEdad = hoy.getFullYear() - anio - 1;
    let edad;
    if(hoy.getMonth() + 1 - mes <0) {
        edad=calcEdad;
    }
    if(hoy.getMonth() +1 - mes >0){
        edad=calcEdad + 1;
    }
    //Salida de los resultados
    let mostrarDatos=document.getElementById("mostrarDatos");
    mostrarDatos.innerHTML+=
       `<p>¡Buenos días ${nombre}!</p>
        <p>Tu nombre tiene ${(nombre.length)} letras</p>
        <p>La primera letra A de tu nombre está en la posición: ${nombre.toLowerCase() .indexOf('a')}</p>
        <p>La última letra A de tu nombre está en la posición: ${nombre.toLowerCase() .lastIndexOf('a')}</p>
        <p>Tu nombre menos las 3 primeras letras es: ${nombre.substring(3)}</p>
        <p>Tu nombre todo en mayúsculas es: ${nombre.toUpperCase()};
        <p>Tu edad es: ${edad} años</p>
        <p>Naciste un feliz ${dia} del año ${anio}</p>
        <p>El coseño de 180 es: ${Math.cos(180)}</p>
        <p>El número mayor de (34,67,23,75,35,19) es: ${Math.max(34,67,27,75,35,19)}</p>
        <p>Ejemplo de un número al azar: ${Math.round(Math.random()*1000)}</p>`;
});

