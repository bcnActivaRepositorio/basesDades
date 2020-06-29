-- SELECT * FROM flights WHERE DayOfWeek <=140 ORDER BY TailNum ASC limit 100;
-- SELECT * FROM flights WHERE ArrTime < 95 ORDER BY ArrTime ASC limit 10;
 -- SELECT origin, colYear, colMonth, AVG (ArrDelay) AS prom_arribades FROM flights group by Origin ,colYear, colMonth  limit 50;
-- SELECT city, colYear, colMonth, AVG (ArrDelay) AS prom_arribades FROM flights, usairports WHERE Origin = iata group by city ,colYear, colMonth  limit 50;
SELECT UniqueCarrier, colYear, colMonth, Cancelled, CancellationCode FROM flights  ORDER BY UniqueCarrier, colYear, colMonth, Cancelled,CancellationCode limit 250;

 