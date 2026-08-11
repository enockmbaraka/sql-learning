USE WSDAMusic;
 
SELECT * 
FROM invoices
LIMIT 5;
SELECT 
BillingCountry,
BillingCity,
ROUND(AVG(Total),2) AS AvgByCity
FROM 
invoices
GROUP BY 
BillingCountry,
BillingCity
ORDER By
BillingCountry;
