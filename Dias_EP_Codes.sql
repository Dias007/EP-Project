/*
CREATE TABLE Building_company(
company_id INT,
company_name VARCHAR(64),
PRIMARY KEY(company_id)
);


CREATE TABLE Building(
building_id INT,
company_id INT,
PRIMARY KEY(building_id),
FOREIGN KEY(company_id) REFERENCES Building_company(company_id)
);



CREATE TABLE Apartment(
apartment_id INT,
apartment_number INT,
building_id INT,
PRIMARY KEY(apartment_id),
FOREIGN KEY(building_id) REFERENCES Building(building_id)
);


 
CREATE TABLE Occupant(
occupant_id INT,
fname VARCHAR(64),
lname VARCHAR(64),
date_0f_birth DATE,
check_in_date date,
email CHAR(500),
apartment_id INT,
PRIMARY KEY(occupant_id),
FOREIGN KEY(apartment_id) REFERENCES Apartment(apartment_id)
);


 
CREATE TABLE Utility_payment (
price INT,
date_of_price DATE,
occupant_id INT,
FOREIGN KEY(occupant_id) REFERENCES Occupant(occupant_id)
);



INSERT INTO building_company(company_id, company_name)
VALUES
(101, 'BiGroup'),
(102, 'Trump Tower'),
(103, 'Modern Structure'),
(104, 'Ace & Hammer Builders'),
(105, 'Diamond Ridge Construction'),
(106, 'Center Circle Design-Build'),
(107, 'Builder Gorilla'),
(108, 'Pure Renovation Company'),
(109, 'Mod Guys Construction'),
(110, 'Build It Brothers');



INSERT INTO building(building_id, company_id)
VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110);



INSERT INTO apartment(apartment_id, apartment_number, building_id)
VALUES
(200, 50, 1),
(201, 51, 2),
(202, 52, 3),
(203, 53, 4),
(204, 54, 5),
(205, 55, 6),
(206, 56, 7),
(207, 57, 8),
(208, 58, 9),
(209, 59, 10);



INSERT INTO occupant(occupant_id, fname, lname, date_0f_birth, check_in_date, email, apartment_id)
VALUES
(300, 'Dias', 'Nurbergenov', '2003-01-05', '2020-09-01', 'diasnkteam@gmail.com', 200),
(301, 'Zhangir', 'Bayanov', '2003-04-29', '2020-10-22', 'bayanov@gmail.com', 201),
(302, 'Cristiano', 'Ronaldo', '1985-02-05', '2019-12-31', 'cristiano@gmail.com', 202),
(303, 'Lionel', 'Messi', '1987-06-24', '2015-03-21', 'leomessi@gmail.com', 203),
(304, 'Sergio', 'Ramos', '1986-01-30', '2017-10-08', 'sergio@gmail.com', 204),
(305, 'Oliver', 'Queen', '1988-01-22', '2010-01-28', 'greenarrow@gmail.com', 205),
(306, 'Barry', 'Allen', '1991-07-07', '2012-12-12', 'flash@gmail.com', 206),
(307, 'Jeff', 'Bezos', '1964-01-12', '2007-04-01', 'amazon@info.com', 207),
(308, 'Bill', 'Gates', '1055-10-28', '2009-02-28', 'gates@gmail.com', 208),
(309, 'Mark', 'Zuckerberg', '1984-05-14', '2018-08-11', 'facebook@support.com', 209);



INSERT INTO utility_payment (price, date_of_price, occupant_id)
VALUES
(2060, '2020-10-01', 300),
(2160, '2020-11-22', 301),
(2260, '2020-01-31', 302),
(2360, '2015-04-21', 303),
(2460, '2017-11-08', 304),
(2560, '2010-02-28', 305),
(2660, '2013-01-12', 306),
(2760, '2007-05-01', 307),
(2860, '2009-03-28', 308),
(2960, '2018-09-11', 309);




/*
SELECT  Occupant.occupant_id, Occupant.fname, Occupant.lname, Occupant.date_0f_birth, Occupant.check_in_date, 
Occupant.email, Utility_payment.price, Utility_payment.date_of_price,
age(Occupant.check_in_date)
AS Living_duration FROM Occupant FULL OUTER JOIN Utility_payment
ON Occupant.occupant_id = Utility_payment.occupant_id
WHERE DATE_PART('year', CURRENT_DATE::date) - DATE_PART('year', Occupant.check_in_date::date) > 5;
*/


/*--
SELECT fname, lname, price 
FROM occupant 
INNER JOIN utility_payment 
ON occupant.occupant_id = utility_payment.occupant_id
WHERE utility_payment.price = (SELECT MIN(price) FROM utility_payment);
*/ 


/*--
SELECT ROUND(AVG(price),2) AS Average price
FROM utility_payment;
*/


/*--9/10
SELECT utility_payment.price
FROM utility_payment
WHERE utility_payment.price > 10000 OR utility_payment.price < 2500;
*/


/* 2/5 SINGLE ROW
SELECT price, date_of_price, occupant_id
FROM utility_payment
WHERE occupant_id =
(SELECT occupant_id
FROM utility_payment
WHERE price > 2900);
*/ 

/* 3/5 MULTIPLE ROW
SELECT apartment.apartment_id, apartment.apartment_number
FROM apartment 
WHERE apartment.apartment_id IN
(SELECT apartment.apartment_id FROM apartment
WHERE apartment.apartment_id > 205);
*/

/* 4/5 MULTIPLE ROW
SELECT  occupant.fname, occupant.lname
FROM occupant 
WHERE apartment_id IN
(SELECT apartment_id FROM apartment
WHERE  apartment_number > 54 );
*/

/* 5/5 MULTIPLE-COLUMN
ELECT  building_company.company_name
FROM building_company 
WHERE company_id NOT IN
(SELECT company_id FROM building
WHERE building_id < 3 OR building_id > 7 );
*/



/* 3/10 UPDATE
UPDATE apartment
SET apartment_number = 100
WHERE apartment_id = 209;
*/
--SELECT * FROM apartment;

/* 4-10 UPDATE
UPDATE occupant
SET date_0f_birth = '1980-01-05', email = 'TheBest@gmail.com'
WHERE occupant_id = 300;
*/
--SELECT * FROM occupant;

/* 5-10 UPDATE
UPDATE utility_payment
SET price = 1000000, date_of_price = '2023-12-22'
WHERE occupant_id = 307;
*/
--SELECT * FROM utility_payment;


/* 1/10 DELETE
DELETE FROM building_company
WHERE company_id = 105;
*/
--select * from building_company;



