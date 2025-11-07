<?php

include 'sqlmisc.php';
$config = include 'config.php';



try {
    // Connect to SQLite database using PDO
    $pdo = new PDO("sqlite:{$config['database']}");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

$tableName = $_GET['table'] ?? '';
if (empty($tableName)) {
    http_response_code(400);
    echo json_encode(['error' => 'Table name is required']);
    exit;
}

// Parse filters from URL parameters (prefixed with "f_")
$filters = [];
foreach ($_GET as $key => $value) {
    if (str_starts_with($key, 'f_') && !empty($value)) {
        $columnName = substr($key, 2); // Remove "f_" prefix
        $filters[$columnName] = $value;
    }
}

try {
    $schema = getTableSchema($pdo, $tableName);
    $result = generateSQL($pdo, $tableName, 100, $filters);
    
    $stmt = $pdo->prepare($result['sql']);
    $stmt->execute($result['params']);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode([
        'schema' => $schema,
        'rows' => $rows,
        'filters' => $filters,
        'sql' => $result['sql'],
        'params' => $result['params']
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
