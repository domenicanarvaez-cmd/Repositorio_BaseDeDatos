CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE Cliente (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Mesero (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Categoria (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Plato (
    codigo            VARCHAR(10)   PRIMARY KEY,
    precio            DECIMAL(8,2)  NOT NULL,
    codigo_categoria  VARCHAR(10)   NOT NULL,
    FOREIGN KEY (codigo_categoria) REFERENCES Categoria(codigo)
);

CREATE TABLE Pedido (
    codigo          VARCHAR(10) PRIMARY KEY,
    codigo_cliente  VARCHAR(10) NOT NULL,
    codigo_mesero   VARCHAR(10) NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo),
    FOREIGN KEY (codigo_mesero)  REFERENCES Mesero(codigo)
);

CREATE TABLE Contiene (
    codigo_pedido    VARCHAR(10),
    codigo_plato     VARCHAR(10),
    cantidad         INT           NOT NULL CHECK (cantidad > 0),
    precio_unitario  DECIMAL(8,2)  NOT NULL,
    PRIMARY KEY (codigo_pedido, codigo_plato),
    FOREIGN KEY (codigo_pedido) REFERENCES Pedido(codigo),
    FOREIGN KEY (codigo_plato)  REFERENCES Plato(codigo)
);
