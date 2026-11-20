USE compras;

SELECT Proveedores.nombrpro, Pedidos.codigpro FROM Proveedores INNER JOIN Pedidos
ON Proveedores.codigpro=Pedidos.codigpro