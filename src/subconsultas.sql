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


SELECT Nombre, Altura FROM jugadores
WHERE Altura = (SELECT MIN(altura) FROM jugadores
WHERE Nombre_equipo IN (SELECT Nombre FROM equipos
						WHERE Division = 'SouthEast')) AND Nombre_equipo IN (SELECT Nombre FROM equipos
						WHERE Division = 'SouthEast')

SELECT codigo FROM jugadores
	WHERE codigo IN (SELECT jugador FROM estadisticas
			WHERE Puntos_por_partido > (SELECT AVG(Puntos_por_partido) FROM estadisticas));


SELECT nombre FROM jugadores
	WHERE peso > (SELECT AVG(Peso) FROM jugadores
					WHERE Nombre_equipo = 'Timberwolves')
	AND Nombre_equipo= 'Timberwolves';



SELECT COUNT(j.nombre) AS NumeroJugadores, j.Nombre_equipo FROM jugadores j /* CONSULTAS CORRELADAS para poder usar un valor dentro de un subconjunto */
	WHERE j.Peso>(SELECT AVG(ju.peso) FROM jugadores ju
						WHERE j.Nombre_equipo=ju.Nombre_equipo)
	GROUP BY j.Nombre_equipo
	HAVING COUNT(j.nombre)>=5;

SELECT COUNT(codigo) AS NumeroJugadores, Nombre_equipo FROM jugadores
	WHERE Procedencia = 'Spain'
	GROUP BY Nombre_equipo
	HAVING COUNT(codigo)>=2;