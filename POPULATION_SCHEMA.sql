SELECT * FROM TiposPlanos;

-- TiposPlanos --
INSERT INTO TiposPlanos (TipoPlano) VALUES ('Básico');
INSERT INTO TiposPlanos VALUES ('Premium');
INSERT INTO TiposPlanos (TipoPlano) VALUES
('Master'), ('Plus Advanced');

-- TiposConsultas --
INSERT INTO TiposConsultas VALUES
('Primeira Consulta', 200.50),
('Retorno', 720),
('Emergência', 1200);

SELECT * FROM TiposConsultas;

-- StatusConsultas --
INSERT INTO StatusConsultas VALUES 
('Agendada'),
('Cancelada'),
('Realizada');

SELECT * FROM StatusConsultas;

UPDATE StatusConsultas 
SET StatusConsulta = 'Concluída'
WHERE StatusConsulta = 'Realizada';

-- EspecialidadesMedicas --
INSERT INTO EspecialidadesMedicas VALUES 
('Pediatra', 'Cuida das crianças'),
('Cardiologista', 'Cuida do coração'),
('Otorrinolaringologista', 'Esse fala por si só'),
('Dermatologista', ''),
('Urologista', 'Cuida dos homens');

SELECT * FROM EspecialidadesMedicas;

-- Medicos --
INSERT INTO Medicos VALUES 
('1234-SP', 'Rodrigo', 'Faro', '2020-04-15'),
('5675-MG', 'Fernando', 'Lacoste', '2013-10-20'),
('RJ 4325', 'Poze', 'Do Rodo', '2007-05-23'),
('SC 34841', 'Patricia', 'Valentina', '2021-02-03'),
('132134 MT', 'Fernanda', 'Gallardo', '1998-04-26'),
('82742 RJ', 'Rodrigo', 'XiFuXan', '1985-06-16');

SELECT * FROM Medicos;

-- TelefonesMedicos --
INSERT INTO TelefonesMedicos VALUES 
(55, 16, 997420562, 1),
(55, 31, 998430674, 2),
(55, 21, 9943140531, 3),
(55, 47, 985042185, 4),
(55, 21, 923423949, 4),
(55, 65, 995047581, 5),
(55, 22, 9940385744, 6);

SELECT * FROM TelefonesMedicos;

--DELETE FROM TelefonesMedicos WHERE Id = 12

-- MedicosEspecialidades --
INSERT INTO MedicosEspecialidades VALUES 
(1, 2),
(2, 3),
(3, 5),
(4, 4),
(5, 1),
(6, 2);

SELECT * FROM MedicosEspecialidades;
--DELETE FROM MedicosEspecialidades;

-- Convenios --
INSERT INTO Convenios VALUES 
('VidaPlena Saúde', 'www.vidaplena.com', 06859709000123),
('Cuidar Bem', 'www.cuidarbem.org.br', 51066241000174),
('Essencial Care', 'www.caressencial.com', 54421656000107),
('MedCuidar', '', 03732152000177)

SELECT * FROM Convenios;

-- TelefonesConvenios --
INSERT INTO TelefonesConvenios VALUES
(55, 16, 33049120, 4),
(55, 21, 30045678, 5),
(55, 16, 35019341, 6),
(55, 49, 33438734, 7);

SELECT * FROM TelefonesConvenios;
--DELETE FROM TelefonesConvenios;

-- Enderecos --
INSERT INTO Enderecos VALUES
('Rua das Flores', 123, 'Apto 202', 'Centro', 'Belo Horizonte', 30123456),
('Avenida Brasil', 4500, '', 'Copacabana', 'Rio de Janeiro', 22040002),
('Rua XV de Novembro', 98, 'Bloco B', 'Centro', 'Joinville', 89201300),
('Rua das Palmeiras', 45, '', 'Jardim das Américas', 'Cuiabá', 78060705),
('Avenida Atlântica', 2000, 'Sala 301', 'Balneário Camboriú', 'Santa Catarina', 88330015);

SELECT * FROM Enderecos;

-- Pacientes --
INSERT INTO Pacientes VALUES
('Cleiton', 'Rasta', 77259470003, '1997-04-10', 2),
('Mateus', 'Ximenes', 88754798019, '1984-10-19', 5),
('Fernanda', 'Betoni', 42960461010, '2002-07-20', 4),
('José', 'Hebert', 07975338001, '2005-01-15', 3),
('Carla', 'Montana', 80030875030, '1999-03-12', 1),
('Roberta', 'Flores', 97748601011, '1983-08-09', 1);

SELECT * FROM Pacientes;

-- Emails --
INSERT INTO Emails VALUES
('cleitin10@gmail.com', 1),
('mathxin@hotmail.com', 2),
('fgibertoni@gmail.com', 3),
('zehebert3@gmail.com', 4),
('carla@gmail.com', 5),
('carlinha2@gmail.com', 5),
('robertinha@gmail.com', 6);

SELECT * FROM Emails;

-- TelefonesPacientes --
INSERT INTO TelefonesPacientes VALUES 
(55, 16, 9943510586, 1),
(55, 21, 985764301, 2),
(55, 16, 996584146, 3),
(55, 16, 9943768903, 4),
(55, 47, 994310576, 5),
(55, 47, 906841461, 6);

SELECT * FROM TelefonesPacientes;

-- PacientesParticulares -- 
INSERT INTO PacientesParticulares (IdPaciente, ValorConsulta) VALUES
(1, 150.50),
(3, 125.45),
(4, 245.75);

SELECT * FROM PacientesParticulares;

-- PacientesConveniados --
INSERT INTO PacientesConveniados VALUES 
(4, 2, 1234567, '2030-05-19', 3),
(7, 5, 1353105, '2035-10-20', 1),
(5, 6, 9432924, '2040-06-15', 4);

SELECT * FROM PacientesConveniados;

-- Consultas --
INSERT INTO Consultas VALUES 
('2025-10-05 16:30', 1, 3, '', 'Dengue', 1, 2),
('2024-04-20 08:30', 2, 2, 'A consulta foi cancelada', 'Sem diagnostico', 4, 5),
('2024-07-06 12:45', 2, 3, '', 'Saúde estável', 4, 5),
('2002-02-24 18:00', 3, 3, '', 'Nada a declarar, foi terrível', 5, 6);

DELETE FROM Consultas;

SELECT * FROM Consultas;

SELECT 
	c.DataHora,
	tc.TipoConsulta, tc.ValorConsulta,
	sc.StatusConsulta,
	p.Nome, p.Sobrenome, p.CPF,
	m.Nome, m.Sobrenome, m.CRM
FROM Consultas c 
INNER JOIN TiposConsultas tc ON c.IdTipoConsulta = tc.Id
INNER JOIN StatusConsultas sc ON c.IdStatusConsulta = sc.Id
INNER JOIN Pacientes p ON c.IdPaciente = p.IdPaciente
INNER JOIN Medicos m ON c.IdMedico = m.IdMedico;

SELECT 
	m.Nome, m.Sobrenome, m.CRM,
	e.NomeEspecialidade, e.Descricao
FROM MedicosEspecialidades me INNER JOIN EspecialidadesMedicas e ON me.IdEspecialidade = e.IdEspecialidade
INNER JOIN Medicos m ON me.IdMedico = m.IdMedico ORDER BY m.Nome ASC;