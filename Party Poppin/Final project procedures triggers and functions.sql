
/* Final Project Procedures */

/*

USE myFictionalBusiness;
GO
CREATE PROC spCustomers
AS
SELECT * FROM Customers
ORDER BY ZipCode;
GO

EXEC spCustomers;


USE myFictionalBusiness;
GO
CREATE PROC spGetCustomer
	@CustomerID int
AS
BEGIN
	SELECT * FROM Customers
	WHERE CustomerID = @CustomerID;
END
GO
EXEC spGetCustomer 2



USE myFictionalBusiness;
GO
CREATE PROC spSupplierInfo
	@SupplierID int,
	@Name nvarchar(100) OUTPUT
	
AS
SELECT @Name = Name
FROM Suppliers 
WHERE SupplierID = @SupplierID;
GO
-- Run the procedure
DECLARE @Name nvarchar(100);

EXEC spSupplierInfo 4, @Name OUTPUT;
SELECT @Name AS 'Supplier Name';


USE myFictionalBusiness;
GO
CREATE PROC spProductCount
AS
DECLARE @ProductCount int;
SELECT @ProductCount = COUNT(*)
FROM Inventory 
RETURN @ProductCount;
GO

DECLARE @ProductCount int;
EXEC @ProductCount = spProductCount;
PRINT 'There are ' + CONVERT(varchar, @ProductCount) + ' products in your inventory';
GO


/* Final Project User Defined Functions */

USE myFictionalBusiness;
GO

CREATE FUNCTION fnProfits ()
			RETURNS money
	BEGIN
		RETURN (SELECT SUM(PurchasePrice -SalePrice)
		FROM Inventory
		WHERE PurchasePrice - SalePrice > 0);
END;


USE myFictionalBusiness;
GO
CREATE FUNCTION fnClientCompanies
	(@ClientCompanies nvarchar(100) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Customers WHERE CompanyName LIKE @ClientCompanies);
GO

SELECT * FROM dbo.fnClientCompanies('%B%');



 /* Final Project Triggers */

  USE myFictionalBusiness;
 GO
 SELECT * INTO CustomerTransaction
 FROM Customers
 WHERE 1=0;
 

 ALTER TABLE CustomerTransaction
 ADD Activity varchar(50);
 GO

CREATE TRIGGER CustomerTransaction_INSERT ON Customers
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Name nvarchar(100)
	DECLARE @CompanyName nvarchar(100)
	DECLARE @Address nvarchar(200)
	DECLARE @ZipCode nvarchar(20)

    SELECT @CustomerID =INSERTED.CustomerID, @Name = INSERTED.[Name], @CompanyName = INSERTED.CompanyName,
	@Address = INSERTED.[Address], @ZipCode = INSERTED.ZipCode
	FROM INSERTED

    INSERT INTO CustomerTransaction VALUES(@CustomerID,@Name, @CompanyName,@Address, @ZipCode, 'Inserted' )
END
GO

INSERT INTO Customers VALUES(6,'Old Squeaky MacTwisty','Will Work For Food','86 Never Come Back ave','10001');
GO



SELECT * FROM Customers;
GO


 CREATE TRIGGER CustomerTransaction_DELETE ON Customers
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Name nvarchar(100)
	DECLARE @CompanyName nvarchar(100)
	DECLARE @Address nvarchar(200)
	DECLARE @ZipCode nvarchar(20)

     SELECT @CustomerID =DELETED.CustomerID, @Name = DELETED.[Name], @CompanyName = DELETED.CompanyName,
	@Address = DELETED.[Address], @ZipCode = DELETED.ZipCode
	FROM DELETED

    INSERT INTO CustomerTransaction VALUES(@CustomerID,@Name, @CompanyName,@Address, @ZipCode, 'Deleted' )
END

GO


DELETE FROM Customers WHERE CustomerID = 6;

GO


SELECT * FROM CustomerTransaction;


 CREATE TRIGGER CustomerTransaction_UPDATE ON Customers
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Name nvarchar(100)
	DECLARE @CompanyName nvarchar(100)
	DECLARE @Address nvarchar(200)
	DECLARE @ZipCode nvarchar(20)

     SELECT @CustomerID =INSERTED.CustomerID, @Name = INSERTED.[Name], @CompanyName = INSERTED.CompanyName,
	@Address = INSERTED.[Address], @ZipCode = INSERTED.ZipCode
	FROM INSERTED

    INSERT INTO CustomerTransaction VALUES(@CustomerID,@Name, @CompanyName,@Address, @ZipCode, 'Updated' )
END
GO
INSERT INTO Customers VALUES(6,'Old Squeaky MacTwisty','Will Work For Food','86 Never Come Back ave','10001');
GO
UPDATE Customers 
SET Name='Clown'
WHERE CustomerID=6;
GO

SELECT * FROM CustomerTransaction;

*/

