create database Banglore;

use [master];

-- Q1 : Create a Stored Procedure to show only the Employees working on C# in the base location of Bangalore. Display the result set with Employee ID, Name, Working Language and Base Location.
create table employee2(emp_id int primary key,emp_name varchar(50) not null,work_language varchar(50) not null ,
location varchar(50) not null);

insert into employee2 values(123,'Rachana','C#','Bangalore');
insert into employee2 values(456,'Sunny','Java','Hyd');
insert into employee2 values(789,'Rishi','C#','Hyd');
insert into employee2 values(111,'pratyusha','Python','Bangalore');
insert into employee2 values(555,'Bansi','.NET','Chennai');
go

CREATE PROCEDURE get_employee2
AS
Select emp_id,emp_name,work_language,location from employee2 where  work_language='C#' and location='Bangalore';

exec get_employee2



--Q2
create table student2(student_id int primary key, student_name varchar(50) not null,
maths int,economics int,commerce int , english int, computer_science int);

insert into student2 values(111,'Harsha',45,55,70,85,68);
insert into student2 values(123,'Sunny',56,78,90,45,55);
insert into student2 values(125,'Lakshmi',79,90,66,54,89);
insert into student2 values(345,'Mohana',54,88,94,45,37);
insert into student2 values(555,'ujwal',78,49,76,49,85);
insert into student2 values(234,'Latha',68,90,83,66,39);
insert into student2 values(567,'rachana',67,89,46,78,66);
insert into student2 values(789,'pratyusha',75,38,88,56,86);
insert into student2 values(456,'rishi',59,90,63,85,73);
insert into student2 values(444,'prakash',59,49,87,48,74);


go

CREATE PROCEDURE student_details
AS
SELECT student_id,student_name,(maths+economics+commerce+english+computer_science) as Total,
ROW_NUMBER() OVER(
	ORDER BY (maths+economics+commerce+english+computer_science) DESC
)
AS 'RANK'
FROM student2;

exec student_details

-- Q3: 

CREATE TABLE stud_Info(
s_Id INT PRIMARY KEY,
s_Name varchar(20),
s_Age INT,
s_Sex varchar(10),
s_Course varchar(20),
s_Year INT
)


insert into stud_Info values(11,'Harsha',21,'F','ECE',3)
insert into stud_Info values(12,'Rachana',20,'F','CSE',2)
insert into stud_Info values(13,'Pratyusha',22,'F','ECE',4)
insert into stud_Info values(14,'Tapaswi',19,'F','EEE',1)
insert into stud_Info values(15,'Yeswanthi',19,'F','ECE',1)
insert into stud_Info values(16,'Latha',20,'F','ME',1)
insert into stud_Info values(17,'Sunny',24,'F','CSE',4)
insert into stud_Info values(18,'ujwal',20,'F','CSE',1)
insert into stud_Info values(16,'Sruthi',22,'F','CE',3)
insert into stud_Info values(17,'yashoda',24,'F','ECE',4)


go

Create or ALTER PROCEDURE p_2 @year INT AS
SELECT * from stud_info where s_Year=@year


EXEC p_2 @year=3



--Q4
go

CREATE function simpleInterest (@Principle BIGINT,@Time INT)
RETURNS BIGINT AS
BEGIN
   DECLARE @Rate AS INT
   SET  @Rate=5
  DECLARE @Result AS BIGINT
  SELECT  @Result = (@Principle*@Rate*@Time)/100
  RETURN @Result
END

SELECT dbo.simpleInterest(65000,5)


--Q5: Create a table that has time from various time zones (US, UK, Dubai, Singapore, etc) Create a UDF where you set the alarm clock to 5 am if the time zone is Dubai, 6 am if it is UK and 7 am if it is any other time zone.

CREATE TABLE time_Zone(
country_code INT PRIMARY KEY,
country_name varchar(20),
)

insert into time_zone values(0010,'US')
insert into time_zone values(0015,'UK')
insert into time_zone values(0020,'Dubai')
insert into time_zone values(0025,'Singapore')


GO
CREATE  or alter FUNCTION timeZone (@c_name varchar(20))
RETURNS varchar(20) AS
BEGIN
DECLARE @res AS varchar(20)
   IF @c_name='Dubai'
    set @res = '5 am'
   ELSE IF @c_name='UK'
     set @res = '6 am'
   ELSE 
   set @res = '7 am'

   RETURN @res
END
GO
select dbo.timeZone('Singapore')


