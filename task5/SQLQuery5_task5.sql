use Trainees_Details --- using the already having database

--creating a table called traineesT
CREATE TABLE TraineesT (
TRAINEE_ID INT  PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)
select * from Traineest

--inserting values in the trainees table

INSERT INTO Traineest
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');


--Write an SQL query to get the count of employees in each department.

select department,count(department) as "No of Employees"  from TraineesT group by DEPARTMENT

--Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.

select dateadd(day,5,joining_date) as "Induction_day" from TraineesT

--Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.

select choose (month([joining_date]),'january','febraury','march','April','may','june','july','August','september','octomber','november','December') as "Joining_Month" from TraineesT

--Write an SQL query to perform the total and subtotal of salary in each department.

select department,sum(salary) as "Department_salary" from TraineesT group by DEPARTMENT
select sum(salary) as "Department_salary" from TraineesT group by JOINING_DATE

--Write an SQL query to retrieve first 3 records randomly.

select top 3 * from Trainees order by newid()

--Show the working of composite key with any example.
 INSERT INTO Traineest
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin')

--Show the working of IIF and CASE for the above table.

SELECT IIF(SALARY<50000, 'JUNIOR DEVELOPER', 'SENIOR DEVELOPER') as CATEGORY FROM Trainees;

--Show the working of Sequence.
CREATE SEQUENCE [dbo].[SequenceObject]
AS INT
START WITH 1 
INCREMENT BY 1 

SELECT * FROM sys.sequences WHERE name = 'SequenceObject';

--Show the working of creation of Synonym for a table in DB1 from DB2.

CREATE SYNONYM Trainees_Details
     FOR Tdetails.dbo.Trainees;



--Show the working of IDENTITY_INSERT.

create table empdetails(
 id int identity(1,1),
 name varchar(20),
 salary money,
 increment money)

  select *from empdetails
 insert into empdetails(name,salary,increment) values ('siva',30000,5000),('Bharath',25000,5000),('karthi',18000,5000)

 set identity_insert empdetails on;
 insert into empdetails(id,name,salary,increment) values(50,'sharon',20000,3000) 
  set identity_insert empdetails off;
   insert into empdetails(name,salary,increment) values('karthick',10000,2000) 

   select * from TraineesT

