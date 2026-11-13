use nba;
SELECT Ciudad FROM equipos
	WHERE Nombre=(SELECT Nombre_equipo FROM jugadores
		WHERE Nombre='Pau Gasol');