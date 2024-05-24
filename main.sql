-- Crear la base de datos
CREATE DATABASE nuttpro;
USE nuttpro;

-- Crear la tabla Proveedores
CREATE TABLE Proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contacto VARCHAR(255),
    productos_suministrados TEXT,
    historial_compras TEXT
);

-- Crear la tabla Inventario
CREATE TABLE Inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    tipo_producto VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL,
    fecha_vencimiento DATE,
    lote VARCHAR(50),
    ubicacion_almacenamiento VARCHAR(255),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id)
);

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contacto VARCHAR(255),
    historial_compras TEXT,
    preferencias TEXT
);

-- Crear la tabla Ventas
CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    detalles_productos TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- Crear la tabla Empleados
CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    rol VARCHAR(255) NOT NULL,
    horarios TEXT,
    desempeno TEXT
);

-- Crear la tabla intermedia Ventas_Productos
CREATE TABLE Ventas_Productos (
    venta_id INT,
    inventario_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (venta_id, inventario_id),
    FOREIGN KEY (venta_id) REFERENCES Ventas(id),
    FOREIGN KEY (inventario_id) REFERENCES Inventario(id)
);
