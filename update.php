<?php

include 'sqlmisc.php';
$config = include 'config.php';

// Set JSON response header
header('Content-Type: application/json');

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
    exit;
}

// Get JSON input
$input = json_decode(file_get_contents('php://input'), true);
if (!$input) {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid JSON input']);
    exit;
}

$tableName = $input['table'] ?? '';
$updates = $input['updates'] ?? [];
$filters = $input['filters'] ?? [];

if (empty($tableName)) {
    http_response_code(400);
    echo json_encode(['error' => 'Table name is required']);
    exit;
}

if (empty($updates)) {
    http_response_code(400);
    echo json_encode(['error' => 'No updates specified']);
    exit;
}

try {
    // Connect to SQLite database using PDO
    $pdo = new PDO("sqlite:{$config['database']}");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Get table schema to validate columns
    $schema = getTableSchema($pdo, $tableName);
    $validColumns = array_column($schema, 'name');
    
    // Validate update columns
    foreach ($updates as $column => $value) {
        if (!in_array($column, $validColumns)) {
            throw new Exception("Invalid column: $column");
        }
    }
    
    // Build UPDATE SQL
    $setParts = [];
    $params = [];
    
    foreach ($updates as $column => $value) {
        $setParts[] = "`$column` = ?";
        $params[] = $value;
    }
    
    $sql = "UPDATE `$tableName` SET " . implode(', ', $setParts);
    
    // Add WHERE clause based on filters
    $whereParts = [];
    foreach ($filters as $column => $value) {
        if (!in_array($column, $validColumns)) {
            throw new Exception("Invalid filter column: $column");
        }
        $whereParts[] = "`$column` LIKE ?";
        $params[] = "%$value%";
    }
    
    if (!empty($whereParts)) {
        $sql .= " WHERE " . implode(' AND ', $whereParts);
    }
    
    // Execute the update
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    
    $affectedRows = $stmt->rowCount();
    
    echo json_encode([
        'success' => true,
        'affected_rows' => $affectedRows,
        'sql' => $sql,
        'message' => "Updated $affectedRows rows"
    ]);
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}