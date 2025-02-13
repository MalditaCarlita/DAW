class A {
    // *********************************************************
    // ÁREA STATIC
    static contadorA = 0;
    static #secretoStatic = 100;

    static {
        A.contadorA = 0;
    }

    // Clase anidada (nested class) 
    static B = class B {
        static contadorB = 0;

        miID;
        propiedadDeB = A.#secretoStatic;  // tiene acceso a propiedades privadas static de la clase contenedora

        static hacerAlgoStatic () {
            console.log("hola soy statico de B");
        }

        hacerAlgoMiembro () {
            console.log("hola soy miembro b" + this.miID + " y mi propiedad vale " + this.propiedadDeB);
        }

        constructor() {
            B.contadorB++;
            console.log("Creando instancia de B ..." + B.contadorB);
            this.miID = B.contadorB;
        }
    }

    static hacerAlgoStatic () {
        console.log("hola soy statico de A");
    }


    // *********************************************************
    // ÁREA DE INSTANCIA
    miID;

    hacerAlgoMiembro () {
        console.log("hola soy miembro a" + this.miID);
    }

    // *********************************************************
    // Constructor    
    constructor() {
        A.contadorA++;
        console.log("Creando instancia de A ..." + A.contadorA);
        this.miID = A.contadorA;
    }

}

const a1 = new A();
const a2 = new A();

const b1 = new A.B();

A.hacerAlgoStatic();

a1.hacerAlgoMiembro();
a2.hacerAlgoMiembro();

A.B.hacerAlgoStatic();
b1.hacerAlgoMiembro();