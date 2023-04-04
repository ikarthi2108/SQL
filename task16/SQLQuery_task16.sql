use Trainees_Details

select * from Trainees 



--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.

create TRIGGER restrict_DML_operations 
ON trainees
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(DW,GETDATE())= 7 or DATEPART(DW,GETDATE())= 1
  BEGIN
    PRINT 'DML OPERATIONS ARE RESTRICTED ON SATURDAY AND SUNDAY'
    ROLLBACK TRANSACTION
  END
END
INSERT INTO Trainees values(21, 'ms', 'dhoni', 80000, '2023-03-20', 'Admin')

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
create trigger restrict_delete_operations
on trainees
for delete 
as 
begin 
if datepart(hh,getdate()) between 11 and 15
print 'DML trigger to restrict delete operations between 11:00AM to 15:00PM'
rollback transaction
end

delete from Trainees where TRAINEE_ID =007


--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

create trigger DDL_trigger
on database
for create_table,alter_table,drop_table,rename
as 
begin
print 'Notify whenever a CREATE, ALTER, DROP, RENAME operation is performed'
rollback tran
end
--working ddl triggers
create table stud(reg_no int)
