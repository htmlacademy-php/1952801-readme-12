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

/**
 * @param $index
 * @return false|string
 */
function generate_random_date($index)
{
    $deltas = [['minutes' => 59], ['hours' => 23], ['days' => 6], ['weeks' => 4], ['months' => 11]];
    $dcnt = count($deltas);

    if ($index < 0) {
        $index = 0;
    }

    if ($index >= $dcnt) {
        $index = $dcnt - 1;
    }

    $delta = $deltas[$index];
    $timeval = rand(1, current($delta));
    $timename = key($delta);

    $ts = strtotime("$timeval $timename ago");
    $dt = date('Y-m-d H:i:s', $ts);

    return $dt;
}

/**
 * Возвращает корректную форму множественного числа
 * Ограничения: только для целых чисел
 *
 * Пример использования:
 * $remaining_minutes = 5;
 * echo "Я поставил таймер на {$remaining_minutes} " .
 *     get_noun_plural_form(
 *         $remaining_minutes,
 *         'минута',
 *         'минуты',
 *         'минут'
 *     );
 * Результат: "Я поставил таймер на 5 минут"
 *
 * @param int $number Число, по которому вычисляем форму множественного числа
 * @param string $one Форма единственного числа: яблоко, час, минута
 * @param string $two Форма множественного числа для 2, 3, 4: яблока, часа, минуты
 * @param string $many Форма множественного числа для остальных чисел
 *
 * @return string Рассчитанная форма множественнго числа
 */
function get_noun_plural_form(int $number, string $one, string $two, string $many): string
{
    $number = (int)$number;
    $mod10 = $number % 10;
    $mod100 = $number % 100;
    if ($mod100 >= 11 && $mod100 <= 20):
        return $many;
    elseif ($mod10 > 5):
        return $many;
    elseif ($mod10 === 1):
        return $one;
    elseif ($mod10 >= 2 && $mod10 <= 4):
        return $two;
    else:
        return $many;
    endif;
}

function get_interval($recording_date): string
{
    $cur_date = date_create("now");
    $diff = date_diff($recording_date, $cur_date);
    $minute = date_interval_format($diff, "%i");
    $hour = date_interval_format($diff, "%h");
    $day = date_interval_format($diff, "%d");
    $month = date_interval_format($diff, "%m");
    $result = '';
    if ($month > 0) {
        $result = $month . ' ' . get_noun_plural_form($month, 'месяц', 'месяца', 'месяцев') . ' назад';
    } elseif ($day > 7) {
        $week = intdiv($day, 7);
        $result = $week . ' ' . get_noun_plural_form($week, 'неделя', 'недели', 'недель') . ' назад';
    } elseif ($day > 0 && $day <= 7) {
        $result = $day . ' ' . get_noun_plural_form($day, 'день', 'дня', 'дней') . ' назад';
    } elseif ($hour > 0) {
        $result = $hour . ' ' . get_noun_plural_form($hour, 'час', 'часа', 'часов') . ' назад';
    } else {
        $result = $minute . ' ' . get_noun_plural_form($minute, 'минуту', 'минуты', 'минут') . ' назад';
    }
    return $result;
}
