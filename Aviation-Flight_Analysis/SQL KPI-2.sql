## Total number of cancelled flights for JetBlue Airways on first date of every month


select A1.AIRLINE,MONTH,DAY,sum(CANCELLED) AS "No_of_cancelled_flights" from flights178 AS A2
LEFT JOIN airlines AS A1 ON A2.AIRLINE=A1.IATA_CODE
where DAY=1 AND A1.AIRLINE='JetBlue Airways'  group by A1.AIRLINE,MONTH,DAY order by MONTH;















