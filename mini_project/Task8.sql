USE WSDA_Music;
 
SELECT * 
FROM Invoice
LIMIT 5;
SELECT 
BillingCountry,
BillingCity,
ROUND(AVG(Total),2) AS AvgByCity
FROM 
Invoice
GROUP BY 
BillingCountry,
BillingCity
ORDER By
BillingCountry;