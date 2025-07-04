<?php
session_start();
require_once '../bd.php';
$pdo = getPDO(); 

$carrito = $_SESSION['carrito'] ?? [];
$productos = [];
$total = 0;

if($carrito){
    $ids = implode(',', array_keys($carrito));
    $stmt = $pdo ->query("SELECT * FROM productos WHERE id_producto IN ($ids)");
    $productos = $stmt ->fetchAll(PDO::FETCH_ASSOC);

    foreach($productos as &$producto){
        $cantidad = $carrito[$producto['id_producto']];
        $descuento = $producto['descuento'];
        $precio_final = $producto['precio']- ($producto['precio']* $descuento/100);
        $subtotal = $cantidad *$precio_final;

        $producto['cantidad'] = $cantidad;
        $producto['precio_final']= $precio_final;
        $producto['subtotal']= $subtotal;
        $total += $subtotal;
    }
}
?>

<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"></head>
<body class="container">
<h1>Carrito de Compras</h1>
<a href="carrito.php?vaciar=1" class="btn btn-danger mb-3">Vaciar Carrito</a>
<table class="table table-bordered">
    <tr><th>Producto</th><th>Cantidad</th><th>Precio Final</th><th>Subtotal</th><th>Acción</th></tr>
    <?php foreach ($productos as $p): ?>
    <tr>
        <td><?= $p['nombre'] ?></td>
        <td>
            <form method="post" action="carrito.php" class="form-actualizar">
                <input type="number" name="cantidad" value="<?= $p['cantidad'] ?>" min="1">
                <input type="hidden" name="id" value="<?= $p['id_producto'] ?>">
                <button class="btn btn-sm btn-warning">Actualizar</button>
            </form>
        </td>
        <td>
            <?php if ($p['descuento'] > 0): ?>
                <del>$<?= number_format($p['precio'], 2) ?></del>
                <strong>$<?= number_format($p['precio_final'], 2) ?></strong>
                <span class="badge bg-success">-<?= $p['descuento'] ?>%</span>
            <?php else: ?>
                $<?= number_format($p['precio'], 2) ?>
            <?php endif; ?>
        </td>
        <td>$<?= number_format($p['subtotal'], 2) ?></td>
        <td><a href="carrito.php?eliminar=<?= $p['id_producto'] ?>" class="btn btn-sm btn-danger btn-eliminar">Eliminar</a></td>
    </tr>
    <?php endforeach; ?>
</table>
<p><strong>Total: $<?= number_format($total, 2) ?></strong></p>
<form method="post" action="guardar_pedido.php">
    <input type="text" name="nombre" class="form-control mb-2" placeholder="Tu nombre" required>
    <input type="email" name="correo" class="form-control mb-2" placeholder="Tu correo" required>
    <button class="btn btn-success">Finalizar pedido</button>
</form>
<a href="index1.php" class="btn btn-secondary">Seguir comprando</a>
</body>
</html>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id'])) {
    $_SESSION['carrito'][$_POST['id']] = (int)$_POST['cantidad'];
    header("Location: carrito.php");
}
if (isset($_GET['eliminar'])) {
    unset($_SESSION['carrito'][$_GET['eliminar']]);
    header("Location: carrito.php");
}
if (isset($_GET['vaciar'])) {
    unset($_SESSION['carrito']);
    header("Location: carrito.php");
}
?>
