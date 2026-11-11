DROP DATABASE IF EXISTS SQLDAY6;

CREATE DATABASE SQLDAY6;

use SQLDAY6;

CREATE TABLE amazonsales (
    Transaction_ID VARCHAR(10) PRIMARY KEY,  -- Unique ID for each transaction
    Customer_ID    VARCHAR(10) NOT NULL,     -- Customer reference ID
    Customer_Name  VARCHAR(100) NOT NULL,    -- Customer full name
    Customer_Phone VARCHAR(15),              -- Customer phone number
    Customer_Email VARCHAR(100),             -- Customer email ID
    Product        VARCHAR(50) NOT NULL,     -- Name of the product
    Category       VARCHAR(30),              -- Category (Electronics, Fashion, etc.)
    Quantity       INT NOT NULL,             -- Number of items purchased
    Price          DECIMAL(10,2) NOT NULL,   -- Price per unit
    Total_Amount   DECIMAL(12,2) NOT NULL,   -- Computed as Quantity * Price
    Country        VARCHAR(30),              -- Country of purchase
    Date           DATE NOT NULL             -- Transaction date
);

SELECT * FROM amazonsales;

SELECT COUNT(*) total_records FROM amazonsales;

describe amazonsales;

SELECT COUNT(*) total_records FROM amazonsales;

SELECT COUNT(*) total_not_null_records
FROM amazonsales
WHERE Customer_Phone IS NOT NULL;

SELECT COUNT(*) total_null_records 
FROM amazonsales
WHERE Customer_Phone IS NULL;

INSERT INTO amazonsales 
(Transaction_ID, Customer_ID, Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country, Date) VALUES
('T0021', 'C101', 'Brian Gardner',null, 'stonecheryl@johnson.com', 'Mobile', 'Electronics', 3, 50, 150, 'UK', '2025-09-01');

SELECT *
FROM amazonsales
WHERE Customer_Phone IS NOT NULL;

SELECT *
FROM amazonsales
WHERE Customer_Phone IS NULL;

SELECT * FROM amazonsales;

SELECT *
FROM amazonsales
WHERE Customer_Email LIKE '%@yahoo.com'; # anthony28@yahoo.com

SELECT *
FROM amazonsales
WHERE Customer_Email LIKE '%@gmail.com'; # tonywalker@gmail.com

SELECT *
FROM amazonsales
WHERE Customer_ID LIKE 'C10%'; # C10%1

SELECT *
FROM amazonsales
WHERE Customer_Name LIKE 'Br%'; # Brian Gardner , Bryan Frederick , Brian Gardner

SELECT *
FROM amazonsales
WHERE Customer_Name LIKE '%e';

SELECT *
FROM amazonsales
WHERE Customer_Name LIKE '%ea%'; # Andr%ea% Reese

SELECT *
FROM amazonsales
WHERE Customer_Name LIKE '%y%'; # Andr%ea% Reese


SELECT * FROM amazonsales;

SELECT  *
FROM amazonsales
WHERE Date BETWEEN '2025-09-01' AND '2025-09-05';

SELECT * FROM amazonsales;

SELECT
	Category,
	"001" AS Category_code
FROM amazonsales;

SELECT
	Category,
	CASE 
		WHEN Category = 'Electronics' THEN  "001" 
		WHEN Category = 'Fashion' THEN  "002"
		WHEN Category = 'Furniture' THEN  "003"
		WHEN Category = 'Stationary' THEN  "004"
    END AS Category_code
FROM amazonsales;


# SUM(), AVG(), MIN(), MAX(), COUNT()

SELECT * FROM amazonsales;

SELECT COUNT(*) FROM amazonsales;

SELECT COUNT(Transaction_ID) FROM amazonsales;

SELECT COUNT(Customer_Phone) FROM amazonsales;

SELECT COUNT(100) FROM amazonsales;

SELECT Total_Amount FROM amazonsales;

-- SELECT SUM(*) FROM amazonsales;

SELECT SUM(Total_Amount) FROM amazonsales;  

SELECT AVG(Total_Amount) FROM amazonsales;  # sum/21

SELECT MIN(Total_Amount) FROM amazonsales; 

SELECT MAX(Total_Amount) FROM amazonsales;

 

use SQLDAY6;

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    account_holder_name VARCHAR(50),
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    created_date DATE
);

INSERT INTO Accounts (account_id, account_holder_name, balance, account_type) VALUES
(1, 'Alice Johnson', 1500.00, 'Savings'),
(2, 'Bob Smith', 2500.50, 'Current'),
(3, 'Charlie Brown', 3200.75, 'Savings'),
(4, 'Diana Prince', 5000.00, 'Current'),
(5, 'Ethan Hunt', 2750.25, 'Savings'),
(6, 'Fiona Gallagher', 1800.00, 'Current'),
(7, 'George Martin', 4200.10, 'Savings'),
(8, 'Hannah Lee', 3500.00, 'Current'),
(9, 'Ian Wright', 600.00, 'Savings'),
(10, 'Julia Roberts', 7200.90, 'Current');


SELECT * FROM Accounts;

SELECT * FROM amazonsales;


SET SQL_SAFE_UPDATES = 0;

delete from amazonsales WHERE Customer_ID = "C101";

ROLLBACK;

SELECT * FROM amazonsales WHERE Customer_ID = "C101";


SELECT * FROM amazonsales WHERE Customer_ID = "C102";

START TRANSACTION;

delete from amazonsales WHERE Customer_ID = "C102";

ROLLBACK;

SELECT * FROM amazonsales WHERE Customer_ID = "C102";



