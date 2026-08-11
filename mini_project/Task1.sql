-- WSDA ANALYSIS

SHOW DATABASES;

USE WSDAMusic;

SHOW TABLES;

SELECT * 
FROM tracks
LIMIT 5;

/* This query generates a report listing track names alongside thier unit prices.
*/
SELECT
t.Name AS 'Track Name',
t.UnitPrice AS Price
FROM tracks AS t
ORDER BY t.Name
LIMIT 20;
