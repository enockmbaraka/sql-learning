/*====================================================
  FULL JOIN / FULL OUTER JOIN
====================================================*/

USE kasongo;

-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers 
VALUES
(1,'Alice','alice@example.com'),
(2,'Bob','bob@example.com'),
(3,'Charlie','charlie@example.com'),
(4,'David','david@example.com');

INSERT INTO orders
VALUES
(1,3,'2024-05-01',150.00),
(2,2,'2024-05-02',200.00),
(3,1,'2024-05-03',100.00),
(4,5,'2024-05-04',80.00);

SELECT
c.name,
o.id AS order_id,
o.order_date,
o.total_amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

UNION

SELECT
c.name,
o.id AS order_id,
o.order_date,
o.total_amount
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;

SELECT * FROM customers;
SELECT * FROM orders;