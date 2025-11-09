<?php

require_once 'vendor/autoload.php';

function db_new()
{
    $config = [
        'host' => '127.0.0.1',
        'port' => '8123',
        'username' => 'default',
        'password' => '',
        'https' => false
    ];
    $db = new ClickHouseDB\Client($config);
    $db->database('default');
    $db->setTimeout(1.5);      // 1 second , support only Int value
    $db->setTimeout(10);       // 10 seconds
    $db->setConnectTimeOut(5); // 5 seconds
    $db->ping(true); // if can`t connect throw exception  
    return $db;
}

