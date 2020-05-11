CREATE DATABASE air_port;
USE air_port;
CREATE TABLE WORKER(
SSN int,
last_name varchar(255),
first_name varchar(255),
hours int,
phone char(11),
birthdate date,
PRIMARY KEY (SSN)
);

CREATE TABLE DEPARTMENT(
dep_ID int,
head_SSN int,
dep_name varchar(255),
phone char(11),
mail varchar(255),
PRIMARY KEY (dep_ID),
FOREIGN KEY (head_SSN) REFERENCES WORKER(SSN) ON DELETE CASCADE
);

CREATE TABLE EMPlOYEE(
salary int,
address varchar(255),
mail varchar(255),
ESSN int,
dep_ID int,
PRIMARY KEY (ESSN),
FOREIGN KEY (ESSN) REFERENCES WORKER(SSN) ON DELETE CASCADE,
FOREIGN KEY (dep_ID) REFERENCES DEPARTMENT(dep_ID) ON DELETE CASCADE
);

CREATE TABLE FLIGHT(
flight_ID int,
price int,
captain_ID int,
attendant_1_ID int,
attendant_2_ID int,
arrival_time datetime,
depature_time datetime,
arrival_city varchar(255),
depature_city varchar(255),
max_weight int,
PRIMARY KEY (flight_ID),
FOREIGN KEY (captain_ID) REFERENCES WORKER(SSN) ON DELETE CASCADE,
FOREIGN KEY (attendant_1_ID) REFERENCES WORKER(SSN) ON DELETE CASCADE,
FOREIGN KEY (attendant_2_ID) REFERENCES WORKER(SSN) ON DELETE CASCADE
);

CREATE TABLE TRAVELER(
SSN int,
nationality varchar(255),
last_name varchar(255),
first_name varchar(255),
flight_ID int,
extra_charges int,
age int,
PRIMARY KEY (SSN, nationality),
FOREIGN KEY (flight_ID) REFERENCES FLIGHT(flight_ID) ON DELETE CASCADE
);

CREATE TABLE BAGGAGE(
bag_ID int,
flight_ID int,
weight int,
SSN_traveler int,
nationality_traveler varchar(255),
PRIMARY KEY (bag_ID),
FOREIGN KEY (SSN_traveler, nationality_traveler) REFERENCES TRAVELER(SSN, nationality) ON DELETE CASCADE,
FOREIGN KEY (flight_ID) REFERENCES FLIGHT(flight_ID) ON DELETE CASCADE
);

CREATE TABLE CONTRACT(
contract_ID int,
contract_duration int,
charges varchar(255),
contract_name varchar(255),
PRIMARY KEY (contract_ID)
);

CREATE TABLE CONTRACTOR(
CSSN int,
contract_duration int,
f_flag int,
a_flag int,
contract_ID int,
PRIMARY KEY (CSSN),
FOREIGN KEY (CSSN) REFERENCES WORKER(SSN) ON DELETE CASCADE,
FOREIGN KEY (contract_ID) REFERENCES CONTRACT(contract_ID) ON DELETE CASCADE
);

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (123456789, 'Fawzy', 'Ahmed', 6, 012345678912, '1998-07-01');

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (234567891, 'Mostafa', 'Nada', 3, 023456789121, '1990-12-05');

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (134567891, 'Omar', 'Ibrahim', 12, 093456789121, '1988-02-10');

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (234567091, 'Beltagy', 'Mahmoud', 7, 023455789121, '1995-05-05');

INSERT INTO DEPARTMENT (dep_ID, head_SSN, dep_name, phone, mail)
VALUES (1, 234567091, 'security', 014725836922, 'security@airport.eg');

INSERT INTO DEPARTMENT (dep_ID, head_SSN, dep_name, phone, mail)
VALUES (2, 234567891, 'mangement', 014525836922, 'mangement@airport.eg');

INSERT INTO DEPARTMENT (dep_ID, head_SSN, dep_name, phone, mail)
VALUES (3, 134567891, 'control', 011525836922, 'control@airport.eg');

INSERT INTO DEPARTMENT (dep_ID, head_SSN, dep_name, phone, mail)
VALUES (4, 123456789, 'puplic relations', 011525036922, 'pr@airport.eg');

INSERT INTO EMPLOYEE (salary, address, mail, ESSN, dep_ID)
VALUES (5000, 'cairo street','ahmed15@gmail.com', 123456789, 2);

UPDATE EMPLOYEE
SET address = 'cairo street15'
WHERE ESSN = 123456789;

INSERT INTO FLIGHT (flight_ID, price, captain_ID, attendant_1_ID, attendant_2_ID,
					arrival_time, depature_time, arrival_city, depature_city, max_weight)
VALUES(5, 5000, 123456789, 134567891, 134567891, '2019-12-9 12:00:05', '2019-12-10 10:00:20', 'NEW YORK', 'Cairo', '20');

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (345678912, 'Ahmed','Fareeda', 11, 012345689459, '1992-05-01');

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (345673912, 'qassem', 'Fareed', 11, 012345589459, '1997-05-07');

INSERT INTO WORKER (SSN, last_name, first_name, hours, phone, birthdate)
VALUES (234567001, 'qattan', 'Mamdouh', 7, 023355789121, '1993-05-03');

INSERT INTO EMPLOYEE (salary, address, mail, ESSN, dep_ID)
VALUES (7000, 'Alexandria street','Nada19@gmail.com', 234567891, 3);

INSERT INTO EMPLOYEE (salary, address, mail, ESSN, dep_ID)
VALUES (9000, 'Luxor street','Ibrahim12@gmail.com', 134567891, 1);

INSERT INTO CONTRACT (contract_ID, contract_duration, charges, contract_name )
VALUES (12345, 4, 4000, 'StarBucks');

INSERT INTO CONTRACT (contract_ID, contract_duration, charges, contract_name )
VALUES (43345, 1, 2000, 'Virgin');

INSERT INTO CONTRACT (contract_ID, contract_duration, charges, contract_name )
VALUES (57645, 5, 14000, 'Dunkins Donuts');                     

INSERT INTO CONTRACT (contract_ID, contract_duration, charges, contract_name )
VALUES (22645, 12, 1400000, 'Egypt Air'); 

INSERT INTO CONTRACTOR (CSSN, contract_duration, f_flag, a_flag, contract_ID)
VALUES (345678912, 4, 0,1, 12345);

INSERT INTO CONTRACTOR (CSSN, contract_duration, f_flag, a_flag, contract_ID)
VALUES (234567091, 3, 1, 0, 22645);

INSERT INTO CONTRACTOR (CSSN, contract_duration, f_flag, a_flag, contract_ID)
VALUES (345673912, 6, 1, 0, 22645);

INSERT INTO CONTRACTOR (CSSN, contract_duration, f_flag, a_flag, contract_ID)
VALUES (234567001, 1, 1, 0, 22645);

INSERT INTO FLIGHT (flight_ID, price, captain_ID, attendant_1_ID, attendant_2_ID,arrival_time, depature_time,arrival_city, depature_city, max_weight)
VALUES(7, 19000, 234567091, 345673912, 234567001, '2019-10-9 00:00:05', '2019-11-10 9:00:20', 'Paris', 'Cairo', '30');

INSERT INTO FLIGHT (flight_ID, price, captain_ID, attendant_1_ID, attendant_2_ID,arrival_time, depature_time,arrival_city, depature_city, max_weight)
VALUES(8, 5000, 234567091, 234567001, 345673912, '2019-09-10 02:30:05', '2019-11-10 06:00:20', 'Cairo', 'Hurghada', '50');

INSERT INTO TRAVELER (SSN, nationality ,last_name ,first_name ,flight_ID ,extra_charges ,age)
VALUES (123456789, 'Russian', 'Marcov', 'Demetry', 7, 122, 22);

INSERT INTO TRAVELER (SSN, nationality ,last_name ,first_name ,flight_ID ,extra_charges ,age)
VALUES (623496789, 'french', 'Claude', 'Cecile', 7, 20, 88);

INSERT INTO TRAVELER (SSN, nationality ,last_name ,first_name ,flight_ID ,extra_charges ,age)
VALUES (773456789, 'American', 'Mcdonald', 'Kyle', 8, 100, 40);

INSERT INTO BAGGAGE (bag_ID, flight_ID, weight,SSN_traveler, nationality_traveler)
VALUES (12344, 7, 6, 123456789, 'Russian');

INSERT INTO BAGGAGE (bag_ID, flight_ID, weight,SSN_traveler, nationality_traveler)
VALUES (31243, 7, 6, 123456789, 'Russian');

INSERT INTO BAGGAGE (bag_ID, flight_ID, weight,SSN_traveler, nationality_traveler)
VALUES (44440,  8, 30, 773456789, 'American');