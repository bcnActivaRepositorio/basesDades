# US FLIGHTS

### Queries exercici.

 * _Quantitat registres vol_

 ![Registres](https://imgur.com/ckc74Yx.png)

     SELECT * FROM flights;

 * _Retard promig de sortida i arribada segons l’aeroport origen_

 **No Group**

![NoGroup](https://imgur.com/Nro1UV1.png)

    SELECT `Origin` AS "Origen", 
    AVG(`ArrDelay`) AS "avgLanding", 
    AVG(`DepDelay`) AS "avgTakeOff" 
    FROM `flights`;

**Group**

![Group](https://imgur.com/OiGMcAJ.png)
           

    SELECT `Origin` AS "Origen", 
    AVG(`ArrDelay`) AS "avgLanding", 
    AVG(`DepDelay`) AS "avgTakeOff" 
    FROM `flights` 
    GROUP BY Origin;