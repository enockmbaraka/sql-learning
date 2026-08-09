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
-- Total Quantity Sold Per Product Using Subquery in FROM Clause
-- ===============================================

-- Key Takeaways:
-- - Subquery in FROM clause calculates total quantity per product.
-- - Treats subquery result as a temporary table for main query.

SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    SQ.TotalQuantitySold
FROM Products P
JOIN (
    SELECT ProductID, SUM(Quantity) AS TotalQuantitySold
    FROM Sales
    GROUP BY ProductID
) AS SQ ON P.ProductID = SQ.ProductID;

-- ===============================================
-- Sales Summary by Category Using Subquery in FROM Clause
-- ===============================================

-- Key Takeaways:
-- - Subquery aggregates sales data grouped by product.
-- - Main query joins with Products to summarize by category.

SELECT 
    P.Category,
    SUM(SQ.TotalQuantitySold) AS TotalQuantitySold,
    SUM(SQ.TotalRevenue) AS TotalRevenue
FROM Products P
JOIN (
    SELECT S.ProductID, SUM(S.Quantity) AS TotalQuantitySold, SUM(S.Quantity * P.Price) AS TotalRevenue
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
    GROUP BY S.ProductID
) AS SQ ON P.ProductID = SQ.ProductID
GROUP BY P.Category;

-- ===============================================
-- Total Sales and Average Sales per Product Using Subquery in FROM Clause
-- ===============================================

-- Key Takeaways:
-- - Subquery calculates total and average sales per product.
-- - Demonstrates organizing complex calculations in FROM clause.

SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    SA.TotalSales,
    SA.AverageSales
FROM Products P
JOIN (
    SELECT S.ProductID, SUM(S.Quantity * P.Price) AS TotalSales, AVG(S.Quantity * P.Price) AS AverageSales
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
    GROUP BY S.ProductID
) AS SA ON P.ProductID = SA.ProductID;

-- Clean up the database
DROP DATABASE SalesAnalytics;
