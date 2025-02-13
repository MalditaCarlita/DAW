(: Título y editorial de todos los librosPara devolver varios campos, los envolvemos en un elemento. :)
for $i in doc("libros.xml")/biblioteca/libros/libro
return <libro>{$i/titulo, $i/editorial}</libro>