## Number of airlines with No departure/arrival delay with distance covered between 2500 and 3000

select A1.AIRLINE,count(*) AS Flights_with_no_delay from flights178 AS A2
LEFT JOIN airlines AS A1 ON A2.AIRLINE=A1.IATA_CODE
WHERE DISTANCE between 2500 AND 3000 and DEPARTURE_DELAY<=0 and ARRIVAL_DELAY<=0 group by A1.AIRLINE order by Flights_with_no_delay DESC;	