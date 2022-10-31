 --1.Write a query to fetch the first name and last name of a person from a table and display it together as "FULL NAME"
 create table FullName
(
   FirstName varchar(50),
   LastName varchar(50)
);
 insert into FullName values('Chris','Gayle');
insert into FullName values('David','Miller');
insert into FullName values('Virat','kohli');
insert into FullName values('Adam','Smith');

select *from FullName;

select concat(FirstName,' ',LastName) AS FullName from FullName;

-- 2.Write a query to find all the people from a given country. (Say, If 5 people are from Delhi, 3 are from Mumbai, it should list all the 8 people) . The city, country information should be in a different table, use joins.

create table country(
    country_id int primary key,
    country_name nvarchar(30)
)

insert into country values(10,'India')
insert into country values(20,'Sri Lanka')


create table city_table(
    person_name nvarchar(25),
    city_name nvarchar(30),
    country_id int,
    foreign key (country_id) references country(country_id)
)


insert into city_table values('	Harsha','Hyderabad',10)
insert into city_table values('Lakshman','Bangalore',10)
insert into city_table values('Yasaswini','Chennai',10)
insert into city_table values('Mohan','Seoul',20)
insert into city_table values('Bharath','Mumbai',10)
insert into city_table values('Vasanth','Bangalore',10)
insert into city_table values('Lucky','Kolkata',10)

select a.person_name, b.country_name
from country b , city_table a where b.country_id = a.country_id
and country_name = 'India'


-- 3.Write a sql query to fetch only the first 3 letters of the city from the city table

create table City1
(
   city varchar(50)
);
insert into City1 values('Mumbai');
insert into City1 values('Chennai');
insert into City1 values('Guntur');
insert into City1 values('Hyderabad');
insert into City1 values('Banglore');
insert into City1 values('Delhi');

select substring(city,1,3) FROM City1;

--4.Write a query to print the names of the employees and departments from the employee table with name ascending and department descending.
create table Employee
(
   name varchar(50),
   Department varchar(50)
);
insert into Employee values('Sunny','Devops');
insert into Employee values('Harsha','Ai');
insert into Employee values('Rachana','Marketing');
insert into Employee values('Ujwal','Finance');
insert into Employee values('Pratyusha','Fullstack');
insert into Employee values('Rishi','Bigdata');

SELECT * FROM Employee e ORDER BY e.name ASC,
         e.Department DESC ;

--5.Write a query to fetch the employee names who have salaries more than 50000 and less than 80000
create table Employees
(
   name varchar(50),
   Salary int
);
insert into Employees values('Sunny',50000);
insert into Employees values('Harsha',80000);
insert into Employees values('Rachana',90000);
insert into Employees values('Ujwal',75000);
insert into Employees values('Pratyusha',40000);
insert into Employees values('Rishi',10000);

select * from Employees e where e.Salary>=50000 and e.Salary<=80000;

--6.Write a sql query to fetch the list of employees who draw the same salary.
create table Employees1
(
   name varchar(50),
   Salary int
);
insert into Employees1 values('Sunny',50000);
insert into Employees1 values('Harsha',50000);
insert into Employees1 values('Rachana',75000);
insert into Employees1 values('Ujwal',75000);
insert into Employees1 values('Pratyusha',40000);
insert into Employees1 values('Rishi',10000);

SELECT name,Salary FROM Employees1 WHERE Salary IN (SELECT Salary FROM Employees1 GROUP BY Salary HAVING COUNT(*) > 1)

-- Q7:Write a query to fetch all students from the student table who do not study Maths and Physics

create table students(id int primary key,st_name varchar(50),course varchar(20));

insert into students values(1,'Harsha','Maths');
insert into students values(2,'ujwal','English');
insert into students values(3,'Manideep','Physics');
insert into students values(4,'Bharath','Chemistry');
insert into students values(5,'Lankesh','Physics');

select * from student where course!='Maths' and course!='Physics';

-- Q8: Write a query to fetch all students who joined after Feb 2020

create table student_detail(id int primary key, st_name varchar(20), DOJ date);

insert into student_detail values(1,'Harsha','2021/06/23')
insert into student_detail values(2,'Priyanka','2019/12/05')
insert into student_detail values(3,'Harini','2020/01/29')
insert into student_detail values(4,'Sunny','2020/04/15')
insert into student_detail values(5,'Vasanth','2022/07/22')

select * from student_detail where DOJ > '02/29/2020';

--Q9: From an orders table, fetch the maximum purchase amount a salesman has made in the last 6 months.

create table orders(
    order_id int  primary key,
    salesman_id int,
    amount int,
    sales_date date
)


insert into orders values (1,4,40000,'10/24/2022')
insert into orders values (2,5,45000,'8/20/2022')
insert into orders values (3,2,75000,'5/12/2022')
insert into orders values (4,5,25000,'4/5/2022')
insert into orders values (5,1,30000,'5/12/2022')
insert into orders values (6,1,40000,'6/22/2022')
insert into orders values (7,3,35000,'7/10/2022')
insert into orders values (8,2,32000,'8/1/2022')

select salesman_id, amount
from orders
where sales_date > '5/1/2022'
and amount = any (select max(amount) from orders group by salesman_id)
order by salesman_id