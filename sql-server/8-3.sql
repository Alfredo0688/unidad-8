/*
8.3. Informar los autores que hayan escrito varios géneros de libros. Mostrar nombre y cantidad de 
géneros ordenados por esta última columna empezando por el mayor.
*/
use editorial
SELECT A.autor_nombre,COUNT(T.genero) AS 'Generos escritos'
FROM autores as A
INNER JOIN titulo_autor as TA
on A.autor_id = TA.autor_id
INNER JOIN titulos as T
ON TA.titulo_id = T.titulo_id
GROUP BY A.autor_nombre
HAVING COUNT(T.genero) > 1
order by 'Generos escritos' DESC