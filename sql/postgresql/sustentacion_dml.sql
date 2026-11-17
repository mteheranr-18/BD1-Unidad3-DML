-- IMPORTANTE:
-- Ejecutar las instrucciones en el orden indicado.
-- Los ejercicios modifican y eliminan registros.
-- Se recomienda utilizarlos en una base de datos
-- de practica y no en un entorno de produccion.


-- =====================================================
-- EJERCICIO 1: INSERT EN CLIENTES
-- =====================================================

-- Registra un nuevo cliente en la base de datos.
-- El identificador se genera automaticamente.

INSERT INTO clientes (nombre, ciudad)
VALUES ('Carlos Martínez', 'Cartagena')
RETURNING *;


-- =====================================================
-- EJERCICIO 2: INSERT EN PEDIDOS
-- =====================================================

-- Registra un pedido relacionado con el cliente.
-- La subconsulta obtiene su identificador.

INSERT INTO pedidos (id_cliente, producto, cantidad)
SELECT id_cliente, 'Teclado mecánico', 2
FROM clientes
WHERE nombre = 'Carlos Martínez'
  AND ciudad = 'Cartagena'
ORDER BY id_cliente DESC
LIMIT 1
RETURNING *;


-- =====================================================
-- EJERCICIO 3: UPDATE EN CLIENTES
-- =====================================================

-- Modifica la ciudad del cliente de Cartagena
-- a Barranquilla.

UPDATE clientes
SET ciudad = 'Barranquilla'
WHERE nombre = 'Carlos Martínez'
  AND ciudad = 'Cartagena'
RETURNING *;


-- =====================================================
-- EJERCICIO 4: UPDATE EN PEDIDOS
-- =====================================================

-- Cambia la cantidad del pedido de 2 a 5 unidades.

UPDATE pedidos
SET cantidad = 5
WHERE producto = 'Teclado mecánico'
  AND cantidad = 2
RETURNING *;


-- =====================================================
-- EJERCICIO 5: DELETE EN PEDIDOS
-- =====================================================

-- Elimina el pedido del cliente Carlos Martínez.

DELETE FROM pedidos
WHERE producto = 'Teclado mecánico'
  AND cantidad = 5
  AND id_cliente = (
      SELECT MAX(id_cliente)
      FROM clientes
      WHERE nombre = 'Carlos Martínez'
        AND ciudad = 'Barranquilla'
  )
RETURNING *;


-- =====================================================
-- EJERCICIO 6: DELETE EN CLIENTES
-- =====================================================

-- Elimina al cliente Carlos Martínez.
-- Primero se elimino su pedido para demostrar
-- ambas operaciones por separado.

DELETE FROM clientes
WHERE id_cliente = (
    SELECT MAX(id_cliente)
    FROM clientes
    WHERE nombre = 'Carlos Martínez'
      AND ciudad = 'Barranquilla'
)
RETURNING *;


-- =====================================================
-- EJERCICIO 7: BACKUP DE LA BASE DE DATOS
-- =====================================================

-- El respaldo se realizo desde pgAdmin 4.
--
-- Procedimiento:
-- 1. Seleccionar la base de datos Xyz.
-- 2. Hacer clic derecho y seleccionar Backup.
-- 3. Elegir el formato Custom.
-- 4. Establecer el archivo:
--    backup_Xyz_video.backup
-- 5. Ejecutar Backup.
-- 6. Verificar que el proceso finalice correctamente.
--
-- NOTA:
-- BACKUP no es una sentencia DML de PostgreSQL.
-- El respaldo fue generado con la herramienta
-- de administracion pgAdmin 4.
