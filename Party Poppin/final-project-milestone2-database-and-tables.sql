CREATE DATABASE myFictionalBusiness;

GO
USE myFictionalBusiness; 
CREATE TABLE Inventory(
ProductID int NOT NULL,
SupplierID int NOT NULL,
Size varchar(20),
UnitQTY int NOT NULL,
Color varchar(50),
PurchasePrice money,
SalePrice money,
PRIMARY KEY(ProductID),
);

GO
CREATE TABLE Suppliers(
SupplierID int NOT NULL,
Name varchar(100),
PRIMARY KEY(SupplierID)
);

GO
CREATE TABLE Customers(
CustomerID int NOT NULL,
Name varchar (100) NOT NULL, 
CompanyName varchar(100),
Address varchar(200) NOT NULL, 
ZipCode varchar (50) NOT NULL,
PRIMARY KEY(CustomerID)
);

GO
CREATE TABLE ZipCode(
ZipCode varchar (50) NOT NULL, 
City Varchar (100) NOT NULL,
State Varchar (2) NOT NULL,
PRIMARY KEY(ZipCode)
);

GO
CREATE TABLE Sales(
OrderID int NOT NULL,
Date datetime,
CustomerID int NOT NULL,
PRIMARY KEY (OrderID)
);

GO
CREATE TABLE SaleDetail(
ID int NOT NULL,
OrderID int NOT NULL,
ProductID int NOT NULL,
QTY int NOT NULL, 
PRIMARY KEY (ID)
);

