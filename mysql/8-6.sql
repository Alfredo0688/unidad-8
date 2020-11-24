/*
8.6. Informar todos los cargos y los empleados que le corresponden de la editorial 'New Moon 
Books', si algún cargo tiene un empleado asignado informar como 'Vacante' en apellido y --- 
en nombre. Mostrar descripción del cargo, apellido y nombre. Ordenar por descripción del 
cargo, apellido y nombre.
*/

USE editorial;
SELECT C.cargo_descripcion,IFNULL(E.nombre,'---') AS 'Nombre',IFNULL(E.apellido,'Vacante') AS 'Apellido'
FROM cargos AS C
LEFT OUTER JOIN empleados AS E
ON C.cargo_id = E.cargo_id
