/*
8.4. Informar las ventas por título. Mostrar título, fecha de orden y cantidad, si no tienen venta al 
menos mostrar una fila que indique la cantidad en 0 y la fecha en nulo. Ordenar por título y 
mayor cantidad vendida primero.
*/
use editorial
SELECT T.titulo,V.fecha_orden,ISNULL(V.cantidad,0) AS 'Cantidad'
FROM titulos as T
LEFT OUTER JOIN ventas as V
on V.titulo_id = T.titulo_id
