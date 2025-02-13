/*
* EN ESTA PROPUESTA DE SOLUCIÓN:
*   Creamos una clase (solución más actual)
*/
class Edificio {
    constructor (calle, numero, codigopostal) {
    // Propiedades
    this.calle        = calle;
    this.numero       = numero;
    this.codigoPostal = codigopostal;
    this.plantas      = new Array();

    // Imprimimos el mensaje por defecto cada vez que se crea un objeto Edificio.
    const parrafo     = document.createElement('p');
    parrafo.innerText = "Construido nuevo edificio en calle: " + calle + ", nº: " + numero + ", CP: " + codigopostal;
    document.body.appendChild(parrafo); 
    }

    agregarPlantasYPuertas (numplantas, puertas) {
        let totalplantas = this.plantas.length;
        let inicio       = totalplantas <= 0 ? 0 : totalplantas;
       
        for (let i = inicio; i < totalplantas + numplantas; i++)
        {
            this.plantas[i] = new Array(puertas);
            for (let j=0; j < puertas; j++)
                    this.plantas[i][j] = "";     // Propietario de esa puerta en blanco.
        }     
    }

    modificarNumero(numero) {
        this.numero = numero;
    }

    modificarCalle(calle) {
        this.calle = calle;
    }

    modificarCodigoPostal(codigo) {
        this.codigoPostal = codigo;
    }

    imprimeCalle() {
        return this.calle;
    }

    imprimeNumero() {
        return this.numero;
    }

    imprimeCodigoPostal() {
        return this.codigoPostal;
    }

    agregarPropietario(nombre, planta, puerta) {
        this.plantas[planta-1][puerta-1] = nombre;
        const parrafo = document.createElement('p');
        parrafo.innerText = nombre + " es ahora el propietario de la puerta " + puerta + " de la planta " + planta;
        document.body.appendChild(parrafo);
    }

    imprimePlantas() {
        // Imprimirá las plantas y nombres de propietarios de cada puerta de un edificio.
        const cabecera = document.createElement('h2');
        cabecera.innerText = "Listado de propietarios del edificio calle " + this.calle + " número "  + this.numero;
        document.body.appendChild(cabecera);
        const parrafo = document.createElement('p');
        for (let i=0; i < this.plantas.length ;i++)
            for (let j=0; j <this.plantas[i].length - 1; j++) {
                if(this.plantas[i][j]!=null){
                    //Si los pisos tienen propietario, se mostrará el siguiente mensaje
                    parrafo.innerText += "Propietario del piso " +(j+1) +" de la planta " +(i+1)  +": "+this.plantas[i][j] +"\n"; 
                    } else {
                        //sino, se mostrará el campo de propietario vacío
                    parrafo.innerText +="Propietario del piso " +(j+1) +" de la planta " +(i+1)  +": " +"\n"; 
                    }
                document.body.appendChild(parrafo);
            }
    }
}


/* *******************************************
 *   
 *
*/
const cabecera = document.createElement('h1');
cabecera.innerText = "TRABAJANDO CON OBJETOS EN JAVASCRIPT";
document.body.appendChild(cabecera);

//-------------------------------------------------------
let parrafo = document.createElement('p');
parrafo.innerText = "Instanciamos 3 objetos edificioA, edificioB y edificioC con estos datos:";
document.body.appendChild(parrafo);

var edificioA = new Edificio("Garcia Prieto","58",15706);
var edificioB = new Edificio("Camino Caneiro","29",32004);
var edificioC = new Edificio("San Clemente","s/n",15705);

parrafo = document.createElement('p');
parrafo.innerText = `El código postal del edificio A es: ${edificioA.imprimeCodigoPostal()}
                     La calle del edificio C es: ${edificioC.imprimeCalle()}
                     El edificio B está situado en la calle ${edificioB.imprimeCalle()}  número ${edificioB.imprimeNumero()}
                     Agregamos 2 plantas y 3 puertas por planta al edificio A...`;
document.body.appendChild(parrafo);


// --------------------------------------------------------------------------
document.body.appendChild(document.createElement('br'));
edificioA.agregarPlantasYPuertas(2,3);

parrafo = document.createElement('p');
parrafo.innerText = "Agregamos 4 propietarios al edificio A...";
document.body.appendChild(parrafo);

edificioA.agregarPropietario("Jose Antonio Lopez",1,1);
edificioA.agregarPropietario("Luisa Martinez",1,2);
edificioA.agregarPropietario("Marta Castellón",1,3);
edificioA.agregarPropietario("Antonio Pereira",2,2);
document.body.appendChild(document.createElement('br'));
edificioA.imprimePlantas();

// --------------------------------------------------------------------------
document.body.appendChild(document.createElement('br'));
document.body.appendChild(document.createElement('br'));
parrafo = document.createElement('p');
parrafo.innerText = "Agregamos 1 planta más al edificio A...";
document.body.appendChild(parrafo);
edificioA.agregarPlantasYPuertas(1,2);


// --------------------------------------------------------------------------
document.body.appendChild(document.createElement('br'));
document.body.appendChild(document.createElement('br'));
parrafo = document.createElement('p');
parrafo.innerText = "Agregamos 1 propietario más al edificio A planta 3, puerta 2...";
document.body.appendChild(parrafo);
edificioA.agregarPropietario("Pedro Meijide",3,2);

// --------------------------------------------------------------------------
document.body.appendChild(document.createElement('br'));
edificioA.imprimePlantas();

class Constructora {
    nombre;
    edificios;
    numEdificios;
    constructor(nombre){
        this.nombre=nombre;
        this.edificios = new Array();
        this.numEdificios=0;
        salida.innerText += "Se ha construido un nueva constructora llamada " +this.nombre +"\n";
    }
    //Para añadir los encargos de la constructora
    agregarEncargos(edificio){
        this.edificios[this.numEdificios]=edificio;
        this.numEdificios++;
        salida.innerText +="Se ha añadido un encargo para un edificio en la calle " +edificio.calle +", nº " +edificio.numero +", CP: " +edificio.codigo +".\nCon un total de " +this.numEdificios +" encargos para la inmobiliaria.\n";
    }
    
    //Para imprimir todos los encargos de la constructora
    imprimirEdificios(){
        salida.innerText+= "Listado de edificios de la constructora " +this.nombre +":\n";
        for(var j=0; j<this.edificios.length;j++){
            if(this.edificios[j]!=null){
            salida.innerText += "- Edificio "+(j+1) +": en la calle " +this.edificios[j].calle +", nº:" +this.edificios[j].numero +" y código postal " +this.edificios[j].codigo +".\n";
            }else{
                salida.innerText += "- Edificio "+(j+1) +":\n";
            }
        }
    }

    //Para borrar un edificio concreto, primero busco el index del edificio a borrar y luego lo borro
    borrarEdificios(edificio){
        for(var i=0; i<this.edificios.length;i++){
            if(this.edificios[i]==edificio){
                this.edificios[i]=null;
                this.numEdificios--;
                salida.innerText +="Se ha borrado el Edificio " + (i+1) +" de la contructora " +this.nombre +"\n";
                salida.innerText +="Quedan un total de " +this.numEdificios +" edificios de la contructora" +this.nombre +"\n";
            }
        }
    }
    
}
var constructoraA=new Constructora("Manolo & CIA");
constructoraA.agregarEncargos(edificioA);
constructoraA.agregarEncargos(edificioB);
constructoraA.agregarEncargos(edificioC);
constructoraA.imprimirEdificios();