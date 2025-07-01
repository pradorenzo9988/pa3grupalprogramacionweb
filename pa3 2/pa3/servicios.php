<?php
// llamada a la base de datos
require_once "./bd.php";

//accion

if (isset($_POST['accion'])) {
    header('Content-Type: application/json');
    $pdo = getPDO();
    // busqueda
    if ($_POST['accion'] == 'buscar') {
        $id = $_POST['id'] ?? '';
        $nombre = $_POST['nombre'] ?? '';
        $caracteristica = $_POST['caracteristica'] ?? '';
        $precio_min = $_POST['precio_min'] ?? '';
        $precio_max = $_POST['precio_max'] ?? '';
        $estado = $_POST['estado'] ?? '';
        $orden = $_POST['orden'] ?? 'nombre';
        $direccion = $_POST['direccion'] ?? 'ASC';
        $pagina = $_POST['pagina'] ?? 1;
        
        $limite = 5;
        $offset = ($pagina - 1) * $limite;
        
        $sql = "SELECT id_producto, nombre, caracteristicas, precio, estado FROM Productos WHERE 1=1";
        $params = [];
        
        // Filtros dinámicos
        if ($id !== '') {
            $sql .= " AND id_producto = :id";
            $params[':id'] = $id;
        }
        if ($nombre !== '') {
            $sql .= " AND nombre LIKE :nombre";
            $params[':nombre'] = "%$nombre%";
        }
        if ($caracteristica !== '') {
            $sql .= " AND caracteristicas LIKE :caracteristica";
            $params[':caracteristica'] = "%$caracteristica%";
        }
        if ($precio_min !== '' && $precio_max !== '') {
            $sql .= " AND precio BETWEEN :precio_min AND :precio_max";
            $params[':precio_min'] = $precio_min;
            $params[':precio_max'] = $precio_max;
        }
        if ($estado !== '') {
            $sql .= " AND estado = :estado";
            $params[':estado'] = $estado;
        }
        
        // Contar el total de productos
        $sqlCount = str_replace("SELECT id_producto, nombre, caracteristicas, precio, estado", "SELECT COUNT(*)", $sql);
        $stmtCount = $pdo->prepare($sqlCount);
        $stmtCount->execute($params);
        $total = $stmtCount->fetchColumn();
        
        // Ordenamiento y paginación
        $sql .= " ORDER BY $orden $direccion LIMIT $limite OFFSET $offset";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $productos = $stmt->fetchAll();
        
        // Devolver los resultados
        echo json_encode(['productos' => $productos, 'total' => $total, 'pagina' => $pagina]);
        exit;
    }
    
    // acciones para que funcione el CRUD 
    if ($_POST['accion'] == 'agregar') {
        $sql = "INSERT INTO Productos (nombre, caracteristicas, precio, estado, edad_recomendada, id_categoria) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$_POST['nombre'], $_POST['caracteristicas'], $_POST['precio'], $_POST['estado'], $_POST['edad_recomendada'], $_POST['id_categoria']]);
        echo json_encode(['success' => true]);
        exit;
    }
    
    if ($_POST['accion'] == 'actualizar') {
        $sql = "UPDATE Productos SET nombre = ?, caracteristicas = ?, precio = ?, estado = ? WHERE id_producto = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$_POST['nombre'], $_POST['caracteristicas'], $_POST['precio'], $_POST['estado'], $_POST['id']]);
        echo json_encode(['success' => true]);
        exit;
    }
    
    if ($_POST['accion'] == 'eliminar') {
        $sql = "DELETE FROM Productos WHERE id_producto = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$_POST['id']]);
        echo json_encode(['success' => true]);
        exit;
    }
}

// obtener un producto especifico 
if (isset($_GET['obtener'])) {
    header('Content-Type: application/json');
    $pdo = getPDO();
    $sql = "SELECT * FROM Productos WHERE id_producto = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$_GET['obtener']]);
    $producto = $stmt->fetch();
    echo json_encode($producto);
    exit;
}

// obtener categorias 
if (isset($_GET['categorias'])) {
    header('Content-Type: application/json');
    $pdo = getPDO();
    $sql = "SELECT id_categoria, nombre_categoria FROM Categorias ORDER BY nombre_categoria";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $categorias = $stmt->fetchAll();
    echo json_encode($categorias);
    exit;
}
?>