-- Create the database
CREATE DATABASE IF NOT EXISTS KwetuFirm;
USE KwetuFirm;

-- Create table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender CHAR(1),
    age INT,
    department VARCHAR(30),
    job_title VARCHAR(40),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    city VARCHAR(30),
    hire_date DATE,
    email VARCHAR(60),
    phone VARCHAR(20),
    performance_rating INT
);

-- Populate the table
INSERT INTO employees
(first_name,last_name,gender,age,department,job_title,salary,bonus,city,hire_date,email,phone,performance_rating)
VALUES

('John','Kamau','M',28,'IT','Data Analyst',85000,10000,'Nairobi','2022-01-15','john@gmail.com','0711111111',5),

('Mary','Atieno','F',35,'Finance','Accountant',95000,15000,'Kisumu','2020-04-20','mary@gmail.com','0722222222',4),

('James','Otieno','M',42,'HR','HR Manager',120000,20000,'Nairobi','2018-07-11','james@gmail.com','0733333333',5),

('Faith','Wanjiku','F',25,'IT','Software Developer',98000,12000,'Nakuru','2023-05-12','faith@gmail.com','0744444444',4),

('Brian','Mutua','M',31,'Sales','Sales Executive',65000,8000,'Mombasa','2021-10-10','brian@gmail.com','0755555555',3),

('Susan','Akinyi','F',27,'Finance','Financial Analyst',89000,9000,'Kisumu','2022-08-09','susan@gmail.com','0766666666',4),

('David','Mwangi','M',38,'IT','Database Administrator',115000,18000,'Nairobi','2019-03-18','david@gmail.com','0777777777',5),

('Peter','Kibet','M',45,'Management','General Manager',250000,50000,'Nairobi','2015-02-25','peter@gmail.com','0788888888',5),

('Mercy','Chebet','F',24,'Sales','Sales Executive',58000,5000,'Eldoret','2024-01-08',NULL,NULL,3),

('Kevin','Njoroge','M',29,'IT','Network Engineer',92000,11000,'Nairobi','2021-06-14','kevin@gmail.com','0799999999',4),

('Alice','Muthoni','F',33,'Finance','Auditor',105000,14000,'Nakuru','2019-11-01','alice@gmail.com','0712121212',5),

('Daniel','Musyoka','M',26,'Marketing','Marketing Officer',70000,6000,'Machakos','2023-03-30','daniel@gmail.com','0723232323',3),

('Grace','Nyambura','F',30,'IT','System Administrator',98000,12000,'Nairobi','2020-09-17','grace@gmail.com','0734343434',4),

('Victor','Ouma','M',37,'HR','Recruitment Officer',83000,9000,'Kisumu','2021-02-12','victor@gmail.com','0745454545',4),

('Lydia','Chepkorir','F',40,'Management','Operations Manager',180000,30000,'Nairobi','2017-05-22','lydia@gmail.com','0756565656',5);

SELECT * FROM employees
LIMIT 10;

/* Arithmetic Operators */
-- Addition
SELECT first_name,
salary,
bonus,
salary + bonus AS total_income
FROM employees;

-- Subtraction
SELECT first_name,
salary,
salary - 5000 AS net_income
FROM employees;

-- multiplication
SELECT first_name,
salary,
salary * 12 AS annual_salary
FROM employees;

-- Division
SELECT first_name,
salary,
salary / 12 AS monthly_salary
FROM employees;

-- Modulus(remainder)
SELECT employee_id,
employee_id % 2 AS remainder
FROM employees;

/* Comparison Operators */
-- Equal
SELECT *
FROM employees
WHERE department = "IT";

-- Greater Than
SELECT *
FROM employees
WHERE salary > 100000;

/* Logical Operators */
-- AND
SELECT *
FROM employees
WHERE department = "IT"
AND salary > 90000;

-- OR
SELECT * 
FROM employees
WHERE city = "Nairobi"
OR city = "Kisumu";

-- NOT
SELECT *
FROM employees
WHERE NOT department = "Finance";

-- BETWEEN
SELECT *
FROM employees
WHERE salary BETWEEN 80000 AND 120000;

-- IN
SELECT *
FROM employees
WHERE department IN("IT", "Finance", "HR");

-- Clauses
-- ORDER BY
SELECT *
FROM employees
ORDER BY salary;

SELECT *
FROM employees
ORDER BY salary DESC;

SELECT *
FROM employees
ORDER BY department, salary DESC;

-- GROUP BY
SELECT department,
COUNT(*) AS employees
FROM employees
GROUP BY department;

SELECT * 
FROM employees;

SELECT city,
AVG(salary)
FROM employees
GROUP BY city;

-- HAVING
SELECT department,
AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 90000;

SELECT city,
COUNT(*)
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

-- SUM
SELECT SUM(salary)
FROM employees;

SELECT department,
AVG(salary)
FROM employees
GROUP BY department;

-- MAX
SELECT MAX(salary)
FROM employees;

-- IT employees earning more than 90,000
-- Employees hired after 2021 ordered by salary
-- Department with payroll greater than 250000
-- Employees with missing emails





