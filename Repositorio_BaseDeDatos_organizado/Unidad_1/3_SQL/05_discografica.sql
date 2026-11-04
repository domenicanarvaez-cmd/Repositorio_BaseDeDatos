CREATE DATABASE discografica;
USE discografica;

CREATE TABLE Manager (
    identificador  VARCHAR(10) PRIMARY KEY,
    nombre         VARCHAR(80) NOT NULL
);

CREATE TABLE Artista (
    NIF                    VARCHAR(15)  PRIMARY KEY,
    nombre_completo        VARCHAR(120) NOT NULL,
    identificador_manager  VARCHAR(10)  NOT NULL,
    FOREIGN KEY (identificador_manager) REFERENCES Manager(identificador)
);

CREATE TABLE Evento_promocion (
    identificador      VARCHAR(10) PRIMARY KEY,
    fecha              DATE        NOT NULL,
    numero_asistentes  INT         CHECK (numero_asistentes >= 0)
);

CREATE TABLE Participa (
    NIF_artista           VARCHAR(15),
    identificador_evento  VARCHAR(10),
    PRIMARY KEY (NIF_artista, identificador_evento),
    FOREIGN KEY (NIF_artista)          REFERENCES Artista(NIF),
    FOREIGN KEY (identificador_evento) REFERENCES Evento_promocion(identificador)
);
