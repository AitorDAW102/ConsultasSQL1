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
	