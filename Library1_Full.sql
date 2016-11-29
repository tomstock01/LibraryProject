--Full Library Project
USE MASTER
GO

--Create Database
DROP DATABASE Library1
GO

CREATE DATABASE Library1
GO

USE Library1
GO

--Create Tables
CREATE TABLE Book(BookId int PRIMARY KEY, Title varchar(50) NULL, PublisherName varchar(50) NULL);
CREATE TABLE Library_Branch(BranchId int PRIMARY KEY, BranchName varchar(50) NULL, Address varchar(50) NULL);
CREATE TABLE Borrower(CardNo int PRIMARY KEY, Name varchar(50) NULL, Address varchar(50) NULL, Phone varchar(25) NULL);
CREATE TABLE Publisher(Name varchar(50) PRIMARY KEY, Address varchar(50) NULL, Phone varchar(25) NULL);
CREATE TABLE Book_Copies(BookId int NOT NULL, BranchId int NOT NULL, No_Of_Copies int NULL);
CREATE TABLE Book_Authors(BookId int NOT NULL, AuthorName varchar(50) NULL);
CREATE TABLE Book_Loans(BookId int NOT NULL, BranchId int NOT NULL, CardNo int NOT NULL, DateOut date NULL, DueDate date NULL);
GO


--Data entry, populate tables
USE Library1
GO

INSERT INTO Library_Branch
VALUES(1, 'Sharpstown', '123 Front St'),
  (2, 'Central', '321 Back Rd'),
  (3, 'Eastside', '555 Pine Ave'),
  (4, 'Dullsville', '92 Water Ave');
GO

INSERT INTO Book
VALUES(1, 'The Shining', 'Tor Books'),
  (2, 'The Lost Tribe','Ace Books'),
  (3, 'The Hunger Games','Island Press'),
  (4, 'The Giver','Legend Press'),
  (5, 'Dune','Virgin Publishing'),
  (6, 'The Way of Kings','Tor Books'),
  (7, 'The Hobbit','Virgin Publishing'),
  (8, 'Fahrenheit 451','Ace Books'),
  (9, 'True Grit','Legend Press'),
  (10, 'All the Pretty Horses','Tor Books'),
  (11, 'Jane Eyre', 'Legend Press'),
  (12, 'Great Expectations','Island Press'),
  (13, 'A Game of Thrones','Ace Books'),
  (14, 'Hyperion','Virgin Publishing'),
  (15, 'The Maltese Falcon','Legend Press'),
  (16, 'The Assassins Apprentice','Tor Books'),
  (17, 'Robinson Crusoe','Island Press'),
  (18, 'Foundation','Virgin Publishing'),
  (19, 'Congo','Ace Books'),
  (20, 'The Lincoln Lawyer', 'Legend Press');
GO

INSERT INTO Book_Authors
VALUES(1, 'Stephen King'),
  (2, 'Mark Lee'),
  (3, 'Suzanne Collins'),
  (4, 'Lois Lowry'),
  (5, 'Frank Herbert'),
  (6, 'Brandon Sanderson'),
  (7, 'J. R. R. Tolkein'),
  (8, 'Ray Bradbury'),
  (9, 'Charles Portis'),
  (10, 'Cormac McCarthy'),
  (11, 'Jane Austen'),
  (12, 'Charles Dickens'),
  (13, 'George R. R. Martin'),
  (14, 'Dan Simmons'),
  (15, 'Dashiell Hammett'),
  (16, 'Robin Hobb'),
  (17, 'Daniel Defoe'),
  (18, 'Isaac Asimov'),
  (19, 'Congo'),
  (20, 'Michael Connelly');
GO

INSERT INTO Borrower
  VALUES (01, 'Sally', '33 Bird Ave', '222-111-1987'),
    (02, 'Jim', '555 Lucky Ln', '909-444-2748'),
	(03, 'Bob', '1919 Cobra Ave','777-222-8572'),
	(04, 'Sue', '212 Riverside Dr','222-333-1256'),
	(05, 'Tim', '888 Ninja St', '888-515-0033'),
	(06, 'Kaleb', '12 Hobbit Ln','222-976-3300'),
	(07, 'Katie', '787 Aiplane St','234-666-5463'),
	(08, 'Ruby', '990 3rd st','777-122-3434'),
	(09, 'Joey', '1001 Keyboard Ave','333-245-7890');
GO

INSERT INTO Publisher
  VALUES ('Tor Books', '1234 1st Ave', '898-444-5432'),
    ('Ace Books', '33 Miller St', '101-222-4367'),
	('Legend Press', '696 Epic Ln', '747-999-0183'),
	('Island Press','553 Oasis Blvd','828-998-1212'),
	('Virgin Publishing', '2222 Wombat Rd', '444-336-7377');
GO

INSERT INTO Book_Copies
  VALUES(1,1,4), (10, 1, 3), (3, 1, 8), (17, 1, 4), (19, 1, 2),--Books in Sharpstown
        (13, 1, 6), (5, 1, 5), (18, 1, 8), (4, 1, 6), (16, 1, 7), (2,1,3),
		(2, 2, 4), (7, 2, 9), (14, 2, 10), (11, 2, 3), (8, 2, 9),--Books in Central
		(6, 2, 5), (15, 2, 3), (20, 2, 4), (9, 2, 8), (10, 2, 5), (1,2,7),
		(20, 3, 3), (1, 3, 4), (19, 3, 5), (2, 3 ,2), (18, 3, 6),--Books in Eastside
		(3, 3, 3), (17, 3, 5), (4, 3, 8), (16, 3, 3), (5, 3, 9),
		(15, 4, 2), (6, 4, 6), (14, 4, 7), (7, 4, 8), (13, 4, 8),--Books in Dullsville
		(8, 4, 4), (12, 4, 5), (9, 4, 9), (11, 4, 6), (10, 4, 5), (2,4,5);
GO

INSERT INTO Book_Loans --Total Book Loans=50
  VALUES(1,1,8,'2016-11-28', '2016-12-12'),(10,1,8,'2016-11-28', '2016-12-12'),(3,1,8,'2016-11-15', '2016-11-29'),(17,1,8,'2016-11-28', '2016-12-12'),(19,1,8,'2016-11-28', '2016-12-12'),(13,1,8,'2016-11-28', '2016-12-12'),(5,1,8,'2016-11-28', '2016-12-12'),(2,1,8,'2016-11-28', '2016-12-12'),--Ruby's Books (8)
    (18,1,7,'2016-11-21', '2016-12-05'), (4,1,7,'2016-11-21', '2016-12-05'), (16,1,7,'2016-11-15', '2016-11-29'), (3,1,7,'2016-11-21', '2016-12-05'), (13,1,7,'2016-11-21', '2016-12-05'), --Katie's Books(5)
	(2,2,6,'2016-12-01','2016-12-15'), (7,2,6,'2016-12-01','2016-12-15'), (14,2,6,'2016-12-01','2016-12-15'), (11,2,6,'2016-12-01','2016-12-15'), (8,2,6,'2016-12-01','2016-12-15'), (6,2,6,'2016-12-01','2016-12-15'), (9,2,6,'2016-12-01','2016-12-15'), --Kaleb's books(7)
	(15,2,5, '2016-12-05', '2016-12-19'), (20,2,5, '2016-12-05', '2016-12-19'), (9,2,5, '2016-12-05', '2016-12-19'), (10,2,5, '2016-12-05', '2016-12-19'), (7,2,5, '2016-12-05', '2016-12-19'), --Tim's Books (5)
	(20,3,4,'2016-12-03','2016-12-17'), (1,3,4,'2016-12-03','2016-12-17'), (19,3,4,'2016-12-03','2016-12-17'), (2,3,4,'2016-12-03','2016-12-17'), (18,3,4,'2016-12-03','2016-12-17'), (5,3,4,'2016-12-03','2016-12-17'), --Sue's Books(6)
	(3,3,3, '2016-11-28', '2016-12-12'), (17,3,3, '2016-11-28', '2016-12-12'), (4,3,3, '2016-11-28', '2016-12-12'), (16,3,3, '2016-11-28', '2016-12-12'), (5,3,3, '2016-11-28', '2016-12-12'), (19,3,3, '2016-11-28', '2016-12-12'), --Bob's Books(6)
	(15,4,2,'2016-12-02','2016-12-16'), (6,4,2,'2016-12-02','2016-12-16'), (14,4,2,'2016-12-02','2016-12-16'), (7,4,2,'2016-12-02','2016-12-16'), (13,4,2,'2016-12-02','2016-12-16'), (8,4,2,'2016-12-02','2016-12-16'), (11,4,2,'2016-12-02','2016-12-16'), --Jim's Books(7)
	(12,4,1,'2016-12-07','2016-12-21'), (9,4,1,'2016-12-07','2016-12-21'), (11,4,1,'2016-12-07','2016-12-21'), (10,4,1,'2016-12-07','2016-12-21'), (6,4,1,'2016-12-07','2016-12-21'), (14,4,1,'2016-12-07','2016-12-21'); --Sally's Books(6)
GO

--Foreign Keys
USE Library1
GO

ALTER TABLE Book_Authors
ADD CONSTRAINT FK_Book_Authors FOREIGN KEY (BookId)
  REFERENCES Book (BookId)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO

ALTER TABLE Book
ADD CONSTRAINT FK_Book_Publisher FOREIGN KEY (PublisherName)
  REFERENCES Publisher (Name)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO

ALTER TABLE Book_Copies
ADD CONSTRAINT FK_Book_Copies_BookId FOREIGN KEY (BookId)
  REFERENCES Book (BookId)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO

ALTER TABLE Book_Copies
ADD CONSTRAINT FK_Book_Copies_BranchId FOREIGN KEY (BranchId)
  REFERENCES Library_Branch (BranchId)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO

ALTER TABLE Book_Loans
ADD CONSTRAINT FK_Book_Loans_CardNo FOREIGN KEY (CardNo)
  REFERENCES Borrower (CardNo)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO

ALTER TABLE Book_Loans
ADD CONSTRAINT FK_Book_Loans_BranchId FOREIGN KEY (BranchId)
  REFERENCES Library_Branch(BranchId)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO


ALTER TABLE Book_Loans
ADD CONSTRAINT FK_Book_Loans_BookId FOREIGN KEY (BookId)
  REFERENCES Book(BookId)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
GO


--Query 1, # of 'The Lost Tribe' in Sharpstown
CREATE PROC RunQuery1
AS
	SELECT Book.Title, Book_Copies.No_Of_Copies, Library_Branch.BranchName
	FROM Book_Copies INNER JOIN Book
	ON Book.BookId=Book_Copies.BookId
	INNER JOIN Library_Branch
	ON Library_Branch.BranchID=Book_Copies.BranchId
	WHERE Book_Copies.BranchId=1 AND Book_Copies.BookId=2
GO

--Query 2, # of 'The Lost Tribe' in each Library
CREATE PROC RunQuery2
AS
	SELECT B.Title, BC.No_Of_Copies, LB.BranchName
	FROM Book_Copies AS BC INNER JOIN Library_Branch AS LB
	ON BC.BranchId=LB.BranchId
	INNER JOIN Book AS B
	ON B.BookId=BC.BookId
	WHERE  BC.BookId=2
GO

--Query 3, Names of Borrower with no books checked out
CREATE PROC RunQuery3
AS
	SELECT BO.Name
	FROM Borrower AS BO LEFT JOIN Book_Loans AS BL
	ON BO.CardNo=BL.CardNo
	WHERE BL.BookId IS NULL
GO

--Query 4, Each book from Sharpstown whose DueDate is Today
CREATE PROC RunQuery4
AS
	SELECT B.Title, BO.Name, BO.Address
	FROM Book AS B INNER JOIN Book_Loans AS BL ON B.BookId=BL.BookId
	INNER JOIN Borrower AS BO ON BL.CardNo=BO.CardNo
	WHERE BL.DueDate=CAST(CURRENT_TIMESTAMP AS DATE)
	AND BL.BranchId=1
GO

--Query 5, Each Library get Branch Name and total # of Books Loaned out from that Library
CREATE PROC RunQuery5
AS
	SELECT LB.BranchName, COUNT(BL.BookId) AS "No_Of_Checkouts"
	FROM Library_Branch AS LB INNER JOIN Book_Loans AS BL
	ON LB.BranchId=BL.BranchId
	GROUP BY LB.BranchName
GO


--Query 6: Names, Addresses, And # of Books checked out for each borrower that has more than 5 books
CREATE PROC RunQuery6
AS
	SELECT BO.Name, BO.[Address], Count(BL.BookId) AS "No_Of_Checkouts"
	FROM Book_Loans AS BL INNER JOIN Borrower AS BO
	ON BL.CardNo=BO.CardNo
	GROUP BY BO.Name, BO.[Address]
	HAVING Count(BL.BookId)>5;
GO

--Query 7: Books By Stephen King in Library Branch Central
CREATE PROC RunQuery7
AS
	SELECT B.Title, BC.No_Of_Copies
	FROM Book AS B INNER JOIN Book_Copies AS BC
	ON B.BookId=BC.BookId
	INNER JOIN Book_Authors AS BA
	ON B.BookId=BA.BookId
	WHERE BA.AuthorName='Stephen King'
	AND BC.BranchId=2
GO
