-- SOURCE ../Final Project/libraryDB.sql;

-- Create Database

DROP DATABASE IF EXISTS libraryDB;
CREATE DATABASE libraryDB;

-- Select the database

USE libraryDB;

-- Create tables for database

CREATE TABLE genreTb (

	genreID				INT 			PRIMARY KEY,
	genre				VARCHAR(20)	 	NOT NULL

);

CREATE TABLE sectionTb (

	sectionID			INT				PRIMARY KEY

);

CREATE TABLE libraryTb (

	libraryID			INT 			PRIMARY KEY,
	lbStreet			VARCHAR(20) 	NOT NULL,
	lbCity				VARCHAR(20) 	NOT NULL,
	lbState				VARCHAR(20) 	NOT NULL,
	lbZip				INT 			NOT NULL

);

CREATE TABLE employeeTb (

	libraryID			INT				NOT NULL,
	employeeFirstName	VARCHAR(20) 	NOT NULL,
	employeeLastName	VARCHAR(20) 	NOT NULL,
	employeeID			INT 			PRIMARY KEY,
	CONSTRAINT libraryTbFkEmployeeTb
		FOREIGN KEY (libraryID)
		REFERENCES libraryTb (libraryID)
);

CREATE TABLE bookTb (

	bookID 				INT 			PRIMARY KEY,
	authorName 			VARCHAR(20) 	NOT NULL,
	title				VARCHAR(100) 	NOT NULL,
	genreID				INT				NOT NULL,
	libraryID			INT				NOT NULL,
	sectionID			INT 			NOT NULL,
	purchasePrice		INT			 	NOT NULL,
	
	CONSTRAINT genreTbFkBookTb
		FOREIGN KEY (genreID)
		REFERENCES genreTb (genreID),
		
	CONSTRAINT libraryTbFkBookTb
		FOREIGN KEY (libraryID)
		REFERENCES libraryTb (libraryID),
		
	CONSTRAINT sectionTbFkBookTb
		FOREIGN KEY (sectionID)
		REFERENCES sectionTb (sectionID)
		
);

CREATE TABLE rentTb (

	rentDate			DATE 			NOT NULL,
	dueDate				DATE,
	rentID				INT				PRIMARY KEY			AUTO_INCREMENT
	
);

CREATE TABLE studentTb (

	studentFirstName	VARCHAR(20) 	NOT NULL,
	studentLastName		VARCHAR(20) 	NOT NULL,
	studentEmail		VARCHAR(50)		NOT NULL			UNIQUE,
	studentID			INT 			PRIMARY KEY,
	rentID				INT				NOT NULL,
	
	CONSTRAINT rentTbFkStudentTb
		FOREIGN KEY (rentID)
		REFERENCES rentTb (rentID)
	
);

-- Create indexes

CREATE INDEX bookIDIndx
	ON bookTb (authorName ASC);
  
CREATE INDEX studentIDIndx
	ON studentTb (studentLastName ASC);
  
CREATE INDEX rentIDIndx
	ON bookTb (authorName ASC);

-- Insert values into tables

-- genreTb (genreID, genre)
INSERT INTO genreTb
VALUES
(100, 'Non-Fiction'),
(200, 'Fiction'),
(300, 'Romance');

-- sectionTb
INSERT INTO sectionTb
VALUES
(1),
(2),
(3),
(4),
(5);

-- libraryTb (libraryID, lbStreet, lbCity, lbState, lbZip)
INSERT INTO libraryTb
VALUES
(1, '200 Polk Blvd.', 'Tucson', 'AZ', '85710'),
(2, '4554 Debuque St.', 'Iowa City', 'IA', '52245'),
(3, '63333 Ridge Ave.', 'San Diego', 'CA', '92029');

-- employeeTb (libraryID, employeeFirstName, employeeLastName, employeeID)
INSERT INTO employeeTb
VALUES
(1, 'Jason', 'Nobriga', 5001),
(2, 'Herald', 'Talon', 4032),
(3, 'Stacy', 'Reed', 7989);

-- bookTb (bookID, authorName, title, genreID, libraryID, sectionID, purchasePrice)
INSERT INTO bookTb
VALUES
(1, 'Stephenie Meyer', 'Twilight', 100, 1, 4, 24.99),
(2, 'Cheryl Mendelson', 'Home Comforts: The Art and Science of Keeping House', 200, 2, 1, 18.99),
(3, 'J. K. Rowling', 'Harry Potter and the Sorcerers Stone', 100, 3, 5, 15.99);

-- rentTb (rentDate, dueDate, rentID, purchasePrice)
-- YYYY-MM-DD

INSERT INTO rentTb
VALUES
('2017-10-21', '2017-10-31', 1),
('2010-04-20', '2010-05-03', 2),
('2015-07-10', '2016-08-02', 3);

-- studentTb (studentFirstName, studentLastName, studentID, rentID)

INSERT INTO studentTb
VALUES
('Mollie','Stewart', '123@abc.com', 50202, 1),
('Kim', 'Moler', 'kmoler@fake.com', 45656, 2),
('Nick', 'Castle', 'castle@booyah.com', 11213, 3);




-- Stored procedures 2 views w/ column alias



