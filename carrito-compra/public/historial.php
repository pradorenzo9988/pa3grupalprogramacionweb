<?php
include '../config/db.php';

$stmt = $pdo->query("SELECT * FROM pedidos ORDER BY fecha DESC");
$pedidos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container">
<h1>Historial de Pedidos</h1>
<table class="table table-bordered">
    <tr><th>ID</th><th>Cliente</th><th>Correo</th><th>Total</th><th>Estado</th><th>Fecha</th></tr>
    <?php foreach ($pedidos as $p): ?>
        <tr>
            <td><?= $p['id'] ?></td>
            <td><?= $p['nombre_cliente'] ?></td>
            <td><?= $p['correo_cliente'] ?></td>
            <td>$<?= $p['total'] ?></td>
            <td><?= $p['estado'] ?></td>
            <td><?= $p['fecha'] ?></td>
        </tr>
    <?php endforeach; ?>
</table>
<a href="index.php" class="btn btn-primary">Volver al inicio</a>
</body>
</html>
