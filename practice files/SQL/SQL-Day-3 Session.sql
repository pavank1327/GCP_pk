DROP DATABASE IF EXISTS SQLDAY3; 

CREATE DATABASE SQLDAY3;

use SQLDAY3;

SELECT * FROM Customers;

use SQLDAY3;
CREATE TABLE Customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,   -- Unique ID for each customer
    Cust_Name VARCHAR(100) NOT NULL,            -- Customer's full name
    Age INT CHECK (Age > 0),               -- Age must be a positive integer
    Gender CHAR(1) CHECK (Gender IN ('M','F')), -- Gender restricted to M/F
    Mobile VARCHAR(15) UNIQUE,             -- Mobile number, unique per customer
    Email VARCHAR(100) UNIQUE              -- Email address, unique per customer
);


-- DELETE FROM Customers;	

-- SET SQL_SAFE_UPDATES = 0;

-- DELETE FROM Customers;

SELECT * FROM Customers;

INSERT INTO Customers (Customer_ID, Cust_Name, Age, Gender, Mobile, Email) VALUES
('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com'),
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

SELECT * FROM Customers;

describe Customers;

-- DELETE FROM Customers;

-- DELETE FROM Customers where Name = "Priya Singh";

SELECT * FROM Customers;

-- DELETE FROM Customers where Gender = "M";

SELECT * FROM Customers;

ROLLBACK;

SELECT * FROM Customers;

START TRANSACTION;

-- DELETE FROM Customers where Gender = "F";

SELECT * FROM Customers;

ROLLBACK;

SELECT * FROM Customers;


CREATE TABLE Accounts (
    Account_No    VARCHAR(10),
    Customer_ID   VARCHAR(10),
    Account_Type  VARCHAR(20),
    Branch_ID     VARCHAR(10),
    Balance       DECIMAL(12,2)
);

INSERT INTO Accounts (Account_No, Customer_ID, Account_Type, Branch_ID, Balance) VALUES
('ACC1001', 'CUST001', 'Savings', 'BR001', 85000.50),
('ACC1002', 'CUST002', 'Current', 'BR002', 150000.00),
('ACC1003', 'CUST003', 'Savings', 'BR003', 45200.00),
('ACC1004', 'CUST004', 'Salary', 'BR004', 235500.00),
('ACC1005', 'CUST005', 'Savings', 'BR005', 12000.00);

SELECT * FROM Accounts;

-- DELETE FROM Accounts; #DELETE COMD

TRUNCATE TABLE Accounts; # TRUNCATE COMD

describe Accounts;

SELECT * FROM Accounts;

# TRUNCATE TABLE Accounts where Branch_ID = "BR001"; # TRUNCATE COMD

START TRANSACTION;

TRUNCATE TABLE Accounts;

SELECT * FROM Accounts;

ROLLBACK;

SELECT * FROM Accounts;

START TRANSACTION;

-- DELETE FROM Accounts;

SELECT * FROM Accounts;

ROLLBACK;

SELECT * FROM Accounts; # BACK 


CREATE TABLE Transactions (
    Txn_ID        VARCHAR(10),
    Account_No    VARCHAR(10),
    Date          DATE,
    Type          VARCHAR(10), -- Credit / Debit
    Amount        DECIMAL(12,2),
    Balance_After DECIMAL(12,2),
    Description   VARCHAR(100)
);

INSERT INTO Transactions (Txn_ID, Account_No, Date, Type, Amount, Balance_After, Description) VALUES
('TXN001', 'ACC1001', '2025-09-01', 'Credit', 10000.00, 95000.50, 'Salary Credit'),
('TXN002', 'ACC1001', '2025-09-05', 'Debit', 5000.00, 90000.50, 'ATM Withdrawal'),
('TXN003', 'ACC1002', '2025-09-03', 'Debit', 20000.00, 130000.00, 'Vendor Payment'),
('TXN004', 'ACC1004', '2025-09-07', 'Credit', 50000.00, 285500.00, 'Project Incentive'),
('TXN005', 'ACC1005', '2025-09-09', 'Debit', 2000.00, 10000.00, 'Utility Bill Payment');


SELECT * FROM Transactions;

-- DELETE FROM Transactions;  #  DATA removed  WHERE 
TRUNCATE TABLE Transactions;  # DATA removed NO WHERE 
DROP TABLE Transactions; # DATA + TABLE removed

describe Transactions;