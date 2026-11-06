USE nba;



SELECT Nombre, Division FROM equipos ORDER BY Division;

SELECT TOP 20 Nombre, Division FROM equipos ORDER BY Division DESC;

SELECT TOP 10 PERCENT Nombre, Division FROM equipos ORDER BY Division;