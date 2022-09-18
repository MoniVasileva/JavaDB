USE minions;
/*1*/
CREATE TABLE minions
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    age  INT
);

CREATE TABLE towns
(
    town_id INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(255) NOT NULL
);
/*2*/
ALTER TABLE minions
    ADD COLUMN town_id INT NOT NULL,
    ADD CONSTRAINT fk_minions_towns
        FOREIGN KEY (town_id)
            REFERENCES towns (`id`);
/*3*/
INSERT INTO towns (id, name)
VALUES (1, 'Sofia'),
       (2, 'Plovdiv'),
       (3, 'Varna');

INSERT INTO minions(id, name, age, town_id)
VALUES (1, 'Kevin', 22, 1),
       (2, 'Bob', 15, 3),
       (3, 'Steward', NULL, 2);
/*4*/
TRUNCATE TABLE minions;
/*5*/
DROP TABLE minions,towns;


CREATE database town;
USE town;
/*6*/
CREATE TABLE people
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    name      VARCHAR(200) NOT NULL,
    picture   BLOB,
    height    DOUBLE,
    weight    DOUBLE,
    gender    CHAR(1)      NOT NULL,
    birthdate DATE         NOT NULL,
    biography text
);

/*7*/
INSERT INTO people(name, gender, birthdate)
VALUES ('Boris', 'm', DATE(NOW())),
       ('Aleksandar', 'm', DATE(NOW())),
       ('Dancho', 'm', DATE(NOW())),
       ('Petar', 'm', DATE(NOW())),
       ('Moni', 'f', DATE(NOW()));

CREATE TABLE users
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    username        VARCHAR(30) NOT NULL,
    password        VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time TIME,
    is_deleted      BOOLEAN
);

INSERT INTO users(username, password)
VALUES ('moni', 'password'),
       ('moni', 'password'),
       ('moni', 'password'),
       ('moni', 'password'),
       ('moni', 'password');

/*8*/
ALTER TABLE users
    DROP PRIMARY KEY,
    ADD PRIMARY KEY pk_users (id, username);

/*9*/
ALTER TABLE users
    MODIFY COLUMN last_login_time DATETIME DEFAULT NOW();

/*10*/
ALTER TABLE users
    DROP PRIMARY KEY,
    ADD CONSTRAINT pk_users PRIMARY KEY users (id),
    MODIFY COLUMN user_name VARCHAR(30) UNIQUE;

CREATE DATABASE soft_uni;
USE soft_uni;
CREATE TABLE towns(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE addresses(
    id INT PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(255) NOT NULL ,
    town_id INT NOT NULL
);

