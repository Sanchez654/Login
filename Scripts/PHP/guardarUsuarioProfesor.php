<?php
$post = empty($_POST) ? json_decode(file_get_contents('php://input'), true) : $_POST;

require 'configuracion.php';

$respuesta = array('exito' => false, 'msj' => '');

if (isset($post['maestro_id'], $post['nombre'], $post['edad'], $post['residencia'], $post['descripcion'])) {
    $id = trim($post['maestro_id']);
    $nombre = trim($post['nombre']);
    $edad = trim($post['edad']);
    $residencia = trim($post['residencia']);
    $descripcion = trim($post['descripcion']);

    $query = "INSERT INTO maestros (maestro_id, nombre, edad, residencia, descripcion) 
              VALUES ('$id', '$nombre', '$edad', '$residencia', '$descripcion')";
    
    $res = mysqli_query($conexion, $query);

    if ($res) {
        $respuesta['exito'] = true;
        $respuesta['msj'] = 'Se han guardado los datos';
    } else {
        $respuesta['msj'] = 'Error al guardar los datos: ' . mysqli_error($conexion);
    }
} else {
    $respuesta['msj'] = 'Datos incompletos o incorrectos en la solicitud';
}

header('Content-type: application/json');
echo json_encode($respuesta);
?>
