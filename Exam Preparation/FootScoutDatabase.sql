CREATE DATABASE football;
USE football;
create table countries
(
    id   int primary key auto_increment,
    name varchar(45) not null
);

Create table towns
(
    id         int primary key auto_increment,
    name       varchar(45) not null,
    country_id int         not null,

    Constraint fk_towns_countries
        Foreign key (country_id)
            references countries (id)
);

Create table stadiums
(
    id       int primary key auto_increment,
    name     varchar(45) not null,
    capacity int         not null,
    town_id  int         not null,

    Constraint fk_stadiums_towns
        Foreign key (town_id)
            references towns (id)
);

Create table teams
(
    id          int primary key auto_increment,
    name        varchar(45) not null,
    established Date        not null,
    fan_base    bigint(20)  not null default (0),
    stadium_id  int         not null,

    Constraint fk_teams_stadiums
        Foreign key (stadium_id)
            references stadiums (id)
);

create table skills_data
(
    id        int primary key auto_increment,
    dribbling int default (0),
    pace      int default (0),
    passing   int default (0),
    shooting  int default (0),
    speed     int default (0),
    strength  int default (0)
);

create table coaches
(
    id          int primary key auto_increment,
    first_name  varchar(10)    not null,
    last_name   varchar(20)    not null,
    salary      decimal(10, 2) not null default (0),
    coach_level int            not null default (0)
);

create table players
(
    id             int primary key auto_increment,
    first_name     varchar(10)    not null,
    last_name      varchar(20)    not null,
    age            int            not null default (0),
    position       char(1)        not null,
    salary         decimal(10, 2) not null default (0),
    hire_date      datetime,
    skills_data_id int            not null,
    team_id        int,

    Constraint fk_players_skills_data
        Foreign key (skills_data_id)
            references skills_data (id),

    Constraint fk_players_teams
        Foreign key (team_id)
            references teams (id)
);

create table players_coaches
(
    player_id int,
    coach_id  int,

    Constraint fk_players_coaches_players
        Foreign key (player_id)
            references players (id),

    Constraint fk_players_coaches_coaches
        Foreign key (coach_id)
            references coaches (id)
);
INSERT INTO coaches(id, first_name, last_name, salary, coach_level)(SELECT p.first_name,
                                                                           p.last_name,
                                                                           (p.salary * 2)            as salary,
                                                                           char_length(p.first_name) as coach_level
                                                                    FROM players as p
                                                                    WHERE p.age >= 45);

UPDATE coaches as c
SET c.coach_level = c.coach_level + 1
WHERE c.id IN (SELECT coach_id
               FROM players_coaches)
  and first_name like 'A%';

DELETE
FROM players
WHERE age >= 45;

SELECT first_name,
       age,
       salary
FROM players
ORDER BY salary desc;

SELECT p.id, CONCAT_WS(' ', p.first_name, p.last_name) as 'full_name', p.age, p.hire_date
FROM players AS p
         JOIN skills_data sd on sd.id = p.skills_data_id
WHERE p.age < 23
  and sd.strenght > 50
  and p.hire_date is NULL
  and p.position = 'A'
ORDER BY p.salary, p.age;

SELECT t.name      as team_name,
       t.established,
       t.fan_base,
       COUNT(p.id) as players_count
FROM teams as t
         LEFT JOIN players p on t.id = p.team_id
GROUP BY t.id
ORDER BY players_count desc, t.fan_base desc;

SELECT MAX(sd.speed) as max_speed,tw.name
FROM skills_data as sd
         RIGHT JOIN players p on sd.id = p.skills_data_id
         RIGHT JOIN teams t on t.id = p.team_id
         JOIN stadiums s on t.stadium_id = s.id
         RIGHT JOIN towns as tw on tw.id = s.town_id
WHERE t.name != 'Devify'
GROUP BY tw.id
ORDER BY max_speed desc , tw.name ASC ;

SELECT c.name,
       SUM(p.salary) as 'total_sum_of_salaries',
       COUNT(p.id) as 'total_count_of_players'
FROM countries as c
LEFT JOIN towns tw on c.id = tw.country_id
LEFT JOIN stadiums as s on s.town_id = tw.id
LEFT JOIN teams as t on t.stadium_id = s.id
LEFT JOIN players p on p.team_id = t.id
GROUP BY country_id
ORDER BY total_count_of_players desc ,c.name;

