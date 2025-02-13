window.addEventListener('storage', function(e) {
    document.querySelector('.mi-clave').textContent = e.key;
    document.querySelector('.mi-anterior').textContent = e.oldValue;
    document.querySelector('.mi-nueva').textContent = e.newValue;
    document.querySelector('.mi-url').textContent = e.url;
    document.querySelector('.mi-almacenamiento').textContent = JSON.stringify(e.storageArea);
  });
  