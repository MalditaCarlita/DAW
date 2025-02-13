// Cierres: característica de ES6 
//  (ES6 introduce ámbito de bloque y ámbito de módulo; 
//    ya existían ámbito local y ámbito global)


// ---------------------------------------------------------------------------
// Ejemplo 1:
// ---------------------------------------------------------------------------
function inicializar() {
    var nombre = 'Mozilla' + ( Math.floor(Math.random()*10) + 1);        // nombre: es una variable local creada por inicializar

    function mostrarNombre() {     // mostrarNombre(): es la función interna, un cierre
        console.log(nombre);         // usa la variable declarada en la función padre
    }

    mostrarNombre();
}

inicializar();
inicializar();




// ---------------------------------------------------------------------------
// Ejemplo 2:
// ---------------------------------------------------------------------------
function funcionHacer() {
    const nombre = 'Mozilla'  + ( Math.floor(Math.random()*10) + 1);

    function mostrarNombre() {
        console.log(nombre);
    }

    return mostrarNombre;
}

const miFuncion = funcionHacer();
miFuncion();
miFuncion();

funcionHacer()();
funcionHacer()();




// ---------------------------------------------------------------------------
// Ejemplo 3: uso de cierres para crear varias versiones de una misma función
// ---------------------------------------------------------------------------
function hacerRedimensionador(tamano) {
    return function () {
        document.body.style.fontSize = `${tamano}px`;
    };
}

const size12 = hacerRedimensionador(12);
const size14 = hacerRedimensionador(14);
const size16 = hacerRedimensionador(16);

document.getElementById('size-12').onclick = size12;
document.getElementById('size-14').onclick = size14;
document.getElementById('size-16').onclick = size16;





// ---------------------------------------------------------------------------
// Ejemplo 4: emular métodos privados con cierres: 
//            usando una IIFE (Inmediately Invoked Function Expression)
// ---------------------------------------------------------------------------
const contador = (function () {  
    let contadorPrivado = 0;

    function cambiarPor(valor) {
        contadorPrivado += valor;
    }

    return {
        incrementar() { cambiarPor(1); },
        decrementar() { cambiarPor(-1);},
        valor()       { return contadorPrivado; },
    };
})();  // <-- aquí la invocamos inmediatamente después de declararla

console.log(contador.valor()); // 0.

contador.incrementar();
contador.incrementar();

console.log(contador.valor()); // 2.

contador.decrementar();
console.log(contador.valor()); // 1.



// ---------------------------------------------------------------------------
// Ejemplo 5: emular métodos privados con cierres:
//  Nos permite obtener ocultación de datos y encapsulación de datos
// ---------------------------------------------------------------------------
const hacerContador = function () {
    let contadorPrivado = 0;

    function cambiarPor(valor) {
        contadorPrivado += valor;
    }

    return {
        incrementar() { cambiarPor(1); },
        decrementar() { cambiarPor(-1);},
        valor()       { return contadorPrivado; },
    };
};

const contador1 = hacerContador();
const contador2 = hacerContador();

console.log(contador1.valor());    
console.log(contador2.valor());     

contador1.incrementar();
contador1.incrementar();
console.log(contador1.valor());    

contador1.decrementar();
console.log(contador1.valor());    
console.log(contador2.valor());   




// ---------------------------------------------------------------------------
// Ejemplo 6: cadenas de ámbitos
// ---------------------------------------------------------------------------
// Esto es ámbito global
const e1 = 10;
function sumar(a) {
  return function (b) { 
    return function (c) {
      // ámbito de las funciones más externas
      return function (d) {
        // ámbito local de esta función
        return a + b + c + d + e1;
      };
    };
  };
}

console.log(sumar(1)(2)(3)(4)); 




// ---------------------------------------------------------------------------
// Ejemplo 7: cadenas de ámbitos, ahora sin funciones anónimas
// ---------------------------------------------------------------------------
// Esto es ámbito global
const e2 = 10;
function adicion(a) {
  return function adicionDos(b) {
    return function adicionTres(c) {
      // ámbito de las funciones más externas
      return function adicionCuatro(d) {
        // ámbito local de esta función
        return a + b + c + d + e2;
      };
    };
  };
}

const adicion2 = adicion(1);
const adicion3 = adicion2(2);
const adicion4 = adicion3(3);

const resultado = adicion4(4);
const resultado2 = adicion(1)(2)(3)(4);

console.log(resultado); 
console.log(resultado2); 



// ---------------------------------------------------------------------------
// Ejemplo 8: cierre sobre variable de ámbito de bloque
// ---------------------------------------------------------------------------
function exterior(valor) {
  const x = 5;
  if (valor > 10) {
    const y = 6;
    return () => console.log(x, y);
  } else {
    const y = 10;
    return () => console.log(x, y);
  }
}

exterior(20)(); 
exterior(4)(); 




// ---------------------------------------------------------------------------
// Ejemplo 9: ejemplo de cierre mal usado y que no funciona: 
//  CULPABLE: var hosting 
// ---------------------------------------------------------------------------
function mostrarAyuda9(ayuda) {
  document.getElementById('ayuda9').textContent = ayuda;
}

function configurarAyuda9() {
  var textoAyuda = [
    { id: 'direccionEmail9', ayuda: 'Tu dirección de email' },
    { id: 'nombre9',         ayuda: 'Tu nombre completo' },
    { id: 'edad9',           ayuda: 'Tu edad (debes ser mayor de 16 años)' },
  ];

  for (var i = 0; i < textoAyuda.length; i++) {
    // el culplable del problema es el uso de var en la declaración siguiente
    var elemento = textoAyuda[i];
    document.getElementById(elemento.id).onfocus = function () { // esta función es un cierre
      mostrarAyuda9(elemento.ayuda);
    };  
  }
}

configurarAyuda9();


// ---------------------------------------------------------------------------
// Ejemplo 9b: ejemplo de cierre bien usado 
// ---------------------------------------------------------------------------
function mostrarAyuda9b(ayuda) {
  document.getElementById('ayuda9b').textContent = ayuda;
}

function configurarAyuda9b() {
  var textoAyuda = [
    { id: 'direccionEmail9b', ayuda: 'Tu dirección de email' },
    { id: 'nombre9b',         ayuda: 'Tu nombre completo' },
    { id: 'edad9b',           ayuda: 'Tu edad (debes ser mayor de 16 años)' },
  ];

  for (var i = 0; i < textoAyuda.length; i++) {
    const elemento = textoAyuda[i];
    document.getElementById(elemento.id).onfocus = function () { // esta función es un cierre
      mostrarAyuda9b(elemento.ayuda);
    };  
  }
}

configurarAyuda9b();



// ---------------------------------------------------------------------------
// Ejemplo 10: ejemplo de cierre usando el patrón fábrica de funciones (function factory)
// ---------------------------------------------------------------------------
function mostrarAyuda10(ayuda) {
  document.getElementById('ayuda10').textContent = ayuda;
}

function contruirCallbackParaAyuda10(ayuda) {
  return function () {
    mostrarAyuda10(ayuda);
  };
}

function configurarAyuda10() {
  var textoAyuda = [
    { id: 'direccionEmail10', ayuda: 'Tu dirección de email' },
    { id: 'nombre10',         ayuda: 'Tu nombre completo' },
    { id: 'edad10',           ayuda: 'Tu edad (debes ser mayor de 16 años)' },
  ];

  for (var i = 0; i < textoAyuda.length; i++) {
    var elemento = textoAyuda[i];
    document.getElementById(elemento.id).onfocus = contruirCallbackParaAyuda10(elemento.ayuda);
  }
}

configurarAyuda10();



// ---------------------------------------------------------------------------
// Ejemplo 11: ahora ejemplo usando cierres anónimos
// ---------------------------------------------------------------------------
function mostrarAyuda11(ayuda) {
  document.getElementById('ayuda11').textContent = ayuda;
}

function configurarAyuda11() {
  var textoAyuda = [
    { id: 'direccionEmail11', ayuda: 'Tu dirección de email' },
    { id: 'nombre11',         ayuda: 'Tu nombre completo' },
    { id: 'edad11',           ayuda: 'Tu edad (debes ser mayor de 16 años)' },
  ];

  for (var i = 0; i < textoAyuda.length; i++) {
    (function () {
      var elemento = textoAyuda[i];
      document.getElementById(elemento.id).onfocus = function () {
        mostrarAyuda11(elemento.ayuda);
      };
    })();   // Enlazamos inmediatamente el "eventListener" con el valor actual de elemento.ayuda 
  }       
}

configurarAyuda11();


// ---------------------------------------------------------------------------
// Ejemplo 12: solución sin cierres con bucle foreach
// ---------------------------------------------------------------------------
function mostrarAyuda12(ayuda) {
  document.getElementById('ayuda12').textContent = ayuda;
}

function configurarAyuda12() {
  var textoAyuda = [
    { id: 'direccionEmail12', ayuda: 'Tu dirección de email' },
    { id: 'nombre12',         ayuda: 'Tu nombre completo' },
    { id: 'edad12',           ayuda: 'Tu edad (debes ser mayor de 16 años)' },
  ];

  textoAyuda.forEach(function (texto) {
    document.getElementById(texto.id).onfocus = function (){ mostrarAyuda12(texto.ayuda); };
  });
}

configurarAyuda12();


console.log("fin");

