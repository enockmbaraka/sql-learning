USE WSDAMusic;
 
SELECT * 
FROM invoices
LIMIT 5;
SELECT 
BillingCity,
ROUND(AVG(Total),2) AS AvgByCity
FROM 
invoices
GROUP BY BillingCity
HAVING AVG(Total) > 5
ORDER By BillingCity;
