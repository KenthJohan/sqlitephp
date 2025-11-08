<?php

require_once 'db.php';
require_once 'schema.php';
require_once 'sql.php';

$db = db_new();


$table = $_GET['table'] ?? '';
if (empty($table)) {
    http_response_code(400);
    echo json_encode(['error' => 'Table name is required']);
    exit;
}

// Add all parameters (prefixed with "f_") for filtering
$filters = [];
foreach ($_GET as $key => $value) {
    if (str_starts_with($key, 'f_') && !empty($value)) {
        $filters[$key] = $value;
    }
}

$columns = schema_columns($db, $table);

$sql = sql_generate($filters);

// Prepare parameters for the query
$params = $filters;
$params["table"] = $table;
$params["limit"] = 100;
$statement = $db->select($sql, $params);


header('Content-Type: application/json');
echo json_encode([
    'columns' => $columns,
    'rows' => $statement->rows(),
    'filters' => $filters,
    'params' => $params,
    'sql' => $sql,
]);
