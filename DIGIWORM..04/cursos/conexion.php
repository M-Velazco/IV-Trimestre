<?php
$servername = "localhost";
$username = "root";
$password = "sena";
$dbname = "digiworm_04";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
