CREATE DATABASE discos_musicales;
USE discos_musicales;

CREATE TABLE Genero (
    identificador  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Cantante (
    identificador  VARCHAR(10) PRIMARY KEY,
    nombre         VARCHAR(80) NOT NULL,
    pais           VARCHAR(50)
);

CREATE TABLE Disco (
    identificador           VARCHAR(10)   PRIMARY KEY,
    titulo                  VARCHAR(100)  NOT NULL,
    precio                  DECIMAL(8,2)  NOT NULL,
    identificador_genero    VARCHAR(10)   NOT NULL,
    identificador_cantante  VARCHAR(10)   NOT NULL,
    FOREIGN KEY (identificador_genero)   REFERENCES Genero(identificador),
    FOREIGN KEY (identificador_cantante) REFERENCES Cantante(identificador)
);

CREATE TABLE Cancion (
    identificador  VARCHAR(10)  PRIMARY KEY,
    titulo         VARCHAR(100) NOT NULL
);

CREATE TABLE Tiene (
    identificador_disco    VARCHAR(10),
    identificador_cancion  VARCHAR(10),
    posicion               INT NOT NULL CHECK (posicion > 0),
    PRIMARY KEY (identificador_disco, identificador_cancion),
    UNIQUE (identificador_disco, posicion),
    FOREIGN KEY (identificador_disco)   REFERENCES Disco(identificador),
    FOREIGN KEY (identificador_cancion) REFERENCES Cancion(identificador)
);
