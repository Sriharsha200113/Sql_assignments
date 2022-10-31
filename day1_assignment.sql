--Q1 : Write a sql query to fetch the unique cities the employees of an organization belong to.
create database organization;
use [tempdb]

create table emp(
emp_id int,
emp_name varchar(50),
emp_dept varchar(50),
emp_city varchar(50),
);

insert into emp values(1,'ujwal','CSE','Vijayawada')
insert into emp values(5,'sunny','CSE','Vijayawada')
insert into emp values(10,'Surya','ECE','Hyderabad')
insert into emp values(7,'ajayy','ECE','Guntur')
insert into emp values(3,'jay','CSE','Warangal')

select * from emp;
select distinct emp_city from emp;


--Q2 : Create a cricket player table where the country name and the person name are together the primary key
create database player_details;
use [tempdb]

create table cricket(
name varchar(50) NOT NULL,
country varchar(50) NOT NULL,
runs int,
primary key (name, country)
);

insert into cricket values('Virat','India',7000)
insert into cricket values('Dhoni','India',9000)
insert into cricket values ('Sachin','India',12000)
insert into cricket values('Warner','Australia',6000)
insert into cricket values('Gayle','West Indies',10000)

select * from cricket;


--Q3 : Write a sql query to display all the students who have joined the Physics course after the month of July.
create database student_details;
use [tempdb]

create table student(
st_id int NOT NULL,
st_name varchar(50),
st_subject varchar(50),
st_date_of_join date
primary key(st_id)
);

insert into student values(3,'ujwal','maths','2022-03-20') 
insert into student values(7,'Sunny','english','2022-07-20')
insert into student values(11,'sai','oops','2022-09-15')
insert into student values(4,'Rachana','physics','2022-08-12')
insert into student values(8,'pratyusha','chemistry','2022-11-15')
insert into student values(6,'Tapaswi','physics','2022-07-15')

SELECT * FROM student WHERE  st_subject='physics' and st_date_of_join >='2022-08-01'

--Q4 : Create 2 similar tables (Students in 2 colleges) and show only the students who are aged over 21 and are studying Mathematics

use [tempdb]
create table st1(
st1_id int NOT NULL,
st1_name varchar(50),
st1_subj varchar(50),
st1_age int,
primary key (st1_id)
);


create table st2(
st2_id int NOT NULL,
st2_name varchar(50),
st2_subj varchar(50),
st2_age int,
primary key (st2_id)
);

insert into st1 values(1,'Harsha','maths',21)
insert into st1 values(5,'Ujwal','physics',25)
insert into st1 values(3,'sai ','physics',24)
insert into st1 values(4,'rachana','maths',20)
insert into st1 values(7,'pratyusha','english',26)
insert into st1 values (15,'sunny','maths',22)
select * from st1;

insert into st2 values(1,'tapaswi','maths',28)
insert into st2 values(11,'yeswanthi','maths',17)
insert into st2 values(8,'sevitha','physics',24)
insert into st2 values(4,'fazzela','maths',26)
insert into st2 values(7,'anushka','english',26)

select * from st2;


select * from st1 where(st1_age>21 and st1_subj='maths') union select * from st2 where(st2_age>21 and st2_subj='maths');
