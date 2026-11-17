-- BASE DE DATOS XYZ
-- Motor: PostgreSQL
-- Actividad: Bases de Datos I - Unidad 3

-- Ejecutar conectado a la base de datos "Xyz"

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id_pedido INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INT NOT NULL,
    producto VARCHAR(100),
    cantidad INT,
    fecha_pedido DATE DEFAULT CURRENT_DATE,

    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
);

-- Verificar las tablas
SELECT tablename
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY tablename;

-- Verificar las claves foráneas
SELECT
    conname AS clave_foranea,
    conrelid::regclass AS tabla_origen,
    confrelid::regclass AS tabla_referenciada
FROM pg_constraint
WHERE contype = 'f';
