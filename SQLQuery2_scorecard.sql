create database cricket
use cricket

create table scorecard
(
player_name varchar(25),
player_score int,
player_ballsfaced int,
player_strikerate decimal
)

select * from scorecard

insert into scorecard values ('dhoni',100,20,500),('kholi',10,20,50),('kl rahul',1,2,50),('pant',30,15,200),('Ruturaj',150,50,300)

update scorecard set player_score=183 where player_name='kholi'

delete scorecard where player_name='kl rahul'

update scorecard set player_ballsfaced=91 where player_name='kholi'

update scorecard set player_strikerate=200.5 where player_name='kholi'