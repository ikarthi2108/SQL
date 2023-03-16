--constraints
create table student1
(
Roll_no int primary key,
Name varchar(20) unique,
Age int check (Age > 10),
school varchar(30) default 'govt public school'
)



insert into student1 values(001,'karthi',12,'lkg')
insert into student1 (Roll_no,name,age) values (102,'hemanth',14)
insert into student1(roll_no,age,school) values (103,11,'skl public school')
insert into student1  values (104,'ajith',18,'skl public school')
insert into student1 values (105,'guru',11,'primary')
insert into student1 (Roll_no,name,age) values (112,'harshan',19)

--rename a table

exec sp_rename 'student1','studenttable'

select * from student1

select * from studenttable 

--rename a database

exec sp_renamedb 'Trainee','Trainees_Details'


--rename a schema

create schema s1

create table s1.Player1
(
player_id int ,
player_name varchar(20),
player_score int
)
insert into s1.player1 values (001,'Ruturaj',100),(002,'Deepak',50)
select * from s1.Player1

--tranfering the schema

create schema s2


alter schema s2 transfer s1.player1

select * from s2.player1

--3. Create a table with the following fields:
  --a. id as identity column, name, salary, increment, computed column as Revised salary(sal+inc)
  create table empdetails
  (
  emp_id int identity(1,1),
  emp_name varchar(20),
  emp_salary int,
  emp_increment int
  )
  insert into empdetails values ('karthi',30000,3000),('hemanth',50000,50000),('siva',60000,60000),('hari',70000,7000)

  select * from empdetails

  alter table empdetails add Revisedsalary as (emp_salary + emp_increment)

  --b. Retrieve all the records whose salary is >40000 and move them into a new table using (SELECT INTO)

  select * into empdetails3 from empdetails where emp_salary>40000

   select * from empdetails3

