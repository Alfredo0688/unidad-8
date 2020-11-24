/*8.5. Informar los autores que no tienen títulos. Mostrar nombre y apellido */
USE editorial
SELECT A.autor_nombre,A.autor_apellido
FROM autores AS A
LEFT OUTER JOIN titulo_autor as TA
ON TA.autor_id = A.autor_id
LEFT OUTER JOIN titulos as T
ON TA.titulo_id = T.titulo_id
WHERE T.titulo_id = 'NULL'




USE editorial
SELECT *
FROM autores AS A
INNER JOIN titulo_autor as TA
ON TA.autor_id != A.autor_id
--LEFT OUTER JOIN titulos as T
--ON TA.titulo_id = T.titulo_id
--AND TA.titulo_id = 'NULL'

