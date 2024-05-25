USE AdventureWorks2019 
GO

  BEGIN TRANSACTION;
	  UPDATE Production.Product SET StandardCost = StandardCost*1.1;
	  DECLARE @suma DECIMAL(10, 2);
	  SELECT @suma = SUM(StandardCost) FROM Production.Product;
	  IF @suma <= 50000 
		  BEGIN
			COMMIT;
		  END
	  ELSE 
		  BEGIN
			  ROLLBACK TRANSACTION;
			  PRINT 'Transakcja odrzucona';
		  END