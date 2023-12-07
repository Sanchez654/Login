<?php
$servername = "10.200.30.186";
$username = "root";
$password = "";
$database = "tofindteacher";

$conexion = new mysqli($servername, $username, $password, $database);

if ($conexion) {
    echo "Conexión Exitosa";
}
?>
