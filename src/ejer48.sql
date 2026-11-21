USE Jardineria;

SELECT nombre, PrecioVenta FROM Productos
	WHERE PrecioVenta = (SELECT MAX(PrecioVenta) FROM Productos)

SELECT Nombre FROM Productos
	WHERE CodigoProducto = (SELECT CodigoProducto FROM DetallePedidos
			WHERE Cantidad=(SELECT MAX(cantidad) FROM DetallePedidos));

SELECT c.CodigoCliente, c.NombreCliente, c.LimiteCredito,
    SUM(dp.Cantidad * dp.PrecioUnidad) AS TotalPedidos FROM Clientes c JOIN Pedidos p 
    ON c.CodigoCliente = p.CodigoCliente JOIN DetallePedidos dp 
    ON p.CodigoPedido = dp.CodigoPedido
        GROUP BY c.CodigoCliente, c.NombreCliente, c.LimiteCredito
		HAVING c.LimiteCredito > SUM(dp.Cantidad * dp.PrecioUnidad);

SELECT Nombre, CantidadEnStock FROM Productos
	Where CantidadEnStock = (SELECT MAX(cantidadEnStock) FROM productos);

SELECT Nombre, CantidadEnStock FROM Productos
	Where CantidadEnStock = (SELECT MIN(cantidadEnStock) FROM productos);