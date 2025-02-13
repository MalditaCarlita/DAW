function relojDigital(){
    let miFecha  = new Date();
    let horas    = miFecha.getHours();
    let minutos  = miFecha.getMinutes();
    let segundos = miFecha.getSeconds();

    if (horas > 12) {
      ampm = 'pm';
      horas -= 12;
    } else {
      ampm = 'am';
    }

    if (horas<10) {
        horas='0'+horas;
    }
    
    if (minutos<10) {
        minutos='0'+minutos;
    }

    if (segundos<10) {
        segundos='0'+segundos;
    }
    
    const texto = document.getElementById('reloj');
    texto.innerHTML = horas + ':' + minutos + ':' + segundos + ' ' + ampm;
    }

    window.onload = function() {
      const reloj = setInterval(relojDigital, 1000 );
    }