CREATE DATABASE SENAI_SP_MEDGROUP;

USE SENAI_SP_MEDGROUP;

CREATE TABLE Tipo_Usuario(
	ID INT PRIMARY KEY IDENTITY ,
	NOME VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Usuario(
	ID INT PRIMARY KEY IDENTITY ,
	EMAIL VARCHAR(200) NOT NULL UNIQUE,
	SENHA VARCHAR(200) NOT NULL ,
	ID_TIPO_USUARIO INT FOREIGN KEY REFERENCES Tipo_Usuario(ID) NOT NULL
);

CREATE TABLE Paciente(
	ID INT PRIMARY KEY IDENTITY,
	ID_USUARIO INT FOREIGN KEY REFERENCES Usuario(ID),
	NOME VARCHAR(200) NOT NULL,
	CPF CHAR(11) UNIQUE NOT NULL ,
	RG CHAR(9) UNIQUE NOT NULL,
	TELEFONE CHAR(11) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL
);

CREATE TABLE Especialidade(
	ID INT PRIMARY KEY IDENTITY ,
	NOME VARCHAR(50) NOT NULL
);

CREATE TABLE Clinica(
    ID INT PRIMARY KEY IDENTITY,
    NOME_FANTASIA VARCHAR(150) UNIQUE NOT NULL,
    ENDERECO VARCHAR(250) NOT NULL,
    NUMERO INT NOT NULL,
    CEP CHAR(8) UNIQUE NOT NULL,
    RAZAO_SOCIAL VARCHAR(100) UNIQUE NOT NULL    
);

CREATE TABLE Medico(
	ID INT PRIMARY KEY IDENTITY,
	ID_USUARIO INT FOREIGN KEY REFERENCES Usuario(ID),
	NOME VARCHAR(200) NOT NULL,
	CRM CHAR(7) NOT NULL,
	ID_CLINICA INT FOREIGN KEY REFERENCES Clinica(ID),
	ID_ESPECIALIDADE INT FOREIGN KEY REFERENCES Especialidade(ID)
);

CREATE TABLE StatusConsulta(
	ID INT PRIMARY KEY IDENTITY ,
	NOME VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Consulta(
    ID INT PRIMARY KEY IDENTITY,
    ID_MEDICO INT FOREIGN KEY REFERENCES Medico(ID),
    ID_PACIENTE INT FOREIGN KEY REFERENCES Paciente(ID),
    DATA_CONSULTA DATE NOT NULL,
	DESCRICAO TEXT,
    STATUS_CONSULTA INT FOREIGN KEY REFERENCES StatusConsulta(ID)
);