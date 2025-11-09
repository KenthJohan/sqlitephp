<?php


function sql_generate_filters($filters)
{
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
        return " WHERE " . implode(' AND ', $whereConditions);
    }
    return '';
}

function sql_generate_select($filters)
{
    $sql = "SELECT * FROM {table}";
    $sql .= sql_generate_filters($filters);
    $sql .= " LIMIT {limit}";
    return $sql;
}

function sql_validate_column($params, $columns)
{
    $validColumns = array_column($columns, 'name');
    foreach ($params as $column => $value) {
        if (empty($value)) {
            continue;
        }
        if (!(str_starts_with($column, 'f_') || str_starts_with($column, 'u_'))) {
            continue;
        }
        // Remove the prefix to get the actual column name
        $columnName = substr($column, 2);
        if (!in_array($columnName, $validColumns)) {
            throw new Exception("Invalid column: $columnName");
        }
    }
}


function sql_generate_update($params)
{
    $setParts = [];
    foreach ($params as $column => $value) {
        if (empty($value)) {
            continue;
        }
        if (!str_starts_with($column, 'u_')) {
            continue;
        }
        $columnName = substr($column, 2);
        $setParts[] = "`$columnName` = '{" . $column . "}'";
    }
    // Use ALTER TABLE ... UPDATE for ClickHouse instead of UPDATE
    $sql = "ALTER TABLE {table} UPDATE " . implode(', ', $setParts);
    $whereClause = sql_generate_filters($params);
    if (!empty($whereClause)) {
        $sql .= $whereClause;
    } else {
        // ClickHouse ALTER TABLE UPDATE requires a WHERE clause
        $sql .= " WHERE 1=1";
    }
    return $sql;
}
