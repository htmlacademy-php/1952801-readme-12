<?php
function cutText($post, $lenght)
{
    $words = explode(" ", $post);
    $sum = 0;
    $words_back = array();
    $result;
    foreach ($words as $word) {
        $words_back[] = $word;
        $sum = mb_strlen($word) + $sum;
        $result = htmlspecialchars(implode(" ", $words_back));
        if ($sum > $lenght) {
            $result .= '...<a class="post-text__more-link" href="#">Читать далее</a>';
            break;
        }
    }
    return $result;
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
