USE AdventureWorks2019 
GO

BEGIN TRANSACTION;
BEGIN TRY
    DELETE Production.Product WHERE ProductID = 707;
    COMMIT TRANSACTION;
	PRINT 'Produkt zostal usuniety.'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transakcje wycofano.';
END CATCH;