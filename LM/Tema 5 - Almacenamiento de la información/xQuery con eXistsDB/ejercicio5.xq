(:5 - Título y editorial de los libros de 2002.:)
for $x in doc("libros.xml")/biblioteca/libros/libro
where $x[number(@publicacion)=2002]
return <libro>{$x/titulo, $x/editorial}</libro>