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


/*13*/
CREATE DATABASE soft_uni;
USE soft_uni;
CREATE TABLE towns
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE addresses
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(255) NOT NULL,
    town_id      INT          NOT NULL
);
CREATE TABLE departments
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE employees
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(255) NOT NULL,
    middle_name   VARCHAR(255) NOT NULL,
    last_name     VARCHAR(255) NOT NULL,
    job_title     VARCHAR(255) NOT NULL,
    department_id INT          NOT NULL,
    hire_date     DATE,
    salary        DECIMAL,
    address_id    INT          NOT NULL
);

INSERT INTO towns(name)
VALUES ('Sofia'),
       ('Plovdiv'),
       ('Varna'),
       ('Burgas');

INSERT INTO departments(name)
VALUES ('Engineering'),
       ('Sales'),
       ('Marketing'),
       ('Software Development'),
       ('Quality Assurance');

INSERT INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES ('Ivan', 'Ivanov', 'Ivanov', 'NET Developer', 4, '2013-02-01', 3500),
       ('Ivan', 'Ivanov', 'Ivanov', 'NET Developer', 4, '2013-02-01', 3500),
       ('Ivan', 'Ivanov', 'Ivanov', 'NET Developer', 4, '2013-02-01', 3500),
       ('Ivan', 'Ivanov', 'Ivanov', 'NET Developer', 4, '2013-02-01', 3500),
       ('Ivan', 'Ivanov', 'Ivanov', 'NET Developer', 4, '2013-02-01', 3500);

/*14,15*/
SELECT *
FROM towns
ORDER BY name;

SELECT *
FROM departments
ORDER BY name;

SELECT *
FROM employees
ORDER BY salary DESC;

/*16*/
SELECT name
FROM towns
ORDER BY name;

SELECT name
FROM departments
ORDER BY name;

SELECT first_name, last_name, job_title, salary
FROM employees
ORDER BY salary DESC;

/*17*/
UPDATE employees
SET salary=salary*1.10;
SELECT  salary from employees;
