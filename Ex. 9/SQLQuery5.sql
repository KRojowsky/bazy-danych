USE AdventureWorks2019 
GO

BEGIN TRANSACTION;
	DECLARE @temp INT;
	DECLARE @pnumb VARCHAR(20) = 'HK-Y56N-98' 
	SELECT @temp = COUNT(*) FROM Production.Product WHERE ProductNumber = @pnumb; 
	IF @temp = 0
	BEGIN
		INSERT INTO Production.Product (Name, ProductNumber, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
		VALUES ('Helmet', @pnumb, 'Red', 100, 75, 10.00, 20.00, 1, '2011-05-31 00:00:00.000');
		COMMIT;
	END
	ELSE
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'Produkt nie zostal dodany, poniewaz taki ProductNumber jest juz w bazie.'
	END