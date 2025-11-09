<?php

/**
 * SVD File Parser - Extracts peripheral information and generates SQL INSERT statements
 * 
 * This script parses an SVD (System View Description) file and extracts peripheral 
 * information to generate SQL INSERT queries.
 */

class SVDParser
{

    private $svdFilePath;

    public function __construct($svdFilePath)
    {
        $this->svdFilePath = $svdFilePath;
    }

    /**
     * Parse the SVD file and extract peripheral information
     * @return array Array of peripheral data
     */
    public function parsePeripherals()
    {
        if (!file_exists($this->svdFilePath)) {
            throw new Exception("SVD file not found: " . $this->svdFilePath);
        }

        // Load the XML file
        $xml = simplexml_load_file($this->svdFilePath);
        if ($xml === false) {
            throw new Exception("Failed to parse SVD XML file : " . $this->svdFilePath);
        }

        $peripherals = [];
        $peripheralMap = []; // Store peripherals by name for derivedFrom lookup

        // Navigate to peripherals section
        if (isset($xml->peripherals->peripheral)) {
            foreach ($xml->peripherals->peripheral as $peripheral) {
                $peripheralData = $this->extractPeripheralData($peripheral, $peripheralMap);
                if ($peripheralData) {
                    $peripherals[] = $peripheralData;
                    // Store in map for future derivedFrom lookups
                    $peripheralMap[$peripheralData['name']] = $peripheralData;
                }
            }
        }

        return $peripherals;
    }

    /**
     * Extract data from a single peripheral element
     * @param SimpleXMLElement $peripheral
     * @param array $peripheralMap Map of already processed peripherals for derivedFrom lookup
     * @return array|null Peripheral data or null if required fields are missing
     */
    private function extractPeripheralData($peripheral, $peripheralMap = [])
    {
        // Check if this peripheral is derived from another
        $derivedFrom = null;
        if (isset($peripheral['derivedFrom'])) {
            $derivedFrom = (string) $peripheral['derivedFrom'];
        }

        // Start with base data (either from derivedFrom peripheral or empty)
        $baseData = [];
        if ($derivedFrom && isset($peripheralMap[$derivedFrom])) {
            $baseData = $peripheralMap[$derivedFrom];
        }

        // Extract basic peripheral information (override base data if present)
        $name = (string) $peripheral->name;
        $description = (string) $peripheral->description;
        $address = (string) $peripheral->baseAddress;

        // Use base description if current one is empty
        if (empty($description) && !empty($baseData['description'])) {
            $description = $baseData['description'];
        }

        // Extract offset and size from addressBlock
        $offset = null;
        $size = null;

        if (isset($peripheral->addressBlock)) {
            $offset = (string) $peripheral->addressBlock->offset;
            $size = (string) $peripheral->addressBlock->size;
        } else if (!empty($baseData)) {
            // Use base peripheral's addressBlock data if not defined
            $offset = $baseData['offset'];
            $size = $baseData['size'];
        }

        // Skip if essential data is missing
        if (empty($name) || empty($address)) {
            return null;
        }

        $result = [
            'name' => $name,
            'description' => $description ?: 'No description available',
            'address' => $address,
            'offset' => $offset,
            'size' => $size
        ];

        // Add derivedFrom information for reference
        if ($derivedFrom) {
            $result['derivedFrom'] = $derivedFrom;
        }

        return $result;
    }

    /**
     * Convert hexadecimal string to integer
     * @param string $hexString Hexadecimal string (e.g., "0x40012400")
     * @return int Integer value
     */
    private function hexToInt($hexString)
    {
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
    public function generateSQLInserts($peripherals, $tableName = 'peripherals', $mcu_name)
    {
        $sql = '';

        // Add table creation statement
        $sql .= $this->generateCreateTableSQL($tableName) . "\n\n";

        // Generate single INSERT statement with multiple VALUES
        if (!empty($peripherals)) {
            $sql .= $this->generateBatchInsert($peripherals, $tableName, $mcu_name) . "\n";
        }

        return $sql;
    }

    /**
     * Generate CREATE TABLE SQL statement
     * @param string $tableName
     * @return string
     */
    private function generateCreateTableSQL($tableName)
    {
        return "-- Create table for peripherals\n" .
            "CREATE TABLE IF NOT EXISTS `{$tableName}` (\n" .
            "  `id` INTEGER PRIMARY KEY AUTOINCREMENT,\n" .
            "  `name` TEXT NOT NULL,\n" .
            "  `description` TEXT,\n" .
            "  `baseAddress` INTEGER NOT NULL,\n" .
            "  `offset` INTEGER,\n" .
            "  `size` INTEGER,\n" .
            "  `derivedFrom` TEXT,\n" .
            "  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP\n" .
            ");";
    }

    /**
     * Generate a single INSERT statement
     * @param array $peripheral
     * @param string $tableName
     * @return string
     */
    private function generateSingleInsert($peripheral, $tableName)
    {
        // Escape single quotes in the data
        $name = $this->escapeSQLString($peripheral['name']);
        $description = $this->escapeSQLString($peripheral['description']);
        $address = $peripheral['address']; // Now an integer
        $offset = $peripheral['offset'];           // Now an integer
        $size = $peripheral['size'];               // Now an integer
        $derivedFrom = isset($peripheral['derivedFrom']) ? "'" . $this->escapeSQLString($peripheral['derivedFrom']) . "'" : 'NULL';

        return "INSERT INTO `{$tableName}` (`name`, `description`, `address`, `offset`, `size`, `derivedFrom`) " .
            "VALUES ('{$name}', '{$description}', {$address}, {$offset}, {$size}, {$derivedFrom});";
    }

    /**
     * Generate a single INSERT statement with multiple VALUES clauses
     * @param array $peripherals
     * @param string $tableName
     * @return string
     */
    private function generateBatchInsert($peripherals, $tableName, $mcu_name)
    {
        $sql = "INSERT INTO `{$tableName}` (`name`, `description`, `address`, `offset`, `size`, `mcu_name`) VALUES\n";

        $values = [];
        foreach ($peripherals as $peripheral) {
            // Escape single quotes in the data
            $name = $this->escapeSQLString($peripheral['name']);
            $description = $this->escapeSQLString($peripheral['description']);
            $address = $peripheral['address'];
            $offset = $peripheral['offset'];
            $size = $peripheral['size'];
            $derivedFrom = isset($peripheral['derivedFrom']) ? "'" . $this->escapeSQLString($peripheral['derivedFrom']) . "'" : 'NULL';

            $values[] = "  ('{$name}', '{$description}', {$address}, {$offset}, {$size}, '{$mcu_name}')";
        }

        $sql .= implode(",\n", $values) . ";";

        return $sql;
    }

    /**
     * Escape single quotes in SQL strings
     * @param string $string
     * @return string
     */
    private function escapeSQLString($string)
    {
        return str_replace("'", "''", $string);
    }

    /**
     * Print peripheral data in a formatted table
     * @param array $peripherals
     */
    public function printPeripheralTable($peripherals)
    {
        echo "Found " . count($peripherals) . " peripherals:\n";
        echo str_repeat("-", 140) . "\n";
        printf("%-15s %-50s %-15s %-10s %-10s %-15s\n", "Name", "Description", "Base Address", "Offset", "Size", "Derived From");
        echo str_repeat("-", 140) . "\n";

        foreach ($peripherals as $peripheral) {
            $derivedFrom = isset($peripheral['derivedFrom']) ? $peripheral['derivedFrom'] : '';
            printf(
                "%-15s %-50s %-15s %-10s %-10s %-15s\n",
                substr($peripheral['name'], 0, 14),
                substr($peripheral['description'], 0, 49),
                sprintf("0x%08X", hexdec($peripheral['address'])), // Format as hex for display
                sprintf("0x%X", hexdec($peripheral['offset'])),
                sprintf("0x%X", hexdec($peripheral['size'])),
                substr($derivedFrom, 0, 14)
            );
        }
        echo str_repeat("-", 140) . "\n";
    }
}
