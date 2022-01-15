DROP DATABASE `base_1952801_readme_12`;
CREATE DATABASE IF NOT EXISTS base_1952801_readme_12
  DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;
USE base_1952801_readme_12;
CREATE TABLE users
(
  id          INT AUTO_INCREMENT PRIMARY KEY,
  dt_add      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email       VARCHAR(128) NOT NULL UNIQUE,
  login       VARCHAR(128) NOT NULL UNIQUE,
  password    VARCHAR(128) NOT NULL,
  avatar_path TINYTEXT
);
CREATE TABLE hashtag
(
  id           INT AUTO_INCREMENT PRIMARY KEY,
  hashtag_name VARCHAR(64) UNIQUE,
  INDEX index_hashtag_name (hashtag_name)
);
CREATE TABLE type_content
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  title      VARCHAR(32) UNIQUE,
  name_class VARCHAR(32) UNIQUE
);
CREATE TABLE posts
(
  id              INT AUTO_INCREMENT PRIMARY KEY,
  dt_add          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  title           VARCHAR(255),
  text            TEXT,
  author_of_quote TINYTEXT,
  img             TINYTEXT,
  video           TINYTEXT,
  link            TINYTEXT,
  number_of_views INT,
  user_id         INT,
  CONSTRAINT posts_users_fk
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  type_content_id INT,
  CONSTRAINT posts_type_content_fk
    FOREIGN KEY (type_content_id) REFERENCES type_content (id) ON DELETE CASCADE,
  hashtag_id      INT,
  CONSTRAINT posts_hashtag_fk
    FOREIGN KEY (hashtag_id) REFERENCES hashtag (id) ON DELETE SET NULL,
  FULLTEXT index_title_text (title, text)
);
CREATE TABLE comments
(
  id      INT AUTO_INCREMENT PRIMARY KEY,
  dt_add  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  content TEXT,
  user_id INT,
  CONSTRAINT comments_users_fk
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  post_id INT,
  CONSTRAINT comments_posts_fk
    FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE
);
CREATE TABLE likes
(
  id      INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  CONSTRAINT likes_users_fk
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  post_id INT,
  CONSTRAINT likes_posts_fk
    FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
  INDEX index_post_id (post_id)
);
CREATE TABLE subscription
(
  id                 INT AUTO_INCREMENT PRIMARY KEY,
  user_id_author     INT,
  CONSTRAINT subscription_author_users_fk
    FOREIGN KEY (user_id_author) REFERENCES users (id) ON DELETE CASCADE,
  post_id            INT,
  user_id_subscriber INT,
  CONSTRAINT subscription_subscriber_users_fk
    FOREIGN KEY (user_id_subscriber) REFERENCES users (id) ON DELETE CASCADE
);
CREATE TABLE messages
(
  id           INT AUTO_INCREMENT PRIMARY KEY,
  dt_add       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  content      TEXT,
  user_id_send INT,
  CONSTRAINT messages_send_users_fk
    FOREIGN KEY (user_id_send) REFERENCES users (id) ON DELETE CASCADE,
  user_id_get  INT,
  CONSTRAINT messages_get_users_fk
    FOREIGN KEY (user_id_get) REFERENCES users (id) ON DELETE CASCADE
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
  role VARCHAR(32)
);
