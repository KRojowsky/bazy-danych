USE AdventureWorks2019 
GO

BEGIN TRANSACTION;
	DECLARE @avgcost DECIMAL (8, 2)
	DECLARE @del INT;
	SELECT @avgcost = AVG(StandardCost) FROM Production.Product;
	SELECT @del = COUNT(*) FROM Production.Product WHERE StandardCost > @avgcost; 
	IF @del <= 10
	BEGIN
		DELETE Production.Product WHERE StandardCost > @avgcost;
		COMMIT;
		PRINT 'Tarnsakcja wykonana. Produkty zostaly usuniete.';
	END
	ELSE
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'Transakcja anulowana. Liczba produktow do usuniecia wynosi: '+ CAST(@del AS VARCHAR(10));
	END