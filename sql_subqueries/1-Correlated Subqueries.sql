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
    (4, 'Mike Brown', 'Houston');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotal)
VALUES 
    (1, 1, '2023-08-01', 250.00),
    (2, 1, '2023-08-10', 150.00),
    (3, 2, '2023-08-05', 400.00),
    (4, 2, '2023-09-12', 350.00),
    (5, 3, '2023-09-10', 600.00),
    (6, 4, '2023-09-15', 700.00);

-- ===============================================
-- Total Number of Orders Alongside Each Customer
-- ===============================================

-- Key Takeaways:
-- - Non-correlated subquery displays total orders alongside each customer.
-- - Subquery runs once; same value for all rows.

SELECT 
    CustomerID, 
    CustomerName, 
    City,
    (SELECT COUNT(*) FROM Orders) AS TotalNumberOfOrders
FROM Customers;

-- ===============================================
-- Number of Orders per Customer
-- ===============================================

-- Key Takeaways:
-- - Correlated subquery counts orders per customer using COUNT.
-- - Subquery references outer query's CustomerID; demonstrates difference from non-correlated subquery.

SELECT 
    C.CustomerID, 
    C.CustomerName, 
    C.City,
    (SELECT COUNT(*)
     FROM Orders O
     WHERE O.CustomerID = C.CustomerID) AS NumberOfOrders
FROM Customers C;

-- Clean up the database
DROP DATABASE SalesDemo;







































