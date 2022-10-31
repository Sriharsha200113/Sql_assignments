--Q1 : Create an orders/ product /customer table with the following schema. 

create database restaurant;
use [tempdb]

create table customer(
cust_id int NOT NULL,
cust_name varchar(50),
cust_address varchar(50),
cust_tel varchar(10),
cust_email varchar(40)
primary key(cust_id)
);

insert into customer values(1,'Harsha','hyd','924892','Harsha@gmail.com')
insert into customer values(2,'siri','vja','13482','Siri@gmail.com')
insert into customer values(3,'ujwal','rjy','495435','ujwal@gmail.com')
insert into customer values(4,'rachana','ongole','72222','rachana@gmail.com')


create table item(
item_id int NOT NULL, 
item_name varchar(50),
item_price int,
customer_id int NOT NULL,
primary key (item_id),
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);


insert into item values(1,'pizza',120,1)
insert into item values(2,'burger',100,3)
insert into item values(3,'sandwich',80,4)
insert into item values(4,'noodles',100,2)
insert into item values(5,'paneer roll',60,1)
insert into item values(6,'icecream',70,3)


create table orders(
orders_id int NOT NULL Primary key,
customer_id int NOT NULL,
orders_datetime datetime,
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);


insert into orders values(1,2,'2022/10/15 12:07:21')
insert into orders values(2,3,'2022/09/21 11:08:35')
insert into orders values(3,4,'2022/08/25 14:08:25')
insert into orders values(4,1,'2022/09/11 18:10:25')
insert into orders values(5,2,'2022/10/26 23:08:15')

create table order_item(
ord_item_id int NOT NULL Primary key,
order_id int NOT NULL,
item_id int NOT NULL,
customer_id int NOT NULL,
product_quantity varchar(50),
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

insert into order_item values(1,3,6,1,'good')
insert into order_item values(2,2,4,4,'not good')
insert into order_item values(3,5,1,3,'bad')
insert into order_item values(4,1,5,3,'too good')
insert into order_item values(5,4,2,2,'bad')

--Q2 : Create a student table which has information about Students, their marks, courses, etc. Display on screen the maximum marks, each student has obtained in each course, order it by course.

use [tempdb]
CREATE TABLE student (student_id int NOT NULL primary key, student_name varchar(20), course varchar(20),marks int )

insert into student values (123,'Harsha','maths',40)
insert into student values (456,'sai teja','chemistry',55)
insert into student values (789,'siri','physics',75)
insert into student values (101,'lakshman','maths',90)
insert into student values (105,'jayanth','chemistry',77)
insert into student values (110,'yasaswini','chemistry',89)
insert into student values (100,'latha','physics',85)
insert into student values (80,'yashoda','maths',90)

SELECT * FROM student  WHERE marks IN (SELECT MAX(marks) FROM student GROUP BY course)  ORDER BY course



--Q3 : Create a telephone_directory table for atleast 20 citizens. It should have id, name, tel number, address, profession. Query the table to check how many citizens are working professionals, students, etc. 
create database assignments;
use [tempdb]

CREATE TABLE Telephone_Directory (id int , name varchar(20),tel_no bigint,address varchar(30),profession varchar(20))


insert into Telephone_Directory values (1,'harsha',876971349,'hyd','Engineer')
insert into Telephone_Directory values (2,'ujwal',8769713412,'vja','Engineer')
insert into Telephone_Directory values (3,'jayanth',8736483822,'vja','doctor')
insert into Telephone_Directory values (4,'yaswanthi',8769713414,'bangalore','doctor')
insert into Telephone_Directory values (5,'yomitha',848981532,'vskp','student')
insert into Telephone_Directory values (6,'latha',8769713416,'chennai','IAS')
insert into Telephone_Directory values (7,'bharath',8739847417,'mumbai','student')
insert into Telephone_Directory values (8,'vidya',92749713418,'banglore','Engineer')
insert into Telephone_Directory values (9,'mohan',9472713419,'hyd','Lawyer')
insert into Telephone_Directory values (10,'swarnakanth',8769713410,'vskp','Lawyer')
insert into Telephone_Directory values (11,'jessi',9769713401,'kolkata','Engineer')
insert into Telephone_Directory values (12,'sunny',87394713402,'delhi','doctor')
insert into Telephone_Directory values (13,'harikanth',82437893403,'pune','Engineer')
insert into Telephone_Directory values (14,'priyanka',8769713404,'mumbai','Engineer')
insert into Telephone_Directory values (15,'charishma',7382713405,'hyd','business')
insert into Telephone_Directory values (16,'manjusha',8769713406,'vskp','bussiness')
insert into Telephone_Directory values (17,'divya',89279713407,'bangalore','bussiness')
insert into Telephone_Directory values (18,'aishwarya',8389713408,'chennai','Engineer')
insert into Telephone_Directory values (19,'bhargav',8769713409,'chennai','IAS')
insert into Telephone_Directory values (20,'ramya',82648713101,'bangalore','IAS')
insert into Telephone_Directory values (21,'sri',872478203,'vskp','doctor')


SELECT  profession,count(*) as count_profession from Telephone_Directory group by profession