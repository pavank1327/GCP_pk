create database WINDOWS_FUNCTIONS;

USE WINDOWS_FUNCTIONS;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    hire_date DATE,
    department_name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id, employee_name, hire_date, department_name, salary) VALUES
(1, 'John Doe', '2020-01-15', 'Human Resources', 55000.00),
(2, 'Jane Smith', '2020-02-10', 'Human Resources', 60000.00),
(3, 'Alice Johnson', '2019-03-20', 'Engineering', 70000.00),
(4, 'Bob Lee', '2020-06-01', 'Engineering', 75000.00),
(5, 'Charlie King', '2021-07-10', 'Sales', 45000.00),
(6, 'Eve Davis', '2021-09-05', 'Sales', 47000.00),
(7, 'Tom Harris', '2018-11-10', 'Human Resources', 52000.00),
(8, 'Sophia Williams', '2019-05-15', 'Human Resources', 58000.00),
(9, 'Daniel Scott', '2017-08-25', 'Engineering', 80000.00),
(10, 'Olivia Brown', '2019-12-01', 'Marketing', 62000.00),
(11, 'Liam Wilson', '2020-03-18', 'Marketing', 61000.00),
(12, 'Emma Taylor', '2021-02-28', 'Sales', 46000.00),
(13, 'Noah White', '2020-11-23', 'Engineering', 73000.00),
(14, 'Ava Thomas', '2021-04-12', 'Engineering', 72000.00),
(15, 'Mason Lewis', '2019-01-30', 'Human Resources', 57000.00),
(16, 'Isabella Clark', '2018-07-19', 'Marketing', 59000.00),
(17, 'Logan Young', '2020-09-14', 'Sales', 49000.00),
(18, 'Mia Hall', '2022-01-01', 'Engineering', 76000.00),
(19, 'James Allen', '2021-06-22', 'Human Resources', 53000.00),
(20, 'Amelia Wright', '2022-03-03', 'Sales', 50000.00),
(21, 'Satish', '2020-01-15', 'Human Resources', 55000.00),
(22, 'Jane Satish', '2020-02-10', 'Human Resources', 55000.00);


SELECT employee_id, employee_name, hire_date, department_name, salary FROM employees;

SELECT SUM(salary) AS max_salary FROM employees;

SELECT department_name, SUM(salary) AS max_salary FROM employees 
GROUP BY department_name;

SELECT employee_id, employee_name, hire_date, department_name, salary, SUM(salary) AS max_salary FROM employees 
GROUP BY department_name;

SELECT employee_id, employee_name, hire_date, department_name, salary, SUM(salary) AS total_sum_salary FROM employees 
GROUP BY employee_id, employee_name, hire_date, department_name, salary;

SELECT employee_id, employee_name, hire_date, department_name, salary, SUM(salary) OVER() AS total_sum_salary FROM employees;

SELECT employee_id, employee_name, hire_date, department_name, salary, SUM(salary) OVER(partition by department_name) AS total_sum_salary FROM employees;

# RANK,DENSE_RANK, ROW_NUMBER 

SELECT *, ROW_NUMBER() OVER(partition by department_name) AS salary_ranking FROM employees;

SELECT *, ROW_NUMBER() OVER(partition by department_name order by salary) AS salary_ranking FROM employees;

SELECT *, ROW_NUMBER() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees;

SELECT sub.* 
FROM 
(SELECT *, ROW_NUMBER() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees)sub
WHERE sub.salary_ranking = 3;

SELECT sub.* 
FROM 
(SELECT *, RANK() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees)sub
WHERE sub.salary_ranking = 3;

SELECT sub.* 
FROM 
(SELECT *, DENSE_RANK() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees)sub
WHERE sub.salary_ranking = 3;


SELECT *, 
ROW_NUMBER() OVER(partition by department_name ORDER BY salary DESC) AS salary_ROW_NUMBER ,
RANK() OVER(partition by department_name ORDER BY salary DESC) AS salary_RANK ,
DENSE_RANK() OVER(partition by department_name ORDER BY salary DESC) AS salary_DENSE_RANK 
FROM employees
WHERE department_name IN ('Engineering');


SELECT *, 
ROW_NUMBER() OVER(partition by department_name ORDER BY salary DESC) AS salary_ROW_NUMBER ,
RANK() OVER(partition by department_name ORDER BY salary DESC) AS salary_RANK ,
DENSE_RANK() OVER(partition by department_name ORDER BY salary DESC) AS salary_DENSE_RANK 
FROM employees
WHERE department_name IN ('Human Resources');


SELECT sub.* 
FROM 
(SELECT *, RANK() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees)sub
WHERE sub.salary_ranking = 3;


SELECT sub.* 
FROM 
(SELECT *, DENSE_RANK() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees)sub
WHERE sub.salary_ranking = 3;

WITH 2nd_high_sal AS (
SELECT *, DENSE_RANK() OVER(partition by department_name order by salary desc) AS salary_ranking FROM employees )
SELECT * FROM 2nd_high_sal WHERE salary_ranking = 2;

