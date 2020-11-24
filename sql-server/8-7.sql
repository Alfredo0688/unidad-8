/*
8.7. Informar cuantos títulos escribió cada autor inclusive aquellos que no lo hayan hecho aún. 
Mostrar nombre y apellido del autor y cantidad. Ordenar por cantidad mayor primero, apellido 
y nombre.
*/
USE editorial
SELECT A.autor_nombre,A.autor_apellido,COUNT(TA.titulo_id) AS 'Titulos escritos'
FROM autores AS A
LEFT OUTER JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
GROUP BY A.autor_nombre,A.autor_apellido
ORDER BY 'Titulos escritos' DESC