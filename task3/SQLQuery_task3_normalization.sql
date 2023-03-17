create database Normalization1
use normalization1

--creating a table for the department

create table Department
(
Deptid int primary key,
Dept_name varchar(20) unique not null
)

insert into Department values (100,'Developer'),(101,'Ui/Ux')

select * from Department

--creating a table for address 

create table Address
(
Address_id int primary key,
City varchar(30) unique,
State varchar(30) unique,
princode int unique
)

insert into Address values (1,'manford','oklahoma(ok)',74044),(2,'sydney','ohio(oh)',45365)

select * from Address

--creating an employee table

create table Employee(
Id int primary key,
Name varchar(30) unique,
Designation varchar(20) references  Department(dept_name),
Dept_id int references Department(Deptid),
Mobile_1 bigint unique,
mobile_2 bigint unique ,
Street_Address varchar(30) not null,
Address_id int  references Address(Address_id)
)
--inserting values in the employee table

insert into Employee values (1,'John','Developer',100,9865741236,6325478962,'234 Hinton Rd',1)

insert into Employee values (2,'Jamie','Ui/Ux',101,7893245698,null,'214 Doorley Rd',2)

insert into Employee values (3,'Jack','Developer',100,5647896523,9856741236,'234 Hilton Rd',1)

select * from Employee

--dhecking the working of normalization

insert into Employee values (4,'jonny','Developer',102,4465655655,5675686655,'234 Hinton Rd',1)