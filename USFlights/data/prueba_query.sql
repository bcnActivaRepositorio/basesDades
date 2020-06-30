-- SELECT * FROM flights WHERE DayOfWeek <=140 ORDER BY TailNum ASC limit 100;
-- SELECT * FROM flights WHERE ArrTime < 95 ORDER BY ArrTime ASC limit 10;
 -- SELECT origin, colYear, colMonth, AVG (ArrDelay) AS prom_arribades FROM flights group by Origin ,colYear, colMonth  limit 50;
-- SELECT city, colYear, colMonth, AVG (ArrDelay) AS prom_arribades FROM flights, usairports WHERE Origin = iata group by city ,colYear, colMonth  limit 50;
-- SELECT UniqueCarrier, colYear, colMonth, Cancelled, CancellationCode FROM flights  ORDER BY UniqueCarrier, colYear, colMonth, Cancelled,CancellationCode limit 250;

 SELECT distinct UniqueCarrier FROM flights;
 SELECT COUNT(*) FROM flights;
 SELECT * FROM flights limit 1;
 -- SELECT Origin, uniqueCarrier, colYear FROM flights LIMIT 45;
 -- SELECT UniqueCarrier, colYear, colMonth, COALESCE (sum(cancelled), 0) AS total_cancelled FROM flights GROUP BY UniqueCarrier, colYear, colMonth HAVING total_cancelled > 0 ORDER BY total_cancelled DESC;
 -- SELECT 
 

 
 