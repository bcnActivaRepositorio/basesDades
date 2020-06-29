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