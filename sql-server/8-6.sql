/*
8.6. Informar todos los cargos y los empleados que le corresponden de la editorial 'New Moon 
Books', si alg�n cargo tiene un empleado asignado informar como 'Vacante' en apellido y �---� 
en nombre. Mostrar descripci�n del cargo, apellido y nombre. Ordenar por descripci�n del 
cargo, apellido y nombre.

*/
USE editorial
SELECT C.cargo_descripcion,ISNULL(E.nombre,'---') AS 'Nombre',ISNULL(E.apellido,'Vacante') AS 'Apellido'
FROM cargos AS C
LEFT OUTER JOIN empleados AS E
ON C.cargo_id = E.cargo_id
