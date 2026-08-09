-- WSDA ANALYSIS

SHOW DATABASES;

USE WSDA_Music;

SHOW TABLES;

SELECT * 
FROM Track
LIMIT 5;

/* This query generates a report listing track names alongside thier unit prices.
*/
SELECT
t.Name AS 'Track Name',
t.UnitPrice AS Price
FROM Track AS t
ORDER BY t.Name
LIMIT 20;