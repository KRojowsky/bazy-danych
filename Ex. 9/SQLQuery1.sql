USE AdventureWorks2019 
GO

BEGIN TRANSACTION
  UPDATE Production.Product SET ListPrice = ListPrice*1.1
  WHERE ProductID = 680;
  COMMIT;

  SELECT * FROM [AdventureWorks2019].[Production].[Product] WHERE ProductID = 680;