<?php

function sql_generate($filters)
{
    $sql = "SELECT * FROM {table}";
    $whereConditions = [];
    foreach ($filters as $column => $value) {
        // Validate column name to prevent SQL injection
        if (!preg_match('/^[a-zA-Z_][a-zA-Z0-9_]*$/', $column)) {
            throw new InvalidArgumentException('Invalid column name: ' . $column);
        }
        if (str_starts_with($column, 'f_') && !empty($value)) {
            // Remove the "f_" prefix to get the actual column name
            $columnName = substr($column, 2);
            // Quote the value properly for ClickHouse
            $whereConditions[] = "`$columnName` = '{" . $column . "}'";
        }
    }
    if (!empty($whereConditions)) {
        $sql .= " WHERE " . implode(' AND ', $whereConditions);
    }
    $sql .= " LIMIT {limit}";
    return $sql;
}
