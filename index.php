<?php
require('function.php');
$layout_content = include_template('layout.php', ['content' => $page_content, 'title' => 'readme: популярное']);
print($layout_content);
