CREATE TABLE users (
    user_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name char(50) NOT NULL,
    password char(255) NOT NULL
);

CREATE TABLE daftar_nonton (
    customer_id int NOT NULL,
    film_id int NOT NULL,
    tanggal_nonton date,
    PRIMARY KEY (customer_id, film_id)
);

CREATE TABLE film (
    film_id int NOT NULL,
    film_name char(50),
    publish_date date,
    PRIMARY KEY(film_id)
);

CREATE TABLE category (
    category_id int(11) NOT NULL AUTO_INCREMENT,
    category_name char(20),
    PRIMARY KEY (category_id)
);

CREATE TABLE cast (
    film_id int NOT NULL,
    artist_id int NOT NULL,
    PRIMARY KEY (film_id, artist_id)
);

CREATE TABLE artist (
    artist_id int NOT NULL,
    artist_name char(50),
    artist_dob date,
    PRIMARY KEY (artist_id)
);

CREATE TABLE category_film (
    category_id int NOT NULL,
    film_id int NOT NULL,
    PRIMARY KEY (category_id, film_id)
);


ALTER TABLE cast ADD FOREIGN KEY (artist_id) REFERENCES artist (artist_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE category_film ADD FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE CASCADE, ADD FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE daftar_nonton ADD FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE CASCADE ON UPDATE CASCADE, ADD FOREIGN KEY (customer_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE film ADD  FOREIGN KEY (film_id) REFERENCES cast (film_id) ON DELETE CASCADE ON UPDATE CASCADE;