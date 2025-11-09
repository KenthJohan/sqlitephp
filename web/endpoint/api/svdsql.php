<?php


require_once '../../misc/fs.php';
require_once '../../misc/SVDParser.php';


header('Content-Type: text/plain');


function generate_sql_from_one_svd($svdFile, $mcu_name = null) {
    $parser = new SVDParser($svdFile);
    
    // Parse the SVD file
    $peripherals = $parser->parsePeripherals();
    
    // Display the results
    $parser->printPeripheralTable($peripherals);
    
    echo "\nGenerating SQL INSERT statements...\n\n";
    
    // Generate SQL statements
    $sqlStatements = $parser->generateSQLInserts($peripherals, 'peripherals', $mcu_name);
    
    // Output the SQL
    echo $sqlStatements;
    
    // Optionally write to file
    //$outputFile = __DIR__ . '/peripherals_inserts_' . basename($svdFile, '.svd') . '.sql';
    //file_put_contents($outputFile, $sqlStatements);
    //echo "\nSQL statements saved to: {$outputFile}\n";
}

$list = fs_find_files_with_ext("../../../svd", "svd");
foreach ($list as $svd) {
    echo "\nProcessing SVD: " . $svd["filename"] . "\n";
    generate_sql_from_one_svd($svd["dirname"] . '/' . $svd["basename"], $svd["filename"]);
}

