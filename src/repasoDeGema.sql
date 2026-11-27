/* EJERCICIO DE REPASO */
/* QUE CLIENTES HAN HECHO 3 O MAS PEDIDOS CON UN PRECIO SUPERIOR A 2000 */


USE Jardineria;


SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) AS cuantia FROM DetallePedidos
	GROUP BY CodigoPedido
	HAVING SUM(Cantidad*PrecioUnidad)>2000

SELECT CodigoCliente, COUNT(CodigoPedido) AS nPedidos FROM Pedidos
	GROUP BY CodigoCliente
	HAVING COUNT(codigoPedido)>3

SELECT nombreCLiente FROM Clientes
	WHERE CodigoCliente IN (SELECT CodigoCliente AS nPedidos FROM Pedidos
	GROUP BY CodigoCliente
	HAVING COUNT(codigoPedido)>3)

SELECT CodigoCliente, COUNT(CodigoPedido) AS nPedidos FROM Pedidos
	WHERE CodigoPedido IN (SELECT CodigoPedido AS cuantia FROM DetallePedidos
	GROUP BY CodigoPedido
	HAVING SUM(Cantidad*PrecioUnidad)>2000)
	GROUP BY CodigoCliente
	HAVING COUNT(codigoPedido)>2

SELECT nombreCLiente FROM Clientes
	WHERE CodigoCliente IN (SELECT CodigoCliente FROM Pedidos
		WHERE CodigoPedido IN (SELECT CodigoPedido AS cuantia FROM DetallePedidos
			GROUP BY CodigoPedido
			HAVING SUM(Cantidad*PrecioUnidad)>2000)
		GROUP BY CodigoCliente
		HAVING COUNT(codigoPedido)>=3);

SELECT c.NombreCliente
	FROM Clientes c JOIN pedidos p ON c.CodigoCliente=p.CodigoCliente JOIN
		(SELECT de.CodigoPedido, SUM(de.cantidad*de.preciounidad) totalpedido
	FROM DetallePedidos de
	GROUP BY de.CodigoPedido) AS tabla1 ON tabla1.CodigoPedido=p.CodigoPedido
		WHERE tabla1.totalpedido >2000
		GROUP BY c.CodigoCliente, c.NombreCliente
		HAVING COUNT(tabla1.codigopedido)>=3;