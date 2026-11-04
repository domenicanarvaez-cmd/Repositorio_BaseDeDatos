CREATE DATABASE aerolinea;
USE aerolinea;

CREATE TABLE Aerolinea (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Avion (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Pasajero (
    cedula  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Vuelo (
    numero            VARCHAR(10) PRIMARY KEY,
    fecha             DATE        NOT NULL,
    origen            VARCHAR(50) NOT NULL,
    destino           VARCHAR(50) NOT NULL,
    codigo_aerolinea  VARCHAR(10) NOT NULL,
    codigo_avion      VARCHAR(10) NOT NULL,
    FOREIGN KEY (codigo_aerolinea) REFERENCES Aerolinea(codigo),
    FOREIGN KEY (codigo_avion)     REFERENCES Avion(codigo)
);

CREATE TABLE Reserva (
    codigo           VARCHAR(10)    PRIMARY KEY,
    asiento          VARCHAR(5)     NOT NULL,
    tarifa           DECIMAL(10,2)  NOT NULL,
    cedula_pasajero  VARCHAR(10)    NOT NULL,
    numero_vuelo     VARCHAR(10)    NOT NULL,
    UNIQUE (numero_vuelo, asiento),
    FOREIGN KEY (cedula_pasajero) REFERENCES Pasajero(cedula),
    FOREIGN KEY (numero_vuelo)    REFERENCES Vuelo(numero)
);
