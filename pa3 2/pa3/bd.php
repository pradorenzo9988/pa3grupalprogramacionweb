<?php
// creación para obtener PDO
function getPDO() {
    $host = "localhost";
    $user = "root";
    $pass = "";
    $bd = "isilstore"; //cambiar a letras mayusculas en las iniciales
    $charset = "utf8mb4";
    $dsn = "mysql:host=$host;dbname=$bd;charset=$charset";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];
    try {
        return new PDO($dsn, $user, $pass, $options);
    } catch (PDOException $e) {
        echo "Error de conexión: " . $e->getMessage();
        exit;
    }
}


?>