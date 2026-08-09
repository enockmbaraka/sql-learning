-- Create the database
CREATE DATABASE SalesAnalytics;
USE SalesAnalytics;

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Create the Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Desk Chair', 'Furniture', 150.00),
(4, 'Coffee Table', 'Furniture', 200.00),
(5, 'Headphones', 'Electronics', 150.00);

-- Insert sample data into Sales table
INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity)
VALUES 
(1, 1, '2023-08-01', 5),
(2, 2, '2023-08-03', 10),
(3, 1, '2023-08-10', 3),
(4, 3, '2023-09-01', 7),
(5, 4, '2023-09-15', 4),
(6, 2, '2023-09-20', 6),
(7, 5, '2023-10-05', 15),
(8, 5, '2023-10-10', 10);

-- ===============================================
-- Total Quantity Sold Per Product
-- ===============================================

-- Key Takeaways:
-- - Correlated subquery in SELECT computes total quantity per product using SUM.
-- - Enables comparative analysis by calculating totals specific to each product.

SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    (SELECT SUM(S.Quantity)
     FROM Sales S
     WHERE S.ProductID = P.ProductID) AS TotalQuantitySold
FROM Products P;

-- ===============================================
-- Total Revenue Per Product
-- ===============================================

-- Key Takeaways:
-- - Correlated subquery calculates total revenue per product with SUM and multiplication.
-- - Combines outer query and subquery data; essential for financial analysis.

SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    (SELECT SUM(S.Quantity * P.Price)
     FROM Sales S
     WHERE S.ProductID = P.ProductID) AS TotalRevenue
FROM Products P;

-- ===============================================
-- Percentage of Total Sales for Each Product
-- ===============================================

-- Key Takeaways:
-- - Nested subqueries calculate each product's percentage of total sales.
-- - Combines correlated and non-correlated subqueries; demonstrates arithmetic operations.

SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    -- Total quantity sold per product
    (SELECT SUM(S.Quantity)
     FROM Sales S
     WHERE S.ProductID = P.ProductID) AS TotalQuantitySold,
    -- Percentage of total sales
    ((SELECT SUM(S.Quantity)
      FROM Sales S
      WHERE S.ProductID = P.ProductID) * 100.0 /
     (SELECT SUM(S2.Quantity)
      FROM Sales S2)) AS PercentageOfTotalSales
FROM Products P;

-- ===============================================
-- Rank Products Based on Total Revenue
-- ===============================================

-- Key Takeaways:
-- - Correlated subqueries rank products by total revenue.
-- - Implements comparative analysis; complexity may impact performance.

SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    -- Total revenue per product
    (SELECT SUM(S.Quantity * P.Price)
     FROM Sales S
     WHERE S.ProductID = P.ProductID) AS TotalRevenue,
    -- Rank based on revenue
    (SELECT COUNT(DISTINCT P2.ProductID)
     FROM Products P2
     WHERE (SELECT SUM(S2.Quantity * P2.Price)
            FROM Sales S2
            WHERE S2.ProductID = P2.ProductID) >=
           (SELECT SUM(S.Quantity * P.Price)
            FROM Sales S
            WHERE S.ProductID = P.ProductID)) AS RevenueRank
FROM Products P
ORDER BY TotalRevenue DESC;

-- Clean up the database
DROP DATABASE SalesAnalytics;





























