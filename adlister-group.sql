USE adlister_db;

CREATE  TABLE categories
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads
 (
     id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
     user_id INT UNSIGNED DEFAULT NULL,
     category_id INT UNSIGNED DEFAULT NULL,
     title VARCHAR(100) NOT NULL,
     description VARCHAR(500) NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (user_id) REFERENCES users (id),
     FOREIGN KEY (category_id) REFERENCES categories (id)
 );

