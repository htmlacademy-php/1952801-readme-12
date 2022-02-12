<?php
require_once ('config.php');
$con = mysqli_connect($host, $username,$password, $database);
if ($con === false) {
    print("Ошибка подключения: " . mysqli_connect_error());
    die();
} else {
    print("Соединение установлено");
    mysqli_set_charset($con, "utf8");
}
