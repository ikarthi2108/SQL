create database Hobbies

use hobbies

--create table hobbies

create table hobbies (HobbyId int primary key,HobbyName varchar(25) unique)

--1. insert records into the table using a stored procedure.

create procedure Insertingrecord (@hobbyId int,@HobbyName varchar(25))
as
begin 

insert into hobbies values(@hobbyId,@HobbyName)

end 
 
 exec Insertingrecord 1,'playing cricket'
 exec Insertingrecord 2,'watching netflix'
 exec Insertingrecord 3,'Reading Books'
 exec Insertingrecord 4, 'Lisiting music'

 
 select * from hobbies

  /*2. insert duplicate records into the table and show the working of exception handling 
 using Try/catch blocks.*/


 Alter procedure HobbyException(@hobbyId int,@HobbyName varchar(25))
 as 
 begin
 begin try 
 
  insert into hobbies values(@hobbyId,@HobbyName)
  end try 

begin catch
print 'These value cant be inserted'
end catch
end


 exec HobbyException 5,'Playing cricket'
 exec HobbyException 6,'watching netflix'


 --because hobby name is unique constraint we cant't add duplicate values

 --3. Store the error details in an errorbackup table.


CREATE TABLE error_backup (ErrorID        INT IDENTITY(1, 1),UserName VARCHAR(100), ErrorNumber INT, ErrorState INT,ErrorSeverity INT,ErrorLine INT,ErrorProcedure VARCHAR(MAX), ErrorMessage  VARCHAR(MAX),ErrorDateTime  DATETIME)

create PROCEDURE sp_error_db (@hobbyId int,@HobbyName varchar(25))
AS
  BEGIN TRY
    INSERT INTO hobbies
         SELECT @hobbyId,@HobbyName
  END TRY
  BEGIN CATCH
    INSERT INTO error_backup
    VALUES
  (SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
  END CATCH
GO

exec sp_error_db 7,'playing cricket'
exec sp_error_db 8,'cycling'
exec sp_error_db 9,'Reading Books'

select * from error_backup

---------------------------------------------------------------------

/*b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product 
else use RAISERROR to show the working of exception handling.*/

Alter procedure Numbers(@num1 int,@num2 int)
as 
begin 
declare @result int
set @result=@num1*@num2
begin  try
if @num1=@num2
print @result
else
RAISERROR('Number are different',16,1)
end try
 BEGIN CATCH
    PRINT ERROR_MESSAGE()
    PRINT ERROR_NUMBER()
    PRINT ERROR_SEVERITY()
    PRINT ERROR_STATE()
  END CATCH
end

--checking the working of try catch
--giving same numbers

exec Numbers 7,7

--with different two numbers

exec Numbers 1,2

/*c. Create a table Friends(id(identity), name (uk)) and insert records into the table using
a stored procedure.
Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the 
error details*/

create table  Friends(id int identity(1,1), name varchar(25) unique) 

Alter procedure Sp_Names(@name varchar(25))
as 
begin 
if (@name like '[ADHKPRSTVY]%')
insert into Friends values(@name)
else
Print 'The  Name should starts with A,D,H,K,P,R,S,T,V,Y '
end

exec Sp_Names 'Karthi'

exec Sp_Names 'siva'

exec Sp_Names 'Dhoni'

exec Sp_Names 'Virat'

select * from Friends

--other alphabets startings
exec Sp_Names 'naveen'

