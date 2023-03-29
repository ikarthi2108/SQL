create database Employee
use Employee

create table Employee
(
Employee_id int primary key,
First_Name varchar(20),
Last_Name varchar(20),
Email varchar(30),
Phone_number bigint,
Hire_date date,
job_id int,
salary int
)
select * from Employee
insert into Employee values 
(1,'karthi','keyan','kk21@gmail.com',7818182829,'2023/01/23',1,30000),
(2,'siva','bharat','sb21@gmail.com',7818183219,'2023/01/24',2,35000),
(3,'Hari','karthick','Hk21@gmail.com',7123482829,'2023/01/25',3,40000),
(4,'Hemanth','kumar','HH21@gmail.com',78182342829,'2023/01/26',4,45000),
(5,'Harshan','kumar','Harshan21@gmail.com',7818182829,'2023/01/24',1,37000),
(6,'selva','ganapathi','sg21@gmail.com',8818182829,'2023/01/23',2,33000),
(7,'kannan','duraisamy','kd21@gmail.com',8918182987,'2023/01/20',3,60000),
(8,'sameer','mohammed','sm21@gmail.com',7874282829,'2023/01/22',4,23000),
(9,'kane','williomson','kw21@gmail.com',9933182829,'2023/01/29',1,20000),
(10,'yamini','s','ys21@gmail.com',7890182829,'2023/01/27',2,31000),
(11,'sharon','david','sd21@gmail.com',9998182829,'2023/01/25',3,88000),
(12,'sri','kanth','kk21@gmail.com',7818182829,'2023/01/22',4,76000),
(13,'priya','dharsan','pd21@gmail.com',9998182829,'2023/01/12',1,42000),
(14,'Arun','joesph','aj21@gmail.com',9988182829,'2023/01/30',2,26000),
(15,'dhana','prakesh','dp21@gmail.com',8608182829,'2023/01/10',3,10000),
(16,'krishna','kumar','kkumar21@gmail.com',9999182899,'2023/01/09',4,20000),
(17,'Dinesh','kumar','dk21@gmail.com',7818180000,'2023/01/11',1,39000),
(18,'Hari','sudhan','hs21@gmail.com',7818100009,'2023/01/09',2,10000),
(19,'Arjun','Venkit','Av21@gmail.com',9898982829,'2023/01/05',3,13000),
(20,'Divya','Prakesh','dpp21@gmail.com',7818182829,'2023/01/06',4,37000)


--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

select EMPLOYEE_ID,First_name,last_name,SALARY from employee where SALARY >(select salary from employee where EMPLOYEE_ID=16)

--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.

select first_name,last_name,job_id from employee where HIRE_DATE in (select HIRE_DATE from employee where EMPLOYEE_ID=11 )

--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME as avg_salary from employee where salary >(select avg(salary) from employee)

--4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.

select FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY from employee where FIRST_NAME in (select FIRST_NAME from employee where FIRST_NAME='Yamini')

--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

select * from employee where SALARY between (select min(salary) from employee) and  20000
