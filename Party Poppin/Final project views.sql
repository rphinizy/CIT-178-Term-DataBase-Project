
/* Final Project Views */

/*USE myFictionalBusiness;
GO

--Updatable view;
CREATE VIEW VI_sales
AS
SELECT Customers.CustomerID, [Name], CompanyName, OrderID, [Date]
FROM Customers
JOIN Sales ON Customers.CustomerID = Sales.CustomerID;
GO 

CREATE VIEW VI_cust_states
AS
SELECT [Name], CompanyName, Customers.ZipCode, [State]
FROM Customers
JOIN ZipCode ON Customers.ZipCode = ZipCode.ZipCode


USE myFictionalBusiness;
GO
CREATE VIEW VI_invSUP
AS
SELECT ProductID, Size, Color, UnitQTY, PurchasePrice, Suppliers.[Name]
FROM Inventory
JOIN Suppliers ON Inventory.SupplierID = Suppliers.SupplierID
WITH CHECK OPTION;
GO

SELECT * FROM VI_sales;

CREATE VIEW VI_sales_VW_plus_details
AS
SELECT [Name], CompanyName, [Date], SaleDetail.ProductID, SaleDetail.QTY
FROM VI_sales
JOIN SaleDetail ON VI_sales.OrderID = SaleDetail.OrderID
GO

SELECT * FROM VI_sales_VW_plus_details;

USE myFictionalBusiness;
GO
UPDATE VI_sales
SET [Date]=GETDATE()
WHERE OrderID = 5; 

SELECT * FROM VI_sales;*/

