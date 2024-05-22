USE AdventureWorksLT2019 
GO

WITH Przychody AS (SELECT c.CompanyName AS CompanyContact, h.TotalDue AS Revenue
  FROM SalesLT.Customer AS c
  INNER JOIN SalesLT.SalesOrderHeader AS h ON c.CustomerID = h.CustomerID
)
SELECT * FROM Przychody
ORDER BY CompanyContact;