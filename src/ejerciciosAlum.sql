USE ALUMNO;
SELECT * FROM ALUM2014;

SELECT dni,nombre,apellidos,curso,nivel,clase FROM ALUM2014

SELECT nombre , apellidos FROM ALUM2014
	WHERE poblacion='GUADALAJARA';

SELECT dni,nombre,apellidos,curso,nivel,clase,
	YEAR(GETDATE())-YEAR(fecha_nac) AS Edad FROM ALUM2014
	ORDER BY nombre, apellidos DESC;

SELECT dni FROM ALUM2014
	WHERE fecha_nac IS NULL;

SELECT * FROM ALUM2014
	WHERE fecha_nac IS NOT NULL;

SELECT dni,nombre, apellidos FROM ALUM2014
	WHERE apellidos ='%Pérez%';

SELECT dni,nombre,apellidos,curso,nivel,clase FROM ALUM2014
	WHERE poblacion IN ('MARCHAMALO', 'CABANILLAS', 'YUNQUERA');

SELECT dni,nombre,apellidos,curso,nivel,clase FROM ALUM2014
	WHERE YEAR(GETDATE())-YEAR(fecha_nac) BETWEEN 17 AND 20;

SELECT dni, nombre, apellidos, nivel,
(faltas1+faltas2+faltas3)/3 Promedio_faltas
FROM alum2014 WHERE nivel in ('ESO', 'ESI');

SELECT * FROM ALUM2014
	WHERE faltas1 + faltas2 + faltas3 IS NULl;

SELECT dni, nombre, apellidos, nivel FROM ALUM2014
	WHERE YEAR(fecha_nac)=1998 AND MONTH(fecha_nac)=5;