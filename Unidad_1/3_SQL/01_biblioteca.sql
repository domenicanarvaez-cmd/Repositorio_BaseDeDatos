CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Libro (
    isbn    VARCHAR(13)  PRIMARY KEY,
    titulo  VARCHAR(100) NOT NULL
);

CREATE TABLE Autor (
    codigo  VARCHAR(10)  PRIMARY KEY,
    nombre  VARCHAR(80)  NOT NULL
);

CREATE TABLE Socio (
    codigo  VARCHAR(10)  PRIMARY KEY,
    nombre  VARCHAR(80)  NOT NULL
);

CREATE TABLE Es_escrito (
    isbn_libro    VARCHAR(13),
    codigo_autor  VARCHAR(10),
    PRIMARY KEY (isbn_libro, codigo_autor),
    FOREIGN KEY (isbn_libro)   REFERENCES Libro(isbn),
    FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo)
);

CREATE TABLE Prestamo (
    isbn_libro        VARCHAR(13),
    codigo_socio      VARCHAR(10),
    fecha_retiro      DATE,
    fecha_devolucion  DATE,
    PRIMARY KEY (isbn_libro, codigo_socio, fecha_retiro),
    FOREIGN KEY (isbn_libro)   REFERENCES Libro(isbn),
    FOREIGN KEY (codigo_socio) REFERENCES Socio(codigo)
);
