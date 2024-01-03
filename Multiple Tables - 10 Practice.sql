SELECT 
 
    CONCAT(de.FirstName, ' ', de.LastName) AS EmployeeName,
    de.Title AS EmployeeTitle,
    dcy.CurrencyName AS Currency,
    SUM(fs.SalesAmount) AS TotalSalesAmount
 
FROM FactResellerSales AS fs
    JOIN DimEmployee AS de
    ON fs.EmployeeKey=de.EmployeeKey
    JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey=dst.SalesTerritoryKey
    JOIN DimCurrency AS dcy
    ON fs.CurrencyKey=dcy.CurrencyKey
 
WHERE dst.SalesTerritoryGroup =N'Europe'
AND de.[Status] =N'Current'
 
GROUP BY de.FirstName, de.LastName, de.Title, dcy.CurrencyName
 
ORDER BY EmployeeName, TotalSalesAmount DESC