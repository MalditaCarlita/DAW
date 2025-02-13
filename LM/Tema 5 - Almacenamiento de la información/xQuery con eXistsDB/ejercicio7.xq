(:7 - Título y editorial de los libros que tienen versión electrónica.:)
for $x in doc("libros.xml")/biblioteca/libros/libro
where exists($x/versionElectronica)
(: o where $x/versionEelectronica :)
return <libro>{$x/titulo, $x/editorial}</libro>