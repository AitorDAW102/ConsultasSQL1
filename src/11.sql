USE nba;
SELECT Nombre_equipo FROM jugadores
	WHERE (peso*0.4535 ) BETWEEN 90 AND 120
	GROUP BY Nombre_equipo
	HAVING COUNT(codigo)>=2;