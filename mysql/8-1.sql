/*8.1. Mostrar los primeros tres géneros más vendidos. Mostrar género y total de ventas ordenado 
por mayor total de venta.*/
use editorial;
SELECT T.genero,COUNT(T.genero) as 'Cantidad', SUM(T.precio * V.cantidad) as 'Venta' 
from titulos as T
inner join ventas as V
ON T.titulo_id = V.titulo_id
group by T.genero
ORDER BY 'Cantidad' DESC, 'Venta' DESC
LIMIT 5