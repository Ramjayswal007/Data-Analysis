use sql_project;

# Que.1--->> Create the Employee Table as per the Below Data Provided.alter

create table Employee( 
empno int not null unique,
ename char(22),
job char(22) default 'CLERK',
mgr int,
hiredate date,
sal float(10,2),
comm float(10,2),
deptno int,
constraint PK_employee primary key (empno),
constraint FK_Dept foreign key (deptno) references Dept(deptno),
constraint CHK_Employee check (sal>0)
);

select * from Employee;

insert into Employee values
(7369,'SMITH',DEFAULT,7902,'1890-12-17',800.00,null,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600.00,300.00,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250.00,500.00,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975.00,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250.00,1400.00,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850.00,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450.00,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000.00,NULL,20),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000.00,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500.00,0.00,30),
(7876,'ADAMS',default,7788,'1987-05-23',1100.00,NULL,20),
(7900,'JAMES',DEFAULT,7698,'1981-12-03',950.00,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000.00,NULL,20),
(7934,'MILLER',DEFAULT,7782,'1982-01-23',1300.00,NULL,10);

# Que.2 --->> Create the Dept Table as below
create table dept(
deptno int primary key NOT NULL, 
dname char(22),
loc char(22)
);

select * from dept;

insert into dept values
(10,'OPERATIONS','BOSTON'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'ACCOUNTING','NEWYORK');

# Que.3 --->> List the Names and salary of the employee whose salary is greater than 1000
select ename,sal from Employee where sal >1000;

# Que.4 --->> List the details of the employees who have joined before end of September 81.
select * from Employee where hiredate<=('1981-09-28');

# Que.5 --->> List Employee Names having I as second character.
select ename
from Employee
where ename like '_I%';

# Que.6 --->> List Employee Name, Salary, Allowances (40% of Sal), P.F. (10 % of Sal) and Net Salary. Also assign the alias name for the columns
select ename,
sal,
floor(sal/100*40) as Allowances,
floor(sal/100*10) as PF,
floor(sal+sal/100*40-sal/100*10) as Net_Salary
from Employee;

# Que.7 --->> List Employee Names with designations who does not report to anybody
select ename,job
from Employee
where mgr is null;

# Que.8 --->> List Empno, Ename and Salary in the ascending order of salary.
select empno,ename,sal
from Employee
order by sal asc;

# Que.9 --->> How many jobs are available in the Organization ?
select distinct job 
from Employee
where job is not null;

# Que.10 --->> Determine total payable salary of salesman category.
SELECT job,
floor(avg(sal+comm))
FROM Employee
where job is not null and job='SALESMAN'
GROUP BY job;

# Que.11 --->> List average monthly salary for each job within each department
select count(*),
floor(avg(sal/12)) as Avg_Monthly_Sal,job,deptno
from Employee
group by job,deptno;

select * from Employee;
select * from Dept;

# Que.12 --->> Use the Same EMP and DEPT table used in the Case study to Display EMPNAME, SALARY and DEPTNAME in which the employee is working.
select e.ename,e.sal,d.dname
from Employee e,dept d
where e.deptno = d.deptno;

# Que.13 --->> Create the Job Grades Table as below
create table job_grades(
grade char(1),
lowest_sal int,
highest_sal int); 

insert into job_grades values
('A',0,999),
('B',1000,1999),
('C',2000,2999),
('D',3000,3999),
('E',4000,5000);

select*from job_grades;

# Que.14 --->> Display the last name, salary and  Corresponding Grade.
select e.ename,e.sal,g.grade
from Employee as e left join job_grades as g
on e.sal between g.lowest_sal and g.highest_sal;

# Que.15 --->> Display the Emp name and the Manager name under whom the Employee works in the below format .
select E.ename as 'Employee Name',
M.ename as 'Manager Name'
from Employee E
join Employee M
on E.mgr = M.empno;

# Que.16 --->> Display Empname and Total sal where Total Sal (sal + Comm).
select ename,
floor(sal+comm) as Total_salary
from Employee
where sal is not null and comm is not null;
 
# Que.17 --->> Display Empname and Sal whose empno is a odd number
select ename,sal
from Employee
where (empno%2)<>0;

# Que.18 --->> Display Empname , Rank of sal in Organisation , Rank of Sal in their department
select e.ename,d.dname,
Rank() over (order by sal) as Sal_in_Organisation
from Employee e,dept d
where e.deptno = d.deptno;

# Que.19 --->> Display Top 3 Empnames based on their Salary.
select ename,sal
from Employee
order by sal desc limit 3;

# Que.20 --->> Display Empname who has highest Salary in Each Department.
select ename,deptno,max(sal)
from Employee
group by deptno;


 