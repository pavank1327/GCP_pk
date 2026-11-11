DROP DATABASE IF EXISTS sqljoins;

CREATE DATABASE sqljoins;

use sqljoins;

# INNER LEFT RIGH FULL CROSS 

-- Table 1
CREATE TABLE T1 (
    ID INT NULL
);


select * from T1;

INSERT INTO T1 (ID) VALUES
    (1), (1), (1), (2), (2),
    (3), (4), (4), (4), (NULL);

select * from T1;    
    
SELECT ID FROM T1;

-- Table 2
CREATE TABLE T2 (
    ID INT NULL
);

INSERT INTO T2 (ID) VALUES
    (1), (1), (2), (2),
    (NULL), (NULL), (NULL), (4), (4),(5);

select * from T2;

SELECT ID FROM T2;

truncate table T2;


SELECT 
T1.id AS T1_id,
T2.id T2_id
FROM T1 
INNER JOIN T2 ON T1.id = T2.id;

SELECT 
T1.id AS T1_id,
T2.id T2_id
FROM T1 
LEFT JOIN T2 ON T1.id = T2.id;


SELECT 
T1.id AS T1_id,
T2.id T2_id
FROM T1 
RIGHT JOIN T2 ON T1.id = T2.id;

SELECT 
T1.id AS T1_id,
T2.id T2_id
FROM T1 
FULL JOIN T2 ON T1.id = T2.id;

SELECT 
T1.id AS T1_id,
T2.id T2_id
FROM T1 
CROSS JOIN T2 ON T1.id = T2.id;