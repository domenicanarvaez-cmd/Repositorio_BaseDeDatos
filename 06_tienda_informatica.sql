CREATE DATABASE tienda_informatica;
USE tienda_informatica;

CREATE TABLE Proveedor (
    codigo     VARCHAR(10)  PRIMARY KEY,
    nombres    VARCHAR(80)  NOT NULL,
    apellidos  VARCHAR(80)  NOT NULL,
    direccion  VARCHAR(150),
    provincia  VARCHAR(50),
    telefono   VARCHAR(15)
);

CREATE TABLE Producto (
    codigo              VARCHAR(10)    PRIMARY KEY,
    descripcion         VARCHAR(150)   NOT NULL,
    precio              DECIMAL(10,2)  NOT NULL,
    numero_existencias  INT            NOT NULL CHECK (numero_existencias >= 0)
);

CREATE TABLE Cliente (
    codigo     VARCHAR(10)  PRIMARY KEY,
    nombre     VARCHAR(80)  NOT NULL,
    apellidos  VARCHAR(80)  NOT NULL,
    direccion  VARCHAR(150),
    telefono   VARCHAR(15)
);

CREATE TABLE Suministra (
    codigo_proveedor  VARCHAR(10),
    codigo_producto   VARCHAR(10),
    PRIMARY KEY (codigo_proveedor, codigo_producto),
    FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo),
    FOREIGN KEY (codigo_producto)  REFERENCES Producto(codigo)
);

CREATE TABLE Compra (
    codigo_cliente   VARCHAR(10),
    codigo_producto  VARCHAR(10),
    fecha            DATE,
    PRIMARY KEY (codigo_cliente, codigo_producto, fecha),
    FOREIGN KEY (codigo_cliente)  REFERENCES Cliente(codigo),
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo)
);
