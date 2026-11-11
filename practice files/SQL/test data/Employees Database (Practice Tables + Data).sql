-- 1. Employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- 2. Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT
);

-- Insert data into employees
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date) VALUES
(1, 'Alice', 'Johnson', 'HR', 52000, '2019-03-15'),
(2, 'Bob', 'Smith', 'IT', 75000, '2020-06-22'),
(3, 'Carol', 'Davis', 'Finance', 68000, '2018-11-02'),
(4, 'David', 'Miller', 'IT', 80000, '2021-01-10'),
(5, 'Eve', 'Brown', 'HR', 56000, '2017-07-19'),
(6, 'Frank', 'Wilson', 'Finance', 72000, '2022-05-30');

-- Insert data into departments
INSERT INTO departments (department_id, department_name, manager_id) VALUES
(10, 'HR', 1),
(20, 'IT', 2),
(30, 'Finance', 3);
