// Configurar canvas
const parrafo = document.querySelector('p');
let contador  = 0;

const canvas  = document.querySelector('canvas');
const ctx     = canvas.getContext('2d');
const ancho   = canvas.width = window.innerWidth;
const alto    = canvas.height = window.innerHeight;


// Función para generar un número aleatorio
function aleatorio(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}


// Función para generar un color RGB aleatorio
function aleatorioRGB() {
  return `rgb(${aleatorio(0, 255)},${aleatorio(0, 255)},${aleatorio(0, 255)})`;
}


function bucle() {
  ctx.fillStyle = 'rgba(0, 0, 0, 0.25)';
  ctx.fillRect(0, 0, ancho, alto);

  for (const pelota of pelotas) {
    if (pelota.existe) {
      pelota.dibujar();
      pelota.actualizar();
      pelota.detectarColision();
    }
  }

  agujero.dibujar();
  agujero.comprobarBorde();
  agujero.detectarColision();

  requestAnimationFrame(bucle);
}


class Forma {

  constructor(x, y, velX, velY) {
    this.x = x;
    this.y = y;
    this.velX = velX;
    this.velY = velY;
  }

}

class Pelota extends Forma {

  constructor(x, y, velX, velY, color, tamano) {
    super(x, y, velX, velY);

    this.color  = color;
    this.tamano = tamano;
    this.existe = true;
  }

  dibujar() {
    ctx.beginPath();
    ctx.fillStyle = this.color;
    ctx.arc(this.x, this.y, this.tamano, 0, 2 * Math.PI);
    ctx.fill();
  }

  actualizar() {
    if ((this.x + this.tamano) >= ancho) {
      this.velX = -(this.velX);
    }

    if ((this.x - this.tamano) <= 0) {
      this.velX = -(this.velX);
    }

    if ((this.y + this.tamano) >= alto) {
      this.velY = -(this.velY);
    }

    if ((this.y - this.tamano) <= 0) {
      this.velY = -(this.velY);
    }

    this.x += this.velX;
    this.y += this.velY;
  }


  detectarColision() {
     for (const pelota of pelotas) {
        if (!(this === pelota) && pelota.existe) {
           const dx = this.x - pelota.x;
           const dy = this.y - pelota.y;
           const distancia = Math.sqrt(dx * dx + dy * dy);

           if (distancia < this.tamano + pelota.tamano) {
             pelota.color = this.color = aleatorioRGB();
           }
        }
     }
  }

}

class Agujero extends Forma {

  constructor(x, y) {
    super(x, y, 20, 20);

    this.color  = "white";
    this.tamano = 10;

    window.addEventListener('keydown', (e) => {
      switch(e.key) {
        case 'a':
          this.x -= this.velX;
          break;
        case 'd':
          this.x += this.velX;
          break;
        case 'w':
          this.y -= this.velY;
          break;
        case 's':
          this.y += this.velY;
          break;
      }
    });
  }

  dibujar() {
    ctx.beginPath();
    ctx.strokeStyle = this.color;
    ctx.lineWidth = 3;
    ctx.arc(this.x, this.y, this.tamano, 0, 2 * Math.PI);
    ctx.stroke();
  }

  comprobarBorde() {
    if ((this.x + this.tamano) >= ancho) {
      this.x -= this.tamano;
    }

    if ((this.x - this.tamano) <= 0) {
      this.x += this.tamano;
    }

    if ((this.y + this.tamano) >= alto) {
      this.y -= this.tamano;
    }

    if ((this.y - this.tamano) <= 0) {
      this.y += this.tamano;
    }
  }

  detectarColision() {
    for (const pelota of pelotas) {
      if (pelota.existe) {
        const dx = this.x - pelota.x;
        const dy = this.y - pelota.y;
        const distancia = Math.sqrt(dx * dx + dy * dy);

        if (distancia < this.tamano + pelota.tamano) {
          pelota.existe = false;
          contador--;
          parrafo.textContent = 'Contador pelotas: ' + contador;
        }
      }
    }
  }

}

const agujero = new Agujero(aleatorio(0, ancho), aleatorio(0, alto));

// Declaramos un array para contener las pelotas y lo inicializamos
const pelotas = [];
while (pelotas.length < 25) {
  const tamano = aleatorio(10,20);
  const pelota = new Pelota(
    // La pelota debe dibujarse siempre, al menos, a una 
    // distancia del borde del canvas del ancho de la pelota
    // para evitar problemas al dibujar
    aleatorio(0 + tamano,ancho - tamano),
    aleatorio(0 + tamano,alto - tamano),
    aleatorio(-7,7),
    aleatorio(-7,7),
    aleatorioRGB(),
    tamano
  );
  pelotas.push(pelota);
  contador++;
  parrafo.textContent = 'Contador pelotas: ' + contador;
}



bucle();