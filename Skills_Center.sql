CREATE SCHEMA Skills_Center;

-- services

CREATE TABLE services (
	service_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    service_character VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    coach_id BIGINT,
    room_id BIGINT,
    price INT
);

ALTER TABLE services ADD
CONSTRAINT coach_id
FOREIGN KEY (coach_id)
REFERENCES coaches(coach_id);

ALTER TABLE services ADD
CONSTRAINT room_id
FOREIGN KEY (room_id)
REFERENCES rooms (room_id);

INSERT INTO services (service_character, description, coach_id, room_id, price)
VALUES 
('mental practice', 'Individual meeting with a sport psychologist.', 2, 2,80),
('basketball practice', 'Practice basketball in groups, games.', 1, 1, 60),
('nutritionist meeting', 'Meeting with a nutritionist.', 3,3, 80),
('individual soocer practice', 'Soocer practice 1 on 1 with coach.', 4, 4, 100),
('soocer practice', 'Practice soocer in groups, games.', 4, 4, 60),
('physical preparation', 'Individual 1 on 1 practice with coach in the weight room.',5,5, 100),
('individual swimming practice', 'Individual swimming practice 1 on 1 with coach.', 6, 6, 100),
('swimming practice', 'Swimming practice in groups.', 6, 6, 60),
('individual volleyball practice', 'Volleyball practice 1 on 1 with coach.', 7, 7, 100),
('volleyball practice', 'Volleyball practice in groups, games.', 7, 7, 60),
('individual basketball practice', 'Practice basketball 1 on 1 with coach.', 1, 1, 100);


-- players

CREATE TABLE players (
	player_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    discipline VARCHAR(45) NOT NULL,
    height INT NOT NULL,
    weight INT NOT NULL
);

INSERT INTO players (first_name, last_name, age, discipline, height, weight)
VALUES
('Diana', 'Malkeva', 20, 'basketball', '167', '60'),
('Cala', 'Luceva', 23, 'soocer', '170', '60'),
('Cristiano', 'Ronaldo', 34, 'soocer', 180, 85),
('Kateryna', 'Jyzy', 18, 'swimming', 177, 65),
('Andrey', 'Campo', 27, 'volleyball', 190, 95),
('Anna', 'Raldo', 14, 'soocer', 140, 35),
('Kate', 'Wroblewska', 19, 'swimming', 177, 75),
('Amanda', 'Bardo', 25, 'volleyball', 188, 75),
('Dagmara', 'Malkeva', 27, 'basketball', '177', '65'),
('Carla', 'Lanceva', 33, 'basketball', '180', '65'),
('Kamil', 'Ando', 22, 'soocer', 166, 60),
('Carolina', 'Vanks', 16, 'swimming', 163, 51),
('Agnes', 'Sensa', 27, 'volleyball', 180, 66),
('Amanda', 'Namura', 19, 'soocer', 177, 70),
('Roberta', 'Wenka', 21, 'swimming', 187, 80),
('Mariana', 'Nao', 17, 'volleyball', 190, 75),
('Raul', 'Maurinio', 15, 'basketball', '155', '45'),
('Daniel', 'Lane', 33, 'basketball', '190', '95'),
('Rob', 'Den', 24, 'soocer', 170, 75),
('Kate', 'Zenk', 19, 'swimming', 176, 65),
('Andrey', 'Zenna', 16, 'volleyball', 170, 65),
('Amy', 'Dave', 18, 'soocer', 180, 75),
('Mary', 'Mate', 20, 'swimming', 164, 53),
('Aneglica', 'Bravo', 23, 'volleyball', 179, 66),
('Diana', 'Lanka', 22, 'basketball', '173', '68'),
('Camilla', 'Navy', 27, 'basketball', '186', '78'),
('Deny', 'Armani', 21, 'soocer', 164, 60),
('Carla', 'Bino', 19, 'swimming', 173, 62),
('Arnold', 'Sasa', 27, 'volleyball', 167, 57),
('Angie', 'Mala', 20, 'soocer', 160, 98),
('Daniel', 'Cello', 28, 'swimming', 177, 70),
('Marta', 'Zerra', 19, 'volleyball', 170, 65),
('Raul', 'Rubens', 18, 'basketball', '180', '93'),
('Jay', 'Lavonne', 23, 'basketball', '181', '88');

-- rooms


CREATE TABLE rooms (
	room_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

INSERT INTO rooms (name, location)
VALUES
('basketball court', 'block 1'),
('psychologist room', 'main house, room 2'),
('nutritionist room', 'main house, room 3'),
('soocer pitch', 'outside - behind block 1'),
('weight room', 'block 1'),
('swimming pool','block 1'),
('volleyball court', 'block 3');

-- service_player

CREATE TABLE service_player(
	service_player_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    player_id BIGINT NOT NULL,
    service_id BIGINT NOT NULL,
    signup_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE service_player ADD
CONSTRAINT player_id
FOREIGN KEY (player_id)
REFERENCES players (player_id);

ALTER TABLE service_player ADD
CONSTRAINT service_id
FOREIGN KEY (service_id)
REFERENCES services (service_id);

INSERT INTO service_player (player_id, service_id)
VALUES (1,1), (1,2), (1,3),(1,4), (1,11), (2,5), (2,6), (2,3), (2,4), (3,4), (3,3), (4,8), (4,7), (4,3), (5,9), (5,10),
(6,5), (6,6), (7,10), (7,3), (8,9), (8,6), (8,1), (9,1), (9,2), (9,3), (10,2), (10,3), (10,11), (11,5), (11,6), (11,1),
(12,8), (12,1), (13,10), (13,9), (13,1), (14,5), (14, 4), (14,1), (14,6), (15, 8), (15, 7), (15,6), (16,10), (16,6), (16,1),
(17,1), (17,2), (17,11), (18,2), (18,6), (18,3), (19,5), (19,4), (19,3), (20,7), (20,1), (20,3), (21,10), (21,9), (21,6), (21,3),
(22,5), (22,4), (22,1), (23,7), (23,8), (23, 6), (24,10), (24,1), (25, 2), (25,11), (25, 6), (26,11), (26,1), (26,3), (26,6),
(27,5), (27,1), (27,3), (27,6), (28,7), (28,1), (28,3), (28,6), (29,10), (29,9), (29,3), (30,4), (30,1), (31,8), (31,7),
(32,9), (32,9), (32,1), (33,2), (33,11), (33,6), (34,1), (34,11), (34,6);
-- ... and more. 
-- coaches

CREATE TABLE coaches(
	coach_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO coaches(first_name, last_name, specialization, email)
VALUES 
('Monika', 'Kowalska', 'basketball coach', 'MKbasketball@gamil.com'),
('Tea', 'Meric', 'mental coach', 'TMmental@gmail.com'),
('Sylvia', 'Elhab', 'nutritionis', 'SEnutritionist@gmail.com'),
('Maria', 'Johnson', 'soocer coach', 'MJsoocer@gmail.com'),
('Ana', 'Rybakova', 'physical preparation', 'ARgym@gmail.com'),
('Robert', 'Martin', 'swimming coach', 'RMswimming@gmail.com'),
('Andre', 'John', 'volleyball coach', 'AJvolley@gmail.com');
