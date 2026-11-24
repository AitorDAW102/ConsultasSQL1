USE Jardineria;

SELECT c.NombreCliente, e.Nombre, o.Ciudad FROM Clientes c JOIN Empleados e
ON c.NombreContacto=e.Nombre JOIN Oficinas o ON e.CodigoOficina=o.CodigoOficina;

SELECT c.NombreCliente, e.Nombre, o.Ciudad FROM Clientes c JOIN Empleados e
ON c.NombreContacto=e.Nombre JOIN Oficinas o ON e.CodigoOficina=o.CodigoOficina
	WHERE c.CodigoCliente NOT IN (SELECT CodigoCliente FROM Pagos);

SELECT e.Nombre AS Empleado, j.Nombre AS Jefe FROM Empleados e
JOIN Empleados j ON e.CodigoJefe = j.CodigoEmpleado;

SELECT c.NombreCliente FROM Clientes c JOIN Pedidos p ON c.CodigoCliente=p.CodigoCliente
	WHERE FechaEntrega>FechaEsperada;