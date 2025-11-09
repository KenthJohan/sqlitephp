<?php

require_once 'web2/db.php';
require_once 'web2/schema.php';
require_once 'web2/sql.php';

// Test the update functionality
try {
    $params = [
        'table' => 'peripherals',
        'u_name' => 'EXTI_ORANGE',
        'f_size' => '152'
    ];
    
    $db = db_new();
    $columns = schema_columns($db, $params['table']);
    sql_validate_column($params, $columns);
    $sql = sql_generate_update($params);
    
    echo "Generated SQL: " . $sql . "\n";
    
    // Replace placeholders manually for testing
    $actualSql = str_replace('{table}', $params['table'], $sql);
    $actualSql = str_replace('{u_name}', $params['u_name'], $actualSql);
    $actualSql = str_replace('{f_size}', $params['f_size'], $actualSql);
    
    echo "Actual SQL: " . $actualSql . "\n";
    
    $result = $db->write($actualSql, $params);
    echo "Update successful!\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}