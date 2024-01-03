SELECT TOP(5)

    dpsc.EnglishProductSubcategoryName AS SubCategory,
    SUM(fs.SalesAmount) AS SalesAmount
 
FROM FactInternetSales AS fs
    JOIN DimProduct AS dp
    ON fs.ProductKey=dp.ProductKey
    JOIN DimProductSubcategory AS dpsc
    ON dp.ProductSubcategoryKey=dpsc.ProductSubcategoryKey
    JOIN DimCurrency AS dcy
    ON fs.CurrencyKey=dcy.CurrencyKey
    JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey=dst.SalesTerritoryKey
 
WHERE dst.SalesTerritoryCountry =N'United States'
AND dcy.CurrencyName=N'US Dollar'
 
GROUP BY dpsc.EnglishProductSubcategoryName
 
ORDER BY SalesAmount DESC