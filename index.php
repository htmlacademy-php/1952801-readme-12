<?php
$con = mysqli_connect("localhost", "root", "", "base_1952801_readme_12");
if ($con == false) {
    print("Ошибка подключения: " . mysqli_connect_error());
} else {
    print("Соединение установлено");
    mysqli_set_charset($con, "utf8");
    // Получаем список всех постов:
    $sql = "SELECT posts.*, type_content.title as type_title, name_class, avatar_path, login
FROM posts
    LEFT JOIN type_content
        ON type_content_id=type_content.id
    LEFT JOIN users
       ON user_id =users.id
       ORDER BY number_of_views";
    $result = mysqli_query($con, $sql);
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
    // Получаем список всех типов контента:
    // Не понял как и куда  надо передать этот список в main.php?
    $sql = "SELECT * FROM type_content";
    $result = mysqli_query($con, $sql);
    $rows2 = mysqli_fetch_all($result, MYSQLI_ASSOC);
}
require('function.php');
require('templates/datas.php');
$page_content = include_template('main.php', ['posts' => $rows]);
$layout_content = include_template('layout.php', ['content' => $page_content, 'title' => 'readme: популярное']);
print($layout_content);
