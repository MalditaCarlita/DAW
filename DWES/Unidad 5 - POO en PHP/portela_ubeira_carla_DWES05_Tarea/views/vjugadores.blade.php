<!--Vista que cargo en jugadores.php. Se encarga de mostrar el listado de jugadores junto a sus barcode-->
@extends('plantillas.plantilla1')
@section('titulo')
    {{$titulo}}
@endsection
@section('encabezado')
    {{$encabezado}}
@endsection
@section('contenido')

<!--Código PHP que utilizo para incluir la librería de Milon Barcode y el fichero jugadores.php
que contiene métodos para mostrar el listado deseado -->
<?php
use \Milon\Barcode\DNS1D;
require_once('jugadores.php');
?>

<br>
      <br>
      <br>
      <form name="formulario1" action="fcrear.php" method="POST">
      <input type="submit" value="Nuevo jugador" class="btn btn-success"  name="nuevo" style="margin-left: 1.5%">
         <br>
         <br>
         <div class="container">            
        <div class="col-xs-6 text-center">

        
        <table  class='table table-striped table-dark'>
        <tr>
       <td>Nombre completo</td>
        <td>Posición</td>
       <td>Dorsal</td>
        <td>Código de barras</td>
        </tr>
        <!--Por cada jugador muestro sus datos -->
        @foreach($pinta as $item)
            <tr class="text-center">
                <td scope="row">{{$item->nombre }} {{$item->apellidos }}</td>
                <td>{{$item->posicion}}</td> 
                <td>{{$item->dorsal}}</td> 
                <td align="center" valign="middle">
                @php            
                $codBarras = (new pintaDatosJugadores()) ->pintaCodigoBarras($item->dorsal);
                @endphp</td>
            </tr>
        @endforeach
        </table>
        </div>
        </div>
      </form>
@endsection