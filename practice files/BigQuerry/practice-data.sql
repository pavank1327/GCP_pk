# Query to Create a Dataset in BigQuery

CREATE SCHEMA `your_project_id.new_dataset`
OPTIONS(
  location="US"
);

/*
Explanation:
your_project_id → replace with your actual GCP project ID.
new_dataset → the name of the dataset you want to create.
location → region where the dataset will be stored (e.g., "US", "EU", "asia-south1").

*/



# Delete a Dataset (and all its tables)
DROP SCHEMA `your_project_id.your_dataset` CASCADE;


INSERT INTO `practice_data.Customers` 
(Customer_ID, Cust_Name, Age, Gender, Mobile, Email)
VALUES
(1, 'Ramesh Kumar', 32, 'M', 9876543210, 'ramesh.kumar@email.com'),
(2, 'Priya Singh', 28, 'F', 9876501234, 'priya.singh@email.com'),
(3, 'Anil Verma', 41, 'M', 9845098765, 'anil.verma@email.com'),
(4, 'Meena Gupta', 36, 'F', 9811122233, 'meena.gupta@email.com'),
(5, 'Suresh Reddy', 50, 'M', 9888888888, 'suresh.reddy@email.com');




select * from practice_data.Customers;





CREATE TABLE practice_data.Accounts (
    Account_No    STRING(10),
    Customer_ID   STRING(10),
    Account_Type  STRING(20),
    Branch_ID     STRING(10),
    Balance       DECIMAL(12,2)
);

INSERT INTO `practice_data.Accounts`
(Account_No, Customer_ID, Account_Type, Branch_ID, Balance)
VALUES
('ACC001', 'CUST001', 'Savings', 'BR001', 15000.50),
('ACC002', 'CUST002', 'Current', 'BR002', 25000.00),
('ACC003', 'CUST003', 'Savings', 'BR003', 10000.75),
('ACC004', 'CUST004', 'Fixed Deposit', 'BR001', 500000.00),
('ACC005', 'CUST005', 'Savings', 'BR002', 7500.25);


select * from practice_data.Accounts;


drop table practice_data.Accounts;

drop table practice_data.Customers;