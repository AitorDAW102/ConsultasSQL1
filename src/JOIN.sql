USE compras;

SELECT pr.nombrpro, pe.codigpro FROM Proveedores pr INNER JOIN Pedidos pe
ON pr.codigpro=pe.codigpro;


SELECT pr.codigpro, pr.nombrpro FROM Proveedores pr INNER JOIN Pedidos pe
ON pr.codigpro=pe.codigpro
GROUP BY pr.codigpro, pr.nombrpro
HAVING COUNT(pr.codigpro)>1

SELECT COUNT(pr.codigpro) AS numeroPerAnio, pr.nombrpro FROM Proveedores pr INNER JOIN Pedidos pe
ON pr.codigpro=pe.codigpro AND YEAR(pe.fechaped)=2010
GROUP BY pr.nombrpro

SELECT pr.*, pe.* FROM Proveedores pr CROSS JOIN Pedidos pe
ORDER BY pe.codigpro

USE Jardineria;

SELECT c.NombreCliente, e.Nombre, e.Apellido1+' '+e.Apellido2 AS Apellidos, o.Ciudad FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado JOIN Oficinas o ON e.CodigoOficina=o.CodigoOficina

SELECT e.CodigoEmpleado, e.Nombre, e.Apellido1,
COUNT(c.CodigoCliente) AS numeroDeClientes
FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
	GROUP BY e.CodigoEmpleado, e.Nombre, e.Apellido1

SELECT c.NombreCliente, e.Nombre, e.Apellido1+' '+e.Apellido2 AS Apellidos, o.Ciudad FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado JOIN Oficinas o ON e.CodigoOficina=o.CodigoOficina
		WHERE o.Ciudad LIKE 'Barcelona';

SELECT c.NombreCliente, e.Nombre, e.Apellido1+' '+e.Apellido2 AS Apellidos, o.Ciudad FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
	JOIN Oficinas o ON e.CodigoOficina=o.CodigoOficina AND o.Ciudad LIKE 'Barcelona';

SELECT c.NombreCliente, e.Nombre, e.Apellido1+' '+e.Apellido2 AS Apellidos FROM Clientes c JOIN Empleados e
	ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
		WHERE e.CodigoOficina IN (SELECT o.CodigoOficina FROM Oficinas o
			WHERE Ciudad LIKE 'Barcelona');

