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

$params = $input;


if (empty($params)) {
    http_response_code(400);
    echo json_encode(['error' => 'No updates specified']);
    exit;
}

if (empty($params['table'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Table name is required']);
    exit;
}

// Prevent updates to SQLite system tables
if (strtolower($params['table']) === 'sqlite_master' || strtolower($params['table']) === 'sqlite_sequence') {
    http_response_code(403);
    echo json_encode(['error' => 'Updates to SQLite system tables are not allowed']);
    exit;
}




$db = db_new();
$columns = schema_columns($db, $params['table']);
sql_validate_column($params, $columns);
$sql = sql_generate_update($params);
$db->write($sql, $params);

echo json_encode([
    'sql' => $sql,
]);
