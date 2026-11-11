-- 1. Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(6,2),
    published_year INT
);

-- 2. Customers / Members table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

-- 3. Borrow / Orders table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    transaction_date DATE,
    type VARCHAR(20), -- 'BORROW' or 'PURCHASE'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert books data
INSERT INTO books (book_id, title, author, genre, price, published_year) VALUES
(101, 'The SQL Adventure', 'John Query', 'Education', 29.99, 2021),
(102, 'Mystery of Databases', 'Jane Table', 'Mystery', 19.50, 2018),
(103, 'Learning Python & SQL', 'Mike Code', 'Programming', 39.95, 2022),
(104, 'Finance Fundamentals', 'Lucy Money', 'Finance', 24.00, 2019),
(105, 'IT Infrastructure 101', 'Greg Tech', 'Technology', 34.75, 2020);

-- Insert customers data
INSERT INTO customers (customer_id, name, email, join_date) VALUES
(201, 'Sarah Connor', 'sarah.connor@mail.com', '2023-02-11'),
(202, 'Tom Hanks', 'tom.hanks@mail.com', '2023-05-27'),
(203, 'Emma Watson', 'emma.watson@mail.com', '2024-01-05'),
(204, 'Bruce Wayne', 'bruce.wayne@mail.com', '2022-09-18');

-- Insert transactions data
INSERT INTO transactions (transaction_id, customer_id, book_id, transaction_date, type) VALUES
(1, 201, 101, '2024-03-12', 'PURCHASE'),
(2, 202, 102, '2024-04-01', 'BORROW'),
(3, 203, 103, '2024-06-15', 'PURCHASE'),
(4, 201, 104, '2024-07-21', 'BORROW'),
(5, 204, 105, '2024-05-02', 'PURCHASE'),
(6, 202, 101, '2024-07-30', 'PURCHASE');
