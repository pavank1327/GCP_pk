-- Drop the database if it exists
DROP DATABASE IF EXISTS sbibank;

-- Create the database again
CREATE DATABASE sbibank;

-- table create ---- 

USE sbibank;

CREATE TABLE Customers (
    Customer_ID   VARCHAR(10), -- CUST001
    Name          VARCHAR(50),
    Age           INT,
    Gender        CHAR(1),
    Mobile        VARCHAR(15),
    Email         VARCHAR(50),
    Address varchar(100)
);

describe Customers;

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) 
VALUES ('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com');

SELECT Customer_ID, Name, Age, Gender, Mobile, Email FROM Customers;

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) 
VALUES
("CUST002", 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

SELECT Customer_ID, Name, Age, Gender, Mobile, Email FROM Customers;

ALTER TABLE Customers ADD Address VARCHAR(100);

SELECT Customer_ID, Name, Age, Gender, Mobile, Email, Address FROM Customers;

UPDATE Customers
SET Address = 'Delhi';

SELECT Customer_ID, Name, Age, Gender, Mobile, Email, Address FROM Customers;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET Address = 'Delhi';

SELECT Customer_ID, Name, Age, Gender, Mobile, Email, Address FROM Customers;

UPDATE Customers
SET Address = 'HYD' WHERE Name = "Ramesh Kumar";

SELECT Customer_ID, Name, Age, Gender, Mobile, Email, Address FROM Customers;

UPDATE Customers
SET Address = 'CHI' WHERE Name = "Anil Verma";

SELECT Customer_ID, Name, Age, Gender, Mobile, Email, Address FROM Customers;

UPDATE Customers
SET Mobile = '1234567890' WHERE Name = "Anil Verma";

SELECT Customer_ID, Name, Age, Gender, Mobile, Email, Address FROM Customers;



-- =============================================


-- Create Database
CREATE DATABASE SBIBankDB;

use SBIBankDB;

CREATE TABLE Customers (
    Customer_ID   VARCHAR(10),
    Name          VARCHAR(50),
    Age           INT,
    Gender        CHAR(1),
    Mobile        VARCHAR(15),
    Email         VARCHAR(50)
);

select * FROM Customers;

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) 
VALUES ('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com');


select * FROM Customers;

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

select * FROM Customers;

SELECT 
Customer_ID, Name, Age, Gender, Mobile, Email
FROM Customers;

SELECT 
name, Mobile
FROM Customers;


-- Add a new column to Customers table
ALTER TABLE Customers ADD Address VARCHAR(100);


SELECT * FROM Customers;

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email,Address) 
VALUES ('CUST006', 'Satish Mudde', 32, 'M', '9876543210', 'ramesh.kumar@email.com','HYD');

SELECT * FROM Customers;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET Address = 'Delhi'
WHERE Customer_ID =  'CUST001';

SELECT * FROM Customers;

UPDATE Customers
SET Address = 'PUNE';

SELECT * FROM Customers;


-- =======================================================================


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

-- Modify column size in Accounts table
ALTER TABLE Accounts MODIFY Account_Type VARCHAR(30);


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


CREATE TABLE Loans (
    Loan_ID       VARCHAR(10),
    Customer_ID   VARCHAR(10),
    Loan_Type     VARCHAR(30),
    Loan_Amount   DECIMAL(15,2),
    EMI           DECIMAL(12,2),
    Tenure        INT,  -- Months
    Status        VARCHAR(20)
);

INSERT INTO Loans (Loan_ID, Customer_ID, Loan_Type, Loan_Amount, EMI, Tenure, Status) VALUES
('LN001', 'CUST001', 'Home Loan', 2500000.00, 25000.00, 240, 'Active'),
('LN002', 'CUST003', 'Car Loan', 750000.00, 12500.00, 60, 'Active'),
('LN003', 'CUST004', 'Personal Loan', 300000.00, 8000.00, 48, 'Closed'),
('LN004', 'CUST005', 'Education Loan', 500000.00, 10000.00, 60, 'Active');

-- Change loan status from Active → Closed
UPDATE Loans 
SET Status = 'Closed' 
WHERE Loan_ID = 'LN002';



CREATE TABLE CreditCards (
    Card_No       VARCHAR(10),
    Customer_ID   VARCHAR(10),
    Card_Type     VARCHAR(20),
    Limit_Amount  DECIMAL(12,2),
    Outstanding   DECIMAL(12,2),
    Status        VARCHAR(20)
);

INSERT INTO CreditCards (Card_No, Customer_ID, Card_Type, Limit_Amount, Outstanding, Status) VALUES
('CC1001', 'CUST001', 'Platinum', 200000.00, 45000.00, 'Active'),
('CC1002', 'CUST002', 'Gold', 150000.00, 30000.00, 'Active'),
('CC1003', 'CUST003', 'Silver', 75000.00, 10500.00, 'Active'),
('CC1004', 'CUST004', 'Titanium', 300000.00, 0.00, 'Blocked'),
('CC1005', 'CUST005', 'Classic', 50000.00, 12000.00, 'Active');

-- Drop a column from CreditCards table
ALTER TABLE CreditCards DROP COLUMN Status;