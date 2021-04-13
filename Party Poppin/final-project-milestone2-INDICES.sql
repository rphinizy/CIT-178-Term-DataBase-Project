
USE myFictionalBusiness; 
GO
CREATE INDEX idx_ZipCode ON Customers(ZipCode)
GO
CREATE INDEX idx_SupplierID ON Inventory(SupplierID)
GO
CREATE INDEX idx_OrderID ON SaleDetail(OrderID)
GO
CREATE INDEX idx_ProductID ON SaleDetail(ProductID)
GO
CREATE INDEX idx_CustomerID ON Sales(CustomerID)
