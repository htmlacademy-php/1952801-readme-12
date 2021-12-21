<?php
$is_auth = rand(0, 1);
$user_name = 'Павел'; // укажите здесь ваше имя
$posts = [
    [
        'title' => 'Цитата',
        'type' => 'post-quote',
        'content' => 'Мы в жизни любим только раз, а после ищем лишь похожих',
        'user_name' => 'Лариса',
        'avatar' => 'userpic-larisa-small.jpg'
    ],
    [
        'title' => 'Игра престолов',
        'type' => 'post-text',
        'content' => 'Время не имеет никаких делений или отметок, указывающих на его течение; ни гром, ни молнии, ни рёв труб не оповещает о наступлении Нового года. Даже когда начинается новое столетие, лишь только мы, смертные, звоним в колокола и стреляем из пистолетов.
Держи время! Стереги его любой час, любую минуту. Без надзора оно ускользнет, словно ящерица. Освещай каждый миг честным, достойным свершением! Дай ему вес, значение, свет.',
        'user_name' => 'Владик',
        'avatar' => 'userpic.jpg'
    ],
    [
        'title' => 'Наконец, обработал фотки!',
        'type' => 'post-photo',
        'content' => 'rock-medium.jpg',
        'user_name' => 'Виктор',
        'avatar' => 'userpic-mark.jpg'
    ],
    [
        'title' => 'Моя мечта',
        'type' => 'post-photo',
        'content' => 'coast-medium.jpg',
        'user_name' => 'Лариса',
        'avatar' => 'userpic-larisa-small.jpg'
    ],
    [
        'title' => 'Лучшие курсы',
        'type' => 'post-link',
        'content' => 'www.htmlacademy.ru',
        'user_name' => 'Владик',
        'avatar' => 'userpic.jpg'
    ]
];
