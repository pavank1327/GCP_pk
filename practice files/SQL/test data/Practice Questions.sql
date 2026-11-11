DROP DATABASE IF EXISTS local;

CREATE DATABASE local;

USE local;
SHOW TABLE STATUS LIKE 'employee%';



-- Q1: Get all employees_large_1_12_25 earning more than 65,000
SELECT * FROM employees_large_1_12_25 WHERE salary > 65000;
select count(*) from employees_large_1_12_25;

-- Q2: Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees_large_1_12_25
GROUP BY department;

-- Q3: List all books purchased (not borrowed)
SELECT b.title, b.author, t.transaction_date
FROM transactions t
JOIN books b ON t.book_id = b.book_id
WHERE t.type = 'PURCHASE';

-- Q4: Customers who borrowed books
SELECT DISTINCT c.name, c.email
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.type = 'BORROW';

-- Q5: Total revenue from book sales
SELECT SUM(price) AS total_revenue
FROM books b
JOIN transactions t ON b.book_id = t.book_id
WHERE t.type = 'PURCHASE';



USE local;

select * From Authors; 

SELECT b.Title, a.Name AS Author, p.Name AS Publisher, b.Price
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
JOIN Publishers p ON b.PublisherID = p.PublisherID;

-- Check customer orders:

SELECT o.OrderID, c.Name, o.OrderDate, od.Quantity, b.Title, od.Subtotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.BookID = b.BookID;

USE local;
select * from Books;


USE local;
DROP TABLE IF EXISTS employees_large_1_12_25;

CREATE TABLE employees_large_1_12_25 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
); 

SELECT * FROM employees_large_1_12_25;

SELECT count(*) FROM employees_large_1_12_25;

INSERT INTO employees_large_1_12_25 (employee_id, first_name, last_name, department, salary, hire_date)
VALUES
(1, 'John', 'Doe', 'Engineering', 75000.00, '2022-05-15'),
(2, 'Jane', 'Smith', 'HR', 60000.00, '2021-03-10'),
(3, 'Michael', 'Brown', 'Finance', 82000.00, '2020-11-20'),
(4, 'Emily', 'Davis', 'Marketing', 68000.00, '2023-01-05'),
(5, 'David', 'Wilson', 'IT', 90000.00, '2019-07-25');

SELECT * FROM employees_large_1_12_25;

SELECT count(*) FROM employees_large_1_12_25;
