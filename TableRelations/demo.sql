CREATE DATABASE TableRelations;
USE TableRelations;
Create table passports
(
    passport_id     INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(50) UNIQUE
);
INSERT INTO passports(passport_id, passport_number)
VALUES (101, 'N34FG21B'),
       (102, 'K65LO4R'),
       (103, 'ZE657QP2');

CREATE TABLE people
(
    person_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50),
    salary      DECIMAL(9, 2),
    passport_id INT UNIQUE,
    CONSTRAINT fk
        FOREIGN KEY (passport_id)
            REFERENCES passports (passport_id)
);

INSERT INTO people(first_name, salary, passport_id)
VALUES ('Roberto', 43300.00, 102),
       ('Tom', 56100.00, 103),
       ('Yana', 60200.00, 101);


CREATE DATABASE cars;
USE cars;
CREATE TABLE manufactures
(
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(50) NOT NULL UNIQUE,
    established_on  DATE
);
INSERT INTO manufactures(name, established_on)
VALUES ('BMW', 1916 - 03 - 01),
       ('Tesla', 2003 - 01 - 01),
       ('Lada', 1966 - 05 - 01);

CREATE TABLE models
(
    model_id        INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(70) NOT NULL,
    manufacturer_id INT,
    CONSTRAINT fk
        FOREIGN KEY (manufacturer_id)
            REFERENCES manufactures (manufacturer_id)
);
INSERT INTO models(model_id, name, manufacturer_id)
VALUES (101, 'X1', 1),
       (102, 'i6', 1),
       (103, 'Model S', 2),
       (104, 'Model X', 2),
       (105, 'Model 3', 2),
       (106, 'Nova', 3);

CREATE DATABASE school;
USE school;
CREATE TABLE students
(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(70) NOT NULL
);
INSERT INTO students(name)
VALUES ('Mila'),
       ('Tony'),
       ('Ron');

CREATE TABLE exams
(
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL
);
ALTER TABLE exams
    AUTO_INCREMENT = 101;

INSERT INTO exams(name)
VALUES ('Spring MVC'),
       ('Neo4j'),
       ('Oracle 11g');

CREATE TABLE student_exams
(
    student_id INT NOT NULL,
    exam_id    INT NOT NULL,
    CONSTRAINT pk
        PRIMARY KEY (student_id, exam_id),
    CONSTRAINT fk_students
        FOREIGN KEY (student_id)
            REFERENCES students (student_id),
    CONSTRAINT fk_exams
        FOREIGN KEY (exam_id)
            REFERENCES exams (exam_id)
);

INSERT INTO student_exams(student_id, exam_id)
VALUES (1, 101),
       (1, 102),
       (2, 101),
       (3, 103),
       (2, 102),
       (2, 103);

CREATE database selfref;
USE selfref;
CREATE TABLE teachers
(
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    manager_id INT
);
ALTER TABLE teachers
    AUTO_INCREMENT = 101;
INSERT INTO teachers (name, manager_id)
VALUES ('John', NULL),
       ('Maya', 106),
       ('Silvia', 106),
       ('Ted', 105),
       ('Mark', 101),
       ('Greta', 101);

ALTER TABLE teachers
    ADD CONSTRAINT fk
        FOREIGN KEY (manager_id)
            REFERENCES teachers (teacher_id);


CREATE DATABASE university;
USE university;
CREATE TABLE subjects
(
    subject_id   INT(11) PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50) NOT NULL
);
CREATE TABLE majors
(
    major_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50) NOT NULL
);
CREATE TABLE payments
(
    payment_id     INT PRIMARY KEY AUTO_INCREMENT,
    payment_date   DATE NOT NULL,
    payment_amount DECIMAL(8, 2),
    student_id     INT
);

CREATE TABLE students
(
    student_id     INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12) NOT NULL,
    student_name   VARCHAR(50) NOT NULL,
    major_id       INT
);

CREATE TABLE agenda
(
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    CONSTRAINT pk
        PRIMARY KEY (student_id, subject_id)
);
