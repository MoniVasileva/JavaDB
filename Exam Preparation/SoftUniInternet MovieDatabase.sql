CREATE DATABASE softuni_imdb;

USE softuni_imdb;
CREATE TABLE countries
(
    id        int PRIMARY KEY AUTO_INCREMENT,
    name      varchar(30) not null unique,
    continent varchar(30) not null,
    currency  varchar(5)  not null
);

create table genres
(
    id   int primary key auto_increment,
    name varchar(50) not null unique
);

create table actors
(
    id         int primary key auto_increment,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    birthdate  DATE        not null,
    height     int,
    awards     int,
    country_id int         not null,
    CONSTRAINT fk_actors_countries
        foreign key (country_id)
            references countries (id)
);

CREATE table movies_additional_info
(
    id            int primary key auto_increment,
    rating        decimal(10, 2) not null,
    runtime       int            not null,
    picture_url   varchar(80)    not null,
    budget        decimal(10, 2),
    release_date  date           not null,
    has_subtitles tinyint(1),
    description   text
);

create table movies
(
    id            int primary key auto_increment,
    title         varchar(70) not null unique,
    country_id    int         not null,
    movie_info_id int         not null unique,
    CONSTRAINT fk_movies_countries
        foreign key (country_id)
            references countries (id),
    CONSTRAINT fk_movies_movie_info
        foreign key (movie_info_id)
            references movies_additional_info (id)
);

create table movies_actors
(
    movie_id int,
    actor_id int,
    KEY pk_movies_actors (movie_id, actor_id),
    CONSTRAINT fk_movie_actors_movies
        foreign key (movie_id)
            references movies (id),
    CONSTRAINT fk_actor_actors_actors
        foreign key (actor_id)
            references actors (id)
);

create table genres_movies
(
    genre_id int,
    movie_id int,
    KEY pk_genres_movies (genre_id, movie_id),
    CONSTRAINT fk_genres_movies_genres
        foreign key (genre_id)
            references genres (id),
    CONSTRAINT fk_genres_movies_movies
        foreign key (movie_id)
            references movies (id)
);

INSERT INTO actors(first_name, last_name, birthdate, height, awards, country_id)
SELECT (REVERSE(first_name)),
       (reverse(last_name)),
       (DATE(birthdate - 2)),
       (height + 10),
       (country_id),
       (3)
From actors
WHERE id <= 10;

UPDATE movies_additional_info
SET runtime = runtime - 10
WHERE id BETWEEN 15 AND 25;

DELETE c
FROM countries as c
         LEFT JOIN movies as m on c.id = m.country_id
WHERE m.country_id IS NULL;

Drop Database softuni_imdb;

SELECT * FROM countries
ORDER BY currency desc , id;

