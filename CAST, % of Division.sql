SELECT COUNT(Employee) AS NumberOfSalesmen
FROM dimEmployee
WHERE [Employee] != 'Unknown'

SELECT
    CAST(
        CAST(
            COUNT(employee) AS decimal(8, 2))*100 /
                    (SELECT COUNT(Employee)
                    FROM dimEmployee
                    WHERE [Employee] != 'Unknown') AS decimal (8, 4)) AS SalesPeoplePctOfTotal

FROM dimEmployee

WHERE Employee != 'Unknown' AND [Is Salesperson] = 1

--By order of operations, we look at the WHERE statement first. Then the first select clause, which is COUNT. Now, we already have all the employees that
--are indeed salesmen. We divide it by the total number, which is captured via an internal SELECT statement mentioned at the top.
--Outer CAST grants us the ability to round, combined with a *100 multiplier, gives us the exact percentage
--In SQL, when you divide an interger by an interger, the result is always 0. the inner CAST allows the equation to function properly by
--turning one of the intergers into a decimal