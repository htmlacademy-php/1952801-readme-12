# список типов контента для поста
INSERT INTO type_content (title, name_class)
VALUES ('Текст', 'photo');
INSERT INTO type_content (title, name_class)
VALUES ('Цитата', 'video');
INSERT INTO type_content (title, name_class)
VALUES ('Картинка', 'text');
INSERT INTO type_content (title, name_class)
VALUES ('Видео', 'quote');
INSERT INTO type_content (title, name_class)
VALUES ('Ссылка', 'link');
# новые пользователи
INSERT INTO users (email, login, password, avatar_path)
VALUES ('artur@mail.com', 'artur', 'parol1', 'userpic.jpg');
INSERT INTO users (email, login, password, avatar_path)
VALUES ('harper@mail.com', 'harper', 'parol2', 'userpic.jpg');
INSERT INTO users (email, login, password, avatar_path)
VALUES ('larisa@pochta.com', 'larisa', 'parol3', 'userpic-larisa-small.jpg');
# список постов
INSERT INTO `posts` (`title`, `text`, `author_of_quote`, `img`, `video`, `link`, `number_of_views`, `user_id`,
                     `type_content_id`, `hashtag_id`)
VALUES ('Цитата', 'Мы в жизни любим только раз, а после ищем лишь похожих', 'Словоблуд', NULL,
        NULL, NULL, NULL, 3, 2, NULL),
       ('Игра престолов',
        'Время не имеет никаких делений или отметок, указывающих на его течение; ни гром, ни молнии, ни рёв труб не оповещает о наступлении Нового года. Даже когда начинается новое столетие, лишь только мы, смертные, звоним в колокола и стреляем из пистолетов.\r\nДержи время! Стереги его любой час, любую минуту. Без надзора оно ускользнет, словно ящерица. Освещай каждый миг честным, достойным свершением! Дай ему вес, значение, свет.',
        NULL, NULL, NULL, NULL, NULL, 1, 1, NULL),
       ('Наконец, обработал фотки!', NULL, NULL, 'rock-medium.jpg', NULL, NULL, NULL, 2, 3,
        NULL),
       ('Моя мечта', NULL, NULL, 'coast-medium.jpg', NULL, NULL, NULL, 3, 3, NULL),
       ('Лучшие курсы', 'www.htmlacademy.ru', NULL, NULL, NULL, NULL, NULL, 2, 5, NULL);
# запрос на выбор постов
SELECT * FROM posts;
# запрос на изменение в посте
UPDATE `posts` SET `title` = 'Лучшие курсы Интернера' WHERE `posts`.`id` = 5;
# поиск
SELECT * FROM `posts` WHERE text LIKE '%время%';
