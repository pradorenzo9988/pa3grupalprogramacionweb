<?php
session_start();
require_once '../bd.php';
$pdo = getPDO(); 

$buscar = $_GET['buscar'] ?? '';
if ($buscar) {
    $stmt = $pdo->prepare("SELECT * FROM productos WHERE nombre LIKE ?");
    $stmt->execute(["%$buscar%"]);
} else {
    $stmt = $pdo->query("SELECT * FROM productos");
}
$productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!isset($_SESSION['carrito'])) {
    $_SESSION['carrito'] = [];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $cantidad = $_POST['cantidad'];

    $stmt = $pdo->prepare("SELECT stock FROM productos WHERE id_producto = ?");
    $stmt->execute([$id]);
    $producto = $stmt->fetch();

    if ($producto && $producto['stock'] >= $cantidad) {
        $_SESSION['carrito'][$id] = ($_SESSION['carrito'][$id] ?? 0) + $cantidad;
        header("Location: carrito.php");
    } else {
        echo "<script>alert('No hay suficiente stock disponible.');</script>";
    }
}
?>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"></head>
<body class="container">
<h1>Productos</h1>
<form method="get" class="mb-4">
    <input type="text" name="buscar" class="form-control" placeholder="Buscar producto...">
</form>
<div class="row">
<?php foreach ($productos as $producto): ?>
    <?php
    $precio = $producto['precio'];
    $descuento = $producto['descuento'];
    $precio_final = $precio - ($precio * $descuento / 100);
    ?>
    <div class="col-md-4">
        <form method="post">
            <div class="card mb-3">
                <!-- <img src="../assets/img/<?= $producto['imagen'] ?>" class="card-img-top"> -->
                <div class="card-body">
                    <h5 class="card-title"><?= $producto['nombre'] ?></h5>
                    <p><?= $producto['caracteristicas'] ?></p>
                    <?php if ($descuento > 0): ?>
                        <p>
                            <del>$<?= number_format($precio, 2) ?></del>
                            <strong class="text-success">$<?= number_format($precio_final, 2) ?></strong>
                            <span class="badge bg-success">-<?= $descuento ?>%</span>
                        </p>
                    <?php else: ?>
                        <p><strong>$<?= number_format($precio, 2) ?></strong></p>
                    <?php endif; ?>
                    <input type="hidden" name="id" value="<?= $producto['id_producto'] ?>">
                    <input type="number" name="cantidad" value="1" min="1" max="<?= $producto['stock'] ?>" class="form-control mb-2">
                    <button class="btn btn-primary">Agregar al carrito</button>
                </div>
            </div>
        </form>
    </div>
<?php endforeach; ?>
</div>
<a href="carrito.php" class="btn btn-success">Ver Carrito</a>
<a href="historial.php" class="btn btn-info">Ver Historial</a>
</body>
</html>
