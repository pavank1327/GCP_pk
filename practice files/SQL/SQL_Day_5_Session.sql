DROP DATABASE IF EXISTS SQLDAY5;

CREATE DATABASE SQLDAY5;

use SQLDAY5;

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

INSERT INTO amazonsales 
(Transaction_ID, Customer_ID, Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country, Date) VALUES
('T001', 'C101', 'Brian Gardner', '2318783966', 'stonecheryl@johnson.com', 'Mobile', 'Electronics', 3, 50, 150, 'UK', '2025-09-01'),
('T002', 'C102', 'Bryan Frederick', '4248889953', 'emily80@yahoo.com', 'Watch', 'Fashion', 5, 300, 1500, 'UK', '2025-08-31'),
('T003', 'C103', 'Joseph Burke', '8382452503', 'john12@ward.com', 'Tablet', 'Electronics', 3, 150, 450, 'UK', '2025-09-01'),
('T004', 'C104', 'Sarah Roberts', '5722560061', 'mitchellangelica@smith-hall.com', 'Tablet', 'Electronics', 3, 300, 900, 'UK', '2025-09-18'),
('T005', 'C105', 'Andrea Reese', '7982222146', 'brent01@davis-branch.com', 'Mobile', 'Electronics', 1, 100, 100, 'UK', '2025-09-09'),
('T006', 'C106', 'Rachel Brown', '3731861118', 'carlafrank@lee.org', 'Mobile', 'Electronics', 2, 200, 400, 'USA', '2025-09-19'),
('T007', 'C107', 'Ian Mason', '5063475513', 'michaelwarren@huber.com', 'Chair', 'Furniture', 1, 100, 100, 'Canada', '2025-09-06'),
('T008', 'C108', 'Larry Powell', '8493033739', 'mcphersonchristopher@smith.com', 'Laptop', 'Electronics', 1, 1200, 1200, 'UK', '2025-09-23'),
('T009', 'C109', 'Donald Anderson', '0110005207', 'loriwright@williams-ingram.net', 'Laptop', 'Electronics', 5, 500, 2500, 'India', '2025-09-07'),
('T010', 'C110', 'Molly Avila', '6227892543', 'douglas14@rivera-barber.com', 'Shoes', 'Fashion', 3, 600, 1800, 'USA', '2025-09-11'),
('T011', 'C111', 'Annette Torres', '2159051125', 'vphillips@armstrong.com', 'Book', 'Stationary', 2, 200, 400, 'Germany', '2025-09-05'),
('T012', 'C112', 'Christina Bell', '8571139477', 'kevinrichardson@yahoo.com', 'Tablet', 'Electronics', 4, 150, 600, 'Canada', '2025-09-16'),
('T013', 'C113', 'Jeremy Jensen', '6335409254', 'daniel02@yahoo.com', 'Shoes', 'Fashion', 1, 600, 600, 'USA', '2025-09-14'),
('T014', 'C114', 'James Watkins', '3364227041', 'brandon87@hotmail.com', 'Laptop', 'Electronics', 2, 1200, 2400, 'India', '2025-09-09'),
('T015', 'C115', 'Tiffany White', '7203438012', 'tonywalker@gmail.com', 'Chair', 'Furniture', 3, 300, 900, 'UK', '2025-09-12'),
('T016', 'C116', 'Anthony Martin', '5109408889', 'smithmichael@kim.com', 'Mobile', 'Electronics', 2, 400, 800, 'USA', '2025-09-10'),
('T017', 'C117', 'Elizabeth Scott', '2369403010', 'xrodriguez@yahoo.com', 'Shoes', 'Fashion', 2, 200, 400, 'Germany', '2025-09-17'),
('T018', 'C118', 'Patrick Lewis', '1409334225', 'anthony28@yahoo.com', 'Sofa', 'Furniture', 1, 1200, 1200, 'UK', '2025-09-02'),
('T019', 'C119', 'Emily Wood', '9327449810', 'shawn44@powers.com', 'Laptop', 'Electronics', 1, 800, 800, 'Canada', '2025-09-03'),
('T020', 'C120', 'Andrew Richards', '3018841134', 'michelle05@yahoo.com', 'Book', 'Stationary', 5, 100, 500, 'India', '2025-09-13');


SELECT * FROM amazonsales;

# Transaction_ID, Customer_ID, Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country, Date


select Total_Amount, Country FROM amazonsales; # DQL 

select 
Country,
SUM(Total_Amount) AS Total_Amount_sales
FROM amazonsales
group by Country
ORDER BY Total_Amount_sales desc;


SELECT 
Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = 'India';

SELECT 
Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = 'UK';

SELECT 
Customer_Name, Product, Category, Price, Country FROM amazonsales ;

SELECT 
Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = "UK";

SELECT 
Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Quantity = 3;


SELECT 
Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity = '1';

describe amazonsales;

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = 'India' and Category = 'Electronics' and Product = 'Laptop';

SELECT 
Country , Category, Product FROM amazonsales 
WHERE  Country = 'India';

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = 'India' and Category = 'Electronics' and Product = 'Mobile';

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = 'India' OR Category = 'Electronics' OR Product = 'Mobile';

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = "India" and Country ="UK" and Country = "USA";

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country = "India" or Country ="UK" or Country = "USA";

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country IN ('India','UK', 'USA');

SELECT Customer_Name, Product, Category, Price, Country FROM amazonsales 
WHERE  Country NOT IN ('India','UK', 'USA');

SELECT Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity = 3;



SELECT Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity < 3;

SELECT Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity > 3;

SELECT Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity <= 3;

SELECT Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity >= 3;

SELECT Customer_Name, Product, Category, Price, Country, Quantity FROM amazonsales 
WHERE  Quantity <> 3;

SELECT  Category
FROM amazonsales;

SELECT DISTINCT Category
FROM amazonsales;

SELECT DISTINCT Category, Product
FROM amazonsales;

SELECT * FROM amazonsales;

SELECT * FROM amazonsales
order by Quantity;

SELECT * FROM amazonsales
order by Price;

SELECT * FROM amazonsales
order by Price asc;

SELECT * FROM amazonsales
order by Price desc;

SELECT * FROM amazonsales
order by Product asc;

SELECT * FROM amazonsales
order by Product desc;

SELECT * FROM amazonsales;

SELECT * FROM amazonsales limit 9;


SELECT 
	Customer_Name, 
	Product, 
	Category , 
	Price, 
	Country 
FROM amazonsales;

SELECT 
	Customer_Name  AS full_Name, 
	Product AS  PROD, 
	Category AS catg , 
	Price AS  Amount , 
	Country AS  dfgfhfghfgdfhfghdf
FROM amazonsales;

SELECT 
	Customer_Name full_Name, 
	Product  PROD, 
	Category  catg , 
	Price  Amount , 
	Country dfgfhfghfgdfhfghdf
FROM amazonsales;

SELECT 
	full_Name, 
	PROD, 
	catg , 
	Amount , 
	Country 
FROM amazonsales;


SELECT  
    full_Name,  
    PROD,  
    catg,  
    Amount,  
    dfgfhfghfgdfhfghdf  
FROM (
    SELECT  
        Customer_Name AS full_Name,  
        Product AS PROD,  
        Category AS catg,  
        Price AS Amount,  
        Country AS dfgfhfghfgdfhfghdf  
    FROM amazonsales
) AS alias_table;

describe amazonsales;

select * from amazonsales where Customer_Phone is not null;

select count(*) from amazonsales where Customer_Phone is not null;

select count(*) from amazonsales;

INSERT INTO amazonsales 
(Transaction_ID, Customer_ID, Customer_Name, Customer_Phone, Customer_Email, Product, Category, Quantity, Price, Total_Amount, Country, Date) 
VALUES 
('T021', 'C102', 'Anita Rao', NULL, 'anita.rao@example.com', 'Laptop', 'Electronics', 1, 1200, 1200, 'India', '2026-04-07');

select * from amazonsales where Customer_Phone is null;

select count(*) as total_null_value_records 
from amazonsales where Customer_Phone is null;

select * from amazonsales;

select * from amazonsales where Customer_Email like '%yahoo.com';