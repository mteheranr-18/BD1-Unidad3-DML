-- Archivo de documentacion de los ejercicios realizados.
-- Las instrucciones UPDATE ya fueron ejecutadas.
-- No ejecutar nuevamente todo el archivo sobre la BD actual.


-- EJERCICIO 44: ACTUALIZAR MEDIANTE DESIGUALDAD

UPDATE clientes
SET
    ciudad = 'Santa Marta',
    fecha_registro = '2026-11-12'
WHERE id_cliente <> 3
RETURNING *;

-- Resultado: 23 registros actualizados.
-- Juan Perez (ID 3) quedo excluido.


-- EJERCICIO 45: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 46: ACTUALIZAR MEDIANTE BETWEEN

UPDATE clientes
SET
    ciudad = 'Barranquilla',
    fecha_registro = '2026-11-11'
WHERE id_cliente BETWEEN 4 AND 8
RETURNING *;

-- Resultado: 5 registros actualizados.


-- EJERCICIO 47: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 48: LIKE - COMIENZA CON

UPDATE clientes
SET
    ciudad = 'Cartagena',
    fecha_registro = '2026-11-10'
WHERE nombre LIKE 'Mar%'
RETURNING *;

-- Resultado: 2 registros actualizados.
-- Maria Gonzalez y Mariana Torres.


-- EJERCICIO 49: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 50: LIKE - TERMINA EN

UPDATE clientes
SET
    ciudad = 'Sincelejo',
    fecha_registro = '2026-11-09'
WHERE nombre LIKE '%ez'
RETURNING *;

-- Resultado: 12 registros actualizados.


-- EJERCICIO 51: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 52: LIKE - CONTIENE

UPDATE clientes
SET
    ciudad = 'Montería',
    fecha_registro = '2026-11-08'
WHERE nombre LIKE '%an%'
RETURNING *;

-- Resultado: 6 registros actualizados.


-- EJERCICIO 53: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.


-- EJERCICIO 54: NOT LIKE - EXCLUSION POR PATRON

UPDATE clientes
SET
    ciudad = 'Cartagena',
    fecha_registro = '2026-11-07'
WHERE nombre NOT LIKE 'Mar%'
RETURNING *;

-- Resultado: 22 registros actualizados.
-- Maria Gonzalez y Mariana Torres quedaron excluidas.


-- EJERCICIO 55: CONSULTAR TODOS LOS CLIENTES

SELECT *
FROM clientes
ORDER BY id_cliente;

-- Resultado: 24 registros.
-- Se verificaron las actualizaciones del ejercicio 54.


-- =====================================================
-- FIN DE LOS EJERCICIOS 44 AL 55
-- =====================================================
