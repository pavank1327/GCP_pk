DROP DATABASE IF EXISTS SQLDAY7;

CREATE DATABASE SQLDAY7;

use SQLDAY7;

CREATE TABLE amazonsales (
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,   -- unique identifier for each sale
    Category VARCHAR(100) NOT NULL,           -- product category
    Country VARCHAR(100) NOT NULL,            -- country of sale
    Total_Amount DECIMAL(10,2) NOT NULL       -- sales amount
);


SELECT * FROM amazonsales;

INSERT INTO amazonsales (Category, Country, Total_Amount) VALUES
('Electronics', 'USA', 1200.50),
('Electronics', 'UK', 950.00),
('Electronics', 'India', 700.00),
('Electronics', 'Canada', 850.75),

('Books', 'USA', 300.00),
('Books', 'UK', 450.00),
('Books', 'India', 600.00),
('Books', 'Canada', 250.00),

('Clothing', 'USA', 1500.00),
('Clothing', 'UK', 1200.00),
('Clothing', 'India', 1800.00),
('Clothing', 'Canada', 1100.00),

('Home & Kitchen', 'USA', 2200.00),
('Home & Kitchen', 'UK', 1750.00),
('Home & Kitchen', 'India', 1950.00),
('Home & Kitchen', 'Canada', 2100.00),

('Sports', 'USA', 800.00),
('Sports', 'UK', 950.00),
('Sports', 'India', 1200.00),
('Sports', 'Canada', 700.00);


SELECT * FROM amazonsales;

SELECT 
Category
FROM amazonsales;


SELECT 
Category
FROM amazonsales
group by Category;

SELECT 
Category,
Total_Amount
FROM amazonsales
group by Category;

SELECT 
Category,
SUM(Total_Amount) AS Total_Amount
FROM amazonsales
group by Category;

SELECT 
Category,
AVG(Total_Amount) AS AVG_Amount
FROM amazonsales
group by Category;

SELECT 
Category,
MIN(Total_Amount) AS MIN_Amount
FROM amazonsales
group by Category;

SELECT 
Category,
MAX(Total_Amount) AS MAX_Amount
FROM amazonsales
group by Category;

SELECT 
Category,
COUNT(Total_Amount) AS COUNT_Amount
FROM amazonsales
group by Category;


-- --------------------------------------------------------------

/*
SELECT 
Category,
COUNT(Total_Amount) AS COUNT_Amount
FROM amazonsales
group by Category
WHERE COUNT(Total_Amount) >= 3;   
*/

-- throws error

-- if you want to filter based on the result of an aggregate (like COUNT), always use HAVING, not WHERE

SELECT 
Category,
COUNT(Total_Amount) AS COUNT_Amount
FROM amazonsales
group by Category
HAVING COUNT(Total_Amount) >= 3;   

-- ---------------------------------------------------------------

SELECT 
SUM(Total_Amount) AS Total_Amount
FROM amazonsales
WHERE Total_Amount > 500;

SELECT 
SUM(Total_Amount) AS Total_Amount
FROM amazonsales
WHERE Total_Amount > 500;

SELECT 
Category,
COUNT(Total_Amount) AS COUNT_Amount
FROM amazonsales
WHERE Total_Amount > 500
group by Category
HAVING COUNT(Total_Amount)  >= 3;


SELECT 
Category,
SUM(Total_Amount) AS Total_Amount
FROM amazonsales
group by Category;


SELECT 
Category,
SUM(Total_Amount) AS Total_Amount
FROM amazonsales
group by Category
HAVING SUM(Total_Amount) >=3000;

SELECT  Country, SUM(Total_Amount) AS Total_Sales_amount
FROM amazonsales
WHERE Country IN ('UK','Canada','India')
GROUP BY Country
HAVING SUM(Total_Amount) > 2000
ORDER BY Country ASC
LIMIT 1;

SELECT  Country, SUM(Total_Amount) AS Total_Sales_amount # STEP 5
FROM amazonsales # STEP 1
WHERE Country IN ('UK','Canada','India') # STEP 2 
GROUP BY Country # STEP 3
HAVING SUM(Total_Amount) > 2000 # STEP 4
ORDER BY Country ASC # STEP 5
LIMIT 1; # STEP 7



SELECT  * # STEP 3 
FROM amazonsales #   STEP 1 
WHERE Country IN ('UK','USA','India') ;#  STEP 2