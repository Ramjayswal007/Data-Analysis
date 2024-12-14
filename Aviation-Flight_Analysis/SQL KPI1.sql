create database Flights_Analysis;
use Flights_Analysis;
select * from airlines;
select * from airports;
load data infile 
## Weekday Vs Weekend total flights statistics

select AIRLINE,
sum(case when DAY_OF_WEEK in (1,2,3,4,5) then 1 else 0 end) as Weekday_Total_flights,
sum(case when DAY_OF_WEEK in (6,7) then 1 else 0 end) as Weekend_Total_flights,
count(DAY_OF_WEEK) as Total_flights
 from flights178 as w1 group by AIRLINE
order by Weekend_Total_flights;	

select "","","" from flights178
union
select "Weekday_Total_flights",sum(case when DAY_OF_WEEK in (1,2,3,4,5) then 1 else 0 end) as Weekday_Total_flights,CONCAT(CAST((sum(case when DAY_OF_WEEK in (1,2,3,4,5) then 1 else 0 end)/5819079)*100 AS signed),"%")   from flights178
UNION
select "Weekend_Total_flights",sum(case when DAY_OF_WEEK in (6,7) then 1 else 0 end) as Weekend_Total_flights ,concat(CAST((sum(case when DAY_OF_WEEK in (6,7) then 1 else 0 end)/5819079)*100 AS signed),"%") from flights178
UNION
SELECT "Total_flights",count(DAY_OF_WEEK),"" as Total_flights from flights178 limit 1,3;


select "Weekends",count(DAY_OF_WEEK) as Weekends from flights178 where DAY_OF_WEEK > 5
union
select "WeekDays",count(DAY_OF_WEEK) as WeekDays from flights178 where DAY_OF_WEEK <6;