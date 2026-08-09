USE WSDA_Music;
 
SELECT * 
FROM Invoice
LIMIT 5;
SELECT 
BillingCity,
ROUND(AVG(Total),2) AS AvgByCity
FROM 
Invoice
GROUP BY BillingCity
HAVING AVG(Total) > 5
ORDER By BillingCity;