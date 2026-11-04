CREATE DATABASE veterinaria;
USE veterinaria;

CREATE TABLE Propietario (
    cedula     VARCHAR(10)  PRIMARY KEY,
    apellidos  VARCHAR(80)  NOT NULL,
    nombres    VARCHAR(80)  NOT NULL,
    direccion  VARCHAR(150)
);

CREATE TABLE Telefono_propietario (
    cedula_propietario  VARCHAR(10),
    telefono            VARCHAR(15),
    PRIMARY KEY (cedula_propietario, telefono),
    FOREIGN KEY (cedula_propietario) REFERENCES Propietario(cedula)
        ON DELETE CASCADE
);

CREATE TABLE Familiar_contacto (
    cedula_propietario  VARCHAR(10) UNIQUE,
    cedula              VARCHAR(10),
    nombre              VARCHAR(80) NOT NULL,
    telefono            VARCHAR(15),
    PRIMARY KEY (cedula_propietario, cedula),
    FOREIGN KEY (cedula_propietario) REFERENCES Propietario(cedula)
        ON DELETE CASCADE
);

CREATE TABLE Mascota (
    identificador       VARCHAR(10) PRIMARY KEY,
    nombre              VARCHAR(50) NOT NULL,
    fecha_nacimiento    DATE,
    tipo                VARCHAR(30),
    cedula_propietario  VARCHAR(10) NOT NULL,
    FOREIGN KEY (cedula_propietario) REFERENCES Propietario(cedula)
);

CREATE TABLE Personal (
    codigo  VARCHAR(10) PRIMARY KEY,
    cedula  VARCHAR(10) NOT NULL UNIQUE,
    nombre  VARCHAR(80) NOT NULL
);

CREATE TABLE Veterinario (
    codigo        VARCHAR(10) PRIMARY KEY,
    fecha_alta    DATE        NOT NULL,
    especialidad  VARCHAR(50),
    FOREIGN KEY (codigo) REFERENCES Personal(codigo)
);

CREATE TABLE Auxiliar (
    codigo           VARCHAR(10)    PRIMARY KEY,
    base_cotizacion  DECIMAL(10,2)  NOT NULL,
    FOREIGN KEY (codigo) REFERENCES Personal(codigo)
);

CREATE TABLE Pasa_consulta (
    identificador_mascota  VARCHAR(10),
    codigo_veterinario     VARCHAR(10),
    fecha                  DATE,
    diagnostico            VARCHAR(255),
    PRIMARY KEY (identificador_mascota, codigo_veterinario, fecha),
    FOREIGN KEY (identificador_mascota) REFERENCES Mascota(identificador),
    FOREIGN KEY (codigo_veterinario)    REFERENCES Veterinario(codigo)
);
