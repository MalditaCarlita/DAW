(:4 - Una lista HTML con el título de los libros de la editorial “O'Reilly” ordenados por título.Podemos mezclar etiquetas HTML y XQuery y obtener HTML como resultado de una consulta.:)
<html>
<head>
	<title>Ejercicio 4</title>
</head>
<body>
	<ol>
	{
	for $x in doc("libros.xml")/biblioteca/libros/libro
	where $x/editorial = "O'Reilly"
	order by $x/titulo
	return <li>{data($x/titulo)}</li>
	}
	</ol>
</body>
</html>

