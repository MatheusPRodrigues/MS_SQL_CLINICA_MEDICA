-- Criação do meu BD
CREATE DATABASE ClinicaMedica;
GO

-- Defino o uso da instância do BD criado
USE ClinicaMedica;

CREATE TABLE Pacientes (
	IdPaciente INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- AUTO INCREMENT - 1,1 -> Anda um por um
	Nome VARCHAR (50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	CPF NUMERIC NOT NULL UNIQUE,
	DataNascimento DATE NOT NULL,
	IdEndereco INT
);

-- ALTER CAMPO DE IdPaciente para UNIQUE
CREATE TABLE PacientesParticulares (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	IdPaciente INT NOT NULL UNIQUE,
	ValorConsulta DECIMAL (8,2) NOT NULL
);

/* Correção do atributo IdPaciente na tabela PacientesParticulares 
ALTER TABLE PacientesParticulares 
ADD CONSTRAINT constraint_idpaciente_unique UNIQUE (IdPaciente);
*/

CREATE TABLE PacientesConveniados (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	IdConvenio INT NOT NULL,
	IdPaciente INT NOT NULL,
	NumCarteirinha NUMERIC NOT NULL UNIQUE,
	ValidadeConvenio DATE NOT NULL,
	IdTipoPlano INT NOT NULL,
);

CREATE TABLE Convenios (
	IdConvenio INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NomeConvenio VARCHAR(20) NOT NULL,
	SiteConvenio VARCHAR(20),
	CNPJ NUMERIC NOT NULL UNIQUE,
);

CREATE TABLE Medicos (
	IdMedico INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CRM VARCHAR(9) NOT NULL UNIQUE,
	Nome VARCHAR(50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	DataContratacao DATE NOT NULL
);

CREATE TABLE TelefonesConvenios (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CodPais NUMERIC NOT NULL,
	CodArea NUMERIC NOT NULL,
	Numero NUMERIC NOT NULL,
	IdConvenio INT NOT NULL
);

CREATE TABLE TiposPlanos (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	TipoPlano VARCHAR(20) NOT NULL UNIQUE
);

--
CREATE TABLE Enderecos (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Logradouro NVARCHAR(20) NOT NULL,
	Numero NUMERIC,
	Complemento VARCHAR(10),
	Bairro NVARCHAR(50) NOT NULL,
	Cidade VARCHAR(20) NOT NULL,
	CEP NUMERIC NOT NULL
);

CREATE TABLE TelefonesMedicos (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CodPais NUMERIC NOT NULL,
	CodArea NUMERIC NOT NULL,
	Numero NUMERIC NOT NULL,
	IdMedico INT NOT NULL
);

CREATE TABLE Consultas (
	IdConsulta INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DataHora DATETIME NOT NULL,
	IdTipoConsulta INT NOT NULL,
	IdStatusConsulta INT NOT NULL, --IdStatusConsulta
	Observacoes VARCHAR(255),
	Diagnostico VARCHAR(255) NOT NULL,
	IdPaciente INT NOT NULL,
	IdMedico INT NOT NULL
);

CREATE TABLE TiposConsultas(
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	TipoConsulta VARCHAR(30) NOT NULL UNIQUE,
	ValorConsulta DECIMAL NOT NULL
);

CREATE TABLE StatusConsultas (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	StatusConsulta VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE TelefonesPacientes (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	CodPais NUMERIC NOT NULL,
	CodArea NUMERIC NOT NULL,
	Numero NUMERIC NOT NULL,
	IdPacientes INT NOT NULL
);

CREATE TABLE Emails (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Email VARCHAR(20) NOT NULL UNIQUE,
	IdPaciente INT NOT NULL
);

CREATE TABLE EspecialidadesMedicas (
	IdEspecialidade INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NomeEspecialidade VARCHAR(20) NOT NULL UNIQUE,
	Descricao NVARCHAR(255)
);

CREATE TABLE MedicosEspecialidades (
	Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	IdMedico INT NOT NULL,
	IdEspecialidade INT NOT NULL
);

ALTER TABLE PacientesParticulares
ADD FOREIGN KEY (IdPaciente) REFERENCES Pacientes (IdPaciente);

ALTER TABLE PacientesConveniados
ADD FOREIGN KEY (IdPaciente) REFERENCES Pacientes (IdPaciente);

ALTER TABLE Pacientes
ADD FOREIGN KEY (IdEndereco) REFERENCES Enderecos (Id);

ALTER TABLE Emails
ADD FOREIGN KEY (IdPaciente) REFERENCES Pacientes (IdPaciente);

ALTER TABLE TelefonesPacientes
ADD FOREIGN KEY (IdPacientes) REFERENCES Pacientes (IdPaciente);

ALTER TABLE Consultas
ADD FOREIGN KEY (IdPaciente) REFERENCES Pacientes (IdPaciente),
FOREIGN KEY (IdMedico) REFERENCES Medicos (IdMedico),
FOREIGN KEY (IdStatusConsulta) REFERENCES StatusConsultas (Id),
FOREIGN KEY (IdTipoConsulta) REFERENCES TiposConsultas (Id);

ALTER TABLE PacientesConveniados 
ADD FOREIGN KEY (IdConvenio) REFERENCES Convenios (IdConvenio),
FOREIGN KEY (IdTipoPlano) REFERENCES TiposPlanos (Id);

ALTER TABLE TelefonesConvenios 
ADD FOREIGN KEY (IdConvenio) REFERENCES Convenios (IdConvenio);

ALTER TABLE TelefonesMedicos 
ADD FOREIGN KEY (IdMedico) REFERENCES Medicos (IdMedico);

ALTER TABLE MedicosEspecialidades
ADD FOREIGN KEY (IdMedico) REFERENCES Medicos (IdMedico),
FOREIGN KEY (IdEspecialidade) REFERENCES EspecialidadesMedicas (IdEspecialidade);