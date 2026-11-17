-- BASE DE DATOS XYZ
-- Motor: SQL Server
-- Actividad: Bases de Datos I - Unidad 3

IF DB_ID('Xyz') IS NULL
BEGIN
    CREATE DATABASE Xyz;
END;
GO

USE Xyz;
GO

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50)
);

-- Tabla clientes_importacion
CREATE TABLE clientes_importacion (
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    producto VARCHAR(100),
    cantidad INT,
    fecha_pedido DATE DEFAULT GETDATE(),

    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
);
GO

-- Verificar las tablas
SELECT name AS tabla
FROM sys.tables
ORDER BY name;

-- Verificar la relación
SELECT
    fk.name AS clave_foranea,
    tp.name AS tabla_origen,
    tr.name AS tabla_referenciada
FROM sys.foreign_keys fk
INNER JOIN sys.tables tp
    ON fk.parent_object_id = tp.object_id
INNER JOIN sys.tables tr
    ON fk.referenced_object_id = tr.object_id;
