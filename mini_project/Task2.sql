USE WSDA_Music;

SELECT *
FROM Customer
LIMIT 5;

SELECT *
FROM Employee
LIMIT 5;

/* This query generates report that lists each customer along with their assigned support representative.
*/
SELECT
c.FirstName AS CustomerFirstName,
c.LastName AS CustomerLastName,
e.FirstName AS SupportRepFirstName,
e.LastName AS SupportRepLastName
FROM Customer AS c
JOIN Employee AS e
ON c.SupportRepId = e.EmployeeId
ORDER BY e.LastName, c.LastName;
