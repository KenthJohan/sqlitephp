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

$tableName = $_GET['table'];
$schema = getTableSchema($pdo, $tableName);
$rows = getTableData($pdo, $tableName, 100);

header('Content-Type: application/json');
echo json_encode([
    'schema' => $schema,
    'rows' => $rows,
]);
