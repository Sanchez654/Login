<?php
$post = empty($_POST) ? json_decode(file_get_contents('php://input'), true) : $_POST; //ajusta a $_GET a necesidad

require 'configuracion.php';
$respuesta['exito'] = false;
$respuesta['msj'] = '';

$id                       = trim($post['alumno_id']);
$nombre                   = trim($post['nombre']);
$edad                     = trim($post['edad']);
$apellido                 = trim($post['apellido']);
$lugar_residencia         = trim($post['lugar_residencia']);


$query = "insert into alumnos values ('$id','$nombre','$edad','$apellido', '$lugar_residencia')";

$res = mysqli_query($conexion, $query);

if($res){
    $respuesta['exito'] = true;
    $respuesta['msj'] = 'Se han guardado los datos';
} else {
    $respuesta['msj'] = 'Error al guardar los datos' . mysqli_error($conexion);
}

header('Content-type: application/json');
echo json_encode($respuesta);
?>