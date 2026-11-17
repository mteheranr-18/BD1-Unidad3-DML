
-- =====================================================
-- PROYECTO: CEA TIO JUANITO
-- ACTIVIDAD: MANIPULACION DE DATOS (DML)
-- MOTOR DE BASE DE DATOS: POSTGRESQL
-- =====================================================

-- NOTA:
-- La base de datos cea_tio_juanito debe estar creada.
-- Este script se ejecuta conectado a dicha base de datos.


-- =====================================================
-- 1. CREACION DE LAS TABLAS
-- =====================================================

-- Tabla CONDUCTOR
CREATE TABLE conductor (
    id_conductor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla BUS
CREATE TABLE bus (
    id_bus INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    capacidad INT NOT NULL CHECK (capacidad > 0),
    id_conductor INT NOT NULL UNIQUE,
    CONSTRAINT fk_bus_conductor
        FOREIGN KEY (id_conductor)
        REFERENCES conductor(id_conductor)
);

-- Tabla RUTA
CREATE TABLE ruta (
    id_ruta INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    barrio VARCHAR(100) NOT NULL,
    colegio VARCHAR(100) NOT NULL,
    jornada VARCHAR(20) NOT NULL,
    capacidad_maxima INT NOT NULL CHECK (capacidad_maxima > 0),
    id_bus INT NOT NULL UNIQUE,
    CONSTRAINT fk_ruta_bus
        FOREIGN KEY (id_bus)
        REFERENCES bus(id_bus)
);

-- Tabla ESTUDIANTE
CREATE TABLE estudiante (
    id_estudiante INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    direccion VARCHAR(150) NOT NULL,
    id_ruta INT NOT NULL,
    CONSTRAINT fk_estudiante_ruta
        FOREIGN KEY (id_ruta)
        REFERENCES ruta(id_ruta)
);

-- Tabla TELEFONO_EMERGENCIA
CREATE TABLE telefono_emergencia (
    id_telefono INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    contacto VARCHAR(100) NOT NULL,
    parentesco VARCHAR(50),
    id_estudiante INT NOT NULL,
    CONSTRAINT fk_telefono_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiante(id_estudiante)
);


-- =====================================================
-- 2. INSERCION DE DATOS (INSERT)
-- =====================================================

-- 2.1 Insertar conductores
INSERT INTO conductor (nombre, documento, telefono)
VALUES
    ('Carlos Mendoza', '1045123456', '3001234567'),
    ('Andrés Pérez', '1045789123', '3012345678'),
    ('Luis Martínez', '1045987654', '3023456789');

-- 2.2 Insertar buses
INSERT INTO bus (placa, capacidad, id_conductor)
VALUES
    ('ABC123', 20, 1),
    ('DEF456', 25, 2),
    ('GHI789', 30, 3);

-- 2.3 Insertar rutas
INSERT INTO ruta (
    nombre, barrio, colegio, jornada,
    capacidad_maxima, id_bus
)
VALUES
    ('Ruta Centro', 'Centro',
     'Institución Educativa San Felipe', 'Mañana', 20, 1),
    ('Ruta Blas de Lezo', 'Blas de Lezo',
     'Institución Educativa Nuevo Bosque', 'Tarde', 25, 2),
    ('Ruta La Castellana', 'La Castellana',
     'Institución Educativa La Concepción', 'Mañana', 30, 3);

-- 2.4 Insertar estudiantes
INSERT INTO estudiante (
    nombre, documento, direccion, id_ruta
)
VALUES
    ('María Rodríguez', '1001234567', 'Barrio Centro', 1),
    ('Juan Pérez', '1002345678', 'Blas de Lezo', 2),
    ('Laura Gómez', '1003456789', 'La Castellana', 3),
    ('Andrés Torres', '1004567890', 'Barrio Centro', 1),
    ('Sofía Martínez', '1005678901', 'Blas de Lezo', 2);

-- 2.5 Insertar teléfonos de emergencia
INSERT INTO telefono_emergencia (
    numero, contacto, parentesco, id_estudiante
)
VALUES
    ('3001112233', 'Carlos Rodríguez', 'Padre', 1),
    ('3012223344', 'Ana Pérez', 'Madre', 2),
    ('3023334455', 'Luis Gómez', 'Padre', 3),
    ('3034445566', 'Marta Torres', 'Madre', 4),
    ('3045556677', 'Pedro Martínez', 'Padre', 5),
    ('3056667788', 'Claudia Rodríguez', 'Madre', 1);


-- =====================================================
-- 3. CONSULTAS DE VERIFICACION DE INSERCIONES
-- =====================================================

SELECT * FROM conductor;
SELECT * FROM bus;
SELECT * FROM ruta;
SELECT * FROM estudiante;
SELECT * FROM telefono_emergencia;


-- =====================================================
-- 4. ACTUALIZACION DE DATOS (UPDATE)
-- =====================================================

-- 4.1 Actualizar un registro específico
UPDATE conductor
SET telefono = '3109876543'
WHERE id_conductor = 1;

-- 4.2 Actualizar varios registros con CASE
UPDATE ruta
SET capacidad_maxima = CASE
    WHEN id_ruta = 1 THEN 22
    WHEN id_ruta = 2 THEN 27
END
WHERE id_ruta IN (1, 2);

-- 4.3 Actualizar estudiantes utilizando otra tabla
UPDATE estudiante e
SET direccion = 'Centro Histórico'
FROM ruta r
WHERE e.id_ruta = r.id_ruta
AND r.id_ruta = 1;

-- Verificar actualizaciones
SELECT * FROM conductor;
SELECT * FROM ruta;
SELECT * FROM estudiante;


-- =====================================================
-- 5. ELIMINACION DE DATOS (DELETE)
-- =====================================================

-- 5.1 Eliminar un teléfono específico
DELETE FROM telefono_emergencia
WHERE id_telefono = 6;

-- 5.2 Eliminar varios teléfonos según una condición
DELETE FROM telefono_emergencia
WHERE parentesco = 'Padre';

-- 5.3 Eliminar el estudiante 1.
-- La operación funciona porque sus teléfonos
-- fueron eliminados en los pasos anteriores.
DELETE FROM estudiante
WHERE id_estudiante = 1;

-- 5.4 Eliminar primero el teléfono del estudiante 2
DELETE FROM telefono_emergencia
WHERE id_estudiante = 2;

-- 5.5 Eliminar después al estudiante 2
DELETE FROM estudiante
WHERE id_estudiante = 2;


-- =====================================================
-- 6. TRUNCATE
-- =====================================================

-- Vaciar completamente la tabla de teléfonos
TRUNCATE TABLE telefono_emergencia;


-- =====================================================
-- 7. VERIFICACION DE RELACIONES
-- =====================================================

-- Relación: estudiante, ruta, bus y conductor
SELECT
    e.id_estudiante,
    e.nombre AS estudiante,
    e.documento,
    r.nombre AS ruta,
    r.barrio,
    r.jornada,
    b.placa AS bus,
    c.nombre AS conductor
FROM estudiante e
INNER JOIN ruta r
    ON e.id_ruta = r.id_ruta
INNER JOIN bus b
    ON r.id_bus = b.id_bus
INNER JOIN conductor c
    ON b.id_conductor = c.id_conductor
ORDER BY e.id_estudiante;


-- =====================================================
-- 8. VERIFICACION FINAL DE REGISTROS
-- =====================================================

SELECT COUNT(*) AS total_conductores
FROM conductor;

SELECT COUNT(*) AS total_buses
FROM bus;

SELECT COUNT(*) AS total_rutas
FROM ruta;

SELECT COUNT(*) AS total_estudiantes
FROM estudiante;

SELECT COUNT(*) AS total_telefonos
FROM telefono_emergencia;
