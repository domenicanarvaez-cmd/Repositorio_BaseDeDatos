CREATE DATABASE clinica;
USE clinica;

CREATE TABLE Paciente (
    cedula  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Especialidad (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Medico (
    identificador        VARCHAR(10) PRIMARY KEY,
    codigo_especialidad  VARCHAR(10) NOT NULL,
    FOREIGN KEY (codigo_especialidad) REFERENCES Especialidad(codigo)
);

CREATE TABLE Cita (
    codigo                VARCHAR(10) PRIMARY KEY,
    fecha                 DATE        NOT NULL,
    hora                  TIME        NOT NULL,
    consultorio           VARCHAR(20) NOT NULL,
    cedula_paciente       VARCHAR(10) NOT NULL,
    identificador_medico  VARCHAR(10) NOT NULL,
    FOREIGN KEY (cedula_paciente)      REFERENCES Paciente(cedula),
    FOREIGN KEY (identificador_medico) REFERENCES Medico(identificador)
);

CREATE TABLE Receta (
    codigo       VARCHAR(10) PRIMARY KEY,
    codigo_cita  VARCHAR(10) NOT NULL UNIQUE,
    FOREIGN KEY (codigo_cita) REFERENCES Cita(codigo)
);

CREATE TABLE Medicamento (
    codigo  VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Incluye (
    codigo_receta       VARCHAR(10),
    codigo_medicamento  VARCHAR(10),
    dosis               VARCHAR(50) NOT NULL,
    duracion            VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo_receta, codigo_medicamento),
    FOREIGN KEY (codigo_receta)      REFERENCES Receta(codigo),
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamento(codigo)
);
