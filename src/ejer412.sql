USE Jardineria;

SELECT AVG(cuantia)FROM
(SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) cuantia FROM DetallePedidos
	GROUP BY CodigoPedido) AS tabla1;

USE nba;

SELECT * FROM partidos

SELECT equipo_local, COUNT(equipo_local) AS ganados FROM partidos
	WHERE puntos_local>puntos_visitante
	GROUP BY equipo_local;

SELECT equipo_visitante, COUNT(equipo_visitante) AS ganados FROM partidos
	WHERE puntos_visitante>puntos_local
	GROUP BY equipo_visitante

SELECT eLocal.equipo_local, (eLocal.ganados +eVisit.ganados) AS ganados
	FROM (SELECT equipo_local, COUNT(equipo_local) AS ganados FROM partidos
		WHERE puntos_local>puntos_visitante
		GROUP BY equipo_local) AS eLocal JOIN (SELECT equipo_visitante, COUNT(equipo_visitante) AS ganados FROM partidos
		WHERE puntos_visitante>puntos_local
		GROUP BY equipo_visitante) AS eVisit ON eLocal.equipo_local=eVisit.equipo_visitante

SELECT * FROM (SELECT equipo_local, COUNT(equipo_local) AS ganados FROM partidos
		WHERE puntos_local>puntos_visitante
		GROUP BY equipo_local) AS eLocal JOIN (SELECT equipo_visitante, COUNT(equipo_visitante) AS ganados FROM partidos
		WHERE puntos_visitante>puntos_local
		GROUP BY equipo_visitante) AS eVisit ON eLocal.equipo_local=eVisit.equipo_visitante