CREATE DATABASE SQLDAY4;

use SQLDAY4;

CREATE TABLE Customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Name        VARCHAR(50),
    Age         INT,
    Gender      CHAR(1),
    Mobile      VARCHAR(15),
    Email       VARCHAR(50),
    Address     VARCHAR(100)
);

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com'),
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');


INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
(null, 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com');

INSERT INTO Customers1 (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
(null, 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com');


SELECT * FROM Customers;

describe Customers;

INSERT INTO Customers (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com'),
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

CREATE TABLE Customers1 (
    Customer_ID VARCHAR(10) ,
    Name        VARCHAR(50),
    Age         INT,
    Gender      CHAR(1),
    Mobile      VARCHAR(15),
    Email       VARCHAR(50),
    Address     VARCHAR(100)
);

INSERT INTO Customers1 (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com'),
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

select * FROM Customers1;

INSERT INTO Customers1 (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com'),
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

select * FROM Customers1;


CREATE TABLE Accounts (
    Account_No   VARCHAR(10) PRIMARY KEY,
    Customer_ID  VARCHAR(10),
    Account_Type VARCHAR(30),
    Branch_ID    VARCHAR(10),
    Balance      DECIMAL(12,2),
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID)
);

describe Accounts;

CREATE TABLE Accounts1 (
    Account_No   VARCHAR(10) PRIMARY KEY,
    Customer_ID  VARCHAR(10),
    Account_Type VARCHAR(30),
    Branch_ID    VARCHAR(10),
    Balance      DECIMAL(12,2),
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID),
	FOREIGN KEY (Branch_ID)
    REFERENCES Customers(Customer_ID)
);

describe Accounts1;

CREATE TABLE Courses (
    Course_ID   INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Fee         DECIMAL(10,2) CHECK (Fee > 0)
);

CREATE TABLE Students (
    Student_ID     INT PRIMARY KEY,                         -- PRIMARY KEY
    Name           VARCHAR(50) NOT NULL,                    -- NOT NULL
    Email          VARCHAR(50) UNIQUE,                      -- UNIQUE
    Mobile         VARCHAR(10) UNIQUE NOT NULL,             -- UNIQUE + NOT NULL
    Age            INT CHECK (Age >= 18),                   -- CHECK
    Gender         CHAR(1) CHECK (Gender IN ('M','F')),     -- CHECK
    Degree         VARCHAR(30) NOT NULL,                    -- NOT NULL
    Passed_Out_Year INT CHECK (Passed_Out_Year >= 2000),   -- CHECK
    Course_ID      INT,                                     -- FOREIGN KEY
    Status         VARCHAR(10) DEFAULT 'Active',            -- DEFAULT
    FOREIGN KEY (Course_ID)
    REFERENCES Courses(Course_ID)
);


describe Students;


CREATE TABLE Customers2 (
    Customer_ID VARCHAR(10) ,
    Name        VARCHAR(50),
    Age         INT,
    Gender      CHAR(1),
    Mobile      VARCHAR(15),
    Email       VARCHAR(50),
    Address     VARCHAR(100) DEFAULT 'HYD'
);

INSERT INTO Customers2 (Customer_ID, Name, Age, Gender, Mobile, Email) VALUES
('CUST001', 'Ramesh Kumar', 32, 'M', '9876543210', 'ramesh.kumar@email.com'),
('CUST002', 'Priya Singh', 28, 'F', '9876501234', 'priya.singh@email.com'),
('CUST003', 'Anil Verma', 41, 'M', '9845098765', 'anil.verma@email.com'),
('CUST004', 'Meena Gupta', 36, 'F', '9811122233', 'meena.gupta@email.com'),
('CUST005', 'Suresh Reddy', 50, 'M', '9888888888', 'suresh.reddy@email.com');

select * FROM Customers2;


