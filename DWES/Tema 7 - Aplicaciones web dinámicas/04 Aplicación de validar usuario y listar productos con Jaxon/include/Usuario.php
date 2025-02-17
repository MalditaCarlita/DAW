<?php

require 'Conexion.php';
class Usuario extends Conexion
{
    private $usuario;
    private $pass;

    public function __construct()
    {
        parent::__construct();
    }

    public function isValido($u, $p)
    {
        $pass1 = hash('sha256', $p);//Codificamos la contraseña, ya que en la DB las contraseñas se guardan codificadas
        $consulta = "select * from usuarios where usuario=:u AND pass=:p";
        $stmt = Conexion::$conexion->prepare($consulta);//Realiza una consulta para saber si existe algún usuario con el nombre y password introducido por parámetro
        try {
            $stmt->execute([
                ':u' => $u,
                ':p' => $pass1
            ]);
        } catch (\PDOException $ex) {
            die("Error al consultar usuario: " . $ex->getMessage());
        }
        $filas=$stmt->rowCount();
        if ($filas == 0) return false;
        return true;//Si da algún valor es que hay coincidencia
    }
}
