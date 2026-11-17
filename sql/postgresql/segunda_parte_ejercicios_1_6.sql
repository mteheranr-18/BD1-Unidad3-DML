
-- =====================================================
-- UNIVERSIDAD DE CARTAGENA
-- BASES DE DATOS I - UNIDAD 3
-- SEGUNDA PARTE (70 %)
-- EJERCICIOS 1 AL 6
-- MOTOR: POSTGRESQL
-- BASE DE DATOS: Xyz
-- =====================================================

-- PREPARACION DEL EJERCICIO 1
-- Se registra un cliente para establecer la relacion
-- entre las tablas clientes y pedidos.

INSERT INTO clientes (nombre, ciudad)
VALUES ('Juan Pérez', 'Cartagena')
RETURNING *;


-- =====================================================
-- EJERCICIO 1: INSERT COMPLETO EN PEDIDOS
-- =====================================================

INSERT INTO pedidos
VALUES (
    DEFAULT,
    (SELECT id_cliente
     FROM clientes
     WHERE nombre = 'Juan Pérez'
     ORDER BY id_cliente DESC
     LIMIT 1),
    'Mouse inalámbrico',
    2,
    CURRENT_DATE
)
RETURNING *;


-- =====================================================
-- EJERCICIO 2: MOSTRAR LOS PEDIDOS
-- =====================================================

SELECT *
FROM pedidos
ORDER BY id_pedido;


-- =====================================================
-- EJERCICIO 3: INSERTAR CINCO CLIENTES
-- FORMATO DE INSERCION COMPLETA
-- =====================================================

INSERT INTO clientes
VALUES (DEFAULT, 'María González', 'Cartagena');

INSERT INTO clientes
VALUES (DEFAULT, 'Pedro Ramírez', 'Barranquilla');

INSERT INTO clientes
VALUES (DEFAULT, 'Laura Martínez', 'Santa Marta');

INSERT INTO clientes
VALUES (DEFAULT, 'Andrés Torres', 'Sincelejo');

INSERT INTO clientes
VALUES (DEFAULT, 'Sofía Herrera', 'Montería');


-- =====================================================
-- EJERCICIO 4: MOSTRAR LOS CLIENTES
-- =====================================================

SELECT *
FROM clientes
ORDER BY id_cliente;


-- =====================================================
-- EJERCICIO 5: INSERTAR CINCO PEDIDOS
-- FORMATO DE INSERCION PARCIAL
-- =====================================================

INSERT INTO pedidos (id_cliente, producto, cantidad)
SELECT id_cliente, 'Teclado', 2
FROM clientes
WHERE nombre = 'María González';

INSERT INTO pedidos (id_cliente, producto, cantidad)
SELECT id_cliente, 'Monitor', 1
FROM clientes
WHERE nombre = 'Pedro Ramírez';

INSERT INTO pedidos (id_cliente, producto, cantidad)
SELECT id_cliente, 'Memoria USB', 3
FROM clientes
WHERE nombre = 'Laura Martínez';

INSERT INTO pedidos (id_cliente, producto, cantidad)
SELECT id_cliente, 'Audífonos', 2
FROM clientes
WHERE nombre = 'Andrés Torres';

INSERT INTO pedidos (id_cliente, producto, cantidad)
SELECT id_cliente, 'Disco SSD', 1
FROM clientes
WHERE nombre = 'Sofía Herrera';


-- =====================================================
-- EJERCICIO 6: MOSTRAR AMBAS TABLAS
-- MEDIANTE CONSULTAS INDEPENDIENTES
-- =====================================================

-- Consulta de clientes
SELECT *
FROM clientes
ORDER BY id_cliente;

-- Consulta de pedidos
SELECT *
FROM pedidos
ORDER BY id_pedido;

-- =====================================================
-- FIN DE LOS EJERCICIOS 1 AL 6
-- =====================================================

-- NOTA:
-- Este archivo documenta las instrucciones utilizadas.
-- No debe ejecutarse nuevamente sobre la misma base
-- de datos sin revisar los registros existentes,
-- porque las inserciones podrian duplicar informacion.
