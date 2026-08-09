/*====================================================
  LEFT JOIN / LEFT OUTER JOIN
====================================================*/

-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
USE kasongo;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers
VALUES
(1,'Alice','alice@example.com'),
(2,'Bob','bob@example.com'),
(3,'Charlie','charlie@example.com'),
(4,'David','david@example.com');

INSERT INTO orders
VALUES
(1,1,'Laptop',1),
(2,2,'Smartphone',2),
(3,1,'Headphones',1),
(4,3,'Tablet',1);

SELECT * FROM customers;
SELECT * FROM orders;

SELECT
customers.name,
orders.id AS order_id,
orders.product,
orders.quantity
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

SELECT * FROM customers; -- left
SELECT * FROM orders; -- right
-- Recommended Approach
SELECT
c.name,
o.id AS order_id,
o.product,
o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

-- RIGHT JOIN
SELECT
c.name,
o.id AS order_id,
o.product,
o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;


