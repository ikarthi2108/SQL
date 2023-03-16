create database student
use student
 -- DDL   
create table products
(
product_id int,
product_name varchar(20)
)
select * from products

alter table products add product_price int

alter table products add product_quantity int

alter table products drop column product_quantity

insert into products(product_id,product_name)values (101,'sugar')
drop table products

update products set product_price =10010 where product_id=101;
insert into products values (102,'salt',10020)

alter table products add product_quantity int 

update products set product_quantity=5 where product_id=101

update products set product_quantity=10 where product_id=102

delete products where product_name='salt'

select * from products

update products set product_quantity=null where product_price=10010

truncate table products

insert into products values(240,'bat',2000,100),(241,'ball',100,200)

delete products where product_name='bat'