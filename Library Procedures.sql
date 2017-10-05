USE db_libraryTEST17
GO

CREATE PROCEDURE LibraryQuery_1

AS

BEGIN

SELECT Book_title AS [TITLE:], Branch_name AS [BRANCH:], Copies_Quantity AS [NUMBER OF COPIES] 
	FROM tbl_copies
		INNER JOIN tbl_book ON tbl_book.Book_id = tbl_copies.Copies_bookID
		INNER JOIN tbl_branch ON tbl_branch.Branch_id=tbl_copies.Copies_branchID
WHERE tbl_branch.Branch_name = 'Sharpstown' AND tbl_book.Book_title = 'The Lost Tribe';

END

LibraryQuery_1

CREATE PROCEDURE LibraryQuery_2
AS

BEGIN
SELECT book_title AS [BOOK TITLE:], Copies_Quantity AS [NUMBER OF COPIES:], branch_name AS [BRANCH:]
	FROM tbl_copies
		INNER JOIN tbl_book ON tbl_book.book_id=tbl_copies.Copies_bookID
		INNER JOIN tbl_branch ON tbl_branch.branch_ID=tbl_copies.Copies_branchID
WHERE book_title = 'The Lost Tribe'
END

LibraryQuery_2

CREATE PROCEDURE LibraryQuery_3
AS

BEGIN
SELECT Borrower_name, Loan_dateout
	FROM tbl_borrower
	FULL OUTER JOIN tbl_loan ON tbl_loan.Loan_CardNo = tbl_borrower.Borrower_cardNo
WHERE tbl_loan.Loan_CardNo IS NULL
END

LibraryQuery_3

CREATE PROCEDURE LibraryQuery_4
AS

BEGIN
Select  book_title AS [BOOK TITLE:], borrower_name AS [BORROWER:], borrower_address AS [BORROWER ADDRESS:]
	FROM tbl_borrower
		INNER JOIN tbl_loan ON tbl_loan.Loan_CardNo=tbl_borrower.Borrower_cardNo
		INNER JOIN tbl_branch ON tbl_branch.Branch_id=tbl_loan.Loan_branchID
		INNER JOIN tbl_book ON  tbl_book.Book_id=tbl_loan.Loan_BookID
WHERE Branch_name = 'Sharpstown' AND Loan_dueDate = '2017-10-03'
END

LibraryQuery_4

CREATE PROCEDURE LibraryQuery_5
AS

BEGIN
SELECT branch_name AS [BRANCH:], COUNT (tbl_loan.Loan_dateout) AS [NUMBER OF BOOKS CHECKED OUT]
	FROM tbl_branch
		INNER JOIN tbl_loan ON tbl_loan.Loan_branchID=tbl_branch.Branch_id
GROUP BY Branch_name
END

LibraryQuery_5

CREATE PROCEDURE LibraryQuery_6
AS

BEGIN
SELECT tbl_borrower.Borrower_name,  COUNT(tbl_loan.Loan_dateout) AS [NUMBER:], tbl_borrower.Borrower_address
	FROM tbl_Loan
		INNER JOIN Tbl_borrower ON tbl_borrower.Borrower_cardNo=tbl_loan.Loan_CardNo
	GROUP BY borrower_name, Borrower_address
HAVING COUNT (tbl_loan.loan_dateout) > 5;
END

LibraryQuery_6


CREATE PROCEDURE LibraryQuery_7
AS
BEGIN
SELECT book_title AS [TITLE:],  Copies_Quantity AS [QUANTITY:], Branch_name AS [BRANCH:]
	FROM tbl_copies
		INNER JOIN tbl_book ON tbl_book.Book_id=tbl_copies.Copies_bookID
		INNER JOIN tbl_author ON tbl_author.Author_bookID=tbl_copies.Copies_bookID
		INNER JOIN tbl_branch ON tbl_branch.Branch_id=tbl_copies.Copies_branchID
WHERE tbl_author.Author_name = 'Stephen King' and tbl_branch.Branch_name = 'Central';
END

LibraryQuery_7

