<?php

require('function.php');
require('templates/datas.php');
$page_content = include_template('main.php', ['posts' => $posts]);
$layout_content = include_template('layout.php', ['content' => $page_content, 'title' => 'readme: популярное']);
print($layout_content);
