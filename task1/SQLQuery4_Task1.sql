create database Trainee
use Trainee

CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)
insert into Trainees values (1,'siva','bharath',30000,23-01-2023,'software')
select * from Trainees
insert into Trainees values(2,'karthikeyan','R',20000,16-09-2022,'software'),
(3,'Hemanth','S',40000,26-08-2022,'development'),
(4,'Harshan','k',50000,06-09-2022,'designer'),
(5,'Hari','karthick',60000,15-11-2018,'designer'),
(6,'sharon','david',65000,10-10-2021,'HR'),
(7,'vikram','k',55000,1-11-2022,'HR'),
(8,'vasanth','k',45000,15-11-2020,'admin'),
(9,'vishal','sj',70000,29-11-2021,'developer'),
(10,'dinesh','kumar',75000,15-11-2018,'designer'),
(11,'krishna','kumar',80000,05-06-2018,'admin'),
(12,'arun','r',85000,04-02-2017,'HR'),
(13,'sanjeevi','j',20000,02-01-2020,'admin'),
(14,'divya','prakesh',35000,31-01-2023,'HR'),
(15,'selva','ganapathy',47000,29-11-2021,'developer'),
(16,'dhana','prakesh',46000,15-11-2018,'designer'),
(17,'santhosh','r',57000,02-06-2018,'admin'),
(18,'srikanth','r',67000,06-02-2017,'HR'),
(19,'vijay','s',15000,12-01-2020,'admin'),
(20,'ajith','k',35000,22-09-2023,'HR')

 --first name starting with J-T

 select * from Trainees order by FIRST_NAME

  select * from Trainees where FIRST_NAME like '[j-t]%'

  --Retrieve all SALARY BETWEEN 20000 TO 50000
select * from Trainees where SALARY between 20000 and 50000

-- Retrieve all FIRST_NAME ending with i

select * from Trainees where FIRST_NAME like '%i'

-- Retrieve all salary without duplications

select distinct salary from Trainees

--Retrieve all records whose department is Developer and Designer

select * from Trainees where DEPARTMENT='designer' or DEPARTMENT='developer'

--Retrieve all Trainee_ID less than 5

select * from Trainees where Trainee_ID<5

--Limit the records by retrieving the 6 to 15 records

select * from Trainees order by trainee_id Offset 5 rows fetch next 10 rows only

--Retrieve the top 5 records with Ties
select top 5 without ties salary from trainees order by SALARY
select top 5 with ties SALARY from Trainees order by SALARY desc

--Retrieve the records in descending order based on department column.

select * from Trainees order by DEPARTMENT desc

-- Retrieve all  last_name with 3rd character as 'a.'

select * from Trainees where LAST_NAME like '__a%'