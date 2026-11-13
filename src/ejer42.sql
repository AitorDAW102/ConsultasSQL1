use Jardineria;

SELECT CodigoOficina, Ciudad FROM Oficinas;

SELECT COUNT(codigoEmpleado) AS numeroDeEmpleados FROM Empleados;

SELECT Pais, COUNT(CodigoCliente) AS NumeroDeClientes  FROM Clientes
	GROUP BY pais;

SELECT *, (Cantidad*1)AS PagoMEDIO FROM Pagos
	WHERE YEAR(FechaPago)=2009;

SELECT CodigoPedido, Estado FROM Pedidos
	WHERE Estado='Entregado'
	ORDER BY CodigoPedido DESC;

SELECT * FROM Pedidos;