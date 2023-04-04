use Trainees_Details

select * from Trainees 



--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.

alter TRIGGER no_dml 
ON trainees
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(DW,GETDATE())= 7 or DATEPART(DW,GETDATE())= 1
  BEGIN
    PRINT 'Y0U CANT PERFORM ANY OPERATIONS ON SATURDAY AND SUNDAY'
    ROLLBACK TRANSACTION
  END
END
INSERT INTO Trainees values(23, 'kl', 'rahul', 90000, '2023-03-20', 'Admin')

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
alter trigger No_delete
on trainees
for delete 
as 
begin 
if datepart(hh,getdate()) between 11 and 15
print 'Trigger to restrict delete operations between 11:00AM to 15:00PM'
rollback transaction
end

delete from Trainees where Trainee_ID=8


--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

alter trigger DDL_trigger
on database
for create_table,alter_table,drop_table,rename
as 
begin
print 'Notify whenever a CREATE, ALTER, DROP, RENAME operation is performed'
rollback tran
end
--working ddl triggers
create table stud1(reg_no int)
