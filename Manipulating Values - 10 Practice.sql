SELECT

    SalesOrderNumber AS InvoiceNumber, 
    SalesOrderLineNumber AS InvoiceLineNumber, 
    SalesAmount AS SalesAmount, 
    TaxAmt AS TaxAmount
 
FROM FactInternetSales
 
WHERE DATENAME(month,OrderDate) = N'December' AND SalesTerritoryKey = 1