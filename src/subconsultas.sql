use nba;
SELECT Ciudad FROM equipos
	WHERE Nombre=(SELECT Nombre_equipo FROM jugadores
		WHERE Nombre='Pau Gasol');

SELECT Nombre_equipo FROM jugadores
	WHERE altura = (SELECT MAX(altura) FROM jugadores); /* Se pueden anidar todas la
															subconsultas que quiera */

SELECT ciudad FROM equipos
	WHERE Nombre IN (SELECT Nombre_equipo FROM jugadores
			WHERE altura = (SELECT MAX(altura) FROM jugadores));

SELECT Nombre, peso FROM jugadores
	WHERE Peso > (SELECT MAX(peso) FROM jugadores
					WHERE Procedencia = 'Spain');

SELECT nombre, Posicion FROM jugadores
	WHERE Posicion LIKE '%G%' AND peso > ANY (SELECT peso FROM jugadores
					WHERE Posicion LIKE '%C%');

SELECT DISTINCT Division FROM equipos
	WHERE Nombre IN(SELECT Nombre_equipo FROM jugadores
						WHERE Procedencia = 'Spain');


SELECT nombre,Altura FROM jugadores
	WHERE Nombre_equipo IN (SELECT Nombre FROM equipos
						WHERE Division = 'SouthEast')
	AND Altura = (SELECT MIN(altura) FROM jugadores)


SELECT nombre FROM jugadores
	WHERE peso > (SELECT AVG(Peso) FROM jugadores
					WHERE Nombre_equipo = 'Timberwolves')
	AND Nombre_equipo= 'Timberwolves';

