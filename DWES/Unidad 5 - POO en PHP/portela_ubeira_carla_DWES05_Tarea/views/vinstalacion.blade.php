
<!--Esta vista contiene el botón de instalar que lleva a crearDatos.php, donde se generan
datos aleatorios que luego se insertan -->
@extends('plantillas.plantilla1')
@section('titulo')
{{$titulo}}
@endsection
@section('encabezado')
{{$encabezado}}
@endsection
@section('contenido')

<form name="formulario1" action="crearDatos.php" method="POST">
    <div class="container">
        <div class="col-xs-3 text-center">
            <form action="metodos.php" method="POST">
            <input type="submit" value="Instalar datos de ejemplo" name="instalar" class="btn btn-success">
            </form>
        </div>
    </div>
</form>
@endsection