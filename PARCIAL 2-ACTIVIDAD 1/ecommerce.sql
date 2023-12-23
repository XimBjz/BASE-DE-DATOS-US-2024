-- base de datos ecommerce
CREATE DATABASE ecommerce;

-- base de datos ecommerce
USE ecommerce;

-- Tabla administrador 
CREATE TABLE administrador(
    id_administrador INT PRIMARY KEY AUTO_INCREMENT,
    nombre_administrador VARCHAR(50),
    app_administrador VARCHAR(50),
    apm_administrador VARCHAR(50),
    correo_electronico VARCHAR(100),
    contrasena VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla estatus
CREATE TABLE estatus(
    id_estatus INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estatus VARCHAR(25)
);

-- Tabla vendedor
CREATE TABLE vendedor(
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_vendedor VARCHAR(50),
    app_vendedor VARCHAR(50),
    apm_vendedor VARCHAR(50),
    correo_electronico VARCHAR(100),
    contraseña VARCHAR(50),
    telefono VARCHAR(10),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_estatus INT,
    FOREIGN KEY (id_estatus) REFERENCES estatus(id_estatus)
);

-- Tabla marca
CREATE TABLE marca(
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre_marca VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla producto
CREATE TABLE producto(
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(50),
    id_marca INT,
    modelo VARCHAR(50),
    stock INT,
    precio_provedor DECIMAL(10, 2),
    precio_publico DECIMAL(10, 2),
    descripcion TEXT,
    id_vendedor INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_estatus INT,
    FOREIGN KEY(id_marca) REFERENCES marca(id_marca),
    FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor),
    FOREIGN KEY(id_estatus) REFERENCES estatus(id_estatus)
);

-- Tabla cliente
CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(50),
    app_cliente VARCHAR(50),
    apm_cliente VARCHAR(50),
    correo_electronico VARCHAR(100),
    contraseña VARCHAR(50),
    telefono VARCHAR(10),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_estatus INT,
    FOREIGN KEY(id_estatus) REFERENCES estatus(id_estatus)
);

-- Tabla ubicación
CREATE TABLE ubicacion(
    id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre_contacto VARCHAR(50),
    numero_contacto VARCHAR(50),
    region VARCHAR(250),
    manzana VARCHAR(50),
    numero_INTerior VARCHAR(50),
    numero_exterior VARCHAR(50),
    codigo_postal VARCHAR(5),
    calles VARCHAR(100),
    referencia VARCHAR(500),
    id_cliente INT,
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabla venta
CREATE TABLE venta(
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_vendedor INT,
    id_cliente INT,
    id_producto INT,
    cantidad_producto INT,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);