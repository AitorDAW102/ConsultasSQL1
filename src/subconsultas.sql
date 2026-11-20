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

SELECT DISTINCT Division FROM equipos
WHERE Division NOT IN (SELECT DISTINCT Division FROM equipos
	WHERE nombre IN (SELECT nombre_equipo FROM jugadores
			WHERE Procedencia = 'Slovenia'));

SELECT * FROM equipos
	WHERE Nombre IN (SELECT nombre_equipo FROM jugadores)
	GROUP BY Nombre
	HAVING COUNT(Nombre)>=15;


SELECT Nombre FROM equipos
	WHERE Nombre IN (SELECT Nombre_equipo FROM jugadores)

SELECT * FROM equipos 
	WHERE Nombre IN (SELECT Nombre_equipo FROM jugadores
			GROUP BY Nombre_equipo
			HAVING COUNT(codigo)>=15);

SELECT * FROM equipos 
	WHERE EXISTS (SELECT Nombre_equipo FROM jugadores
			WHERE equipos.Nombre=jugadores.Nombre_equipo
			GROUP BY Nombre_equipo
			HAVING COUNT(codigo)>=15);

USE compras;

SELECT nombrpro FROM Proveedores
	WHERE codigpro IN (SELECT codigpro FROM Pedidos)

SELECT nombrpro FROM Proveedores
	WHERE EXISTS (SELECT codigpro FROM Pedidos /* SIEMPRE QUE USE EXIST TENGO QUE EN LA SUBCONSULTA HACER EN SU WHERE UNA COMPARACION */
		WHERE Proveedores.codigpro = Pedidos.codigpro)