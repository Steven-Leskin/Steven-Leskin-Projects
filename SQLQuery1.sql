
USE TEST
GO

--*****CREATE TABLES*****

CREATE TABLE tbl_contact
(contact_ID INT PRIMARY KEY IDENTITY (1,1), contact_fname VARCHAR (20), contact_lname VARCHAR (20), contact_gender CHAR (10) NOT NULL );

CREATE TABLE tbl_Address
(address_ID INT PRIMARY KEY IDENTITY (1,1), fk_contact_ID VARCHAR (20) FOREIGN KEY (address_ID) REFERENCES tbl_contact(contact_ID), address_city VARCHAR (20), address_phone CHAR(20), address_state CHAR (20));

CREATE TABLE tbl_Orders
(orders_ID INT PRIMARY KEY IDENTITY (1,1), fk_contact_ID VARCHAR (20) FOREIGN KEY (orders_ID) REFERENCES tbl_contact(contact_ID),order_model VARCHAR (20), order_year VARCHAR (10))

--*****POPULATE TABLES*****	

	INSERT INTO tbl_Orders (order_model,order_year)--populate orders
	VALUES ('Ford', '2015'),('Honda','2016'),('Toyota', '2017'); -- add multiple values concurrently in this fashion

	INSERT INTO tbl_Orders(fk_contact_ID)
	VALUES ('1'),('2'),('3')

	INSERT INTO tbl_Contact (Contact_fname,Contact_Lname, contact_gender) -- populate contacts 
	VALUES ('Steven','Leskin','male');

	INSERT INTO tbl_Contact (Contact_fname,Contact_Lname,contact_gender)
	VALUES ('William','Ifrah','male');

	INSERT INTO tbl_Contact (Contact_fname,Contact_Lname,contact_gender)
	VALUES ('Michelle','Lawson','female');

	INSERT INTO tbl_Address(fk_contact_ID ,address_city,address_state,address_phone) -- populate addresses
	VALUES ('1','Sausilito','CA','5039364598');

	INSERT INTO tbl_Address(fk_contact_ID,address_city,address_state,address_phone)
	VALUES ('3','Sausilito','OR','503-805-3764');

	INSERT INTO tbl_Address(address_city,address_state,address_phone)
	VALUES ('Sausilito','CA','5038053764');

SELECT * FROM tbl_Contact;
SELECT * FROM tbl_Address;
SELECT * FROM tbl_Orders;

--*****QUERY*****

SELECT tbl_Contact.Contact_fname AS [Customer first name:], tbl_contact.Contact_Lname AS [Customer last name:], tbl_Address.address_phone [Customer phone:],tbl_Orders.order_model AS [Model purchased:], tbl_Orders.order_year AS [Model year:]
FROM tbl_Contact
INNER JOIN tbl_Address ON tbl_Address.address_ID=tbl_Contact.Contact_ID
INNER JOIN tbl_orders on tbl_orders.orders_ID =tbl_contact.Contact_ID
WHERE tbl_Contact.contact_fname= @contact OR tbl_Orders.order_model=@model;

--******CREATE PROCEDURE*****

CREATE PROCEDURE dbo.upsGetCustomer @ContactFirstName VARCHAR (20)=Null, @Model VARCHAR (20)
AS
SELECT tbl_Contact.Contact_fname AS [Customer first name:], tbl_contact.Contact_Lname AS [Customer last name:], tbl_Address.address_phone [Customer phone:],tbl_Orders.order_model AS [Model purchased:], tbl_Orders.order_year AS [Model year:]
FROM tbl_Contact
INNER JOIN tbl_Address ON tbl_Address.address_ID=tbl_Contact.Contact_ID
INNER JOIN tbl_orders on tbl_orders.orders_ID =tbl_contact.Contact_ID
WHERE tbl_Contact.contact_fname= @contactFirstName OR tbl_Orders.order_model=@model;
GO 

EXEC [dbo].[upsGetCustomer] @model = 'ford', @ContactFirstName = 'William'