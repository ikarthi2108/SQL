create database stock
use stock

create table stockdetails
(
stockID int identity(1,1) not null,
stockName nvarchar(50) not null,
stockPrice varbinary(max) not null
)
insert into dbo.stockdetails(stockName,stockPrice)
select 'stock demo',100

select * from stockdetails