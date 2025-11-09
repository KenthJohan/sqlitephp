<?php


function schema_get($db, $tableName, $database = 'default') {
    // Basic table info
    $tableInfo = $db->select("
        SELECT engine, partition_key, sorting_key, primary_key 
        FROM system.tables 
        WHERE name = '$tableName' AND database = '$database'
    ")->rows();
    
    // Column info
    $columns = $db->select("
        SELECT name, type, default_kind, default_expression, comment
        FROM system.columns 
        WHERE table = '$tableName' AND database = '$database'
        ORDER BY position
    ")->rows();
    
    // CREATE statement
    $createStatement = $db->showCreateTable($tableName);
    
    return [
        'table_info' => $tableInfo[0] ?? null,
        'columns' => $columns,
        'create_statement' => $createStatement
    ];
}


function schema_columns($db, $tableName, $database = 'default') {
    // Column info
    $columns = $db->select("
        SELECT name, type, default_kind, default_expression, comment
        FROM system.columns 
        WHERE table = '$tableName' AND database = '$database'
        ORDER BY position
    ")->rows();
    return $columns;
}

