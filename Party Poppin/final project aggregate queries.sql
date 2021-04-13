/*
USE myFictionalBusiness;
SELECT ZipCode.State, COUNT(DISTINCT Customers.CustomerID) AS [Customers per State]
FROM Customers JOIN ZipCode ON Customers.ZipCode = ZipCode.ZipCode
GROUP BY ZipCode.State
ORDER BY ZipCode.State ASC; 

Select ZipCode.City, COUNT(Sales.OrderID) AS [Numer of Orders]
FROM Customers JOIN ZipCode ON ZipCode.ZipCode=Customers.ZipCode
JOIN Sales ON Customers.CustomerID=Sales.CustomerID
GROUP by ZipCode.City
ORDER by ZipCode.City;

SELECT MIN(SaleDetail.QTY) AS [Minimum Quanitity Ordered],
	   MAX(SaleDetail.QTY) AS [Maximim Quanitity Ordered],
	   AVG(SaleDetail.QTY) AS [Average Quanitity Ordered]
	   FROM SaleDetail;


This one doesn's really make sense. I'm thinking my data table is just really really small and it's 
hard to make meaningful reports. I Couldnt quite figure out how to join it in a way that wouldn't repeat.
It should have added the duplicate colors /size items into the same total. Or at least that is what I was going for. 

Select  COUNT(SaleDetail.QTY) AS [Total Items Ordered], Inventory.Size, Inventory.Color,
		SUM(SaleDetail.QTY)*Inventory.SalePrice AS [Total Price]
FROM SaleDetail JOIN Inventory ON  SaleDetail.ProductID =Inventory.ProductID 
GROUP BY Inventory.Size, Inventory.Color, SaleDetail.QTY , Inventory.SalePrice*/



