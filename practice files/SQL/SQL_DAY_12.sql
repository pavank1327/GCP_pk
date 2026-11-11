-- create database WINDOWS_FUNCTIONS;

USE WINDOWS_FUNCTIONS;


WITH 2nd_high_sal AS (
SELECT *, DENSE_RANK() OVER(partition by department_name order by salary desc) AS rnk FROM employees )
SELECT * FROM 2nd_high_sal WHERE rnk = 3;

# LAG LEAD


SELECT * FROM employees;

SELECT
employee_id, 
employee_name, 
LAG(employee_name) OVER () AS prev_employee_name,
hire_date, 
department_name, 
salary,
LAG(salary) OVER () AS prev_salary
FROM employees;


SELECT
employee_id, 
employee_name, 
LEAD(employee_name) OVER () AS prev_employee_name,
hire_date, 
department_name, 
salary,
LEAD(salary) OVER () AS next_salary
FROM employees;


SELECT
employee_id, 
employee_name, 
hire_date, 
department_name, 
salary,
LAG(salary) OVER () AS prev_salary,
LEAD(salary) OVER () AS next_salary
FROM employees;


SELECT
employee_id, 
employee_name, 
hire_date, 
department_name, 
salary,
LAG(salary) OVER () AS prev_salary,
LAG(salary,1) OVER () AS prev_salary_1,
LAG(salary,2) OVER () AS prev_salary_2,
LAG(salary,3) OVER () AS prev_salary_3,
LAG(salary,4) OVER () AS prev_salary_4
FROM employees;


SELECT
employee_id, 
employee_name, 
hire_date, 
department_name, 
salary,
LEAD(salary) OVER () AS next_salary,
LEAD(salary,1) OVER () AS next_salary_1,
LEAD(salary,2) OVER () AS next_salary_2,
LEAD(salary,3) OVER () AS next_salary_3,
LEAD(salary,4) OVER () AS next_salary_4
FROM employees;

use sql_practice_questions;
# Emps whose Sal is same as FORD or SMITH in desc order of Sal.

SELECT * FROM EMPY;

SELECT SAL FROM EMPY WHERE ENAME IN ('FORD','SMITH');

SELECT * FROM EMPY WHERE SAL IN (800,3000);

SELECT * FROM EMPY WHERE SAL IN (SELECT SAL FROM EMPY WHERE ENAME IN ('FORD','SMITH')) ORDER BY SAL DESC;

WITH emp_salaries AS (
    SELECT SAL
    FROM EMPY
    WHERE ENAME IN ('FORD', 'SMITH')
)
SELECT *
FROM EMPY
WHERE SAL IN (SELECT SAL FROM emp_salaries)
ORDER BY SAL DESC;















