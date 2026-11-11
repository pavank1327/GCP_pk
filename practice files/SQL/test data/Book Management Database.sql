/* Database Schema Overview
We’ll need these core entities:
- Authors → who wrote the books
- Publishers → who published them
- Books → main catalog
- Customers → people who buy/borrow books
- Orders → transactions of book purchases
- OrderDetails → line items inside each order
- Inventory → stock management
*/


-- ---------------------------------------------------------------------------------

/* --> SQL Queries:

-- 1. Create Database
CREATE DATABASE BookManagementDB;
USE BookManagementDB;

USE local; (test DB)
*/

-- 2. Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Bio TEXT,
    Country VARCHAR(50)
);

-- 3. Publishers Table
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Contact VARCHAR(50)
);

-- 4. Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Genre VARCHAR(50),
    Price DECIMAL(10,2),
    AuthorID INT,
    PublisherID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- 5. Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- 6. Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 7. OrderDetails Table (many-to-many between Orders and Books)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 8. Inventory Table
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    Stock INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);



-- ---------------------------------------------------------------------------------

--> Sample Inserts:

-- Authors
INSERT INTO Authors (Name, Bio, Country)
VALUES ('George Orwell', 'English novelist and essayist', 'UK'),
       ('J.K. Rowling', 'Author of Harry Potter series', 'UK');

-- Publishers
INSERT INTO Publishers (Name, Address, Contact)
VALUES ('Penguin Books', 'London, UK', '123456789'),
       ('Bloomsbury', 'London, UK', '987654321');

-- Books
INSERT INTO Books (Title, ISBN, Genre, Price, AuthorID, PublisherID)
VALUES ('1984', '9780451524935', 'Dystopian', 9.99, 1, 1),
       ('Harry Potter and the Philosopher\'s Stone', '9780747532743', 'Fantasy', 19.99, 2, 2);

-- Customers
INSERT INTO Customers (Name, Email, Phone, Address)
VALUES ('Rahul Sharma', 'rahul@example.com', '9876543210', 'Hyderabad, India'),
       ('Anita Verma', 'anita@example.com', '9123456780', 'Delhi, India');

-- Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2025-11-19', 29.98);

-- OrderDetails
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Subtotal)
VALUES (1, 1, 1, 9.99),
       (1, 2, 1, 19.99);

-- Inventory
INSERT INTO Inventory (BookID, Stock)
VALUES (1, 50),
       (2, 100);


-- ---------------------------------------------------------------------------------

--> Example Queries:

-- Get all books with author and publisher:

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