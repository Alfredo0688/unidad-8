/*
8.8. Informar cuantos t�tulos �Is Anger the Enemy?� vendi� cada almac�n. Si un almac�n no tuvo 
ventas del mismo informar con un cero. Mostrar c�digo de almac�n y cantidad.
*/

USE editorial
SELECT ISNULL(V.almacen_id,0) AS 'Id Almacen',ISNULL(V.cantidad,0) AS 'Cantidad'
FROM titulos AS T
LEFT JOIN ventas as V
ON V.titulo_id = T.titulo_id
AND T.titulo = 'Is Anger the Enemy?'
