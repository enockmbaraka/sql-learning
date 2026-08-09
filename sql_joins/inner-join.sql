/*====================================================
  INNER JOIN
====================================================*/

-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS departments;
CREATE DATABASE IF NOT EXISTS kasongo;
USE kasongo;
-- Create departments table
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Insert data into departments
INSERT INTO departments
VALUES
(1,'HR'),
(2,'Finance'),
(3,'IT'),
(4,'Marketing');

-- Insert data into employees
INSERT INTO employees
VALUES
(1,'Alice',1),
(2,'Bob',2),
(3,'Charlie',3);

SELECT * FROM departments;
SELECT * FROM employees;

-- INNER JOIN
SELECT
employees.name,
departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;

SELECT * FROM departments;
SELECT * FROM employees;
-- Recommended Approach
SELECT 
e.name,
d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.id;


