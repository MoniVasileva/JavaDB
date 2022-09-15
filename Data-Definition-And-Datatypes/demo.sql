CREATE DATABASE gamebar;

CREATE TABLE gamebar.employees (
                                   id INT auto_increment primary key,
                                   first_name varchar(100) not null,
                                   last_name varchar(100) NOT NULL
);
CREATE TABLE gamebar.categories (
                                    id INT auto_increment primary key,
                                    name varchar(100) not null
);
CREATE TABLE gamebar.products (
                                  id INT auto_increment primary key,
                                  name varchar(100) not null,
                                  category_id INT NOT NULL
);
