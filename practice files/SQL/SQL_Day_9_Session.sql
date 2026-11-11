DROP DATABASE IF EXISTS UNIONS;

CREATE database UNIONS;

use UNIONS;

CREATE TABLE employees_2025 (
    emp_id INT,
    emp_name VARCHAR(10),
    department VARCHAR(10)
);


INSERT INTO employees_2025 VALUES
(1, 'Satish', 'Data'),
(2, 'Rahul', 'Science'),
(3, 'Anita', 'DevOps');

SELECT * FROM employees_2025;


CREATE TABLE employees_2026 (
    emp_id INT,
    emp_name VARCHAR(10),
    department VARCHAR(10)
);


INSERT INTO employees_2026 VALUES
(3, 'Anita', 'DevOps'),
(4, 'Priya', 'Cloud'),
(5, 'Amit', 'Data');


SELECT * FROM employees_2025;

SELECT * FROM employees_2026;


SELECT
e25.*,e26.* 
FROM employees_2025 e25 
JOIN employees_2026 e26 
	WHERE e25.emp_id = e26.emp_id;
    
SELECT emp_id, emp_name, department FROM employees_2025
UNION ALL
SELECT emp_id, emp_name, department FROM employees_2026;

SELECT emp_id, emp_name, department FROM employees_2025
UNION
SELECT emp_id, emp_name, department FROM employees_2026;

SELECT emp_id, emp_name FROM employees_2025 # 2 SELECT 
UNION ALL
SELECT emp_id, emp_name, department FROM employees_2026; # 3 SELECT 

SELECT emp_id, emp_name FROM employees_2025 # 2 SELECT 
UNION
SELECT emp_id, emp_name, department FROM employees_2026; # 3 SELECT 

SELECT emp_id, emp_name FROM employees_2025 # 2 SELECT 
UNION ALL
SELECT emp_id, department FROM employees_2026; # 2 SELECT 

SELECT emp_id, emp_name FROM employees_2025 # 2 SELECT 
UNION
SELECT emp_id, department FROM employees_2026; # 2 SELECT 


DROP DATABASE IF EXISTS SQL_Practice_Questions;

CREATE database SQL_Practice_Questions;

USE SQL_Practice_Questions;

CREATE TABLE EMPY (
EMPNO int ,
ENAME VARCHAR(10),
JOB VARCHAR(9),
MGR int,
HIREDATE date,
SAL int,
COMM int,
DEPTNO int,
GRADE int
);

INSERT INTO EMPY (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, GRADE)
VALUES
(7369, 'SMITH', 'CLERK', 7902, CAST('1980-12-17' AS DATE), 800, NULL, 20, 5),
(7499, 'ALLEN', 'SALESMAN', 7698, CAST('1981-02-20' AS DATE), 1600, 300, 30, 3),
(7521, 'WARD', 'SALESMAN', 7698, CAST('1981-02-22' AS DATE), 1250, 500, 30, 4),
(7566, 'JONES', 'MANAGER', 7839, CAST('1981-04-02' AS DATE), 2975, NULL, 20, 2),
(7654, 'MARTIN', 'SALESMAN', 7698, CAST('1981-09-28' AS DATE), 1250, 1400, 30, 4),
(7698, 'BLAKE', 'MANAGER', 7839, CAST('1981-05-01' AS DATE), 2850, NULL, 30, 2),
(7782, 'CLARK', 'MANAGER', 7839, CAST('1981-06-09' AS DATE), 2450, NULL, 10, 2),
(7788, 'SCOTT', 'ANALYST', 7566, CAST('1982-12-09' AS DATE), 3000, NULL, 20, 1),
(7839, 'KING', 'PRESIDENT', NULL, CAST('1981-11-17' AS DATE), 5000, NULL, 10, 1),
(7844, 'TURNER', 'SALESMAN', 7698, CAST('1981-09-08' AS DATE), 1500, NULL, 30, 3),
(7876, 'ADAMS', 'CLERK', 7788, CAST('1983-01-12' AS DATE), 1100, NULL, 20, 4),
(7900, 'JAMES', 'CLERK', 7698, CAST('1981-12-03' AS DATE), 950, NULL, 30, 5),
(7902, 'FORD', 'ANALYST', 7566, CAST('1981-12-03' AS DATE), 3000, NULL, 20, 1),
(7934, 'MILLER', 'CLERK', 7782, CAST('1982-01-23' AS DATE), 1300, NULL, 10, 3);

SELECT * FROM EMPY;

CREATE TABLE DEPT (
DEPTNO INT,
DNAME VARCHAR(14),
LOC VARCHAR(13) );

INSERT INTO DEPT (DEPTNO, DNAME, LOC)
VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

SELECT * FROM DEPT;


# 1.Display all the information of the EMPY table? 

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, GRADE FROM EMPY;


# 1.Display all the information of the DEPT table? 

SELECT DEPTNO, DNAME, LOC FROM DEPT;

# 2.Display unique Jobs from EMPY table?
SELECT * FROM EMPY;

SELECT distinct JOB FROM EMPY;

SELECT distinct JOB FROM EMPY order by job;
