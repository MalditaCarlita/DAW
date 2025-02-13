(:8 - Título de los libros que no tienen versión electrónica.:)
for $x in doc("libros.xml")/biblioteca/libros/libro
where not (exists($x/versionElectronica))
(: o where not($x/versionElectronica) :)
(: o where $x/versionEelectronica :)
return <libro>{$x/titulo, $x/editorial}</libro>