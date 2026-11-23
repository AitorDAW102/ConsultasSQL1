USE Jardineria

SELECT Ciudad, Telefono 
FROM Oficinas 
WHERE Pais = 'EE. UU.' OR Pais = 'Estados Unidos';


SELECT e.Nombre, e.Apellido1, e.Apellido2, e.Email 
FROM Empleados e
JOIN Empleados j ON e.CodigoJefe = j.CodigoEmpleado
WHERE j.Nombre = 'Alberto' AND j.Apellido1 = 'Soria';


SELECT Puesto, Nombre, Apellido1, Apellido2, Email 
FROM Empleados 
WHERE CodigoJefe IS NULL;


SELECT Nombre, Apellido1, Apellido2, Puesto 
FROM Empleados 
WHERE Puesto != 'Representante Ventas';



SELECT COUNT(*) AS TotalClientes 
FROM Clientes;

SELECT NombreCliente 
FROM Clientes 
WHERE Pais = 'Spain' OR Pais = 'España';



SELECT Pais, COUNT(*) AS TotalClientes 
FROM Clientes 
GROUP BY Pais;


SELECT COUNT(*) AS TotalClientesMadrid 
FROM Clientes 
WHERE Ciudad = 'Madrid';

SELECT Ciudad, COUNT(*) AS TotalClientes 
FROM Clientes 
WHERE Ciudad LIKE 'M%' 
GROUP BY Ciudad;

SELECT CodigoEmpleadorepVentas, COUNT(*) AS TotalClientes 
FROM Clientes 
WHERE CodigoEmpleadorepVentas IS NOT NULL 
GROUP BY CodigoEmpleadorepVentas;

SELECT COUNT(*) AS ClientesSinRepresentante 
FROM Clientes 
WHERE CodigoEmpleadorepVentas IS NULL;

SELECT MIN(FechaPago) AS PrimerPago, MAX(FechaPago) AS UltimoPago 
FROM Pagos;

SELECT DISTINCT CodigoCliente 
FROM Pagos 
WHERE YEAR(FechaPago) = 2008;

SELECT DISTINCT Estado 
FROM Pedidos;

SELECT CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega 
FROM Pedidos 
WHERE FechaEntrega > FechaEsperada;

SELECT CodigoPedido, COUNT(CodigoProducto) AS TotalProductos 
FROM DetallePedidos 
GROUP BY CodigoPedido;

SELECT CodigoProducto, SUM(Cantidad) AS CantidadTotal 
FROM DetallePedidos 
GROUP BY CodigoProducto 
ORDER BY CantidadTotal DESC;


SELECT 
    SUM(Cantidad * PrecioUnidad) AS BaseImponible,
    SUM(Cantidad * PrecioUnidad) * 0.18 AS IVA,
    SUM(Cantidad * PrecioUnidad) * 1.18 AS TotalFacturado
FROM DetallePedidos;

SELECT 
    CodigoProducto,
    SUM(Cantidad * PrecioUnidad) AS BaseImponible,
    SUM(Cantidad * PrecioUnidad) * 0.18 AS IVA,
    SUM(Cantidad * PrecioUnidad) * 1.18 AS TotalFacturado
FROM DetallePedidos
WHERE CodigoProducto LIKE 'FR%'
GROUP BY CodigoProducto;
