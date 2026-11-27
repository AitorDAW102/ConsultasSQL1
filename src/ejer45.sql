USE Jardineria;

SELECT SUM(Cantidad*PrecioUnidad) AS cuantia FROM DetallePedidos
	GROUP BY CodigoPedido;


SELECT TOP 1 SUM(Cantidad*PrecioUnidad) AS cuantia FROM DetallePedidos
	GROUP BY CodigoPedido
	ORDER BY cuantia DESC

SELECT CodigoPedido FROM DetallePedidos
	GROUP BY CodigoPedido
	HAVING SUM(Cantidad*PrecioUnidad)=(SELECT TOP 1 SUM(Cantidad*PrecioUnidad) AS cuantia FROM DetallePedidos
		GROUP BY CodigoPedido
		ORDER BY cuantia DESC)


		/*--------CONSULTA-FINAL--------*/
SELECT NombreCliente FROM Clientes
	WHERE CodigoCliente IN (SELECT CodigoCliente FROM Pedidos
		WHERE CodigoPedido IN(SELECT CodigoPedido FROM DetallePedidos
			GROUP BY CodigoPedido
			HAVING SUM(Cantidad*PrecioUnidad)=(SELECT TOP 1 SUM(Cantidad*PrecioUnidad) AS cuantia FROM DetallePedidos
				GROUP BY CodigoPedido
				ORDER BY cuantia DESC)))


		/*--------CONSULTA-FINAL-CON-JOINS--------*/
SELECT c.NombreCliente, p.CodigoPedido, SUM(dp.Cantidad*dp.PrecioUnidad) AS Cuantia FROM Clientes c JOIN Pedidos p
	ON c.codigoCliente=p.CodigoCliente JOIN DetallePedidos dp
	ON dp.CodigoPedido=p.CodigoPedido
	GROUP BY p.CodigoPedido,c.NombreCliente
	HAVING SUM(dp.Cantidad*dp.PrecioUnidad)=(SELECT TOP 1 SUM(Cantidad*PrecioUnidad) AS cuantia FROM DetallePedidos
				GROUP BY CodigoPedido
				ORDER BY cuantia DESC) /* El codigo y de de la agrupacion tiene que ser de la misma tabla
										es decir que no puedo SELECT del p.codigoPedido pero agrupar por 
										dp.codigoPedido*/
		

		/*--------CONSULTA-FINAL-CON-TABLA-DERIVADAS--------*/
SELECT c.nombreCliente, tabla1.codigopedido,tabla1.cuantia FROM Clientes c JOIN Pedidos p
	ON c.codigoCliente=p.CodigoCliente JOIN (SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) cuantia FROM DetallePedidos
	GROUP BY CodigoPedido) AS tabla1 ON p.CodigoPedido=tabla1.CodigoPedido
	WHERE tabla1.cuantia=(SELECT MAX(cuantia)FROM
(SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) cuantia FROM DetallePedidos
	GROUP BY CodigoPedido) AS tabla1);


SELECT MAX(cuantia)FROM
(SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) cuantia FROM DetallePedidos
	GROUP BY CodigoPedido) AS tabla1;