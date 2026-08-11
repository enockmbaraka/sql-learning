USE WSDAMusic;

/* This query calculates the average spending amount of customers in each city */

SELECT
BillingCity AS City,
ROUND(AVG(Total),2) AS AverageSpending
FROM invoices
GROUP BY
BillingCity
ORDER BY City;
