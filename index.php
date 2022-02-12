<?php
require ('init_db.php');
// Получаем список всех постов:
$sql = "SELECT posts.*, type_content.title as type_title, name_class, avatar_path, login
FROM posts
    LEFT JOIN type_content
        ON type_content_id=type_content.id
    LEFT JOIN users
       ON user_id =users.id
       ORDER BY number_of_views";
$result = mysqli_query($con, $sql);
$posts = mysqli_fetch_all($result, MYSQLI_ASSOC);
// Получаем список всех типов контента:
// Не понял как и куда  надо передать этот список в main.php?
$sql = "SELECT * FROM type_content";
$result = mysqli_query($con, $sql);
$type_contents = mysqli_fetch_all($result, MYSQLI_ASSOC);
require('function.php');
require('templates/datas.php');
$page_content = include_template('main.php', ['posts' => $posts]);
$layout_content = include_template('layout.php', ['content' => $page_content, 'title' => 'readme: популярное']);
print($layout_content);
