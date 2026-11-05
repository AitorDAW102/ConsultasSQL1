USE compras;

SELECT codigart, descrart FROM Articulos;

SELECT 5*8;


SELECT codigart AS codigo ,descrart AS descripcion,
	'bd compras' AS base_datos FROM Articulos;

SELECT codigart, descrart, preunart, preunart*1.1 FROM Articulos;

SELECT codigart, descrart, preunart FROM Articulos
	ORDER BY preunart DESC;
