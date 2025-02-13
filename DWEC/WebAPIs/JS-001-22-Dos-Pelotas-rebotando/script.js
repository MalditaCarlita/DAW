// Preparar el canvas
const canvas = document.querySelector('canvas');
const ctx    = canvas.getContext('2d');

const ancho = canvas.width  = window.innerWidth;
const alto  = canvas.height = window.innerHeight;


// Función para generar un número aleatorio
function aleatorio(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}


// Función para generar un color RGB aleatorio
function aleatorioRGB() {
  return `rgb(${aleatorio(0, 255)},${aleatorio(0, 255)},${aleatorio(0, 255)})`;
}


// Función de animación
function bucle() {
   ctx.fillStyle = 'rgba(0, 0, 0, 0.25)';
   ctx.fillRect(0, 0,  ancho, alto);

   pelota1.actualizar();
   pelota1.dibujar();

   pelota2.actualizar();
   pelota2.dibujar();

   if (!pelota2.detectarColision(pelota1) ) {
      requestAnimationFrame(bucle);
   }

}


// Clase Pelota
class Pelota {

   constructor(x, y, velX, velY, color, tamano) {
      this.x = x;
      this.y = y;
      this.velX = velX;
      this.velY = velY;
      this.color = color;
      this.tamano = tamano;
   }

   dibujar() {
      ctx.beginPath();
      ctx.fillStyle = this.color;
      ctx.arc(this.x, this.y, this.tamano, 0, 2 * Math.PI);
      ctx.fill();
   }

   actualizar() {
      if ((this.x + this.tamano) >= ancho) {
         this.velX = -(Math.abs(this.velX));
      }

      if ((this.x - this.tamano) <= 0) {
         this.velX = Math.abs(this.velX);
      }

      if ((this.y + this.tamano) >= alto) {
         this.velY = -(Math.abs(this.velY));
      }

      if ((this.y - this.tamano) <= 0) {
         this.velY = Math.abs(this.velY);
      }

      this.x += this.velX;
      this.y += this.velY;
   }

   detectarColision(pelota) {
      if (!(this === pelota)) {
         const dx = this.x - pelota.x;
         const dy = this.y - pelota.y;
         const distancia = Math.sqrt(dx * dx + dy * dy);

         if (distancia < this.tamano + pelota.tamano) {
            pelota.color = aleatorioRGB();
            this.color = aleatorioRGB();
            pelota.velX = 0 ;
            pelota.velY = 0 ;
            this.velX = 0;
            this.velY = 0;
            return true;
         }
      }
      return false;
   }

}

// Creamos 2 pelotas:
const tamano1 =  aleatorio(10,20);
const pelota1 = new Pelota(    
   // La pelota debe dibujarse siempre, al menos, a una 
   // distancia del borde del canvas del ancho de la pelota
   // para evitar problemas al dibujar
   aleatorio(0 + tamano1,ancho - tamano1),
   aleatorio(0 + tamano1,alto - tamano1),
   aleatorio(-7,7),
   aleatorio(-7,7),
   aleatorioRGB(),
   tamano1
);

const tamano2 =  aleatorio(10,20);
const pelota2 = new Pelota(    
   // La pelota debe dibujarse siempre, al menos, a una 
   // distancia del borde del canvas del ancho de la pelota
   // para evitar problemas al dibujar
   aleatorio(0 + tamano2,ancho - tamano2),
   aleatorio(0 + tamano2,alto - tamano2),
   aleatorio(-7,7),
   aleatorio(-7,7),
   aleatorioRGB(),
   tamano2
);

// Comienza la animación:
bucle();