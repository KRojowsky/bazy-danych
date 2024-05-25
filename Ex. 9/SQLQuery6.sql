USE AdventureWorks2019 
GO

BEGIN TRANSACTION;

UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty - 1;

DECLARE @zero INT;
SELECT @zero = COUNT(*) FROM Sales.SalesOrderDetail WHERE OrderQty = 0;

IF @zero > 0
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcje anulowano, poniewaz OrderQty = 0.';
END
ELSE
BEGIN
    COMMIT;
    PRINT 'Transakcja wykonana.';
END


SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0;