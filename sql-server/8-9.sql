/*
8.9. Informar los totales de ventas (pesos) al contado entre abril y septiembre del 2014 por cada 
almacén. Mostrar nombre de almacén, y total de venta. Si un almacén no tiene ventas mostrar 
en cero.
*/
use editorial
SELECT A.almacen_nombre, ISNULL(SUM(V.cantidad * T.precio),0) AS 'Total venta Abril-Septiembre 2014'
FROM almacenes as A
LEFT JOIN ventas AS V
ON A.almacen_id = V.almacen_id
LEFT JOIN titulos AS T
ON V.titulo_id = T.titulo_id
AND V.fecha_orden BETWEEN '20140401' AND '20140930'
GROUP BY A.almacen_nombre
