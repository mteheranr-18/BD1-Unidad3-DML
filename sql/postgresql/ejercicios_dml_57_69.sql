-- EJERCICIO 57
-- Mostrar el contenido completo de TablaX (clientes).

SELECT *
FROM clientes
ORDER BY id_cliente;


-- EJERCICIO 58
-- Crear la tabla TablaY.

CREATE TABLE TablaY (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha TIMESTAMP,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    asignatura VARCHAR(100),
    nota1 NUMERIC(5,2),
    nota2 NUMERIC(5,2),
    nota3 NUMERIC(5,2),
    nota_definitiva NUMERIC(5,3),
    promedio NUMERIC(5,3),
    mensaje TEXT
);


-- EJERCICIO 59
-- Mostrar el contenido de TablaY antes de insertar registros.

SELECT *
FROM TablaY
ORDER BY id;


-- EJERCICIO 60
-- Insertar los seis registros solicitados.

INSERT INTO TablaY (
    fecha, nombre, apellidos, asignatura,
    nota1, nota2, nota3,
    nota_definitiva, promedio, mensaje
)
VALUES
(
    '2023-05-20 00:00:00',
    'Persona 1', 'De tal', 'Estructuras de datos',
    1, NULL, NULL, NULL, NULL,
    'Prácticamente no hizo nada'
),
(
    '2023-06-20 00:00:00',
    'Persona 1', 'De tal', 'Estructuras de datos',
    1, 1, NULL, NULL, NULL,
    'La actividad es una copia de fragmentos disponibles en internet'
),
(
    '2023-07-20 00:00:00',
    'Persona 1', 'De tal', 'Estructuras de datos',
    1, 1, 1, NULL, NULL,
    'La actividad esta completa pero no pudo sustentar, explicarla y no domina el desarrollo de ninguno de los ejercicios'
),
(
    '2023-05-20 00:00:00',
    'Persona 3', 'De tal', 'Estructuras de datos',
    4, NULL, NULL, NULL, NULL,
    'Actividad al 80%, pero fue desarrollada progresivamente y socializada al docente en cada tutoria'
),
(
    '2023-06-20 00:00:00',
    'Persona 3', 'De tal', 'Estructuras de datos',
    4, 4.5, NULL, NULL, NULL,
    'Actividad completa y entregada una semana antes del cierre, con video y sin documento'
),
(
    '2023-07-20 00:00:00',
    'Persona 3', 'De tal', 'Estructuras de datos',
    4, 4.5, 5, NULL, NULL,
    'Actividad entregada mucho antes del cierre, 100% completa, con documento, video y sustentación'
)
RETURNING *;


-- EJERCICIO 61
-- Consultar los registros insertados.

SELECT *
FROM TablaY
ORDER BY id;


-- EJERCICIO 62
-- Calcular nota definitiva y promedio.

UPDATE TablaY
SET
    nota_definitiva =
        COALESCE(nota1, 0) * 0.20 +
        COALESCE(nota2, 0) * 0.20 +
        COALESCE(nota3, 0) * 0.60,

    promedio = (
        COALESCE(nota1, 0) +
        COALESCE(nota2, 0) +
        COALESCE(nota3, 0)
    ) / 3.0
RETURNING
    id, nombre, nota1, nota2, nota3,
    nota_definitiva, promedio;


-- EJERCICIO 63
-- Mostrar los resultados calculados.

SELECT *
FROM TablaY
ORDER BY id;


-- EJERCICIO 64
-- Convertir todas las columnas de texto a mayúsculas.

UPDATE TablaY
SET
    nombre = UPPER(nombre),
    apellidos = UPPER(apellidos),
    asignatura = UPPER(asignatura),
    mensaje = UPPER(mensaje)
RETURNING *;


-- EJERCICIO 65
-- Verificar los textos convertidos a mayúsculas.

SELECT *
FROM TablaY
ORDER BY id;


-- EJERCICIO 66
-- Eliminar un cliente específico.
-- En la práctica se verificó previamente
-- que el cliente 30 no tenía pedidos asociados.

DELETE FROM clientes
WHERE id_cliente = 30
RETURNING *;


-- EJERCICIO 67
-- Consultar los clientes restantes.

SELECT *
FROM clientes
ORDER BY id_cliente;


-- EJERCICIO 68
-- Demostrar la eliminación de todos los clientes
-- dentro de una transacción reversible.
-- ON DELETE CASCADE también afecta los pedidos.
-- ROLLBACK evita guardar la eliminación.

BEGIN;

DELETE FROM clientes
RETURNING *;

ROLLBACK;

-- Comprobar que los datos se conservaron.

SELECT
    (SELECT COUNT(*) FROM clientes) AS total_clientes,
    (SELECT COUNT(*) FROM pedidos) AS total_pedidos;


-- EJERCICIO 69
-- Mostrar el contenido completo de TablaY.

SELECT *
FROM TablaY
ORDER BY id;
