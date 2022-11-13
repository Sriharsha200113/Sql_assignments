create database event;
use event;

CREATE TABLE Event( 
event_id INT PRIMARY KEY,
Events_name varchar(30),
event_date date,
organizer  varchar(20),
loc varchar(50),
total_cost BIGINT
)


insert into Event values(1,'aniversary','11-04-2022','Sunny','hyderabad',20000)
insert into Event values(2,'conference','10-04-2022','Harsha','chennai',30000)
insert into Event values(3,'seminar','05-04-2022','Rachana','bangalore',40000)
insert into Event values(4,'party','06-04-2022','Rishi','hyderabad',50000)

insert into Event values(5,'aniversary','11-04-2022','Ujwal','bangalore',30000)
insert into Event values(6,'conference','10-04-2022','Pratyusha','mumbai',20000)
insert into Event values(7,'seminar','05-04-2022','yeswanthi','mumbai',50000)
insert into Event values(8,'party','06-04-2022','Harini','chennai',40000)

go
CREATE OR ALTER PROCEDURE display_events @event_date date AS
BEGIN
SELECT * from Event where event_date = @event_date
END

EXEC display_events '11-04-2022';
go

CREATE OR ALTER FUNCTION disp_Event()

RETURNS TABLE AS

RETURN 
SELECT count(Events_name) AS numofevents  from Event where total_cost = (select MAX(total_cost) from Event )

go
select * from disp_Event()

go
CREATE OR ALTER PROCEDURE display_events @location varchar(50) AS
BEGIN
SELECT * from Event where loc = @location
END


EXEC display_events 'bangalore'