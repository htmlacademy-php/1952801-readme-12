CREATE DATABASE IF NOT EXISTS base_1952801_readme_12
    DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;
USE base_1952801_readme_12;
CREATE TABLE users
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    dt_add      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email       VARCHAR(128) NOT NULL UNIQUE,
    login       VARCHAR(128) NOT NULL UNIQUE,
    password    CHAR(64)     NOT NULL,
    avatar_path VARCHAR(128)
);
CREATE TABLE posts
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    dt_add          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title           VARCHAR(128),
    text            TEXT,
    author_of_quote VARCHAR(64),
    img             VARCHAR(255),
    video           VARCHAR(255),
    link            VARCHAR(255),
    number_of_views INT,
    user_id         INT,
    type_id         INT,
    hashtag_id      INT,
    FULLTEXT index_title_text (title, text)
);
CREATE TABLE comments
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    dt_add         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content        TEXT,
    user_author_id INT,
    post_id        INT
);
CREATE TABLE like_left
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    who_left_like_id   INT,
    which_post_like_id INT,
    INDEX index_which_post_like_id (which_post_like_id)
);
CREATE TABLE subscription
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    user_author_id     INT,
    user_subscriber_id INT
);
CREATE TABLE messages
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    dt_add       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content      TEXT,
    user_send_id INT,
    user_get_id  INT
);
CREATE TABLE hashtag
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    hashtag_name VARCHAR(32) UNIQUE,
    INDEX index_hashtag_name (hashtag_name)

);
CREATE TABLE type_content
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(16) UNIQUE,
    name_class VARCHAR(16) UNIQUE
);
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
CREATE TABLE user_role
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    role varchar(16)
);