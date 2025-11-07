<?php


// Function to get table schema
function getTableSchema($pdo, $tableName)
{
    // Validate table name to prevent SQL injection
    if (!preg_match('/^[a-zA-Z_][a-zA-Z0-9_]*$/', $tableName)) {
        throw new InvalidArgumentException('Invalid table name');
    }
    $stmt = $pdo->query("PRAGMA table_info(`$tableName`)");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Function to get table data
function getTableData($pdo, $tableName, $limit = 100, $filters = [])
{
    // Validate table name to prevent SQL injection
    if (!preg_match('/^[a-zA-Z_][a-zA-Z0-9_]*$/', $tableName)) {
        throw new InvalidArgumentException('Invalid table name');
    }
    
    // Build the base query
    $sql = "SELECT * FROM `$tableName`";
    $params = [];
    
    // Add WHERE clause if filters are provided
    if (!empty($filters)) {
        $whereConditions = [];
        foreach ($filters as $column => $value) {
            // Validate column name to prevent SQL injection
            if (!preg_match('/^[a-zA-Z_][a-zA-Z0-9_]*$/', $column)) {
                throw new InvalidArgumentException('Invalid column name: ' . $column);
            }
            $whereConditions[] = "`$column` = ?";
            $params[] = $value;
        }
        $sql .= " WHERE " . implode(' AND ', $whereConditions);
    }
    
    // Add limit
    $sql .= " LIMIT ?";
    $params[] = $limit;
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Function to count rows in table
function getRowCount($pdo, $tableName)
{
    // Validate table name to prevent SQL injection
    if (!preg_match('/^[a-zA-Z_][a-zA-Z0-9_]*$/', $tableName)) {
        throw new InvalidArgumentException('Invalid table name');
    }
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM `$tableName`");
    $stmt->execute();
    return $stmt->fetchColumn();
}
