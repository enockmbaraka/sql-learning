/*====================================================
  CROSS JOIN
====================================================*/
USE kasongo;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO customers
VALUES
(1,'Alice','alice@example.com'),
(2,'Bob','bob@example.com'),
(3,'Charlie','charlie@example.com'),
(4,'David','david@example.com');

INSERT INTO products
VALUES
(1,'Laptop',150.00),
(2,'Mouse',200.00),
(3,'Keyboard',100.00),
(4,'Speaker',80.00);

SELECT * FROM customers;
SELECT * FROM products;

SELECT
c.name AS customer_name,
p.name AS product_name,
p.amount
FROM customers AS c
CROSS JOIN products AS p;
