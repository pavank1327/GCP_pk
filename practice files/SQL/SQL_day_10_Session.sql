DROP DATABASE IF EXISTS amazon;

CREATE database amazon;


USE amazon;

-- Step 1: Create the table
CREATE TABLE amazonsales (
    Customer_Name VARCHAR(100),
    Customer_Phone VARCHAR(15),
    Customer_Email VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    Total_Amount DECIMAL(10,2),
    Country VARCHAR(50)
);

INSERT INTO amazonsales 
(Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country)
VALUES
('John Doe', '9876543210', 'john@gmail.com', 'Laptop', 'Electronics', 1, 50000, 50000, 'India'),
('Alice Smith', '9876543211', 'alice@gmail.com', 'Phone', 'Electronics', 2, 20000, 40000, 'USA'),
('Bob Brown', '9876543212', 'bob@gmail.com', 'Shoes', 'Fashion', 3, 2000, 6000, 'UK'),
('Charlie Lee', '9876543213', 'charlie@gmail.com', 'Watch', 'Accessories', 1, 5000, 5000, 'India'),
('David Miller', '9876543214', 'david@gmail.com', 'Tablet', 'Electronics', 2, 15000, 30000, 'USA'),
('Emma Wilson', '9876543215', 'emma@gmail.com', 'Bag', 'Fashion', 1, 3000, 3000, 'UK'),
('Frank Thomas', '9876543216', 'frank@gmail.com', 'Headphones', 'Electronics', 2, 2500, 5000, 'India'),
('Grace Hall', '9876543217', 'grace@gmail.com', 'Dress', 'Fashion', 1, 4000, 4000, 'USA'),
('Henry Clark', '9876543218', 'henry@gmail.com', 'Camera', 'Electronics', 1, 45000, 45000, 'UK'),
('Ivy Scott', '9876543219', 'ivy@gmail.com', 'Shoes', 'Fashion', 2, 2500, 5000, 'India');


USE amazon;

select * from amazonsales; 

USE amazon;
SELECT 
sub.* FROM 
(SELECT 
Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country
FROM amazonsales
WHERE Country IN ("UK", "India", "USA")
)sub
WHERE Country IN ("UK", "India") ;

SELECT 
sub_amazonsales.* FROM 
(SELECT 
Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country,
CASE 
		WHEN Category = 'Electronics' THEN 0
		WHEN Category = 'Fashion' THEN 1
		WHEN Category = 'Furniture' THEN 2
		WHEN Category = 'Stationary' THEN 3
		ELSE 
		Category 
        END AS Category_code
FROM amazonsales
WHERE Country IN ("UK", "India", "USA") 
)sub_amazonsales
WHERE Category_code IN (0,1,3) ;

SELECT 
Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country,
CASE 
		WHEN Category = 'Electronics' THEN 0
		WHEN Category = 'Fashion' THEN 1
		WHEN Category = 'Furniture' THEN 2
		WHEN Category = 'Stationary' THEN 3
		ELSE 
		Category 
        END AS Category_code
FROM amazonsales
WHERE Country IN ("UK", "India", "USA") ;


# LOGIC ;

CREATE VIEW vw_amazonsales AS
SELECT 
Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country,
CASE 
		WHEN Category = 'Electronics' THEN 0
		WHEN Category = 'Fashion' THEN 1
		WHEN Category = 'Furniture' THEN 2
		WHEN Category = 'Stationary' THEN 3
		ELSE 
		Category 
        END AS Category_code
FROM amazonsales
WHERE Country IN ("UK", "India", "USA");

select * FROM amazonsales;

select * FROM vw_amazonsales;

describe amazonsales;

describe vw_amazonsales;

SELECT * FROM vw_amazonsales WHERE Country = "UK";

SELECT * FROM vw_amazonsales WHERE Category_code IN (0,1,3) ;

WITH cte_amazonsales AS (
SELECT 
Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country,
CASE 
		WHEN Category = 'Electronics' THEN 0
		WHEN Category = 'Fashion' THEN 1
		WHEN Category = 'Furniture' THEN 2
		WHEN Category = 'Stationary' THEN 3
		ELSE 
		Category 
        END AS Category_code
FROM amazonsales
WHERE Country IN ("UK", "India", "USA")

)
SELECT * FROM cte_amazonsales WHERE Category_code IN (0,1,3) ;