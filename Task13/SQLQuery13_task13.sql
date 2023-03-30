create database university_database
use university_database

--users tables
create table users (user_id int primary key,username varchar(16) unique not null,password varchar(40))

create table user_number (user_id int references users(user_id),number numeric(15,0),description varchar(15))

create table user_address(user_id int references users(user_id),address varchar(80),apt_num varchar(15),city varchar(25),state varchar(20),zip numeric(5,0),decription varchar(15))

create table finaid_main (aid int primary key,name varchar(50) unique not null,category varchar(15))

create table user_finaid_map(user_id int references users(user_id),aid_id int references finaid_main(aid),
semester varchar(8),year int,offered numeric(18,2),accepted numeric(18,2))

create table user_email(user_id int references users(user_id),email varchar(50) primary key,description varchar(15))

create table role(role_id int primary key,role_name varchar(3) unique not null,role_full_name varchar(16))

create table user_role(user_id int references users(user_id),role_id int references role(role_id))

create table hold_main (user_id int references users(user_id),hold_id int primary key,name varchar(25) unique not null,description varchar(15))

create table user_hold_map(user_id int references users(user_id),hold_id int references hold_main(hold_id))

create table user_balance(user_id int references users(user_id),balance numeric(18,2))

create table user_salary(user_id int references users(user_id),salary numeric(18,2))

create table department (dept_name varchar(25) primary key,building varchar(20),budget numeric(18,2))

create table course (class_id int primary key,name varchar(25),dept_name varchar(25) references department(dept_name),credits numeric(15,2),description varchar(100))


create table time_slot(time_slot_id int primary key,days varchar(8),start_time time,end_time time)


create table section(class_id int references course(class_id),class_num int primary key,semester varchar(7),year int,room_no varchar(6),time_slot_id int references time_slot(time_slot_id),capacity int)


create table takes(user_id int references users(user_id),class_id int references course(class_id),class_num int references section(class_num),semester varchar(7),year int,grade varchar(2))

create table teaches (user_id int references users(user_id),class_id int references course(class_id),class_num int references section(class_num),semester varchar(7),year int)

create table requisite (class_id int references course(class_id),req_id int primary key,type varchar(4))