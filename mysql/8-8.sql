/*
8.8. Informar cuantos títulos Is Anger the Enemy? vendió cada almacén. Si un almacén no tuvo 
ventas del mismo informar con un cero. Mostrar código de almacén y cantidad.
*/
USE editorial;
SELECT IFNULL(V.almacen_id,0) AS 'Id Almacen',IFNULL(V.cantidad,0) AS 'Cantidad'
FROM titulos AS T
LEFT JOIN ventas as V
ON V.titulo_id = T.titulo_id
AND T.titulo = 'Is Anger the Enemy?'
