USE WSDA_Music;

/* This query calculates the average spending amount of customers in each city */

SELECT
BillingCity AS City,
ROUND(AVG(Total),2) AS AverageSpending
FROM Invoice
GROUP BY
BillingCity
ORDER BY City;