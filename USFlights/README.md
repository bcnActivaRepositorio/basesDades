# US FLIGHTS

### Queries exercici.

 * _Quantitat registres vol_

 ![Registres](https://imgur.com/ckc74Yx.png)

     SELECT * FROM flights;

 * _Retard promig de sortida i arribada segons l’aeroport origen_

 **No Group**

 * _Retard promig_

![NoGroup](https://imgur.com/Nro1UV1.png)

    SELECT Origin AS "Origen", 
    AVG(ArrDelay) AS "prom_arribades", 
    AVG(DepDelay) AS "prom_sortides" 
    FROM flights;

**Group**

* _Retard promig de sortida i arribada segons l’aeroport origen_

![Group](https://imgur.com/OiGMcAJ.png)
           

    SELECT Origin AS "Origen", 
    AVG(ArrDelay) AS "prom_arribades", 
    AVG(DepDelay) AS "prom_sortides" 
    FROM flights 
    GROUP BY Origin;

* _Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files)_    

![Group by Origin, year and month](https://imgur.com/zKCYncK.png)

    SELECT Origin AS "Origen",
    colYear, colMonth,
    AVG(ArrDelay) AS "prom_arribades",
    AVG(DepDelay) AS "prom_sortides"
    FROM flights
    GROUP BY Origin, colYear, colMonth;

* _Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat._    

![INNER JOIN](https://imgur.com/yh8F7Qf.png)

    SELECT City, colYear, colMonth, 
    AVG(ArrDelay) AS "prom_arribades"
    FROM flights
    INNER JOIN usairports
    ON flights ID = IATA
    GROUP BY City, colYear, colMonth; 


    SELECT title, domestic_sales, international_sales FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id WHERE international_sales > domestic_sales;

* _Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres_*

![sum](https://imgur.com/WACdPCE.png)

    SELECT UniqueCarrier, colYear, colMonth
    SUM(Cancelled) AS "total_cancelacions"
    FROM flights 
    GROUP BY UniqueCarrier, colYear, colMonth
    ORDER BY "total_cancelacions" DESC;

Problemes amb el resultat de la columna Cancelled ja que tots son NULL

![coalesce(sum(cancelled))](https://imgur.com/Qnz50au.png)

    SELECT UniqueCarrier, colYear, colMonth, COALESCE (sum(cancelled), 0) AS total_cancelled 
    FROM flights GROUP BY UniqueCarrier, colYear, colMonth 
    HAVING total_cancelled > 0 ORDER BY total_cancelled DESC;

###### Consideracions

La importancia de l'ordre en la pujada de les dades **( f, a, c)**_upsidedown_ i, en aquest cas, repasar una i un altre vegada la qualitat de les dades. Sense cap mena de dubte, la query més difícil.

* _L’identificador dels 10 avions que més distància han recorregut fent vols_*

![TailNum and totalDistance](https://imgur.com/AuxVrsQ.png)

    SELECT TailNum, SUM(Distance) AS totalDistance 
    FROM flights 
    WHERE TailNum IS NOT NULL 
    GROUP BY TailNum ORDER BY totalDistance DESC LIMIT 10;

 _Per què les dues fórmules funcionen? A preguntar a l'Ismael.(WHERE & HAVING)_

    SELECT TailNum, SUM(Distance) AS totalDistance 
    FROM flights 
    GROUP BY TailNum HAVING TailNum IS NOT NULL
    ORDER BY totalDistance DESC LIMIT 10;

* _Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts._

![Ten minutes and last](https://imgur.com/uFLq3Rd.png)

    SELECT UniqueCarrier, AVG(ArrDelay) AS avgDelay 
    FROM flights  GROUP BY UniqueCarrier 
    HAVING avgDelay > 10 ORDER by avgDelay DESC;

1:04 am 01/07/20

Finalment l'última query!


### Documentació

[basics](https://sqlbolt.com/lesson/select_queries_introduction)

[select](https://www.youtube.com/watch?v=YufocuHbYZo)

[select2](https://www.youtube.com/watch?v=9yeOJ0ZMUYw)

[Tens les dades bé?](https://www.linkedin.com/in/ismael-kale-programador-php-angular-ab155372/?originalSubdomain=es)

[check if NULL](https://www.w3schools.com/sql/sql_null_values.asp)

[having](https://www.dofactory.com/sql/having) 

[differences where and having](https://www.sqltutorial.org/sql-having/)




