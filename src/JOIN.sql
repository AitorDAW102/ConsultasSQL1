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