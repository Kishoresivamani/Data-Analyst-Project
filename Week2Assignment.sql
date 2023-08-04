show schemas;
create schema if not exists Travego;
use Travego;
DROP Table PASSENGER;
create table IF NOT exists passenger(
passenger_id int not null primary key,
passenger_name varchar(20),
category varchar(20),
GENDER VARCHAR(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20)
);
create table price(
id int not null primary key,
bus_type varchar(20),
distance int,
price int
);

insert into passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into price values
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860)
;
SELECT * FROM passenger;
select * from price;
-- a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender,count(gender) from passenger where distance >=600 group by gender ;

-- b.	Find the minimum ticket price of a Sleeper Bus. 
select min(price) from price where bus_type like '%sleeper%';

-- c.	Select passenger names whose names start with character 'S' 
select passenger_name from passenger where passenger_name like 's%';

-- d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, 
-- Destination City, Bus_Type, Price in the output
select Passenger_name, Boarding_City,Destination_City, Bus_Type from passenger; 
select price from price;
select p.Passenger_name, p.Boarding_City,p.Destination_City, p.Bus_Type ,pri.price 
from passenger p 
join price pri 
on p.bus_type=pri.bus_type and p.distance =pri.distance;

-- e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select passenger_name ,price from passenger p
join price pri
using(bus_type)
where p.distance = 1000 and p.bus_type like '%sitting%';

-- f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? 
select passenger_name,p.bus_type,price from passenger p
left  outer join price pri
on p.passenger_id=pri.id
where p.passenger_name='Pallavi';

-- g.	List the distances from the "Passenger" table which are unique (non-repeated distances)
-- in descending order. 
select distinct distance from passenger order by distance desc;

-- h.	Display the passenger name and percentage of distance traveled by that passenger from 
	-- the total distance traveled by all passengers without using user variables 
select passenger_name, round((distance/(select sum(distance) from passenger))*100,2) as percentage_of_distance from passenger;