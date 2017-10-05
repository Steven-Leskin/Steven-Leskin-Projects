USE MASTER
GO
CREATE DATABASE db_Library
GO
USE db_Library
GO


BEGIN
--CREATE TABLES

CREATE TABLE  tbl_publisher (
	Pub_name VARCHAR (100),
	Pub_address VARCHAR (100),
	Pub_Phone VARCHAR (100)
);

INSERT INTO tbl_publisher -- name, address, phone
VALUES
	('Scribner','123 6th Street Melbourne, FL','251 546 9442'),
	('Scribner','70 Bowman Street South Windsor, CT','630 446 8851'),
	('Random House', '71 Pilgrim Avenue Chevy Chase, MD', '949 569 4371'),
	('Simon and Shuster', '4 Goldfield Road Honolulu, HI 96815', '760 802 6677'),
	('Hachette Book Group','514 S. Magnolia Street Orlando, FL', '472 245 2947'),
	('Amazon Digital Services', '325 SW Glenlake Lane Norcross GA', '908 606 5397'),
	('Random House', '9808 Mayfair Drive Westerville, OH','379 771 0744'),
	('HarberCollins Publishers','99 Lakeshore Street','878 442 1305'),
	('HarperCollins', '1 Deerfield Street Danville, VA', '236 552 4719'),
	('Henry Holt &: Co', ' 20 South Marsh Drive Butte, MT', '621 955 5840'),
	('Vintage House', ' 53 Arcadia Lane Renoldsburg, OH', '621 955 5820'),
	('DC Comics', '6904 Prince Road Pittsburgh, PA', '875 962 9233'),
	('Cordette Honor Books', '922 Fordham Street Oswego NY', '243 931 9387'),
	('Prentice Hall','575 Summer Court District Heights, MD', '583 403 4708')

CREATE TABLE  tbl_book (
	Book_id INT PRIMARY KEY IDENTITY (100,1) NOT NULL,
	Book_title VARCHAR (100),
	Book_publisherName VARCHAR (100) 
);

INSERT INTO tbl_book -- title, publisher
VALUES
	('The Shinning','Scribner'),
	('IT','Scribner'),
	('Sleeping Beauty','Scribner'),
	('Life 3.0 Being Human','Random House'),
	('Why Buddhism is True','Simon and Shuster'),
	('Giant of the Senate','Hachette Book Group'),
	('Astrophysics','Amazon Digital Services'),
	('Option B', 'Random House'),
	('Killers of the Flower Moon','Random House'),
	('Hillbilly Elegy','HarberCollins Publishers'),
	('Betwen the World and Me','Random House'),
	('Sapiens: A Brief Unhappy History', 'Harper Collins'),
	('Just Mercy','Random House'),
	('The New Jim Crow','Amazon Digital Services'),
	('The Lost Tribe','Henry Holt &: Co'),
	('Immortal Life of Henrietta Lacks', 'Random House'),
	('Glass Castle: A Memoir', 'Jeannette Walls'),
	('What Happened','Random House'),
	('Francis of the Fifth','Vintage House'),
	('Annialation: A Novel','DC Comics'),
	('Dog Man', 'Cordette Honor Books'),
	('Annals of the Former World', 'Prentice Hall'),
	('Less than Zero','Pilgram Books')

CREATE TABLE  tbl_author (
	Author_bookID INT IDENTITY (100,1), CONSTRAINT fk_book_ID FOREIGN KEY (author_bookID)REFERENCES tbl_book(Book_id),
	Author_name VARCHAR (100)
);

INSERT INTO tbl_author(Author_name) 
VALUES
	('Stephen King'),
	('Stephen King'),
	('Stephen King'),
	('Max Tegmark'),
	('Robert Wright'),
	('Al Franken'),
	('Neil deGrasse Tyson'),
	('Sheryl Sandbert'),
	('David Grann'),
	('J.D. Vance'),
	('Ta-Nehisi Coates'),
	('Yuval Harari'),
	('Bryan Stevenson'),
	('Cornel West'),
	('Edward Marriott')

CREATE TABLE  tbl_borrower (
	Borrower_cardNo INT PRIMARY KEY IDENTITY (300,1), 
	Borrower_name VARCHAR (100),
	Borrower_address VARCHAR (100), 
	Borrower_phone VARCHAR (100)
);

INSERT INTO tbl_borrower ---Borrower, address, phone
VALUES
	('Pauline Figueroa','2648 Skinner Hollow Road Portland','503 989 7654'),
	('Brandi Barber', '50 Ivu Street Portland','503 878 6543'),
	('Cory Perez','38843 Wetland Road Portland', '503 767 5432'),
	('Rita Nenez','308 Aspen Avenue Portland','503 656 4321'),
	('Brandon McGee','205 Sleepy Hollow Avenue Portland', '503 545 2198'),
	('Luis Cooper', '99 Shipley Street Portland','503 434 1987'),
	('Isaac Dixon','852 Lexingon Street Portland', '503 323 9876'),
	('Vanessa Lawson', '91 Bear Drive Portland','503 212 8765'),
	('Dennis Schmidt','79 S. Pegasus Lane Portland', '503 191 7654'),
	('Alton Caldwell','830 Linda Avenue Portland', '503 989 6543'),
	('Kelly Manning','268 Poor House Avenue Portland','541 202 2282'),
	('Shari Norman', '7 Walnut Wood Street Portland','971 220 1064'),
	('Roman Ferguson','98 Inverness Street Portland','503 498 9282'),
	('Kristin Cunningham','560 Grotto Drive Portland','541 615 9228'),
	('Meredith Gardner','2 Water Court Portland','971 794 5141'),
	('Melody Simpson','359 Pinnacle Road Portland','503 657 3899'),
	('Michele Hill','27 Barley Avenue Portland','503 441 2196'),
	('Clay Wagner','298 Bay Street Portland','503 242 8886'),
	('Michael Walker','851 Kingwood Street Portland','541 766 8664'),
	('Casey Montomery','48 W Rock Maple Road Portland','503 304 0123')

CREATE TABLE tbl_branch(
	Branch_id INT PRIMARY KEY IDENTITY (200,1),
	Branch_name VARCHAR (100),
	Branch_address VARCHAR (100)
);

INSERT INTO tbl_Branch -- Branch name, address
VALUES
	('Sharpstown','333 Sharpstown Road Gresham'),
	('Central','400 SW 10th Portland'),
	('Tigard Branch', '4938 Main Street Tigard'), 
	('North Portland', '12043 Rosa Parks'),
	('Southwest','108 Tervilliger Portland')

CREATE TABLE  tbl_loan (
	Loan_BookID INT, CONSTRAINT fk_loans_book_ID FOREIGN KEY (Loan_BookID) REFERENCES tbl_book(book_id),
	Loan_branchID INT, CONSTRAINT fk_loans_Branch_id FOREIGN KEY (Loan_branchID) REFERENCES tbl_branch(branch_id),
	Loan_CardNo INT, CONSTRAINT fk_CardNo FOREIGN KEY (Loan_CardNo) REFERENCES tbl_borrower(borrower_CardNo),
	Loan_dateout DATE,
	Loan_dueDate DATE
);
INSERT INTO tbl_loan (Loan_BookID,Loan_CardNo,Loan_branchID,Loan_dateout,Loan_dueDate)
VALUES
	(120,300,200,'2017-11-07','2017-10-03'),
	(119,301,200,'2017-03-06','2017-10-03'),
	(118,302,200,'2016-02-04','2017-10-03'),
	(117,303,200,'2015-11-04','2017-10-03'),
	(116,304,204,'2016-02-01','2016-02-15'),
	(115,305,204,'2016-08-13','2016-08-27'),
	(114,306,203,'2017-03-13','2017-03-17'),
	(113,307,202,'2016-07-17','2016-07-27'),
	(112,308,201,'2016-04-15','2016-04-29'),
	(111,309,200,'2016-04-18','2017-10-03'),
	(110,310,200,'2017-11-07','2017-11-21'),
	(110,311,201,'2017-03-06','2017-03-20'),
	(109,312,202,'2016-02-04','2016-02-18'),
	(108,313,203,'2015-11-04','2015-11-14'),
	(108,314,204,'2016-02-01','2016-02-15'),
	(108,315,204,'2016-08-13','2016-08-28'),
	(106,316,203,'2017-03-13','2017-03-29'),
	(105,317,202,'2016-07-17','2016-07-30'),
	(103,318,201,'2016-04-15','2016-04-29'),
	(102,317,200,'2016-04-18','2016-04-30'),
	(101,316,200,'2017-11-07','2017-11-23'),
	(100,315,201,'2017-03-06','2017-03-22'),
	(119,314,202,'2016-02-04','2016-02-18'),
	(115,313,203,'2015-11-04','2015-11-18'),
	(103,312,204,'2016-02-01','2016-02-19'),
	(111,311,203,'2016-08-13','2016-08-27'),
	(119,312,202,'2017-03-13','2017-03-27'),
	(109,310,201,'2016-07-17','2016-07-30'),
	(113,309,200,'2016-04-15','2016-04-29'),
	(118,308,201,'2016-04-18','2016-04-30'),
	(114,307,202,'2017-11-07','2017-11-24'),
	(108,306,203,'2017-03-06','2017-03-20'),
	(110,305,204,'2016-02-04','2016-02-18'),
	(113,304,204,'2015-11-04','2015-11-18'),
	(107,303,203,'2016-02-01','2016-02-15'),
	(102,302,202,'2016-08-13','2016-08-27'),
	(106,301,201,'2017-03-13','2017-03-27'),
	(113,300,201,'2016-07-17','2016-07-31'),
	(101,300,200,'2016-04-15','2016-04-29'),
	(100,301,200,'2016-04-18','2016-04-30'),
	(120,300,200,'2017-11-07','2017-10-03'),
	(119,301,200,'2017-03-06','2017-10-03'),
	(118,302,200,'2016-02-04','2017-10-03'),
	(117,303,200,'2015-11-04','2017-10-03'),
	(116,304,204,'2016-02-01','2016-02-15'),
	(115,305,204,'2016-08-13','2016-08-27'),
	(114,306,203,'2017-03-13','2017-03-17'),
	(113,307,202,'2016-07-17','2016-07-27'),
	(112,308,201,'2016-04-15','2016-04-29'),
	(111,309,200,'2016-04-18','2017-10-03'),
	(110,310,200,'2017-11-07','2017-11-21'),
	(110,311,201,'2017-03-06','2017-03-20'),
	(109,312,202,'2016-02-04','2016-02-18'),
	(108,313,203,'2015-11-04','2015-11-14'),
	(108,314,204,'2016-02-01','2016-02-15'),
	(108,315,204,'2016-08-13','2016-08-28'),
	(106,316,203,'2017-03-13','2017-03-29'),
	(105,317,202,'2016-07-17','2016-07-30'),
	(103,318,201,'2016-04-15','2016-04-29'),
	(102,317,200,'2016-04-18','2016-04-30'),
	(101,316,200,'2017-11-07','2017-11-23'),
	(100,315,201,'2017-03-06','2017-03-22'),
	(119,314,202,'2016-02-04','2016-02-18'),
	(115,313,203,'2015-11-04','2015-11-18'),
	(103,312,204,'2016-02-01','2016-02-19'),
	(111,311,203,'2016-08-13','2016-08-27'),
	(119,312,202,'2017-03-13','2017-03-27'),
	(109,310,201,'2016-07-17','2016-07-30'),
	(113,309,200,'2016-04-15','2016-04-29'),
	(118,308,201,'2016-04-18','2016-04-30'),
	(114,307,202,'2017-11-07','2017-11-24'),
	(108,306,203,'2017-03-06','2017-03-20'),
	(110,305,204,'2016-02-04','2016-02-18'),
	(113,304,204,'2015-11-04','2015-11-18'),
	(107,303,203,'2016-02-01','2016-02-15'),
	(102,302,202,'2016-08-13','2016-08-27'),
	(106,301,201,'2017-03-13','2017-03-27'),
	(113,300,201,'2016-07-17','2016-07-31'),
	(101,300,200,'2016-04-15','2016-04-29'),
	(100,301,200,'2016-04-18','2016-04-30'),
	(120,300,200,'2017-11-07','2017-10-03'),
	(119,301,200,'2017-03-06','2017-10-03'),
	(118,302,200,'2016-02-04','2017-10-03'),
	(117,303,200,'2015-11-04','2017-10-03'),
	(116,304,204,'2016-02-01','2016-02-15'),
	(115,305,204,'2016-08-13','2016-08-27'),
	(114,306,203,'2017-03-13','2017-03-17'),
	(113,307,202,'2016-07-17','2016-07-27'),
	(112,308,201,'2016-04-15','2016-04-29'),
	(111,309,200,'2016-04-18','2017-10-03'),
	(110,310,200,'2017-11-07','2017-11-21'),
	(110,311,201,'2017-03-06','2017-03-20'),
	(109,312,202,'2016-02-04','2016-02-18'),
	(108,313,203,'2015-11-04','2015-11-14'),
	(108,314,204,'2016-02-01','2016-02-15'),
	(108,315,204,'2016-08-13','2016-08-28'),
	(106,316,203,'2017-03-13','2017-03-29'),
	(105,317,202,'2016-07-17','2016-07-30'),
	(103,318,201,'2016-04-15','2016-04-29'),
	(102,317,200,'2016-04-18','2016-04-30'),
	(101,316,200,'2017-11-07','2017-11-23'),
	(100,315,201,'2017-03-06','2017-03-22'),
	(119,314,202,'2016-02-04','2016-02-18'),
	(115,313,203,'2015-11-04','2015-11-18'),
	(103,312,204,'2016-02-01','2016-02-19'),
	(111,311,203,'2016-08-13','2016-08-27'),
	(119,312,202,'2017-03-13','2017-03-27'),
	(109,310,201,'2016-07-17','2016-07-30'),
	(113,309,200,'2016-04-15','2016-04-29'),
	(118,308,201,'2016-04-18','2016-04-30'),
	(114,307,202,'2017-11-07','2017-11-24'),
	(108,306,203,'2017-03-06','2017-03-20'),
	(110,305,204,'2016-02-04','2016-02-18'),
	(113,304,204,'2015-11-04','2015-11-18'),
	(107,303,203,'2016-02-01','2016-02-15'),
	(102,302,202,'2016-08-13','2016-08-27'),
	(106,301,201,'2017-03-13','2017-03-27'),
	(113,300,201,'2016-07-17','2016-07-31'),
	(101,300,200,'2016-04-15','2016-04-29'),
	(100,301,200,'2016-04-18','2016-04-30'),
	(120,300,200,'2017-11-07','2017-10-03'),
	(119,301,200,'2017-03-06','2017-10-03'),
	(118,302,200,'2016-02-04','2017-10-03'),
	(117,303,200,'2015-11-04','2017-10-03'),
	(116,304,204,'2016-02-01','2016-02-15'),
	(115,305,204,'2016-08-13','2016-08-27'),
	(114,306,203,'2017-03-13','2017-03-17'),
	(113,307,202,'2016-07-17','2016-07-27'),
	(112,308,201,'2016-04-15','2016-04-29'),
	(111,309,200,'2016-04-18','2017-10-03'),
	(110,310,200,'2017-11-07','2017-11-21'),
	(110,311,201,'2017-03-06','2017-03-20'),
	(109,312,202,'2016-02-04','2016-02-18'),
	(108,313,203,'2015-11-04','2015-11-14'),
	(108,314,204,'2016-02-01','2016-02-15'),
	(108,315,204,'2016-08-13','2016-08-28')


CREATE TABLE tbl_copies (
	Copies_bookID INT, CONSTRAINT fk_copies_bookID FOREIGN KEY (Copies_bookID) REFERENCES tbl_book(book_id),
	Copies_branchID INT, CONSTRAINT fk_copies_branchID FOREIGN KEY (Copies_BranchID) REFERENCES tbl_branch(branch_ID), 
	Copies_Quantity INT 
);

INSERT INTO tbl_copies --bookid, branchID, copies#
VALUES
	(114,200,3),
	(102,202,2),
	(103,203,3),
	(104,204,4),
	(100,204,5),
	(100,201,1),
	(100,202,2),
	(100,203,3),
	(100,204,4),
	(101,201,5),
	(101,202,1),
	(101,203,2),
	(103,200,3),
	(104,201,4),
	(101,202,5),
	(101,200,1),
	(101,204,2),
	(102,201,3),
	(103,200,4),
	(102,203,5),
	(102,204,1),
	(100,200,1),
	(100,202,2),
	(100,203,3),
	(104,200,4),
	(102,204,5),
	(101,200,1),
	(100,202,2),
	(101,203,3),
	(102,204,4),
	(101,201,5),
	(103,202,1),
	(114,203,2),
	(113,204,3),
	(114,201,4),
	(114,202,5),
	(110,203,1),
	(113,204,2),
	(114,201,3),
	(113,202,4),
	(112,203,5),
	(112,204,1),
	(110,201,1),
	(110,202,2),
	(113,203,3),
	(114,204,4),
	(115,204,5),
	(116,201,1),
	(117,202,2),
	(118,203,3),
	(119,204,4),
	(111,201,5),
	(111,202,1),
	(112,203,2),
	(113,204,3),
	(114,201,4),
	(115,202,5),
	(116,203,1),
	(117,204,2),
	(118,201,3),
	(119,202,4),
	(112,203,5),
	(102,204,1),
	(103,203,3),
	(104,204,4),
	(100,204,5),
	(100,201,1),
	(100,202,2),
	(100,203,3),
	(100,204,4),
	(101,201,5),
	(101,202,1),
	(101,203,2),
	(103,200,3),
	(104,201,4),
	(101,202,5),
	(101,200,1),
	(101,204,2),
	(102,201,3),
	(103,200,4),
	(102,203,5),
	(102,204,1),
	(100,200,1),
	(100,202,2),
	(100,203,3),
	(104,200,4),
	(102,204,5),
	(101,200,1),
	(100,202,2),
	(101,203,3),
	(102,204,4),
	(101,201,5),
	(103,202,1),
	(114,203,2),
	(113,204,3),
	(114,201,4),
	(114,202,5),
	(110,203,1),
	(113,204,2),
	(114,201,3),
	(113,202,4),
	(112,203,5),
	(112,204,1),
	(110,201,1),
	(110,202,2),
	(113,203,3),
	(114,204,4),
	(115,204,5),
	(116,201,1),
	(117,202,2),
	(118,203,3),
	(119,204,4),
	(111,201,5),
	(111,202,1),
	(112,203,2),
	(113,204,3),
	(114,201,4),
	(115,202,5),
	(116,203,1),
	(117,204,2),
	(118,201,3),
	(119,202,4),
	(112,203,5)

END


--QUERIES

--1. how many copies of The Lost Tribe are housed at Sharpstown branch

SELECT Book_title AS [TITLE:], Branch_name AS [BRANCH:], Copies_Quantity AS [NUMBER OF COPIES] 
	FROM tbl_copies
		INNER JOIN tbl_book ON tbl_book.Book_id = tbl_copies.Copies_bookID
		INNER JOIN tbl_branch ON tbl_branch.Branch_id=tbl_copies.Copies_branchID
WHERE tbl_branch.Branch_name = 'Sharpstown' AND tbl_book.Book_title = 'The Lost Tribe';

--2. How many copies of The Lost Tribe are at each branch

SELECT book_title AS [BOOK TITLE:], Copies_Quantity AS [NUMBER OF COPIES:], branch_name AS [BRANCH:]
	FROM tbl_copies
		INNER JOIN tbl_book ON tbl_book.book_id=tbl_copies.Copies_bookID
		INNER JOIN tbl_branch ON tbl_branch.branch_ID=tbl_copies.Copies_branchID
WHERE book_title = 'The Lost Tribe'

--3. Retreive the names of all borrowers who do not have books checked out

SELECT Borrower_name, Loan_dateout
	FROM tbl_borrower
	FULL OUTER JOIN tbl_loan ON tbl_loan.Loan_CardNo = tbl_borrower.Borrower_cardNo
WHERE tbl_loan.Loan_CardNo IS NULL

--4 For books due today (2017-10-03) of Sharpstown branch, retrieve book title, and borrower name and address

Select  book_title AS [BOOK TITLE:], borrower_name AS [BORROWER:], borrower_address AS [BORROWER ADDRESS:]
	FROM tbl_borrower
		INNER JOIN tbl_loan ON tbl_loan.Loan_CardNo=tbl_borrower.Borrower_cardNo
			INNER JOIN tbl_branch ON tbl_branch.Branch_id=tbl_loan.Loan_branchID
		INNER JOIN tbl_book ON  tbl_book.Book_id=tbl_loan.Loan_BookID
WHERE Branch_name = 'Sharpstown' AND Loan_dueDate = '2017-10-03'

-- 5 Number of books checked out of each branch

SELECT branch_name AS [BRANCH:], COUNT (tbl_loan.Loan_dateout) AS [NUMBER OF BOOKS CHECKED OUT]
	FROM tbl_branch
	INNER JOIN tbl_loan ON tbl_loan.Loan_branchID=tbl_branch.Branch_id
GROUP BY Branch_name

--6 name and address of all borrowers with more than five books out, and number checked out

SELECT tbl_borrower.Borrower_name,  COUNT(tbl_loan.Loan_dateout) AS [NUMBER:], tbl_borrower.Borrower_address
	FROM tbl_Loan
		INNER JOIN Tbl_borrower ON tbl_borrower.Borrower_cardNo=tbl_loan.Loan_CardNo
	GROUP BY borrower_name, Borrower_address
HAVING COUNT (tbl_loan.loan_dateout) > 5;

-- 7 find the copies of Stephen King titles at central branch

SELECT book_title AS [TITLE:],  Copies_Quantity AS [QUANTITY:], Branch_name AS [BRANCH:]
	FROM tbl_copies
	INNER JOIN tbl_book ON tbl_book.Book_id=tbl_copies.Copies_bookID
		INNER JOIN tbl_author ON tbl_author.Author_bookID=tbl_copies.Copies_bookID
	INNER JOIN tbl_branch ON tbl_branch.Branch_id=tbl_copies.Copies_branchID
WHERE tbl_author.Author_name = 'Stephen King' and tbl_branch.Branch_name = 'Central';

