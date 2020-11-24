/*8.2. Informar las ventas a 60 días. Mostrar el id de título, el título y el total de ventas (cantidad por 
precio). Renombrar a la columna calculada.*/
USE editorial;
SELECT T.titulo_id,T.titulo,(T.precio * V.cantidad) AS 'Total venta'
FROM titulos as T
INNER JOIN ventas as V
ON T.titulo_id = V.titulo_id
WHERE V.forma_pago = '60 días'