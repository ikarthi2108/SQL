use student

--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.
create procedure SP_studentname (@student_name varchar(25))
as
begin
select * from student1 where Student_name=@student_name
end
--exec Type
exec Sp_studentname  @Student_name='karthick'


--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.

alter procedure Sp_remarks
as
begin
select * ,
case  
   when (securedmarks >= 495 and securedmarks<= 500) then 'Execellent,Fantastic,VV Good'
   when (securedmarks >= 490 and securedmarks< 497) then 'Awesome,Fabulous'
   when (securedmarks >= 480 and securedmarks< 490) then 'superb'
   when (securedmarks >= 450 and securedmarks< 480)  then 'Good ,keep it up!'
   end as 'Remarks'
   from student1
   end
   
   --exec
   exec Sp_remarks

--3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--Table variables


--local table  variable

declare @Table_variable1 table (id int, name varchar(20),Age int)

insert into @Table_variable1 values(101,'vijay',45)

select * from @Table_variable1


--global table variable 


declare @@Table_variable2 table (id int, name varchar(25),Age int)

insert into @@Table_variable2 values(102,'Ajith',50)

select * from @@Table_variable2
 






--creating a temporary table

--Local
create table #student001(
s_id int primary key,
s_name varchar(25),
sem_no varchar(10)
)

insert into #student001 select student_id,student_name,semester from student1 where semester='sem 1'

select * from #student001

--Global

create table ##student001(
s_id int primary key,
s_name varchar(25),
sem_no varchar(10)
)

insert into ##student001 select student_id,student_name,semester  from student1 where semester='sem 3'

select * from ##student001

-- procedure

--Local
Alter procedure #temp_local
as
begin
print 'Temporary Local procedure'
end
exec #temp_local


--global Stored procedure

Alter procedure ##temp_global
as
begin
print 'Temporary global procedure'
end

exec ##temp_global

