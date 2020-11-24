
/*
8.10. Informar el monto de regalías a pagar por cada autor, inclusive aquellos que no tengan 
ventas, de las ventas del año 2013 de la editorial 'Binnet & Hardley'. Mostrar apellido y nombre 
del autor y monto a pagar. Tener en cuenta que hay que operar la regalía del título y sobre esta 
la regalía del autor respecto a ese libro.
*/

USE editorial;
SELECT A.autor_apellido,A.autor_nombre,IFNULL(SUM(((T.regalias * T.precio) /100) * T.precio * TA.porcentaje_regalias),0) as 'Regalias'
FROM autores AS A
LEFT JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
LEFT JOIN titulos AS T
ON TA.titulo_id = T.titulo_id
LEFT JOIN ventas AS V
ON T.titulo_id = V.titulo_id
LEFT JOIN editoriales AS E
ON T.editorial_id = E.editorial_id
AND E.editorial_nombre = 'Binnet & Hardley'
AND YEAR(V.fecha_orden) = '2013'
GROUP BY A.autor_apellido,A.autor_nombre

/*los campos en con valor cero pertenecen a los autores que no tienen titulos*/