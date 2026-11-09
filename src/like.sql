USE compras;

SELECT * FROM Articulos;

SELECT * FROM Articulos
	WHERE descrart LIKE 'M%'; /* Para decir que quiero lo que sigue
								a esa cadena de texto en vez de usar
								"*" como en linux se usa '%' */

SELECT * FROM Articulos
	WHERE descrart NOT LIKE 'M%';

SELECT * FROM Articulos
	WHERE descrart LIKE '^M%'; /* NOT LIKE 'M%' y LIKE '^M%' es lo mismo
								porque '^' se usa para negar en el LIKE */

SELECT * FROM Articulos
	WHERE descrart LIKE '_R%'; /* La '_' es para que diga 
								cualquier caracter anterior */

SELECT * FROM Articulos
	WHERE descrart LIKE '[a-mt-z]%'; /* Entre corchete se usa
									para hacer rangos */

/* PARA BUSCAR UN CARACTER ESPECIAL EN UNA CADENA
TIENE QUE ESTAR ENTRE CORCHETES POR EJEMPLO SI QUIERO
BUSCAR UNA '_' DEBERIA HACERLO ASI '%[%]%' */


/* SE USA PARA FILTRAR POR SI UN CAMPO TIENE O NO UN VALOR
"IS NULL" es decir no tiene valor
"IN NOT NUL es decir si tiene valor "*/


SELECT * FROM Proveedores
	WHERE emailpro IS NULL;

SELECT * FROM Proveedores
	WHERE emailpro IS NOT NULL;