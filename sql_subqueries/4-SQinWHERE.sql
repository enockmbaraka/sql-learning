-- Create the database
CREATE DATABASE SalesDemo;
USE SalesDemo;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderTotal DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES 
    (1, 'John Doe', 'New York'),
    (2, 'Jane Smith', 'Los Angeles'),
    (3, 'Alice Johnson', 'Chicago'),
    (4, 'Mike Brown', 'Houston'),
    (5, 'Emma Davis', 'Phoenix'),
    (6, 'David Wilson', 'New York');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotal)
VALUES 
    (1, 1, '2023-08-01', 2500.00),
    (2, 1, '2023-08-10', 1500.00),
    (3, 2, '2023-08-05', 4000.00),
    (4, 2, '2023-09-12', 3500.00),
    (5, 3, '2023-09-10', 6000.00),
    (6, 4, '2023-09-15', 7000.00),
    (7, 5, '2023-10-01', 2000.00),
    (8, 5, '2023-10-05', 3000.00),
    (9, 6, '2023-08-15', 4500.00);

-- ===============================================
-- Orders with Amount Above Average
-- ===============================================

-- Key Takeaways:
-- - Subquery in WHERE clause calculates average order total.
-- - Filters orders where OrderTotal exceeds the average.

SELECT 
    OrderID,
    CustomerID,
    OrderDate,
    OrderTotal
FROM 
    Orders
WHERE 
    OrderTotal > (SELECT AVG(OrderTotal) FROM Orders);

-- ===============================================
-- Orders Exceeding Customer's Average by 20%
-- ===============================================

-- Key Takeaways:
-- - Subquery in WHERE clause calculates average order total per customer.
-- - Filters orders exceeding customer's average by 20%.

SELECT 
    O.OrderID,
    O.CustomerID,
    O.OrderDate,
    O.OrderTotal
FROM 
    Orders O
WHERE 
    O.OrderTotal > (
        SELECT AVG(O2.OrderTotal) * 1.2
        FROM Orders O2
        WHERE O2.CustomerID = O.CustomerID
    );

-- ===============================================
-- Customers Whose Total Orders Exceed Overall Average
-- ===============================================

-- Key Takeaways:
-- - Subquery in WHERE clause calculates overall average total orders per customer.
-- - Filters customers whose total order amount exceeds this average.

SELECT 
    C.CustomerID,
    C.CustomerName,
    C.City
FROM 
    Customers C
WHERE 
    (SELECT SUM(O.OrderTotal) 
     FROM Orders O 
     WHERE O.CustomerID = C.CustomerID) > (
        SELECT AVG(TotalOrders) FROM (
            SELECT CustomerID, SUM(OrderTotal) AS TotalOrders
            FROM Orders
            GROUP BY CustomerID
        ) AS CustomerTotals
    );

-- Clean up the database
DROP DATABASE SalesDemo;
