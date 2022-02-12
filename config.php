<?php
$file = file_exists(__DIR__ . '/local_config.php') ? __DIR__ . '/local_config.php' : __DIR__ . '/default_config.php';
require_once $file;
