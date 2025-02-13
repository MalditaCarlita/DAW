class A {
    // *********************************************************
    // ÁREA STATIC
    static contadorA;
    static miArraydeAAs;

    static {
        A.contadorA = 0;
       //  miArraydeAAs = [ new A.AA(), new A.AA(), new A.AA() ];
    }

    // *********************************************************
    // ÁREA DE INSTANCIA 
    miembroA = Math.floor(Math.random() * 10) + 1;
    miID;
    yomismo = this;

    AA = class AA {
        var;

        hacerAlgoMiembro () {
            console.log("hola soy miembro aa y mi var = " + this.var);
        }

        constructor() {
            this.var = this.miembroA;
        }
    }

    BB = function BB(padre) {
        this.miPadre = padre.miembroA;

        function mostrarEstado() {
            console.log("Soy BB de padre " + this.miPadre);
        }

    }

    static hacerAlgoStatic () {
        console.log("hola soy statico de A");
    }

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

A.hacerAlgoStatic();
a1.hacerAlgoMiembro();
a2.hacerAlgoMiembro();

console.log("a1.miembroA: " + a1.miembroA);
console.log("a2.miembroA: " + a2.miembroA);

const a1AA1 = new a1.AA();
const a1AA2 = new a1.AA();
const a2AA1 = new a2.AA();
const a2AA2 = new a2.AA();

a1AA1.hacerAlgoMiembro();
a1AA2.hacerAlgoMiembro();
a2AA1.hacerAlgoMiembro();
a2AA2.hacerAlgoMiembro();

/*
for (const aa of A.miArraydeAAs ) {
    aa.hacerAlgoMiembro();
}
*/


const interno1 = new a1.BB(a1);

console.log("Fin");