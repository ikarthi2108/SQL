--Show the working of the following concepts for the students table created in the earlier tasks

use student


select * from Student

--1. Auto-commit and Auto-rollback transactions.
--auto rollback
begin tran 
insert into Student values('venkatesh','Bio',427)
update Student set score=495 where studentid=21
select * from Student
commit tran
--auto-commit
insert into Student values('bosco','Bca',450) 
SET IDENTITY_INSERT student on
--2. Implicit transactions
set IMPLICIT_TRANSACTIONS on 
update Student set  studentname ='Arivu'  where studentid=22
select iif(@@OPTIONS & 2=2,'Implicit_transactions mode ON','Implicit_transactions mode OFF')as Tranaction_mode
SELECT 
    @@TRANCOUNT AS Before_OpenTransactions 
COMMIT TRANSACTION
insert into Student values('mehta','Bsc-ct',463) 
SELECT 
    @@TRANCOUNT AS After_OpenTransactions
SET IMPLICIT_TRANSACTIONS OFF

--3. Explicit transactions
   --a. Only Commit - insert statement
  begin tran
  insert into Student values ('sreegar','bsc-ct',477)
  select * from student
  select @@trancount as no_of_transactoins
  COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions
    --b. Only Rollback - update statement

	begin transaction 
	update Student set score=499 where studentid=10
	select @@TRANCOUNT as no_of_tranction

	--retriving the table
	select * from Student

    --c. Savepoint - commit update and insert statements, rollback delete statement
	begin tran
	update Student set score=499 where studentid=11
    insert into Student values ('Ben 10000','bsc-it',487)

	SAVE tran A
	delete from Student where studentid=10
	select * from Student
	select @@trancount as no_of_transactoins
	rollback tran a
	commit
	
	select * from Student