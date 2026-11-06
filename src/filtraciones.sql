USE compras;

SELECT * FROM Articulos
	WHERE preunart >180 AND stockart <= 300;

SELECT * FROM Articulos
	WHERE preunart NOT BETWEEN 180 AND 300;


USE nba;

SELECT * FROM jugadores
	WHERE Nombre_equipo IN ('Lakers', 'Timberwolves');