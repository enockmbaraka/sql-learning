USE WSDA_Music;
SHOW TABLES;
 
SELECT * 
FROM Invoice
LIMIT 5;
 
SELECT 
BillingCity, 
ROUND(AVG(Total),2) AS AvgByCity
FROM Invoice
GROUP BY 
BillingCity
ORDER BY BillingCity;