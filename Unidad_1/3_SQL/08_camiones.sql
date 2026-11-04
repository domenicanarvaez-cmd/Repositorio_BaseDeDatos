CREATE DATABASE camiones;
USE camiones;

CREATE TABLE Camionero (
    cedula     VARCHAR(10)    PRIMARY KEY,
    nombre     VARCHAR(80)    NOT NULL,
    telefono   VARCHAR(15),
    direccion  VARCHAR(150),
    salario    DECIMAL(10,2),
    poblacion  VARCHAR(80)
);

CREATE TABLE Provincia (
    codigo  VARCHAR(10) PRIMARY KEY,
    nombre  VARCHAR(50) NOT NULL
);

CREATE TABLE Camion (
    matricula  VARCHAR(10) PRIMARY KEY,
    modelo     VARCHAR(50),
    tipo       VARCHAR(30),
    potencia   INT
);

CREATE TABLE Paquete (
    codigo                  VARCHAR(10)   PRIMARY KEY,
    descripcion             VARCHAR(150),
    destinatario            VARCHAR(80)   NOT NULL,
    direccion_destinatario  VARCHAR(150)  NOT NULL,
    cedula_camionero        VARCHAR(10)   NOT NULL,
    codigo_provincia        VARCHAR(10)   NOT NULL,
    FOREIGN KEY (cedula_camionero) REFERENCES Camionero(cedula),
    FOREIGN KEY (codigo_provincia) REFERENCES Provincia(codigo)
);

CREATE TABLE Conduce (
    cedula_camionero  VARCHAR(10),
    matricula_camion  VARCHAR(10),
    fecha             DATE,
    PRIMARY KEY (cedula_camionero, matricula_camion, fecha),
    FOREIGN KEY (cedula_camionero) REFERENCES Camionero(cedula),
    FOREIGN KEY (matricula_camion) REFERENCES Camion(matricula)
);
