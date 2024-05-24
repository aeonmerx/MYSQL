
**1.Tabla Proveedores:**

Esta tabla almacena información sobre los proveedores que suministran productos a la empresa.
Relaciones:
La tabla Inventario tiene una clave externa (proveedor_id) que referencia el id de esta tabla, indicando qué proveedor suministró un determinado producto.
```sql
CREATE TABLE Proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contacto VARCHAR(255),
    productos_suministrados TEXT,
    historial_compras TEXT
);

```
**2.Tabla Inventario:**

Esta tabla almacena información sobre el inventario de productos de la empresa.
Relaciones:
La tabla Ventas_Productos tiene una clave externa (inventario_id) que referencia el id de esta tabla, indicando qué productos se vendieron en una determinada venta.
La tabla Proveedores tiene una relación con esta tabla a través de la clave externa (proveedor_id), indicando qué proveedor suministró un determinado producto.

```sql
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
```
**3.Tabla Clientes:**

Esta tabla almacena información sobre los clientes de la empresa.
Relaciones:
La tabla Ventas tiene una clave externa (cliente_id) que referencia el id de esta tabla, indicando qué cliente realizó una determinada compra.

```sql
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contacto VARCHAR(255),
    historial_compras TEXT,
    preferencias TEXT
);
```
**4Tabla Ventas:**

Esta tabla almacena información sobre las ventas realizadas por la empresa.
Relaciones:
La tabla Clientes tiene una relación con esta tabla a través de la clave externa (cliente_id), indicando qué cliente realizó una determinada compra.
La tabla Ventas_Productos tiene una clave externa (venta_id) que referencia el id de esta tabla, indicando qué productos se vendieron en una determinada venta.

```sql
CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    detalles_productos TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
```

**5Tabla Empleados:**

Esta tabla almacena información sobre los empleados de la empresa.
Relaciones: No tiene relaciones con otras tablas en este esquema.

```sql
CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    rol VARCHAR(255) NOT NULL,
    horarios TEXT,
    desempeno TEXT
);

```
**6.Tabla intermedia Ventas_Productos:**

Esta tabla intermedia relaciona las ventas con los productos vendidos.
Relaciones:
La tabla Ventas tiene una relación con esta tabla a través de la clave externa (id), indicando qué productos se vendieron en una determinada venta.
La tabla Inventario tiene una relación con esta tabla a través de la clave externa (id), indicando qué productos se vendieron en una determinada venta.

```sql
CREATE TABLE Ventas_Productos (
    venta_id INT,
    inventario_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (venta_id, inventario_id),
    FOREIGN KEY (venta_id) REFERENCES Ventas(id),
    FOREIGN KEY (inventario_id) REFERENCES Inventario(id)
);

```
