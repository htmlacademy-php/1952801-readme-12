<?php
function cutText($post, $lenght)
{
    $words = explode(" ", $post);
    $sum = 0;
    $words_back = array();
    foreach ($words as $word) {
        $sum = mb_strlen($word) + $sum;
        if ($sum > $lenght) {
            $words_back[] = '...<a class="post-text__more-link" href="#">Читать далее</a>';
            break;
        } else {
            $words_back[] = $word;
        }
    }
    $post = implode(" ", $words_back);
    return $post;
}

function include_template($name, array $data = [])
{
    $name = 'templates/' . $name;
    $result = '';

    if (!is_readable($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}
