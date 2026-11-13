USE nba;

SELECT * FROM jugadores;

SELECT MAX(Altura) AS altMAX FROM jugadores /* MAXIMO VALOR */
	WHERE Nombre_equipo='Lakers'

SELECT MIN(Peso) AS pesoMIN FROM jugadores /* MINIMO VALOR */
	WHERE Nombre_equipo='Lakers'

SELECT AVG(Peso) AS pesoMEDIO FROM jugadores /* MEDIA */
	WHERE Nombre_equipo='Lakers'

USE compras;

SELECT * FROM Articulos;

SELECT SUM(preunart*stockart) AS precioTOTAL FROM Articulos; /* SUMA DE TODOS LOS VALORES */

USE nba;

SELECT MAX(altura),Nombre_equipo FROM jugadores
	GROUP BY Nombre_equipo;

SELECT COUNT(codigo),Procedencia ,Nombre_equipo FROM jugadores /* COUNT CUENTA TODOS LOS VALORES Y EL GROUP BY VA
																PROBAR CON TODOS LOS TOMANDO EN CUENTA SUS VALORES Y
																SE PUEDEN HACER TODAS LAS TABLAS NECESARIAS */
	GROUP BY Nombre_equipo,Procedencia
	ORDER BY Nombre_equipo;

SELECT COUNT(codigo), Nombre_equipo FROM jugadores
	GROUP BY Nombre_equipo 
	HAVING COUNT(codigo)>=15 AND Nombre_equipo LIKE '_o%';
	