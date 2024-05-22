USE AdventureWorks2019 
GO

WITH EmployeeInfo AS (
  SELECT e.BusinessEntityID, p.FirstName, p.LastName, h.Rate
  FROM HumanResources.EmployeePayHistory AS h
  INNER JOIN HumanResources.Employee AS e ON h.BusinessEntityID = e.BusinessEntityID
  INNER JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
)
SELECT *
INTO TempEmployeeInfo
FROM EmployeeInfo;

SELECT * FROM TempEmployeeInfo;