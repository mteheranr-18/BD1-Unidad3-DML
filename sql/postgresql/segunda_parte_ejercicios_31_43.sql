
-- Archivo de documentacion de ejercicios realizados.
-- Las instrucciones UPDATE ya fueron ejecutadas.
-- No volver a ejecutarlas sobre la base de datos actual.


-- EJERCICIO 31: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 32: ACTUALIZAR DOS COLUMNAS
-- EN UN REGISTRO ESPECIFICO

UPDATE clientes
SET
    nombre = 'Alejandro Mendoza',
    ciudad = 'Cartagena'
WHERE id_cliente = 30
RETURNING *;

-- Resultado: 1 registro actualizado.


-- EJERCICIO 33: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 34: ACTUALIZAR MEDIANTE IN

UPDATE clientes
SET
    ciudad = 'Cartagena',
    fecha_registro = '2026-11-17'
WHERE id_cliente IN (9, 10, 11, 12, 13)
RETURNING *;

-- Resultado: 5 registros actualizados.


-- EJERCICIO 35: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 36: ACTUALIZAR MEDIANTE OR

UPDATE clientes
SET
    ciudad = 'Barranquilla',
    fecha_registro = '2026-11-16'
WHERE id_cliente = 14
   OR id_cliente = 15
RETURNING *;

-- Resultado: 2 registros actualizados.


-- EJERCICIO 37: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 38: ACTUALIZAR MEDIANTE AND

UPDATE clientes
SET
    ciudad = 'Santa Marta',
    fecha_registro = '2026-11-15'
WHERE id_cliente = 16
  AND id_cliente = 17
RETURNING *;

-- Resultado: 0 registros actualizados.
-- Ningun registro puede tener dos claves primarias
-- diferentes simultaneamente.


-- EJERCICIO 39: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros sin cambios.


-- EJERCICIO 40: ACTUALIZAR MEDIANTE BETWEEN

UPDATE clientes
SET
    ciudad = 'Cartagena',
    fecha_registro = '2026-11-14'
WHERE id_cliente BETWEEN 18 AND 22
RETURNING *;

-- Resultado: 5 registros actualizados.
-- BETWEEN incluye ambos extremos del rango.


-- EJERCICIO 41: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 42: ACTUALIZAR MEDIANTE MAYOR O IGUAL

UPDATE clientes
SET
    ciudad = 'Cartagena',
    fecha_registro = '2026-11-13'
WHERE id_cliente >= 23
RETURNING *;

-- Resultado: 4 registros actualizados.


-- EJERCICIO 43: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- =====================================================
-- FIN DE LOS EJERCICIOS 31 AL 43
-- =====================================================
