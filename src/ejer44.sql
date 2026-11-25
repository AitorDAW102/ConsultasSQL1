USE Jardineria;
                
SELECT c.NombreCliente, e.Nombre, e.Apellido1+' '+e.Apellido2 AS Apellidos FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado


SELECT c.NombreCliente, e.Nombre FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
	WHERE c.CodigoCliente NOT IN (SELECT CodigoCliente FROM Pagos)

SELECT c.NombreCliente, e.Nombre FROM Clientes c LEFT JOIN Pagos p
	ON c.CodigoCliente=p.CodigoCliente
	JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
	WHERE p.CodigoCliente IS NULL
	

SELECT p.nombre, SUM(dp.Cantidad) AS CantidadTotal, SUM(dp.Cantidad*dp.PrecioUnidad) AS Total,
	SUM(dp.Cantidad*dp.PrecioUnidad)*1.18 AS TotalConIVA  FROM Productos p JOIN DetallePedidos dp
	ON p.CodigoProducto=dp.CodigoProducto
	GROUP BY p.Nombre;

SELECT DISTINCT o.CodigoOficina, o.LineaDireccion1, o.LineaDireccion2
	FROM Oficinas o JOIN Empleados e ON o.CodigoOficina=e.CodigoOficina
	JOIN Clientes c ON e.CodigoEmpleado=c.CodigoEmpleadoRepVentas
	WHERE c.Ciudad='Fuenlabrada';