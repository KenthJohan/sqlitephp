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
    if ($tableName === 'system.columns') {
        $columns = [
            ['name' => 'database', 'type' => 'String'],
            ['name' => 'table', 'type' => 'String'],
            ['name' => 'name', 'type' => 'String'],
            ['name' => 'type', 'type' => 'String'],
            ['name' => 'default_kind', 'type' => 'String'],
            ['name' => 'default_expression', 'type' => 'String'],
            ['name' => 'comment', 'type' => 'String'],
            ['name' => 'position', 'type' => 'UInt32'],
        ];
    } else if ($tableName === 'system.tables') {
        $columns = [
            ['name' => 'database', 'type' => 'String'],
            ['name' => 'name', 'type' => 'String'],
            ['name' => 'engine', 'type' => 'String'],
            ['name' => 'is_temporary', 'type' => 'UInt8'],
            ['name' => 'data_path', 'type' => 'String'],
            ['name' => 'metadata_path', 'type' => 'String'],
            ['name' => 'total_rows', 'type' => 'UInt64'],
            ['name' => 'total_bytes', 'type' => 'UInt64'],
            ['name' => 'primary_key', 'type' => 'String'],
            ['name' => 'sorting_key', 'type' => 'String'],
            ['name' => 'partition_key', 'type' => 'String'],
        ];
    } else {
        $columns = $db->select("
            SELECT name, type, default_kind, default_expression, comment
            FROM system.columns 
            WHERE table = '$tableName' AND database = '$database'
            ORDER BY position
        ")->rows();
    }
    return $columns;
}

