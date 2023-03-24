use student

--1. Create User-define Scalar function to calculate percentage of all students after creating the following table.

create table student1 
(
student_id int primary key identity(1,1),
student_name varchar(30) not null,
semester varchar(25),
securedmarks int,
totalmarks int
)


insert into student1 values 
('john','sem 1',450,500),
('karthick','sem 1',470,500),
('siva','sem 1',475,500),
('Hari','sem 1',480,500),
('Hemanth','sem 1',490,500),
 ('vishal','sem 3',498,500),
 ('krishna','sem 3',499,500),
 ('dinesh','sem 3',497,500)


select * from student1

Alter function dbo.student_percentage(@securedmarks decimal(7,3))
returns decimal(5,2)
As
Begin
declare @percentage decimal(5,2)
set @percentage=(@securedmarks/5)
Return @percentage
End

select * ,dbo.student_percentage(securedmarks) as percentage from student1

--2. Create user-defined function to generate a table that contains result of Sem 3 students.

create function dbo.semester3_details(@semester varchar(20))
 returns @result table(student_name varchar(20),semester varchar(10),securedmarks int)
 As
 Begin
 insert into @result(student_name,semester ,securedmarks)
 select student_name,semester ,securedmarks from student1 where semester=@semester
 return 
 end

 select *  from dbo.semester3_details('sem 3') as semester3_details

 --3. Write SQL stored procedure to retrieve all students details. (No parameters)

create procedure sp_Display_details1 
as
select * from student1
go

exec sp_Display_details1

--4. Write SQL store procedure to display Sem 1 students details. (One parameter)

create procedure sp_Display_details_sem1 @semester varchar(25)
as 
select * from student1 where semester =@semester
go

exec sp_Display_details_sem1 @semester ='Sem 1'

--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)

create Procedure sp_Display_output_parameter @student_count int output
as
begin
select @student_count = count(student_id) from  student1
end;

declare @student_count int

exec sp_Display_output_parameter @student_count output
print @student_count 

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
--Note: Update few values in students details so that you can see the working of UPDATE.
create table Student2(Student_id int,Student_name varchar(30),semester varchar(25),securedmarks int,totalmark int)
insert into Student2 values(1,'Hari','Sem 1',499,500),(2,'Harshan','Sem 1',490,500),(3,'Karthi','Sem 1',480,500),(4,'Siva','Sem 1',485,500)


select * into student_details_backup from student2;

select * from Student2 
 select * from student_details_backup

 update student2 set Student_name='Arun' where Student_id=1
 delete from student_details_backup where Student_id=4


 merge Student_details_backup sdb using student2 sd
on (sdb.student_id=sd.student_id)
when matched then update set
sdb.student_name=sd.student_name,
sdb.semester=sd.semester,
sdb.securedmarks=sd.securedmarks,
sdb.totalmark=sd.totalmark 
when not matched
then insert (student_id,student_name,semester,securedmarks,totalmark )
values(sd.student_id,sd.student_name,sd.semester,sd.securedmarks,sd.totalmark)
when not matched by source
then delete;
