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

-- MedicosEspecialidades --
