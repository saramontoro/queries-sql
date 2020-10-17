-- Consulta 1 - Quantitat de registres de la taula de vols:

SELECT COUNT(*) FROM flights;

-- Consulta 2 - Retard promig de sortida i arribada segons l’aeroport origen:

SELECT Origin, AVG(ArrDelay) AS prom_arribades, AVG(DepDelay) AS prom_sortides FROM Flights GROUP BY Origin;

-- Consulta 3 - Retard promig d’arribada dels vols, per mesos, anis i segons l’aeroport origen. A més, volen que els resultats es mostrin de la segment forma:

SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM Flights GROUP BY Origin, colYear, colMonth ORDER BY Origin, colYear, colMonth;

-- Consulta 4 - Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat:

SELECT City, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM Flights LEFT JOIN USAirports ON IATA = Origin GROUP BY City, colYear, colMonth ORDER BY City, colYear, colMonth;

-- Consulta 5 - Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenadas de forma que les companyies amb més cancel·lacions apareguin les primeres:

SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) AS total_cancelled FROM Flights GROUP BY UniqueCarrier, colYear, colMonth ORDER BY total_cancelled DESC;

-- Consulta 6 - L’identificador dele 10 avions que més distància han recorregut fent vols:

SELECT TailNum, SUM(Distance) AS totalDistance FROM Flights GROUP BY TailNum ORDER BY totalDistance DESC LIMIT 10;

-- Consulta 7 - Companyies amb el seu retard promig noms d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts:

SELECT UniqueCarrier, AVG(ArrDelay) AS avgDelay 
FROM Flights  
GROUP BY UniqueCarrier
HAVING avgDelay > 10 
ORDER BY avgDelay DESC;