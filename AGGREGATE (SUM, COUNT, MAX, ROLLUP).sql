SELECT 
    ISNULL([Sales Territory], 'Total') AS SalesTerritory,
    SUM([Latest Recorded Population]) AS TotalPopulation,
    COUNT([WWI City ID]) AS NumOfCities,
    MAX([Latest Recorded Population]) HighestPopulation
	
FROM dimCity

WHERE City != 'Unknown'
GROUP BY ROLLUP ([Sales Territory])
ORDER BY [TotalPopulation] DESC

--ISNULL() transforms the 'Unknown' first entry into a 'Total' entry