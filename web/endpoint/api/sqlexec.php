<?php

require_once '../../misc/db.php';
require_once '../../misc/schema.php';
require_once '../../misc/sql.php';


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

if (empty($input)) {
    http_response_code(400);
    echo json_encode(['error' => 'No input provided']);
    exit;
}

if (empty($input["sql"])) {
    http_response_code(400);
    echo json_encode(['error' => 'No SQL query specified']);
    exit;
}

$params = $input["params"] ?? [];
$sql = $input["sql"];


$db = db_new();
$catch = null;
$results = null;
$error = null;
$changes = null;

try {
    // Determine if this is a SELECT query or other type
    $trimmedSql = trim(strtoupper($sql));
    $isSelect = strpos($trimmedSql, 'SELECT') === 0 || 
                strpos($trimmedSql, 'SHOW') === 0 || 
                strpos($trimmedSql, 'DESCRIBE') === 0 ||
                strpos($trimmedSql, 'EXPLAIN') === 0;
    
    if ($isSelect) {
        // For SELECT queries, get the results
        $statement = $db->select($sql, $params);
        $results = $statement->rows();
    } else {
        // For other queries, use write method
        $statement = $db->write($sql, $params);
        $changes = $statement->rows(); // This might need adjustment based on ClickHouse client
    }
} catch (Exception $e) {
    http_response_code(500);
    $catch = $e->getMessage();
}

echo json_encode([
    'sql' => $sql,
    'error' => $error,
    'catch' => $catch,
    'changes' => $changes,
    'lastInsertId' => null, // ClickHouse doesn't typically use auto-increment IDs
    'results' => $results
]);

