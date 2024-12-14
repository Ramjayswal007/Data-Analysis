## Week wise, State wise and City wise statistics of delay of flights with airline details	

select  DAY_OF_WEEK,A3.STATE,A3.CITY,A1.AIRLINE,
sum(case when DEPARTURE_DELAY>=1 then 1 else 0 end) as DEPARTURE_DELAY,
sum(case when ARRIVAL_DELAY>=1 then 1 else 0 end) as ARRIVAL_DELAY,
sum(case when AIR_SYSTEM_DELAY>=1 then 1 else 0 end)as AIR_SYSTEM_DELAY,
sum(case when SECURITY_DELAY>=1 then 1 else 0 end) as SECURITY_DELAY ,
sum(case when AIRLINE_DELAY>=1 then 1 else 0 end) as AIRLINE_DELAY ,
sum(case when LATE_AIRCRAFT_DELAY>=1 then 1 else 0 end) as LATE_AIRCRAFT_DELAY,
sum(case when WEATHER_DELAY>=1 then 1 else 0 end) as WEATHER_DELAY,
sum(case when DEPARTURE_DELAY>=1 then 1 else 0 end) as DEPARTURE_DELAY
from flights178 AS A2
LEFT JOIN airlines AS A1 ON A2.AIRLINE=A1.IATA_CODE 
LEFT JOIN airports AS A3 ON A2.ORIGIN_AIRPORT=A3.IATA_CODE
group by DAY_OF_WEEK,A1.AIRLINE,A3.STATE,A3.CITY order by DAY_OF_WEEK,A1.AIRLINE,A3.STATE,A3.CITY;


select A3.STATE,A3.CITY,A1.AIRLINE,
sum(case when DEPARTURE_DELAY>=1 then 1 else 0 end) as DEPARTURE_DELAY,
sum(case when ARRIVAL_DELAY>=1 then 1 else 0 end) as ARRIVAL_DELAY,
sum(case when AIR_SYSTEM_DELAY>=1 then 1 else 0 end)as AIR_SYSTEM_DELAY,
sum(case when SECURITY_DELAY>=1 then 1 else 0 end) as SECURITY_DELAY ,
sum(case when AIRLINE_DELAY>=1 then 1 else 0 end) as AIRLINE_DELAY ,
sum(case when LATE_AIRCRAFT_DELAY>=1 then 1 else 0 end) as LATE_AIRCRAFT_DELAY,
sum(case when WEATHER_DELAY>=1 then 1 else 0 end) as WEATHER_DELAY,
sum(case when DEPARTURE_DELAY>=1 then 1 else 0 end) as DEPARTURE_DELAY
from flights178 AS A2
LEFT JOIN airlines AS A1 ON A2.AIRLINE=A1.IATA_CODE 
LEFT JOIN airports AS A3 ON A2.ORIGIN_AIRPORT=A3.IATA_CODE
group by A1.AIRLINE,A3.STATE,A3.CITY;

select A1.AIRLINE,cast(SUM(DEPARTURE_DELAY)/60 as signed) as DEPARTURE_DELAY,cast(SUM(ARRIVAL_DELAY)/60 as signed) as ARRIVAL_DELAY,cast(SUM(AIR_SYSTEM_DELAY)/60 as signed)as AIR_SYSTEM_DELAY,
cast(sum(SECURITY_DELAY)/60 as signed) as SECURITY_DELAY,cast(SUM(AIRLINE_DELAY)/60 as signed) as AIRLINE_DELAY,
cast(SUM(LATE_AIRCRAFT_DELAY)/60 as signed) as LATE_AIRCRAFT_DELAY,cast(SUM(WEATHER_DELAY)/60 as signed) as WEATHER_DELAY,
sum(case when DEPARTURE_DELAY>1 then 1 else 0 end) 
from flights178 AS A2
LEFT JOIN airlines AS A1 ON A2.AIRLINE=A1.IATA_CODE group by A1.AIRLINE;