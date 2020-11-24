
USE editorial
SELECT A.autor_apellido, ((T.regalias * T.precio) /100) * T.precio * TA.porcentaje_regalias
FROM autores AS A
INNER JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
INNER JOIN titulos AS T
ON TA.titulo_id = T.titulo_id
LEFT JOIN ventas as V
ON T.titulo_id = V.titulo_id


SELECT A.autor_apellido, A.autor_nombre,T.titulo
FROM autores AS A
INNER JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
INNER JOIN titulos AS T
ON TA.titulo_id = T.titulo_id
GROUP BY A.autor_apellido, A.autor_nombre,T.titulo
ORDER BY A.autor_apellido ASC

--HAY 25 TITULOS ESCRITOS POR UNO O MAS AUTORES




USE editorial
SELECT *--, (TA.porcentaje_regalias / 100) * T.precio AS 'Regalias' 
FROM autores AS A
INNER JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
INNER JOIN titulos AS T
ON TA.titulo_id = T.titulo_id

--VENTAS DEL AÑO 2013 DE LA EDITORIAL ‘Binnet & Hardley’
SELECT A.autor_apellido, A.autor_nombre,T.titulo
FROM autores AS A
INNER JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
INNER JOIN titulos AS T
ON TA.titulo_id = T.titulo_id
INNER JOIN editoriales AS E
ON T.editorial_id = E.editorial_id
INNER JOIN ventas AS V
ON T.titulo_id = V.titulo_id
AND E.editorial_nombre = 'Binnet & Hardley'
AND YEAR(V.fecha_orden) = '2013'
GROUP BY A.autor_apellido, A.autor_nombre,T.titulo
ORDER BY A.autor_apellido ASC

--3REGISTROS RESULTANTES






--VENTAS DEL AÑO 2013 DE LA EDITORIAL ‘Binnet & Hardley’
SELECT A.autor_apellido, A.autor_nombre,T.titulo
FROM ventas AS V 
INNER JOIN titulos AS T
ON T.titulo_id = V.titulo_id
INNER JOIN editoriales AS E
ON T.editorial_id = E.editorial_id
INNER JOIN titulo_autor AS TA
ON TA.titulo_id = T.titulo_id
LEFT JOIN autores AS A
ON A.autor_id = TA.autor_id
AND E.editorial_nombre = 'Binnet & Hardley'
AND YEAR(V.fecha_orden) = '2013'
GROUP BY A.autor_apellido, A.autor_nombre,T.titulo
ORDER BY A.autor_apellido ASC



--LISTAR REGALIAS DE AUTORES ASI NO HAYAN TENIDO VENTAS


SELECT A.autor_id FROM autores AS A GROUP BY A.autor_id
--23 AUTORES
SELECT TA.autor_id FROM titulo_autor AS TA GROUP BY TA.autor_id
--19 CON GROUP BY, HABRIA 4 AUTORES SIN TITULOS.

--MOSTRAR AUTORES ASI NO TENGAN TITULOS
SELECT A.autor_apellido,A.autor_nombre,ISNULL(T.titulo,'SIN TITULO')
FROM autores AS A
LEFT JOIN titulo_autor AS TA
ON A.autor_id = TA.autor_id
LEFT JOIN titulos AS T
ON TA.titulo_id = T.titulo_id
--29 REGISTROS: 25 CON 4 SIN TITULOS



--MOSTRAR AUTORES ASI NO TENGAN TITULOS
SELECT A.autor_apellido,A.autor_nombre,ISNULL(SUM(((T.regalias * T.precio) /100) * T.precio * TA.porcentaje_regalias),0) as 'Regalias'
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











