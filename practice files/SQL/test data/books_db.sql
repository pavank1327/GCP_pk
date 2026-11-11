CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date) VALUES
(1, 'Alice', 'Johnson', 'HR', 52000, '2019-03-15'),
(2, 'Bob', 'Smith', 'IT', 75000, '2020-06-22'),
(3, 'Carol', 'Davis', 'Finance', 68000, '2018-11-02'),
(4, 'David', 'Miller', 'IT', 80000, '2021-01-10'),
(5, 'Eve', 'Brown', 'HR', 56000, '2017-07-19'),
(6, 'Frank', 'Wilson', 'Finance', 72000, '2022-05-30');

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(6,2),
    published_year INT
);
INSERT INTO books (book_id, title, author, genre, price, published_year) VALUES
(101, 'The SQL Adventure', 'John Query', 'Education', 29.99, 2021),
(102, 'Mystery of Databases', 'Jane Table', 'Mystery', 19.50, 2018),
(103, 'Learning Python & SQL', 'Mike Code', 'Programming', 39.95, 2022),
(104, 'Finance Fundamentals', 'Lucy Money', 'Finance', 24.00, 2019),
(105, 'IT Infrastructure 101', 'Greg Tech', 'Technology', 34.75, 2020);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);
INSERT INTO customers (customer_id, name, email, join_date) VALUES
(201, 'Sarah Connor', 'sarah.connor@mail.com', '2023-02-11'),
(202, 'Tom Hanks', 'tom.hanks@mail.com', '2023-05-27'),
(203, 'Emma Watson', 'emma.watson@mail.com', '2024-01-05'),
(204, 'Bruce Wayne', 'bruce.wayne@mail.com', '2022-09-18');

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    transaction_date DATE,
    type VARCHAR(20)
);
INSERT INTO transactions (transaction_id, customer_id, book_id, transaction_date, type) VALUES
(1, 201, 101, '2024-03-12', 'PURCHASE'),
(2, 202, 102, '2024-04-01', 'BORROW'),
(3, 203, 103, '2024-06-15', 'PURCHASE'),
(4, 201, 104, '2024-07-21', 'BORROW'),
(5, 204, 105, '2024-05-02', 'PURCHASE'),
(6, 202, 101, '2024-07-30', 'PURCHASE');
