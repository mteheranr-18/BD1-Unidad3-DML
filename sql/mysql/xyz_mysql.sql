-- BASE DE DATOS XYZ
-- Motor: MySQL
-- Actividad: Bases de Datos I - Unidad 3

CREATE DATABASE IF NOT EXISTS xyz;
USE xyz;

-- Tabla clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50)
);

-- Tabla clientes_importacion
CREATE TABLE IF NOT EXISTS clientes_importacion (
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

-- Tabla pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    producto VARCHAR(100),
    cantidad INT,
    fecha_pedido DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
);

-- Verificar las tablas
SHOW TABLES;

-- Verificar la relación entre clientes y pedidos
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'xyz'
  AND REFERENCED_TABLE_NAME IS NOT NULL;
