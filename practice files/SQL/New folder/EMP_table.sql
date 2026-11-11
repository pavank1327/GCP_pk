use local;
# drop table if exists EMPY,DEPT;  works in workbench but not on DBeaver
drop table if exists EMPY;
drop table if exists DEPT;


-- Create Employee Table
use local;
create table EMPY (
    EMPNO INT,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT,
    DEPTNO INT,
    GRADE INT
);

select * from EMPY;

-- Insert EMPYloyee Data
insert into EMPY values
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
(7934, 'MILLER', 'CLERK', 7782, CAST('1982-01-23' AS DATE), 1300, NULL, 10, 3),
(8001, 'RAHUL', 'CLERK', 7902, CAST('1984-03-15' AS DATE), 1250, NULL, 25, 3),
(8002, 'PRIYA', 'ANALYST', 7566, CAST('1985-07-21' AS DATE), 2250, NULL, 25, 2),
(8003, 'ARUN', 'SALESMAN', 7698, CAST('1986-11-05' AS DATE), 3250, 500, 25, 4),
(8004, 'NEHA', 'MANAGER', 7839, CAST('1987-09-12' AS DATE), 4250, NULL, 25, 1),
(8005, 'VIJAY', 'CLERK', 7782, CAST('1988-01-30' AS DATE), 5250, NULL, 25, 5);




select * from EMPY;
select count(*) from EMPY;

-- Create Department Table
use local;
#drop table if exists DEPT;
create table DEPT (
    DEPTNO INT,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);

-- Insert Department Data
insert into DEPT values
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(25, 'MANUFACTURING', 'OKLAHOMA'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

select * from DEPT;
select count(*) from DEPT;


# Display unique Jobs from EMPY table?
select DISTINCT JOB from EMPY;

# List the EMPYs in the asc order of their Salaries 
select * from EMPY order by SAL ASC;

# List the details of the EMPYs in asc order of the Dptnos and desc of Jobs?
select * from EMPY order by DEPTNO ASC , JOB DESC;

# Display all the unique job groups in the descending order?
select DISTINCT JOB from EMPY order by JOB DESC;  

# Display all the details of all ‘Mgrs’
select * from  EMPY where JOB = "MANAGER";

#  List the EMPYs who joined before 1981
select * from  EMPY where HIREDATE < TO_DATE('01-JAN-1981','DD-MON-YYYY');  # using TODATE() not working in mysql
select * from EMPY where HIREDATE < '1981-01-01'; # direct date is not working, check CAST as date to work on date 
select * from EMPY where HIREDATE < cast('1981-01-01' as DATE);

#  List the EMPNO, Ename, Sal, Daily sal of all EMPYs in the asc order of Ann sal
describe EMPY;
select EMPNO,ENAME,SAL, (SAL * 12) as ANN_Sal, (sal / 30 ) as Daily_sal from  EMPY order by ANN_sal ASC; 


# Display the EMPNO, Ename, job, Hiredate, Exp of all Mgrs
select * from EMPY where JOB = 'MANAGER';
select HIREDATE from EMPY where JOB = 'MANAGER';
select HIREDATE,SYSDATE(), MONTHS_BETWEEN(SYSDATE(),HIREDATE) as total_exp_months from EMPY where JOB = 'MANAGER';
select HIREDATE,SYSDATE(), DATEDIFF(SYSDATE(),HIREDATE) as total_exp_months, 
floor(DATEDIFF(SYSDATE(),HIREDATE))/ 12 as total_exp_years from EMPY where JOB = 'MANAGER'; # SYSDATE() is not working

select HIREDATE,CURDATE(), DATEDIFF(CURDATE(),HIREDATE) as total_exp_months, 
floor(DATEDIFF(CURDATE(),HIREDATE))/ 12 as total_exp_years from EMPY where JOB = 'MANAGER'; # curdate() diff by 12 months is not working

select EMPNO, ENAME, JOB, HIREDATE,CURDATE(), DATEDIFF(CURDATE(),HIREDATE) / 30 as total_exp_months, 
floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years from EMPY where JOB = 'MANAGER'; # curdate() diff by 365 days is working

# List the EMPNO, Ename, Sal, Exp of all EMPYs working for Mgr 7369
select * from EMPY;

select EMPNO, ENAME, JOB, HIREDATE,CURDATE(), DATEDIFF(CURDATE(),HIREDATE) / 30 as total_exp_months, 
floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years from EMPY where MGR = '7369'; -- no records for the record no 7369

select EMPNO, ENAME, JOB, HIREDATE,CURDATE(), DATEDIFF(CURDATE(),HIREDATE) / 30 as total_exp_months, 
floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years from EMPY where MGR = '7839'; -- records for the record no 7839

# Display all the details of the EMPYs whose Comm. Is more than their Sal

select * from EMPY;
select * from EMPY where SAL < COMM;
select * from EMPY where COMM > SAL;

# . List the EMPYs in the asc order of Designations of those joined after the second halfof 1981
select * from EMPY where HIREDATE > '1981-07-01' order by JOB ASC;  -- after seocnd half of 1981
select * from EMPY where HIREDATE between '1981-07-01' and '1981-12-31' order by JOB ASC; -- only in second half of 1981

# List the EMPYs along with their Exp and Daily Sal is more than Rs.100
select floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years, 
(sal / 30) as Daily_Sal from EMPY where Daily_Sal > 100;   # need to check why this is not working


select *,floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years, 
(sal / 30) as Daily_Sal from EMPY where (sal / 30) > 100;         -- sql this don't work use in subquerry instead

select * from (select *,floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years, 
(sal / 30) as Daily_Sal from EMPY) as Daily_sal_cal where Daily_Sal > 100;   -- with sub-querry its working

#  List the EMPYs who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
Select * from EMPY;
select * from EMPY where JOB in ('CLERK', 'ANALYST')  order  by JOB desc;

#  List the EMPYs who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in ascorder of seniority
Select * from EMPY;
select EMPNO, ENAME, JOB, HIREDATE,CURDATE(), DATEDIFF(CURDATE(),HIREDATE) / 30 as total_exp_months, 
floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years from EMPY 
where HIREDATE IN ('1981-05-01','1981-12-03','1981-12-17','1980-01-19')
order by total_exp_years ASC;
select EMPNO, ENAME, JOB, HIREDATE,CURDATE(), DATEDIFF(CURDATE(),HIREDATE) / 30 as total_exp_months, 
floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as total_exp_years from EMPY 
where HIREDATE IN ('1981-05-01','1981-12-03','1981-12-17','1980-01-19')
order by total_exp_years desc;

# List the EMPY who are working for the Deptno 10 or20
select * from EMPY where DEPTNO IN (10, 20);

# List the EMPYs who are joined in the year 81
select count(*) from EMPY where HIREDATE between '1981-01-01' and '1981-12-31';
select count(*) from EMPY where year(HIREDATE) = 1981;  -- year() is working
select * from EMPY where year(HIREDATE) = 1981;

#  List the EMPYs who are joined in the month of Aug 1980
select * from EMPY where YEAR(HIREDATE) = 1980  AND MONTH(HIREDATE) = 8; -- do data with that date
select * from EMPY where YEAR(HIREDATE) = 1981  AND MONTH(HIREDATE) in (1,4,5);

# List the EMPYs Who Annual sal ranging from 22000 and 45000
select * from EMPY where (SAL * 12) BETWEEN 22000 AND 45000; -- can be written in sub-querry format if alias name is used 

# List the Enames those are having five characters in their Names
select ENAME from EMPY where LENGTH(ENAME) = 5;

#  List the Enames those are starting with ‘S’ and with five characters
select ENAME from EMPY where ENAME like 'S____';

-- 18. list the EMPYs who are joined in the month of aug 1980
select *
from EMPY
where year(HIREDATE) = 1980 and month(HIREDATE) = 8;

-- 19. list the EMPYs who annual sal ranging from 22000 and 45000
select *
from EMPY
where (SAL * 12) between 22000 and 45000;

-- 20. list the enames those are having five characters in their names
select ENAME
from EMPY
where len(ENAME) = 5;

-- 21. list the enames those are starting with ‘s’ and with five characters
select ENAME
from EMPY
where ENAME like 'S____';

-- 22. list the EMPYs those are having four chars and third character must be ‘r’
select ENAME
from EMPY
where len(ENAME) = 4 and substring(ENAME,3,1) = 'R';

-- 23. list the five character names starting with ‘s’ and ending with ‘h’
select ENAME
from EMPY
where ENAME like 'S___H';

-- 24. list the EMPYs who joined in january
select *
from EMPY
where month(HIREDATE) = 1;

-- 25. list the EMPYs who joined in the month of which second character is ‘a’
select *
from EMPY
where datename(month, HIREDATE) like '_a%';

-- 26. list the EMPYs whose sal is four digit number ending with zero
select *
from EMPY
where SAL between 1000 and 9999 and SAL % 10 = 0;

-- 27. list the EMPYs whose names having a character set ‘ll’ together
select ENAME
from EMPY
where ENAME like '%LL%';

-- 28. list the EMPYs those who joined in 80’s
select *
from EMPY
where year(HIREDATE) between 1980 and 1989;

-- 29. list the EMPYs who does not belong to deptno 20
select *
from EMPY
where DEPTNO <> 20;

-- 30. list all the EMPYs except ‘president’ & ‘mgr’ in asc order of salaries
select *
from EMPY
where JOB not in ('PRESIDENT','MANAGER')
order by SAL asc;

-- 31. list all the EMPYs who joined before or after 1981
select *
from EMPY
where year(HIREDATE) <> 1981;

-- 32. list the EMPYs whose EMPNO not starting with digit 78  ( convertion not working need to check )
select * from EMPY
where cast(EMPNO as varchar) not like '78%';  # varchar cast is not working

select * from EMPY
where cast(EMPNO as varchar(10)) not like '78%';

select * from EMPY
where convert(varchar(10), EMPNO) not like '78%';

select * from EMPY
where str(EMPNO) not like '78%';

select * from EMPY
where to_char(EMPNO) not like '78%';

select *
from EMPY
where left(convert(varchar(10), EMPNO),2) <> '78';

select * from EMPY where EMPNO not like '78%';   # this direct approach is working

select * from EMPY where cast(EMPNO as char) not like '78%'; # this char cast approach is working (varchar won't work)


-- 33. list the EMPYs who are working under ‘MGR’
select * from EMPY
where JOB = 'MANAGER';   # not this ( this gives manager , but need to get the details who are not empty and querently working under MGR)	 

select * from EMPY where MGR is not null;

-- 34. list the EMPYs who joined in any year but not belongs to the month of march
select *
from EMPY
where month(HIREDATE) <> 3;

-- 35. list all the clerks of deptno 20
select * from EMPY where JOB = 'CLERK' and DEPTNO = 20;

-- 36. list the EMPYs of deptno 30 or 10 joined in the year 1981
select * from EMPY where DEPTNO in (10,30) and year(HIREDATE) = 1981;

-- 37. display the details of smith
select * from EMPY where ENAME = 'SMITH';

-- 38. display the location of smith (requires dept table with location column)
select E.EMPNO, E.ENAME, D.LOC
from EMPY E
join DEPT D on E.DEPTNO = D.DEPTNO
where E.ENAME = 'SMITH';

/* 39. list the total information of EMP table along with DNAME and LOC 
of all the emps working under ‘ACCOUNTING’ & ‘RESEARCH’ in ascending DEPTNO */
select E.*, D.DNAME, D.LOC
from EMPY E
join DEPT D on E.DEPTNO = D.DEPTNO
where D.DNAME in ('ACCOUNTING','RESEARCH')
order by E.DEPTNO asc;

/* 40. list the EMPNO, ENAME, SAL, DNAME of all the ‘MGRS’ and ‘ANALYST’ 
working in New York, Dallas with an exp more than 7 years 
without receiving COMM, ascending order of LOC */
select E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC,
       datediff(year, E.HIREDATE, getdate()) as EXP_YEARS
from EMPY E
join DEPT D on E.DEPTNO = D.DEPTNO
where E.JOB in ('MANAGER','ANALYST')
  and D.LOC in ('NEW YORK','DALLAS')
  and datediff(year, E.HIREDATE, getdate()) > 7
  and (E.COMM is null or E.COMM = 0)
order by D.LOC asc;
 # datediff() won't work here with year() need to use days to get yer count
 
select E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC,
       floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) as EXP_YEARS
from EMPY E
join DEPT D on E.DEPTNO = D.DEPTNO
where E.JOB in ('MANAGER','ANALYST')
  and D.LOC in ('NEW YORK','DALLAS')
  and floor(DATEDIFF(CURDATE(),HIREDATE)/ 365) > 20
  and (E.COMM is null or E.COMM = 0)
order by D.LOC asc;


/* 41. display the EMPNO, ENAME, SAL, DNAME, LOC, DEPTNO, JOB of all emps
 working at CHICAGO or working for ACCOUNTING dept with annual SAL > 28000,
 but SAL should not be 3000 or 2800, who don’t belong to MGR
 and whose EMPNO has digit ‘7’ or ‘8’ in 3rd position,
 in ascending order of DEPTNO and descending order of JOB */
 
select E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC, E.DEPTNO, E.JOB
from EMPY E
join DEPT D on E.DEPTNO = D.DEPTNO
where (D.LOC = 'CHICAGO' or D.DNAME = 'ACCOUNTING')
  and (E.SAL * 12) > 28000
 # and E.SAL not in (3000, 2800)
  and E.JOB <> 'MANAGER'
  # and substring(cast(E.EMPNO as char),3,1) in ('7','8')
order by E.DEPTNO asc, E.JOB desc;

/* 42. display the total information of the emps along with grades in ascending order
 (assuming a SALGRADE table with columns GRADE, LOSAL, HISAL) */
 
select E.*, S.GRADE
from EMPY E
join SALGRADE S on E.SAL between S.LOSAL and S.HISAL
order by S.GRADE asc;   # need to create GRADE table to use join instead can use CASE

select E.*,
       case
           when SAL between 700 and 1200 then 1
           when SAL between 1201 and 1400 then 2
           when SAL between 1401 and 2000 then 3
           when SAL between 2001 and 3000 then 4
           when SAL between 3001 and 9999 then 5
           else null
       end as GRADE
from EMPY E
order by GRADE asc;


-- define a CTE that calculates grade once
with EmpGrades as (
    select E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, E.JOB, E.HIREDATE,
           case
               when SAL between 700 and 1200 then 1
               when SAL between 1201 and 1400 then 2
               when SAL between 1401 and 2000 then 3
               when SAL between 2001 and 3000 then 4
               when SAL between 3001 and 9999 then 5
           end as GRADE
    from EMPY E
)
-- 43. list all the grade 2 and grade 3 emps
select * from EmpGrades
where GRADE in (2,3) order by GRADE ASC;

-- 44. display all grade 4,5 analyst and mgr

with EmpGrades as (
    select E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, E.JOB, E.HIREDATE,
           case
               when SAL between 700 and 1200 then 1
               when SAL between 1201 and 1400 then 2
               when SAL between 1401 and 2000 then 3
               when SAL between 2001 and 3000 then 4
               when SAL between 3001 and 9999 then 5
           end as GRADE
    from EMPY E
)

select * from EmpGrades
where 
#JOB in ('ANALYST','MANAGER') and 
GRADE in (4,5) order by GRADE ASC;

-- 45. list the EMPNO, ENAME, SAL, DNAME, GRADE, EXP, and annual SAL of emps working for dept 10 or 20
select EG.EMPNO, EG.ENAME, EG.SAL, D.DNAME, EG.GRADE,
       datediff(year, EG.HIREDATE, getdate()) as EXP,
       (EG.SAL * 12) as ANN_SAL
from EmpGrades EG
join DEPT D on EG.DEPTNO = D.DEPTNO
where EG.DEPTNO in (10,20);


/* 
46. List all the information of emp with Loc and the Grade of all the emps
belong to the Grade range from 2 to 4 working at the Dept those are
not starting with char set ‘OP’ and not ending with ‘S’ with the
designation having a char ‘a’ any where joined in the year 1981 but
not in the month of Mar or Sep and Sal not end with ‘00’ in the asc
order of Grades  */

-- works with getting GRADES through CTE
use local;
with EmpGrades as (
    select E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, E.JOB, E.HIREDATE,
           case
               when SAL between 700 and 1200 then 1
               when SAL between 1201 and 1400 then 2
               when SAL between 1401 and 2000 then 3
               when SAL between 2001 and 3000 then 4
               when SAL between 3001 and 9999 then 5
           end as GRADE
    from EMPY E
)

select E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO, D.DNAME, D.LOC, E.GRADE
from EMPY E
join DEPT D on E.DEPTNO = D.DEPTNO
where E.GRADE between 2 and 4
  and D.DNAME not like 'OP%'   -- not starting with OP
  and D.DNAME not like '%S'    -- not ending with S
  and E.JOB like '%a%'         -- designation has 'a'
  and year(E.HIREDATE) = 1981
  and month(E.HIREDATE) not in (3,9)   -- not March or September
  and cast(E.SAL as char) not like '%00'  -- salary not ending with 00
order by E.GRADE asc;

-- using CTE , the date is given tempararily , need to find a way to make out put data permenant


# 47. List the details of the Depts along with Empno, Ename or without the emps
use local;
describe EMPY; 
describe DEPT;

use local;
select d.DEPTNO, d.DNAME, d.LOC, e.EMPNO, e.ENAME
from DEPT d
left outer join EMPY e on d.DEPTNO = e.DEPTNO;

/* 48. List the details of the emps whose Salaries more than the employee BLAKE.
 can get using subquerry */
 
select * from EMPY where SAL > (select SAL from EMPY where ENAME = 'BLAKE');
select SAL from EMPY where ENAME = 'BLAKE';


# find employees with any empty (NULL) field

select * from EMPY
where EMPNO is null
   or ENAME is null
   or JOB is null
   or MGR is null
   or HIREDATE is null
   or SAL is null
   or COMM is null
   or DEPTNO is null;

# 49. List the emps whose Jobs are same as ALLEN.
select *
from EMPY
where JOB = (select JOB from EMPY where ENAME = 'ALLEN');

# 50. List the emps who are senior to King.
select *
from EMPY
where HIREDATE < (select HIREDATE from EMPY where ENAME = 'KING');

# 51. List the Emps who are senior to their own MGRS.

select e.EMPNO, e.ENAME, e.HIREDATE, e.MGR
from EMPY e
join EMPY m on e.MGR = m.EMPNO
where e.HIREDATE < m.HIREDATE;


# 52. List the Emps of Deptno 20 whose Jobs are same as Deptno10.
select * from EMPY
where DEPTNO = 20 
  and JOB in (select distinct JOB from EMPY where DEPTNO = 10);

# 53. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.
select * from EMPY
where SAL in (select SAL from EMPY where ENAME in ('FORD','SMITH'))
order by SAL desc;

# 54. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select * from EMPY
where JOB = (select JOB from EMPY where ENAME = 'MILLER')
   or SAL > (select SAL from EMPY where ENAME = 'ALLEN') ; #limit 5;


# 55. List the Emps whose Sal is > the total remuneration of the SALESMAN.
select * from EMPY
where SAL > (select sum(SAL + ifnull(COMM,0)) 
	from EMPY where JOB = 'SALESMAN');

# 56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON.

select HIREDATE from EMPY where ENAME = 'BLAKE';
#Senior to:
select e.* from EMPY e
join DEPT d on e.DEPTNO = d.DEPTNO
where e.HIREDATE < (select HIREDATE from EMPY where ENAME = 'BLAKE')
  and d.LOC in ('CHICAGO','BOSTON');

#junior to:
select e.* from EMPY e
join DEPT d on e.DEPTNO = d.DEPTNO
where e.HIREDATE > (select HIREDATE from EMPY where ENAME = 'BLAKE')
  and d.LOC in ('CHICAGO','BOSTON');
  
/* 57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and
RESEARCH whose Sal is more than ALLEN and exp more than
SMITH in asc order of EXP. */

# Senior to SMITH:
use local;
with EmpGrades as (
    select e.*, d.loc, d.DNAME, 
        case
            when e.sal between 700 and 1200 then 1
            when e.sal between 1201 and 1400 then 2
            when e.sal between 1401 and 2000 then 3
            when e.sal between 2001 and 3000 then 4
            when e.sal between 3001 and 9999 then 5
        end as SAL_GRADE
    from EMPY e
    join DEPT d on e.DEPTNO = d.DEPTNO
)

select *
from EmpGrades
where SAL_GRADE in (3,4)
  and DNAME in ('ACCOUNTING','RESEARCH')
  and sal > (select sal from EMPY where ename='ALLEN')
  and (hiredate < (select hiredate from EMPY where ename='SMITH'))
order by hiredate asc;

describe DEPT;

# Junior to SMITH:
use local;
with EmpGrades as (
    select e.*, d.loc, d.DNAME, 
        case
            when e.sal between 700 and 1200 then 1
            when e.sal between 1201 and 1400 then 2
            when e.sal between 1401 and 2000 then 3
            when e.sal between 2001 and 3000 then 4
            when e.sal between 3001 and 9999 then 5
        end as SAL_GRADE
    from EMPY e
    join DEPT d on e.DEPTNO = d.DEPTNO
)

select *
from EmpGrades
where SAL_GRADE in (3,4)
  and DNAME in ('ACCOUNTING','RESEARCH')
  and sal > (select sal from EMPY where ename='ALLEN')
  and (hiredate > (select hiredate from EMPY where ename='SMITH'))
order by hiredate asc;

# 58. List the emps whose jobs same as SMITH or ALLEN.
select * from EMPY
where JOB in (select JOB from EMPY where ENAME in ('SMITH','ALLEN'));

select * from EMPY
where JOB = (select JOB from EMPY where ENAME in ('SMITH','ALLEN')); # (= doesnot work with multiple row output)

/*59. Write a Query to display the details of emps whose Sal is same as of
Any jobs of deptno 10 those that are not found in deptno 20. */

select * from EMPY
where SAL in (select distinct SAL from EMPY where DEPTNO = 10)
and SAL not in (select distinct SAL from EMPY where DEPTNO = 20);


# 60. List of emps of emp1 who are not found in emp2.
USE local;
create table EMP1 (
    EMPNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    SAL INT
);

create table EMP2 (
    EMPNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    SAL INT
);

insert into EMP1 values
(101, 'SMITH', 'CLERK', 800),
(102, 'ALLEN', 'SALESMAN', 1600),
(103, 'WARD', 'SALESMAN', 1250),
(104, 'JONES', 'MANAGER', 2975),
(105, 'MARTIN', 'SALESMAN', 1250),
(106, 'BLAKE', 'MANAGER', 2850),
(107, 'CLARK', 'MANAGER', 2450);

insert into EMP2 values
(101, 'SMITH', 'CLERK', 800),
(103, 'WARD', 'SALESMAN', 1250),
(105, 'MARTIN', 'SALESMAN', 1250);


select * from EMP1;
select * from EMP2;

select * from EMP1
where EMPNO not in (select EMPNO from EMP2);


# 61. Find the highest sal of EMP table.
select max(SAL) as HIGHEST_SAL from EMPY;

# 62. Find details of highest paid employee.
select * from EMPY
where SAL = (select max(SAL) from EMPY);

# 63. Find the highest paid employee of sales department.

select * from EMPY
where DEPTNO = (select DEPTNO from DEPT where DNAME='SALES')
  and SAL = (
      select max(SAL) from EMPY
      where DEPTNO = (select DEPTNO from DEPT where DNAME='SALES')
  );

# 64. List the most recently hired emp of grade3 belongs to location CHICAGO.
use local;
with EmpGrades as (
    select e.*, d.loc,
        case
            when e.sal between 1401 and 2000 then 3
            else null
        end as hire_GRADE
    from EMPY e
    join DEPT d on e.DEPTNO = d.DEPTNO
)
select *
from EmpGrades
where hire_GRADE=3 and LOC='CHICAGO'
order by HIREDATE desc limit 1;

# 65. List the employees who are senior to most recently hired employee working under king.
select * from EMPY
where HIREDATE < (
    select max(HIREDATE) from EMPY
    where MGR = (select EMPNO from EMPY where ENAME='KING')
);

/* 66. List the details of the employee belongs to newyork with grade 3 to 5
except ‘PRESIDENT’ whose sal> the highest paid employee of
Chicago in a groupwhere there is manager and salesman not working
under king */

use local;
WITH EmpGrades AS (
    SELECT 
        e.*, 
        d.loc,
        CASE
            WHEN e.sal BETWEEN 1401 AND 2000 THEN 3
            WHEN e.sal BETWEEN 2001 AND 3000 THEN 4
            WHEN e.sal > 3000 THEN 5
        END AS newyork_grade
    FROM EMPY e
    JOIN DEPT d 
        ON e.DEPTNO = d.DEPTNO
)

SELECT *
FROM EmpGrades
WHERE loc = 'NEW YORK'
  AND newyork_grade BETWEEN 3 AND 5
  AND JOB <> 'PRESIDENT'
  AND SAL > (
      SELECT max(SAL)
      FROM EMPY e
      JOIN DEPT d 
           ON e.DEPTNO = d.DEPTNO
      WHERE d.LOC = 'CHICAGO'
  );

# 67. List the details of the senior employee belongs to 1981

select * from EMPY
where year(HIREDATE) = 1981
order by HIREDATE asc limit 1;  # using limit

select * from EMPY
where HIREDATE=(select min(HIREDATE) from EMPY where year(HIREDATE)=1981);

# 68. List the employees who joined in 1981 with the job same as the most seniorperson of the year 1981.
use local;
SELECT *
FROM EMPY
WHERE YEAR(HIREDATE) = 1981
AND JOB = (
    SELECT JOB
    FROM EMPY
    WHERE YEAR(HIREDATE) = 1981
    ORDER BY HIREDATE ASC
    LIMIT 1
);

# 69. List the most senior empl working under the king and grade is more than 3.
SELECT *
FROM EMPY
WHERE MGR = (
    SELECT EMPNO
    FROM EMPY
    WHERE ENAME = 'KING'
)
AND GRADE > 3
ORDER BY HIREDATE ASC
LIMIT 1;   # has employees less than grade 3, there are no employees greater than grade 3

# 70. Find the total sal given to the MGR.
SELECT SUM(SAL) AS TOTAL_MANAGER_SAL
FROM EMPY
WHERE JOB = 'MANAGER';


# 71. Find the total annual sal to distribute job wise in the year 81.
SELECT JOB,
       SUM(SAL * 12) AS TOTAL_ANNUAL_SAL
FROM EMPY
WHERE YEAR(HIREDATE) = 1981
GROUP BY JOB;


# 72. Display total sal employee belonging to grade 3.
SELECT SUM(SAL) AS TOTAL_SAL
FROM EMPY
WHERE GRADE = 3;

# 73. Display the average salaries of all the clerks.
SELECT AVG(SAL) AS AVG_CLERK_SAL
FROM EMPY
WHERE JOB = 'CLERK';


# 74. List the employeein dept 20 whose sal is >the average sal 0f dept 10 emps.
SELECT *
FROM EMPY
WHERE DEPTNO = 20
AND SAL > (
    SELECT AVG(SAL)
    FROM EMPY
    WHERE DEPTNO = 10
);

# 75. Display the number of employee for each job group deptno wise.
SELECT DEPTNO,JOB,COUNT(*) AS EMP_COUNT
FROM EMPY
GROUP BY DEPTNO,JOB;

# 76. List the manager no and the number of employees working for those mgrs in ascending oder of Mgrno.
SELECT MGR,
       COUNT(*) AS EMP_COUNT
FROM EMPY
WHERE MGR IS NOT NULL
GROUP BY MGR
ORDER BY MGR ASC;

SELECT MGR,
       COUNT(*) AS EMP_COUNT
FROM EMPY
WHERE MGR IS NULL
GROUP BY MGR
ORDER BY MGR ASC;  # there is one employee with NULL employer


# 77. List the department,details where at least two emps are working
SELECT d.*
FROM DEPT d
JOIN EMPY e
ON d.DEPTNO = e.DEPTNO
GROUP BY d.DEPTNO, d.DNAME, d.LOC
HAVING COUNT(*) >= 2;


# 78. Display the Grade, Number of emps, and max sal of each grade.
SELECT GRADE,
       COUNT(*) AS NO_OF_EMPS,
       MAX(SAL) AS MAX_SAL
FROM EMPY
GROUP BY GRADE;


# 79. Display dname, grade, No. of emps where at least two emps are clerks.
SELECT d.DNAME,
       e.GRADE,
       COUNT(*) AS NO_OF_EMPS
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'CLERK'
GROUP BY d.DNAME, e.GRADE
HAVING COUNT(*) >= 2;  

SELECT d.DNAME,
       e.GRADE,
       COUNT(*) AS NO_OF_EMPS
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'CLERK'
GROUP BY d.DNAME, e.GRADE
HAVING COUNT(*) >= 1;# there are records as two employees as CLERKS , there is only with one employee as CLERK

# 80. List the details of the department where maximum number of emps are working.
SELECT d.*
FROM DEPT d
JOIN EMPY e
ON d.DEPTNO = e.DEPTNO
GROUP BY d.DEPTNO, d.DNAME, d.LOC
ORDER BY COUNT(*) DESC
LIMIT 1;

# 81. Display the emps whose manager name is jones.
SELECT e.*,m.ENAME FROM EMPY e
JOIN EMPY m ON e.MGR = m.EMPNO
WHERE m.ENAME = 'JONES';

# 82. List the employees whose salary is more than 3000 after giving 20% increment.
SELECT *,SAL * 0.20 AS INCREMENTED_SAL
FROM EMPY
WHERE SAL * 0.20 > 3000;  # there no employee with more than 20% increment

SELECT  *,SAL * 0.20 AS INCREMENTED_SAL
FROM EMPY E
WHERE SAL * 0.20 < 3000;

SELECT COUNT(*)
FROM EMPY E
WHERE SAL * 0.20 < 3000;

SELECT * FROM (SELECT E.*,SAL * 0.20 AS INCREMENTED_SAL
FROM EMPY E) AS TEST
WHERE TEST.INCREMENTED_SAL < 3000;

SELECT COUNT(*) FROM (SELECT E.*,SAL * 0.20 AS INCREMENTED_SAL
FROM EMPY E) AS TEST
WHERE TEST.INCREMENTED_SAL < 3000;    # Other way of writing using Alias name

# 83. List the emps with dept names.
SELECT e.ENAME,
       e.JOB,
       e.SAL,
       d.DNAME
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO ORDER BY d.DEPTNO;

# 84. List the emps who are not working in sales dept.
SELECT * FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE d.DNAME <> 'SALES';

SELECT * FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE d.DNAME = 'SALES';  # working in SALES also

/*85. List the emps name ,dept, sal and comm. For those whose salary is
between 2000 and 5000 while loc is Chicago. */
SELECT e.ENAME,
       d.DNAME,
       e.SAL,
       e.COMM
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.SAL BETWEEN 2000 AND 5000
AND d.LOC = 'CHICAGO';

# 86. List the emps whose sal is greater than his managers salary
SELECT e.*
FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE e.SAL > m.SAL;

/*87. List the grade, EMP name for the deptno 10 or deptno 30 but sal
grade is not 4 while they joined the company before ’31-dec-82’. */
SELECT GRADE,ENAME FROM EMPY
WHERE DEPTNO IN (10,30)
AND GRADE <> 4
AND HIREDATE < '1982-12-31';

# 88. List the name ,job, dname, location for those who are working as MGRS.
SELECT e.ENAME,e.JOB,d.DNAME,d.LOC
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'MANAGER';

# 89. List the emps whose mgr name is jones and also list their manager name.
SELECT e.ENAME AS EMPLOYEE,
       m.ENAME AS MANAGER
FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE m.ENAME = 'JONES';

# 90. List the name and salary of ford if his salary is equal to HIGH sal of his grade.
SELECT ENAME,SAL
FROM EMPY
WHERE ENAME = 'FORD'
AND SAL = (
    SELECT MAX(SAL)
    FROM EMPY
    WHERE GRADE = (
        SELECT GRADE
        FROM EMPY
        WHERE ENAME = 'FORD'
    )
);   # need to check this querry , i have a dought

# 91. List the name, job, dname, sal, grade dept wise
SELECT e.ENAME,e.JOB,d.DNAME,e.SAL,e.GRADE
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
ORDER BY d.DEPTNO;

# 92. List the emp name, job, sal, grade and dname except clerks and sort on the basis of highest sal
SELECT e.ENAME,e.JOB,e.SAL,e.GRADE,d.DNAME
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE e.JOB <> 'CLERK'
ORDER BY e.SAL DESC;

# 93. List the emps name, job who are without manager
SELECT ENAME,JOB
FROM EMPY
WHERE MGR IS NULL;


# 94. List the names of the emps who are getting the highest sal dept wise
SELECT * FROM EMPY e
WHERE SAL = (
    SELECT MAX(SAL)
    FROM EMPY
    WHERE DEPTNO = e.DEPTNO
);

# 95. List the emps whose sal is equal to the average of max and minimum
SELECT * FROM EMPY
WHERE SAL = (
    SELECT (MAX(SAL) + MIN(SAL)) / 2
    FROM EMPY
);
 # There is norecord with SAL = Avg of MAX and MIN SAL 
SELECT * FROM EMPY
WHERE SAL = (
    SELECT (MAX(SAL) + MIN(SAL)) / 2
    FROM EMPY
);

# There is no record with SAL not equal to Avg of MAX and MIN SAL 

SELECT * FROM EMPY
WHERE SAL < (
    SELECT (MAX(SAL) + MIN(SAL)) / 2
    FROM EMPY
);


SELECT * FROM EMPY
WHERE SAL > (
    SELECT (MAX(SAL) + MIN(SAL)) / 2
    FROM EMPY
);

# so checked < and > , there are records

# 96. List the no. of emps in each department where the no. is more than 3
SELECT DEPTNO,COUNT(*) AS EMP_COUNT
FROM EMPY
GROUP BY DEPTNO
HAVING COUNT(*) > 3;

# 97. List the names of depts where at least 3 are working in that department
SELECT d.DNAME
FROM DEPT d
JOIN EMPY e
ON d.DEPTNO = e.DEPTNO
GROUP BY d.DNAME
HAVING COUNT(*) >= 3;

# 98. List the managers whose sal is more than his employees avg salary
SELECT m.ENAME,
       m.SAL
FROM EMPY m
WHERE m.EMPNO IN (
    SELECT DISTINCT MGR
    FROM EMPY
    WHERE MGR IS NOT NULL
)
AND m.SAL > (
    SELECT AVG(e.SAL)
    FROM EMPY e
    WHERE e.MGR = m.EMPNO
);

# 99. List the name, salary, comm for those employees whose net pay is greater than or equal to any other employee salary of the company
SELECT ENAME,SAL,COMM,
       SAL + IFNULL(COMM,0) AS NET_PAY
FROM EMPY
WHERE SAL + IFNULL(COMM,0) >= ANY ( SELECT SAL FROM EMPY);

SELECT * FROM (SELECT ENAME,SAL,COMM,
       SAL + IFNULL(COMM,0) AS NET_PAY
FROM EMPY ) AS N_P
WHERE N_P.NET_PAY >= ANY ( SELECT SAL FROM EMPY);    # BOTH ARE NOT SAME need to study this

# 100. List the emp whose sal < his manager but more than any other manager
SELECT e.* FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE e.SAL < m.SAL
AND e.SAL > ANY (
    SELECT SAL
    FROM EMPY
    WHERE JOB = 'MANAGER'
);

# 101. List the employee names and his average salary department wise
SELECT e.ENAME,e.DEPTNO,
       (
         SELECT AVG(SAL)
         FROM EMPY
         WHERE DEPTNO = e.DEPTNO
       ) AS AVG_DEPT_SAL
FROM EMPY e;

# 102. Find out least 5 earners of the company
SELECT * FROM EMPY
ORDER BY SAL ASC LIMIT 5;

# 103. Find out emps whose salaries greater than salaries of their managers
-- 103. Employees whose salary is greater than their manager's salary
SELECT e.* FROM EMPY e
JOIN EMPY m ON e.MGR = m.EMPNO
WHERE e.SAL > m.SAL;

# 104. List the managers who are not working under the president
SELECT * FROM EMPY
WHERE JOB = 'MANAGER'
AND MGR <> (
    SELECT EMPNO FROM EMPY
    WHERE JOB = 'PRESIDENT'
); # no details Managers who are not working under the PRESIDENT need to check data once

# 105. List the records from emp whose deptno is not in dept
SELECT * FROM EMPY
WHERE DEPTNO NOT IN (
    SELECT DEPTNO FROM DEPT
); # no details for the condition need to check data

# 106. List the Name, Salary, Comm and Net Pay is more than any other employee
SELECT ENAME,SAL,COMM,
       SAL + IFNULL(COMM,0) AS NET_PAY
FROM EMPY
WHERE SAL + IFNULL(COMM,0) > ANY (
    SELECT SAL FROM EMPY
);

# 107. List the Enames who are retiring after 31-Dec-89 the max Job period is 20Y
SELECT ENAME,HIREDATE,
       DATE_ADD(HIREDATE, INTERVAL 20 YEAR) AS RETIRE_DATE
FROM EMPY
WHERE DATE_ADD(HIREDATE, INTERVAL 20 YEAR) > '1989-12-31';	

SELECT * FROM (SELECT ENAME,HIREDATE,
       DATE_ADD(HIREDATE, INTERVAL 20 YEAR) AS RETIRE_DATE
FROM EMPY ) AS RD
WHERE RD.RETIRE_DATE > '1989-12-31';

# 108. List those Emps whose Salary is odd value
SELECT * FROM EMPY
WHERE MOD(SAL,2) <> 0;

SELECT * FROM EMPY
WHERE sal % 2 <> 0;

# 109. List the emp’s whose Salary contain 3 digits
SELECT * FROM EMPY
WHERE SAL BETWEEN 100 AND 999;

# 110. List the emps who joined in the month of DEC
use local;
SELECT * FROM EMPY WHERE MONTH(HIREDATE) = 12;
SELECT * FROM EMPY WHERE MONTH(HIREDATE) <> 12;

# 111. List the emps whose names contains ‘A’
SELECT * FROM EMPY WHERE ENAME LIKE '%A%';

# 112. List the emps whose Deptno is available in his Salary
use local;
UPDATE EMPY SET DEPTNO = 25
WHERE SAL BETWEEN 1000 AND 9999 
  AND CAST(SAL AS CHAR) LIKE '_25_';   # it's in safemode check about it once , can remove safe mode and execute
  
# otherwise use sub querry

use local;
UPDATE EMPY SET DEPTNO = 25
WHERE EMPNO IN (
    SELECT EMPNO FROM EMPY
    WHERE SAL BETWEEN 1000 AND 9999
      AND CAST(SAL AS CHAR) LIKE '_25_'
);

select * from EMPY;

SELECT * FROM EMPY
WHERE CAST(SAL AS CHAR) LIKE CONCAT('%', DEPTNO, '%');

SELECT * FROM EMPY
WHERE CAST(SAL AS CHAR) LIKE DEPTNO;

SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,E.DEPTNO,D.DNAME,D.LOC
FROM EMPY E
JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
WHERE E.SAL BETWEEN 1000 AND 9999
  AND CAST(E.SAL AS CHAR) LIKE '_25_'
  AND E.DEPTNO = 25;

USE local;
SELECT * FROM EMPY WHERE SAL LIKE CONCAT('%',DEPTNO,'%');

SELECT * FROM EMPY WHERE INSTR(CAST(SAL AS CHAR),CAST(DEPTNO AS CHAR))>0;

# 113. List the emps whose first 2 chars from Hiredate = last 2 characters of Salary
SELECT * FROM EMPY WHERE SAL IN (1823 AND 2319);
SELECT * FROM EMPY WHERE SAL = 2319;

use local;
SELECT * FROM EMPY
WHERE LEFT(YEAR(HIREDATE),2) = RIGHT(SAL,2);
# no data found so inserting test record to check table
use local;
INSERT INTO EMPY VALUES
(8006, 'RAJESH', 'CLERK', 7902, CAST('1981-06-15' AS DATE), 2319, NULL, 10, 3),
(8009, 'RAkESH', 'ASST', 7902, CAST('1981-07-15' AS DATE), 1823, NULL, 10, 3);

# now we are getting data  and also new records not shown check it again

# 114. List the emps whose 10% of Salary is equal to year of joining
SELECT * FROM EMPY WHERE SAL * 0.10 = YEAR(HIREDATE);

# 115. List first 50% of chars of Ename in Lower Case and remaining are upper Case
SELECT ENAME,
CONCAT(
    LOWER(LEFT(ENAME, FLOOR(LENGTH(ENAME)/2))),
    UPPER(RIGHT(ENAME, LENGTH(ENAME) - FLOOR(LENGTH(ENAME)/2)))
) AS FORMATTED_NAME
FROM EMPY;

# 116. List the Dname whose No. of Emps is = to number of chars in the Dname
SELECT d.DNAME FROM DEPT d
JOIN EMPY e ON d.DEPTNO = e.DEPTNO
GROUP BY d.DNAME
HAVING COUNT(*) = LENGTH(d.DNAME);  # there is no data with length = DNAME

SELECT d.DNAME
FROM DEPT d
JOIN EMPY e ON d.DEPTNO = e.DEPTNO
GROUP BY d.DNAME
HAVING COUNT(*) <> LENGTH(d.DNAME); # getting some data with not equals DNAME

# 117. List the emps those who joined in company before 15th of the month
SELECT * FROM EMPY WHERE DAY(HIREDATE) < 15;

# 118. List the Dname, no of chars of which is = no. of emp’s in any other Dept
SELECT d.DNAME
FROM DEPT d
WHERE LENGTH(d.DNAME) IN (
    SELECT COUNT(*) FROM EMPY
    GROUP BY DEPTNO
);

# 119. List the emps who are working as Managers
SELECT * FROM EMPY WHERE JOB = 'MANAGER';

# 120. List the Name of dept where highest no. of emps are working
SELECT d.DNAME FROM DEPT d
JOIN EMPY e ON d.DEPTNO = e.DEPTNO
GROUP BY d.DNAME
ORDER BY COUNT(*) DESC
LIMIT 1;

# 121. Count the No.of emps who are working as ‘Managers’(using set option).
SELECT COUNT(*) AS MANAGER_COUNT FROM EMPY
WHERE JOB = 'MANAGER';

# 122. List the emps who joined in the company on the same date.
SELECT * FROM EMPY
WHERE HIREDATE IN (
    SELECT HIREDATE     FROM EMPY
    GROUP BY HIREDATE
    HAVING COUNT(*) > 1
    ORDER BY HIREDATE
);

# 123. List the details of the emps whose Grade is equal to one tenth of Sales Dept.
SELECT * FROM EMPY
WHERE GRADE = (
    SELECT COUNT(*) / 10
    FROM EMPY
    WHERE DEPTNO = (
        SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'
    ) 
);   #there is no date for grade equal values

SELECT * FROM EMPY
WHERE GRADE <> (
    SELECT COUNT(*) / 10
    FROM EMPY
    WHERE DEPTNO = (
        SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'
    )
);

# 124. List the name of the dept where more than average no. of emps are working.
SELECT d.DNAME, COUNT(*) AS EMP_COUNT
FROM EMPY e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
GROUP BY d.DNAME
HAVING COUNT(*) >
(
    SELECT AVG(emp_count)
    FROM
    (
        SELECT COUNT(*) AS emp_count
        FROM EMPY
        GROUP BY DEPTNO
    ) x
);

# 125. List the Managers name who is having max no.of emps working under him.
use local;
SELECT m.ENAME, COUNT(*) AS NO_OF_EMPS
FROM EMPY e
JOIN EMPY m ON e.MGR = m.EMPNO
GROUP BY m.ENAME
ORDER BY COUNT(*) DESC
LIMIT 1;

# 126. List the Ename and Sal is increased by 15% and expressed as no.of Dollars.
SELECT ENAME, CONCAT('$ ', ROUND(SAL * 1.15,2)) AS INCREASED_SALARY FROM EMPY;

# 127. Produce the output of EMP table ‘EMP_AND_JOB’ for Ename and Job.
SELECT CONCAT(ENAME,'_',JOB) AS EMP_AND_JOB FROM EMPY;

/* 128. Produce the following output from EMP.
     EMPLOYEE
     SMITH(clerk)
     ALLEN
     (Salesman) */
SELECT CONCAT(ENAME,'(',LOWER(JOB),')') AS EMPLOYEE FROM EMPY;

#129. same detail with date of joining and experience.
USE local;

SELECT 
    CONCAT(ENAME, '(', LOWER(JOB), ')') AS EMPLOYEE,
    HIREDATE,
    FLOOR(DATEDIFF(SYSDATE(), HIREDATE) / 365) AS TOTAL_EXP_YEARS
FROM EMPY;

# 130. List the emps with Hire date in format June 4, 1988.
SELECT ENAME,
       DATE_FORMAT(HIREDATE,'%M %e, %Y') AS FORMATTED_DATE
FROM EMPY;

/* 131. Print a list of emp’s Listing ‘just salary’ if Salary is more than 1500,
on target if Salary is 1500 and ‘Below 1500’ if Salary is less than 1500. */
SELECT ENAME,
CASE
    WHEN SAL > 1500 THEN 'Just Salary'
    WHEN SAL <= 1500 THEN 'On Target'
    ELSE 'Below 1500'
END AS STATUS
FROM EMPY;

# 132. Write a query which return the day of the week for any date entered in format ‘DD-MM-YY’.
SELECT DAYNAME(STR_TO_DATE('13-04-97','%d-%m-%y')) AS DAY_NAME;

/* 133. Write a query to calculate the length of service of any employee with the company,
     use DEFINE to avoid repetitive typing of functions.*/
/* 134. Give a string of format ‘NN/NN’, verify that the first and last two characters are numbers
      and that the middle character is ‘/’. Print the expression ‘YES’ if valid, ‘NO’ if not valid.
      Use the following values to test your solution. ‘12/34’, ‘01/1a’, ‘99/98’.*/
/* 135. Emps hired on or before 15th of any month are paid on the last Friday of that month,
     those hired after 15th are paid on the first Friday of the following month. 
     Print a list of emps their hire date and the first pay date. Sort on hire date. */
# 136. Count the no. of characters without considering spaces for each name.
# 137. Find out the emps who are getting decimal value in their Sal without using like operator.
SELECT * FROM EMPY
WHERE SAL <> FLOOR(SAL);

# 138. List those emps whose Salary contains first four digit of their Deptno.
SELECT * FROM EMPY
WHERE CAST(SAL AS CHAR)
LIKE CONCAT('%',DEPTNO,'%');

# 139. List those Managers who are getting less than his emps Salary.
SELECT DISTINCT m.*
FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE m.SAL < e.SAL;

# 140. Print the details of all the emps who are sub-ordinates to Blake.
SELECT * FROM EMPY
WHERE MGR =
(
    SELECT EMPNO
    FROM EMPY
    WHERE ENAME='BLAKE'
);


-- 141) List the emps who are working as Managers using co-related sub query.
SELECT * FROM EMPY e
WHERE EXISTS
(
    SELECT 1
    FROM EMPY x
    WHERE x.MGR = e.EMPNO
);

-- 142) List the emps whose Mgr name is ‘Jones’ and also with his Manager name.
SELECT e.ENAME AS EMPLOYEE,
       m.ENAME AS MANAGER
FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE m.ENAME = 'JONES';

/* 143) Define a variable representing the expression used to calculate on emps total annual remuneration use the variable in a statement, 4
 which finds all emps who can earn 30000 a year or more. */
SELECT ENAME,SAL,COMM,
       (SAL*12 + IFNULL(COMM,0)*12) AS ANNUAL_REMUNERATION
FROM EMPY
WHERE (SAL*12 + IFNULL(COMM,0)*12) >= 30000; # greater than or equals

SELECT ENAME,SAL,COMM,
       (SAL*12 + IFNULL(COMM,0)*12) AS ANNUAL_REMUNERATION
FROM EMPY
WHERE (SAL*12 + IFNULL(COMM,0)*12) < 30000; # less than

-- 144) Find out how may Managers are their in the company.
SELECT COUNT(*) AS MANAGER_COUNT
FROM EMPY
WHERE JOB='MANAGER';

-- 145) Find Average salary and Average total remuneration for each Job type. Remember Salesman earn commission.
SELECT JOB,
       AVG(SAL) AS AVG_SALARY,
       AVG(SAL + IFNULL(COMM,0)) AS AVG_REMUNERATION
FROM EMPY
GROUP BY JOB;

-- 146) Check whether all the emps numbers are indeed unique.
SELECT EMPNO, COUNT(*)
FROM EMPY
GROUP BY EMPNO
HAVING COUNT(*) > 1;  # no data means there is no comman no more than 1

-- 147) List the emps who are drawing less than 1000 Sort the output by Salary.
SELECT * FROM EMPY
WHERE SAL < 1000
ORDER BY SAL;

-- 148) List the employee Name, Job, Annual Salary, deptno, Dept name and grade who earn 36000 a year or who are not CLERKS.
SELECT e.ENAME,
       e.JOB,
       e.SAL*12 AS ANNUAL_SALARY,
       e.DEPTNO,
       d.DNAME,
       e.GRADE
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE e.SAL*12 >= 36000
OR e.JOB <> 'CLERK';

-- 149) Find out the Job that was filled in the first half of 1983 and same job that was filled during the same period of 1984.
SELECT DISTINCT JOB
FROM EMPY
WHERE HIREDATE BETWEEN '1983-01-01' AND '1983-06-30'
AND JOB IN
(
    SELECT JOB
    FROM EMPY
    WHERE HIREDATE BETWEEN '1984-01-01' AND '1984-06-30'
);
# need to check of there is another way to get the data


-- 150) Find out the emps who joined in the company before their Managers.
SELECT e.*
FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE e.HIREDATE < m.HIREDATE;

-- 151) List all the emps by name and number along with their Manager’s name and number. Also List KING who has no ‘Manager’.
SELECT e.EMPNO,
       e.ENAME,
       m.EMPNO AS MGR_NO,
       IFNULL(m.ENAME,'NO MANAGER') AS MANAGER_NAME
FROM EMPY e
LEFT JOIN EMPY m
ON e.MGR = m.EMPNO;  # need to check other way to get data

-- 152) Find all the emps who earn the minimum Salary for each job wise in ascending order.
SELECT * FROM EMPY e
WHERE SAL =
(
    SELECT MIN(SAL) FROM EMPY
    WHERE JOB=e.JOB
)
ORDER BY SAL;

-- 153) Find out all the emps who earn highest salary in each job type. Sort in descending salary order.
SELECT * FROM EMPY e 
WHERE SAL =
(
    SELECT MAX(SAL) FROM EMPY
    WHERE JOB=e.JOB
)
ORDER BY SAL DESC;
-- 154) Find out the most recently hired emps in each Dept order by Hiredate.
SELECT * FROM EMPY e
WHERE HIREDATE =
(
    SELECT MAX(HIREDATE) FROM EMPY
    WHERE DEPTNO=e.DEPTNO
)
ORDER BY HIREDATE;

/* 155) List the employee name, Salary and Deptno for each employee who earns a salary greater than 
the average for their department order by Deptno.*/
SELECT ENAME,SAL,DEPTNO
FROM EMPY e
WHERE SAL >
(
    SELECT AVG(SAL) FROM EMPY
    WHERE DEPTNO=e.DEPTNO
)
ORDER BY DEPTNO;

-- 156) List the Deptno where there are no emps.
SELECT * FROM DEPT
WHERE DEPTNO NOT IN
(
    SELECT DISTINCT DEPTNO
    FROM EMPY
);

-- 157) List the No.of emp’s and Avg salary within each department for each job, sort by deptno and job.
SELECT DEPTNO,JOB,
       COUNT(*) AS EMP_COUNT,
       AVG(SAL) AS AVG_SAL
FROM EMPY GROUP BY DEPTNO, JOB;

SELECT DEPTNO,JOB,
       COUNT(*) AS EMP_COUNT,
       FLOOR(AVG(SAL)) AS AVG_SAL 
FROM EMPY GROUP BY DEPTNO, JOB; # removing decimals (there are 0's here)

-- 158) Find the maximum average salary drawn for each job except for ‘President’.
SELECT JOB,AVG(SAL) AS AVG_SAL
FROM EMPY
WHERE JOB <> 'PRESIDENT'
GROUP BY JOB
ORDER BY AVG_SAL DESC;

-- 159) Find the name and Job of the emps who earn Max salary and Commission.
SELECT ENAME, JOB FROM EMPY
WHERE SAL = (SELECT MAX(SAL) FROM EMPY)
AND IFNULL(COMM,0) = (SELECT MAX(IFNULL(COMM,0)) FROM EMPY); # no record with both max sal whichhas comission

SELECT * FROM EMPY
WHERE SAL = (SELECT MAX(SAL) FROM EMPY);  # checking the records to get max salary with commission values

SELECT ENAME, JOB FROM EMPY
WHERE SAL = (SELECT MAX(SAL) FROM EMPY)
OR IFNULL(COMM,0) = (SELECT MAX(IFNULL(COMM,0)) FROM EMPY); 

# try and get both the values with union

SELECT ENAME, JOB FROM EMPY
WHERE SAL = (SELECT MAX(SAL) FROM EMPY)
UNION
SELECT ENAME, JOB FROM EMPY
WHERE IFNULL(COMM,0) = (SELECT MAX(IFNULL(COMM,0)) FROM EMPY); 

/* 160) List the Name, Job and Salary of the emps who are not belonging to the department 10 
but who have the same job and Salary as the emps of dept 10. */
SELECT * FROM EMPY e
WHERE DEPTNO <> 10
AND (JOB,SAL) IN (SELECT JOB,SAL FROM EMPY WHERE DEPTNO=10); # no related data - need to check again

SELECT * FROM EMPY e
WHERE DEPTNO = 10
AND (JOB,SAL) IN (SELECT JOB,SAL FROM EMPY WHERE DEPTNO=10);

-- 161) List the Deptno, Name, Job, Salary and Sal+Comm of the SALESMAN who are earning maximum salary and commission in descending order.
SELECT DEPTNO,ENAME,JOB,SAL,
       SAL + IFNULL(COMM,0) AS TOTAL_EARNINGS
FROM EMPY WHERE JOB='SALESMAN'
ORDER BY SAL DESC, COMM DESC;

-- 162) List the Deptno, Name, Job, Salary and Sal+Comm of the emps who earn the second highest earnings (sal + comm.).
SELECT DEPTNO,ENAME,JOB,SAL,
       SAL + IFNULL(COMM,0) AS TOTAL_EARNINGS
FROM EMPY
WHERE (SAL + IFNULL(COMM,0)) =
(
    SELECT MAX(SAL + IFNULL(COMM,0)) FROM EMPY
    WHERE (SAL + IFNULL(COMM,0)) <
    (
        SELECT MAX(SAL + IFNULL(COMM,0)) FROM EMPY
    )
);

# another simple way of writing
SELECT DEPTNO,ENAME,JOB,SAL,
       SAL + IFNULL(COMM,0) AS TOTAL_EARNINGS
FROM EMPY ORDER BY  TOTAL_EARNINGS DESC LIMIT 1 OFFSET 1;  # offset second highest limit works on that 


# 163) List the Deptno and their average salaries for dept with the average salary less than the averages for all department.
SELECT DEPTNO,AVG(SAL) AS AVG_SAL
FROM EMPY
GROUP BY DEPTNO
HAVING AVG(SAL) < (SELECT AVG(SAL) FROM EMPY);

/* 164) List out the Names and Salaries of the emps along with their manager names and salaries 
for those emps who earn more salary than their Manager. */

SELECT e.ENAME AS EMPLOYEE,
       e.SAL AS EMP_SAL,
       m.ENAME AS MANAGER,
       m.SAL AS MGR_SAL
FROM EMPY e
JOIN EMPY m
ON e.MGR = m.EMPNO
WHERE e.SAL > m.SAL;

# 165) List out the Name, Job, Salary of the emps in the department with the highest average salary.
SELECT ENAME, JOB, SAL FROM EMPY
WHERE DEPTNO =
(
    SELECT DEPTNO FROM EMPY
    GROUP BY DEPTNO
    ORDER BY AVG(SAL) DESC
    LIMIT 1
);

# 166) List the empno, sal, comm. Of emps.
SELECT EMPNO, SAL, COMM FROM EMPY;

# 167) List the details of the emps in the ascending order of the sal.
SELECT * FROM EMPY ORDER BY SAL ASC;

# 168) List the dept in the ascending order of the job and the desc order of the emps print empno, ename.
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMPY
ORDER BY DEPTNO ASC, JOB DESC;

# 169) Display the unique dept of the emps.
SELECT DISTINCT DEPTNO FROM EMPY;

# 170) Display the unique dept with jobs
SELECT DISTINCT DEPTNO, JOB FROM EMPY;

# 171) Display the details of the blake.
SELECT * FROM EMPY WHERE ENAME='BLAKE';

# 172) List all the clerks
SELECT * FROM EMPY WHERE JOB='CLERK';

# 173) List all the employees joined on 1st may 81.
SELECT * FROM EMPY WHERE HIREDATE='1981-05-01';

# 174) List the empno, ename, sal, deptno of the dept 10 emps in the ascending order of salary.
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMPY
WHERE DEPTNO=10 ORDER BY SAL ASC;

# 175) List the emps whose salaries are less than 3500.
SELECT * FROM EMPY WHERE SAL < 3500;

# 176) List the empno, ename, sal of all the emp joined before 1 apr 81.
SELECT EMPNO, ENAME, SAL FROM EMPY
WHERE HIREDATE < '1981-04-01';

# 177) List the emp whose annual sal is <25000 in the asc order of the salaries.
SELECT *, SAL*12 AS ANNUAL_SAL
FROM EMPY
WHERE SAL*12 < 25000
ORDER BY SAL ASC;

select * from ( SELECT *, SAL*12 AS ANNUAL_SAL FROM EMPY ) AS X
WHERE X.ANNUAL_SAL < 25000
ORDER BY SAL ASC;

# 178) List the empno, ename, annsal, dailysal of all the salesmen in the asc ann sal.
SELECT EMPNO,ENAME,
       SAL*12 AS ANNUAL_SAL,
       ROUND(SAL/30,2) AS DAILY_SAL
FROM EMPY WHERE JOB='SALESMAN'
ORDER BY ANNUAL_SAL ASC;

# 179) List the empno, ename, hiredate, current date & exp in the ascending order of the exp.
SELECT EMPNO,ENAME,HIREDATE,CURDATE() AS CURRENT_DATE,
       TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) AS EXPERIENCE
FROM EMPY
ORDER BY EXPERIENCE ASC;

# Timestamp won't work with SQL , try DATEDIFF - will work - eed to check again 
SELECT EMPNO, ENAME, HIREDATE, SYSDATE() AS CURRENT_DATE,   # should not used CURRENT_DATE as keyword it is used to get date shows error
       FLOOR(DATEDIFF(SYSDATE(), HIREDATE) / 365) AS EXPERIENCE
FROM EMPY
ORDER BY EXPERIENCE ASC;

select CURDATE() AS `CURRENT_DATE`;

SELECT EMPNO, ENAME, HIREDATE, CURDATE() AS DATE,
       DATEDIFF(CURDATE(), HIREDATE) / 365 AS EXPERIENCE
FROM EMPY
ORDER BY EXPERIENCE ASC;

SELECT EMPNO, ENAME, HIREDATE, CURDATE() AS `CURRENT_DATE`,  # `CURRENT_DATE` this makes it as string - no error
       DATEDIFF(CURDATE(), HIREDATE) / 365 AS EXPERIENCE
FROM EMPY
ORDER BY EXPERIENCE ASC;

# 180) List the emps whose exp is more than 10 years.
SELECT * FROM EMPY
WHERE TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) > 10;

/* 181) List the empno, ename, sal, TA30%, DA40%, HRA50%, GROSS, LIC, PF, net, deduction, 
net allow and net sal in the ascending order of the net salary. */
-- 181. Salary calculations

SELECT EMPNO,
       ENAME,
       SAL,

       SAL*0.30 AS TA,
       SAL*0.40 AS DA,
       SAL*0.50 AS HRA,

       (SAL + (SAL*0.30)+(SAL*0.40)+(SAL*0.50)) AS GROSS,

       SAL*0.10 AS LIC,
       SAL*0.12 AS PF,

       ((SAL*0.10)+(SAL*0.12)) AS DEDUCTION,

       ((SAL*0.30)+(SAL*0.40)+(SAL*0.50)) AS NET_ALLOW,

       ((SAL + (SAL*0.30)+(SAL*0.40)+(SAL*0.50)) - ((SAL*0.10)+(SAL*0.12))) AS NET_SAL

FROM EMPY
ORDER BY NET_SAL ASC;

# 182) List the emps who are working as managers.
SELECT * FROM EMPY WHERE JOB='MANAGER';

# 183) List the emps who are either clerks or managers.
SELECT * FROM EMPY WHERE JOB IN ('CLERK','MANAGER');

# 184) List the emps who have joined on the following dates 1 may 81, 17 nov 81, 30 dec 81.
SELECT * FROM EMPY WHERE HIREDATE IN ('1981-05-01','1981-11-17','1981-12-30');

# 185) List the emps who have joined in the year 1981SELECT *
SELECT * FROM EMPY WHERE YEAR(HIREDATE)=1981;

# 186) List the emps whose annual sal ranging from 23000 to 40000.
SELECT *,SAL*12 AS ANNUAL_SAL
FROM EMPY
WHERE SAL*12 BETWEEN 23000 AND 40000;

SELECT * FROM (SELECT *,
       SAL*12 AS ANNUAL_SAL
FROM EMPY ) AS Y
WHERE Y.ANNUAL_SAL BETWEEN 23000 AND 40000;

# 187) List the emps working under the mgrs 7369, 7890, 7654, 7900.
SELECT * FROM EMPY WHERE MGR IN (7369,7890,7654,7900);

# 188) List the emps who joined in the second half of 82.
SELECT * FROM EMPY
WHERE HIREDATE BETWEEN '1982-07-01' AND '1982-12-31';

# 189) List all the 4 char emps.
SELECT * FROM EMPY
WHERE LENGTH(ENAME)=4;

# 190) List the emp names starting with ‘M’ with 5 chars.
SELECT * FROM EMPY
WHERE ENAME LIKE 'M____'; # no data of emp names starting with ‘M’ with 5 chars

SELECT * FROM EMPY
WHERE ENAME LIKE '%M%';

SELECT * FROM EMPY 
WHERE ENAME LIKE 'M_____'; # getting data of emp names starting with ‘M’ with 5 chars

# 191) List the emps end with ‘H’ all together 5 chars.
SELECT * FROM EMPY 
WHERE ENAME LIKE '____H';

# 192) List names start with ‘M’.
SELECT * FROM EMPY WHERE ENAME LIKE 'M%';

# 193) List the emps who joined in the year 81.
SELECT * FROM EMPY WHERE YEAR(HIREDATE)=1981;

# 194) List the emps whose sal is ending with 00.
SELECT * FROM EMPY WHERE MOD(SAL,100)=0;

# 195) List the emp who joined in the month of JAN.
SELECT * FROM EMPY WHERE MONTHNAME(HIREDATE)='January';

# 196) Who joined in the month having char ‘a’.
SELECT * FROM EMPY WHERE MONTHNAME(HIREDATE) LIKE '%a%';

# 197) Who joined in the month having second char ‘a’.
SELECT * FROM EMPY WHERE MONTHNAME(HIREDATE) LIKE '_a%';

# 198) List the emps whose salary is 4 digit number.
SELECT * FROM EMPY WHERE SAL BETWEEN 1000 AND 9999;

# 199) List the emp who joined in 80’s.
SELECT * FROM EMPY WHERE HIREDATE BETWEEN '1980-01-01' AND '1989-12-31';

# 200) List the emp who are clerks who have exp more than 8 years.
SELECT * FROM EMPY WHERE JOB='CLERK'
AND TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) > 8;

#201 List the mgrs of dept 10 or 20.
SELECT *
FROM EMPY
WHERE JOB='MANAGER'
AND DEPTNO IN (10,20);

#202 List the emps joined in jan with salary ranging from 1500 to 4000.
SELECT *
FROM EMPY
WHERE MONTH(HIREDATE)=1
AND SAL BETWEEN 1500 AND 4000;

#203 List the unique jobs of dept 20 and 30 in desc order.
SELECT DISTINCT JOB
FROM EMPY
WHERE DEPTNO IN (20,30)
ORDER BY JOB DESC;

/* 204 List the emps along with exp of those working under the mgr 
whose number is starting with 7 but should not have a 9 joined before 1983. */
SELECT ENAME,
       TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) AS EXP
FROM EMPY
WHERE CAST(MGR AS CHAR) LIKE '7%'
AND CAST(MGR AS CHAR) NOT LIKE '%9%'
AND YEAR(HIREDATE) < 1983;


#205 List the emps who are working as either mgr or analyst with the salary ranging from 2000 to 5000 and with out comm.
SELECT *
FROM EMPY
WHERE JOB IN ('MANAGER','ANALYST')
AND SAL BETWEEN 2000 AND 5000
AND COMM IS NULL;

/* 206 List the empno,ename,sal,job of the emps with /ann sal <34000 but receiving some comm. 
Which should not be>sal and desg should be sales man workingfor dept 30. */
SELECT EMPNO,ENAME,SAL,JOB
FROM EMPY
WHERE (SAL*12) < 34000
AND COMM IS NOT NULL
AND COMM <= SAL
AND JOB='SALESMAN'
AND DEPTNO=30;

/* 207 List the emps who are working for dept 10 or 20 with desgs as clerk or analyst 
with a sal is either 3 or 4 digits with an exp>8 years 
but does not belong to months of mar,apr,sep and working for mgrs &no is not ending with 88 and 56. */
SELECT *
FROM EMPY
WHERE DEPTNO IN (10,20)
AND JOB IN ('CLERK','ANALYST')
AND LENGTH(SAL) IN (3,4)
AND TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) > 8
AND MONTHNAME(HIREDATE) NOT IN ('March','April','September')
AND RIGHT(MGR,2) NOT IN ('88','56');

/* 208 List the empno,ename,sal,job,deptno&exp of all the emps belongs to dept 10 or 20 
with an exp 6 to 10 y working under the same mgr with out comm. With a job not ending 
irrespective of the position with comm.>200 with exp>=7y and sal<2500 but not belongs 
to the month sep or nov working under the mgr whose no is not having digits either 9 or 0 in the asc dept& desc dept. */
SELECT EMPNO,ENAME,SAL,JOB,DEPTNO,
       TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) AS EXP
FROM EMPY
WHERE DEPTNO IN (10,20)
AND TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) BETWEEN 6 AND 10
AND COMM IS NULL
AND JOB NOT LIKE '%MAN'
ORDER BY DEPTNO ASC, SAL DESC;

#209 List the details of the emps working at Chicago.

SELECT e.* FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.LOC='CHICAGO';

#210 List the empno,ename,deptno,loc of all the emps.
SELECT e.EMPNO,e.ENAME,e.DEPTNO,d.LOC
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO;

#211 List the empno,ename,loc,dname of all the depts.,10 and 20.
SELECT e.EMPNO,e.ENAME,d.LOC,d.DNAME
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE e.DEPTNO IN (10,20);

#212 List the empno, ename, sal, loc of the emps working at Chicago dallas with an exp > 6 ys.
SELECT e.EMPNO,e.ENAME,e.SAL,d.LOC
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.LOC IN ('CHICAGO','DALLAS')
AND TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) > 6;

#213 List the emps along with loc of those who belongs to dallas ,newyork with salranging from 2000 to 5000 joined in 81.
SELECT e.*, d.LOC
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.LOC IN ('DALLAS','NEW YORK')
AND SAL BETWEEN 2000 AND 5000
AND YEAR(HIREDATE)=1981;

#214 List the empno,ename,sal,grade of all emps.
SELECT EMPNO,ENAME,SAL,GRADE FROM EMPY;

#215 List the grade 2 and 3 emp of Chicago.
SELECT e.* FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.LOC='CHICAGO'
AND GRADE IN (2,3);

#216 List the emps with loc and grade of accounting dept or the locs dallas orChicago with the grades 3 to 5 & exp > 6y.
SELECT e.*,d.LOC
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.DNAME='ACCOUNTING'
OR (d.LOC IN ('DALLAS','CHICAGO')
AND GRADE BETWEEN 3 AND 5
AND TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) > 6); 

#217 List the grades 3 emps of research and operations depts.. joined after 1987 andwhose names should not be either miller or allen.
SELECT e.* FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.DNAME IN ('RESEARCH','OPERATIONS')
AND GRADE=3
AND YEAR(HIREDATE)>1987
AND ENAME NOT IN ('MILLER','ALLEN'); # need to cehck the data again

#218 List the emps whose job is same as smith.
SELECT * FROM EMPY
WHERE JOB= (SELECT JOB FROM EMPY WHERE ENAME='SMITH');
 
#219 List the emps who are senior to miller.
SELECT * FROM EMPY
WHERE HIREDATE < (SELECT HIREDATE FROM EMPY WHERE ENAME='MILLER');

#220 List the emps whose job is same as either allen or sal > allen.
SELECT * FROM EMPY
WHERE JOB= (SELECT JOB FROM EMPY WHERE ENAME='ALLEN')
OR SAL > (SELECT SAL FROM EMPY WHERE ENAME='ALLEN');

#221 List the emps who are senior to their own manager.
SELECT e.* FROM EMPY e
JOIN EMPY m ON e.MGR=m.EMPNO
WHERE e.HIREDATE < m.HIREDATE;

#222 List the emps whose sal greater than blakes sal.
SELECT * FROM EMPY
WHERE SAL > (SELECT SAL FROM EMPY WHERE ENAME='BLAKE');

#223 List the dept 10 emps whose sal>allen sal.
SELECT * FROM EMPY
WHERE DEPTNO=10
AND SAL > ( SELECT SAL FROM EMPY WHERE ENAME='ALLEN' );

#224 List the mgrs who are senior to king and who are junior to smith.
SELECT * FROM EMPY
WHERE JOB='MANAGER'
AND HIREDATE < (SELECT HIREDATE FROM EMPY WHERE ENAME='KING')
AND HIREDATE > (SELECT HIREDATE FROM EMPY WHERE ENAME='SMITH');

#225 List the empno,ename,loc,sal,dname,loc of the all the emps belonging to king dept.
SELECT e.EMPNO,e.ENAME,e.SAL,d.DNAME,d.LOC
FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE e.DEPTNO= (SELECT DEPTNO FROM EMPY WHERE ENAME='KING');

#226 List the emps whose salgrade are greater than the grade of miller.
SELECT * FROM EMPY
WHERE GRADE > (SELECT GRADE FROM EMPY WHERE ENAME='MILLER');

#227 List the emps who are belonging dallas or Chicago with the grade same asadamsor exp more than smith.
-- 227. Employees of Dallas/Chicago with same grade as ADAMS or exp > SMITH

SELECT e.*,d.LOC FROM EMPY e
JOIN DEPT d ON e.DEPTNO=d.DEPTNO
WHERE d.LOC IN ('DALLAS','CHICAGO')
AND
(
GRADE=
(
SELECT GRADE FROM EMPY WHERE ENAME='ADAMS'
)
OR TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) >
(
SELECT TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) FROM EMPY WHERE ENAME='SMITH'
)
);


#228 List the emps whose sal is same as ford or blake.
SELECT * FROM EMPY
WHERE SAL IN
(
SELECT SAL FROM EMPY WHERE ENAME IN ('FORD','BLAKE')
);

#229 List the emps whose sal is same as any one of the following.
#230 Sal of any clerk of emp1 table.

SELECT * FROM EMPY
WHERE SAL IN
(
SELECT SAL FROM EMPY WHERE JOB='CLERK'
);

#231 Any emp of emp2 joined before 82.
SELECT * FROM EMPY WHERE YEAR(HIREDATE)<1982;

#232 The total remuneration (sal+comm.) of all sales person of Sales dept belongingto emp3 table.
SELECT *
FROM EMPY
WHERE (SAL+IFNULL(COMM,0)) IN
(
SELECT (SAL+IFNULL(COMM,0)) FROM EMPY
WHERE JOB='SALESMAN' AND DEPTNO=30
);   # need to check the data and querry once

#233 Any Grade 4 emps Sal of emp 4 table.
SELECT * FROM EMPY
WHERE SAL IN
(
SELECT SAL FROM EMPY WHERE GRADE=4
);

#234 Any emp Sal of emp5 table.
SELECT * FROM EMPY
WHERE SAL = ANY
(
SELECT SAL FROM EMPY
);  # need to check this again - find if another way of extracting data

#235 List the highest paid emp.
SELECT * FROM EMPY
WHERE SAL=
(
SELECT MAX(SAL) FROM EMPY
);

#236 List the details of most recently hired emp of dept 30.
SELECT * FROM EMPY
WHERE DEPTNO=30
AND HIREDATE=
(
SELECT MAX(HIREDATE) FROM EMPY WHERE DEPTNO=30
);

#237 List the highest paid emp of Chicago joined before the most recently hired empof grade 2.
SELECT e.* FROM EMPY e
JOIN DEPT d
ON e.DEPTNO=d.DEPTNO
WHERE d.LOC='CHICAGO'
AND e.HIREDATE <
(
SELECT MAX(HIREDATE) FROM EMPY WHERE GRADE=2
)
ORDER BY SAL DESC LIMIT 1;

#238 List the highest paid emp working under King.
SELECT * FROM EMPY
WHERE MGR=
(
SELECT EMPNO FROM EMPY WHERE ENAME='KING'
)
AND SAL=
(
SELECT MAX(SAL) FROM EMPY 
WHERE MGR=
(
SELECT EMPNO FROM EMPY WHERE ENAME='KING'
)
);

