USE AdventureWorks2019 
GO

BEGIN TRANSACTION;
INSERT INTO Production.Product (Name, ProductNumber, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
VALUES ('Helmet', 'HK-Y56N-98', 'Red', 100, 75, 10.00, 20.00, 1, '2011-05-31 00:00:00.000');
COMMIT TRANSACTION;

SELECT * FROM [AdventureWorks2019].[Production].[Product] WHERE ProductNumber = 'HK-Y56N-98';
