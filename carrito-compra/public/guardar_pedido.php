<?php
session_start();
require_once '../bd.php';
$pdo = getPDO(); 

$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$carrito = $_SESSION['carrito'] ?? [];

if (!$carrito) die("Carrito vacío");

$total = 0;
$productos_json = [];

$ids = implode(',', array_keys($carrito));
$stmt = $pdo->query("SELECT * FROM productos WHERE id_producto IN ($ids)");
$productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($productos as $producto) {
    $cantidad = $carrito[$producto['id_producto']];
    $subtotal = $producto['precio'] * $cantidad;
    $total += $subtotal;

    $productos_json[] = [
        'producto' => $producto['nombre'],
        'precio' => $producto['precio'],
        'cantidad' => $cantidad
    ];
}

$stmt = $pdo->prepare("INSERT INTO pedidos (nombre_cliente, correo_cliente, total, estado) VALUES (?, ?, ?, ?)");
$stmt->execute([$nombre, $correo, $total, 'pendiente']);

$json = json_encode([
    'cliente' => $nombre,
    'correo' => $correo,
    'productos' => $productos_json,
    'total' => $total
]);

file_put_contents('../pedido.json', $json);
$_SESSION['carrito'] = [];

echo "<h1>Pedido guardado</h1><pre>$json</pre>";
echo '<a href="index.php">Volver al inicio</a>';
?>
