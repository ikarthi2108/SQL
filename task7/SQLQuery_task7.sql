create database student
use student

--creating table

create table student 
(
studentid int primary key identity(1,1),
studentname varchar(20) not null,
department varchar(20),
score int
)

--inserting values

insert into student values ('karthi','Bsc-CT',90),
('siva','Bsc-IT',89),
('Hemanth','Bca',88),
('vijay','Bio',80),
('Ajith','Mech',78),
('Dhoni','Mech',91),
('Kholi','Bsc-CT',78),
('Arun','Bsc-It',66),
('Ajay','Mca',97)
,('surya','Mca',92)

insert into student values ('kavin','Bsc-CT',88),
('saran','Bsc-It',70),
('Hemanth','Bca',81),
('Hari','Bio',72),
('selva','Mech',97),
('Prakesh','Mech',66),
('Praveen','Bsc-CT',77),
('Arjun','Bsc-It',84),
('Vikram','Mca',99),
('Vasanth','Mca',93)

--displaying the table

select * from student
drop table student
--1. Create a non-clustered index for department.

exec sp_helpindex 'student'
create nonclustered index non_cluster_department on student(department asc)

--2. Create a filtered index for department='BCA'

create nonclustered index department on student (department asc)where department='bca'

--3. Create a view for students in BCA department.

create view Bca as select * from student where department='bca'

--4. Apply Rank() for all the students based on score.

select * ,Rank() over (order by score desc) as ranks from student

--5. Apply Dense_Rank() for students in each department based on score.

select * ,DENSE_RANK() over(partition by department order by score desc) as dept_rank from student

--b. Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).--

create table Manager (id int primary key, name varchar(25))

create table Employee (eid int primary key,ename varchar(25),mid int references manager(id))

insert into MANAGER values (101,'karthi'),(102,'siva'),(103,'hari')

insert into Employee values (1,'Hemanth',101),(2,'selva',103),(3,'harshan',102),(4,'dhana',101),(5,'srikanth',103)


select * from manager
select * from Employee

--1. Create a complex view by retrieving the records from Manager and Employee table.

create view View_details1
as 
select m.id,m.name,e.eid,e.ename from Manager as m inner join employee as e on m.id=e.mid

select * from View_details1


--2. Show the working of 'on delete cascade on update set default' for the above tables



Create table Manager (id int primary key,name varchar(25))
create table Employee(eid int primary key, ename varchar (25),mid int references manager(id)) 

insert into Manager values(101,'Karthi'),(102,'Harshan'),(103,'Hari'),(104,'siva')

insert into Employee  values (1,'Venkit',101),(2,'Dhana',104),(3,'vasanth',103),(4,'sharon',104),(5,'vikram',104),(6,'selva',102),(7,'srikanth',101),(8,'Dhana',104)

select * from Manager
select * from Employee
--1. Create a complex view by retrieving the records from Manager and Employee table.

create view view_table
as 
select m.id,m.name,e.eid,e.ename from Manager as m inner join Employee as e on m.id=e.mid

select * from view_table
drop view view_table
--2. Show the working of 'on delete cascade on update set default' for the above tables

alter table Employee drop constraint [FK__Employee__mid__534D60F1]--removing the foriegn key

alter table employee drop column mid



--performing the on delete cascade on update set default
alter table Employee add  mid int default 101 constraint FK__Employee__mid_del_cas_update_default foreign key (mid) references manager(id)on delete cascade on update set default 

delete from Manager where  id=101
update Manager set  id=101 where id=104





--truncation the table
truncate table employee

--on update set defatul checking
insert into employee (eid,ename) values (9,'david')

update manager set id=105 where id =103
select * from Manager
select * from Employee   

