<?php

/**
 * SVD File Parser - Extracts peripheral information and generates SQL INSERT statements
 * 
 * This script parses an SVD (System View Description) file and extracts peripheral 
 * information to generate SQL INSERT queries.
 */

class SVDParser {
    
    private $svdFilePath;
    
    public function __construct($svdFilePath) {
        $this->svdFilePath = $svdFilePath;
    }
    
    /**
     * Parse the SVD file and extract peripheral information
     * @return array Array of peripheral data
     */
    public function parsePeripherals() {
        if (!file_exists($this->svdFilePath)) {
            throw new Exception("SVD file not found: " . $this->svdFilePath);
        }
        
        // Load the XML file
        $xml = simplexml_load_file($this->svdFilePath);
        if ($xml === false) {
            throw new Exception("Failed to parse SVD XML file");
        }
        
        $peripherals = [];
        
        // Navigate to peripherals section
        if (isset($xml->peripherals->peripheral)) {
            foreach ($xml->peripherals->peripheral as $peripheral) {
                $peripheralData = $this->extractPeripheralData($peripheral);
                if ($peripheralData) {
                    $peripherals[] = $peripheralData;
                }
            }
        }
        
        return $peripherals;
    }
    
    /**
     * Extract data from a single peripheral element
     * @param SimpleXMLElement $peripheral
     * @return array|null Peripheral data or null if required fields are missing
     */
    private function extractPeripheralData($peripheral) {
        // Extract basic peripheral information
        $name = (string) $peripheral->name;
        $description = (string) $peripheral->description;
        $baseAddress = (string) $peripheral->baseAddress;
        
        // Extract offset and size from addressBlock
        $offset = null;
        $size = null;
        
        if (isset($peripheral->addressBlock)) {
            $offset = (string) $peripheral->addressBlock->offset;
            $size = (string) $peripheral->addressBlock->size;
        }
        
        // Skip if essential data is missing
        if (empty($name) || empty($baseAddress)) {
            return null;
        }
        
        return [
            'name' => $name,
            'description' => $description ?: 'No description available',
            'baseAddress' => $this->hexToInt($baseAddress),
            'offset' => $this->hexToInt($offset ?: '0x0'),
            'size' => $this->hexToInt($size ?: '0x0')
        ];
    }
    
    /**
     * Convert hexadecimal string to integer
     * @param string $hexString Hexadecimal string (e.g., "0x40012400")
     * @return int Integer value
     */
    private function hexToInt($hexString) {
        if (empty($hexString)) {
            return 0;
        }
        return hexdec($hexString);
    }
    
    /**
     * Generate SQL INSERT statements for the peripherals
     * @param array $peripherals Array of peripheral data
     * @param string $tableName Name of the database table
     * @return string SQL INSERT statements
     */
    public function generateSQLInserts($peripherals, $tableName = 'peripherals') {
        $sql = '';
        
        // Add table creation statement
        $sql .= $this->generateCreateTableSQL($tableName) . "\n\n";
        
        foreach ($peripherals as $peripheral) {
            $sql .= $this->generateSingleInsert($peripheral, $tableName) . "\n";
        }
        
        return $sql;
    }
    
    /**
     * Generate CREATE TABLE SQL statement
     * @param string $tableName
     * @return string
     */
    private function generateCreateTableSQL($tableName) {
        return "-- Create table for peripherals\n" .
               "CREATE TABLE IF NOT EXISTS `{$tableName}` (\n" .
               "  `id` INTEGER PRIMARY KEY AUTOINCREMENT,\n" .
               "  `name` TEXT NOT NULL,\n" .
               "  `description` TEXT,\n" .
               "  `baseAddress` INTEGER NOT NULL,\n" .
               "  `offset` INTEGER,\n" .
               "  `size` INTEGER,\n" .
               "  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP\n" .
               ");";
    }
    
    /**
     * Generate a single INSERT statement
     * @param array $peripheral
     * @param string $tableName
     * @return string
     */
    private function generateSingleInsert($peripheral, $tableName) {
        // Escape single quotes in the data
        $name = $this->escapeSQLString($peripheral['name']);
        $description = $this->escapeSQLString($peripheral['description']);
        $baseAddress = $peripheral['baseAddress']; // Now an integer
        $offset = $peripheral['offset'];           // Now an integer
        $size = $peripheral['size'];               // Now an integer
        
        return "INSERT INTO `{$tableName}` (`name`, `description`, `baseAddress`, `offset`, `size`) " .
               "VALUES ('{$name}', '{$description}', {$baseAddress}, {$offset}, {$size});";
    }
    
    /**
     * Escape single quotes in SQL strings
     * @param string $string
     * @return string
     */
    private function escapeSQLString($string) {
        return str_replace("'", "''", $string);
    }
    
    /**
     * Print peripheral data in a formatted table
     * @param array $peripherals
     */
    public function printPeripheralTable($peripherals) {
        echo "Found " . count($peripherals) . " peripherals:\n";
        echo str_repeat("-", 120) . "\n";
        printf("%-15s %-50s %-15s %-10s %-10s\n", "Name", "Description", "Base Address", "Offset", "Size");
        echo str_repeat("-", 120) . "\n";
        
        foreach ($peripherals as $peripheral) {
            printf("%-15s %-50s %-15s %-10s %-10s\n", 
                   substr($peripheral['name'], 0, 14),
                   substr($peripheral['description'], 0, 49),
                   sprintf("0x%08X", $peripheral['baseAddress']), // Format as hex for display
                   sprintf("0x%X", $peripheral['offset']),
                   sprintf("0x%X", $peripheral['size'])
            );
        }
        echo str_repeat("-", 120) . "\n";
    }
}

// Main execution
try {
    $svdFile = __DIR__ . '/svd/STM32C051.svd';
    
    echo "SVD File Parser\n";
    echo "===============\n";
    echo "Parsing file: {$svdFile}\n\n";
    
    $parser = new SVDParser($svdFile);
    
    // Parse the SVD file
    $peripherals = $parser->parsePeripherals();
    
    // Display the results
    $parser->printPeripheralTable($peripherals);
    
    echo "\nGenerating SQL INSERT statements...\n\n";
    
    // Generate SQL statements
    $sqlStatements = $parser->generateSQLInserts($peripherals);
    
    // Output the SQL
    echo $sqlStatements;
    
    // Optionally write to file
    $outputFile = __DIR__ . '/peripherals_inserts.sql';
    file_put_contents($outputFile, $sqlStatements);
    echo "\nSQL statements saved to: {$outputFile}\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    exit(1);
}
