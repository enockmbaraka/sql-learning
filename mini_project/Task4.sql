USE WSDAMusic;
SHOW TABLES;
 
SELECT * 
FROM invoices
LIMIT 5;
 
SELECT 
BillingCity, 
ROUND(AVG(Total),2) AS AvgByCity
FROM invoices
GROUP BY 
BillingCity
ORDER BY BillingCity;
