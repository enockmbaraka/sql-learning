/*====================================================
  SELF JOIN
====================================================*/
USE kasongo;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

-- Insert the manager first
INSERT INTO employees 
VALUES
(3,'Charlie',NULL);

-- Then insert employees managed by Charlie
INSERT INTO employees
VALUES
(1,'Alice',3),
(2,'Bob',3);

-- Finally insert David, who reports to Bob
INSERT INTO employees 
VALUES
(4,'David',2);

SELECT * FROM employees;

SELECT
e1.name AS employee_name,
e2.name AS manager_name
FROM employees AS e1
JOIN employees AS e2
ON e1.manager_id = e2.id;
