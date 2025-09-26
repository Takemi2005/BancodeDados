-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE CURSOS_ON;
USE CURSOS_ON;
SELECT DATABASE();




CREATE TABLE Alunos (
id_aluno int auto_increment primary key PRIMARY KEY,
email_aluno int not null,
data_nascimento datetime,
nome_aluno varchar(100)
);

CREATE TABLE Cursos (
id_curso int auto_increment primary key PRIMARY KEY,
descricao_curso varchar(255),
titulo_curso varchar(100),
status_curso varchar(10),
carga_horaria int not null
);

CREATE TABLE Inscricoes (
id_inscricao int auto_increment primary key,
data_inscricao datetime,
id_aluno int,
id_curso int,
FOREIGN KEY(id_aluno) REFERENCES Alunos (id_aluno),
FOREIGN KEY(id_curso) REFERENCES Cursos (id_curso)
);

CREATE TABLE Avaliacoes (
id_avaliacao int auto_increment primary key,
nota decimal(5,2),
comentario varchar(255),
id_inscricao int ,
FOREIGN KEY(id_inscricao) REFERENCES Inscricoes (id_inscricao)
);

ALTER TABLE Alunos MODIFY column email_aluno varchar(100) not null;

INSERT INTO Alunos (Alunos.nome_aluno, Alunos.email_aluno, Alunos.data_nascimento) VALUES
( 'Ana Silva', 'ana.silva@email.com', '1998-05-20'),
( 'Bruno Costa', 'bruno.costa@email.com', '1995-11-15'),
('Carla Lima', 'carla.lima@email.com', '2000-08-01'),
('Daniel Alves', 'daniel.alves@email.com', '1997-03-25'),
('Erica Fernandes', 'erica.fernandes@email.com', '1999-01-10');

INSERT INTO Cursos (titulo_curso, descricao_curso, status_curso, carga_horaria) VALUES
('Introdução ao SQL', 'Aprenda os fundamentos de bancos de dados.', 'ativo', 20),
('Desenvolvimento Web', 'Crie sites e aplicações dinâmicas.', 'inativo', 40),
('Análise de Dados com Python', 'Utilize Python para processamento de dados.', 'ativo', 60),
('Marketing Digital', 'Estratégias para promover negócios online.', 'ativo', 30),
('Design Gráfico', 'Princípios e técnicas de design visual.', 'inativo', 25);

INSERT INTO Inscricoes (data_inscricao, id_aluno, id_curso) VALUES
('2024-01-15 10:00:00', 1, 2),
('2024-01-16 14:30:00', 3, 1),
('2024-01-17 09:15:00', 2, 4),
('2024-01-18 11:00:00', 4, 3),
('2024-01-19 16:00:00', 5, 5);

INSERT INTO Avaliacoes (nota, comentario, id_inscricao) VALUES
(8.50, 'Ótimo curso, conteúdo relevante.', 1),
(7.00, 'Poderia ter mais exemplos práticos.', 2),
(9.75, 'Excelente, superou as expectativas!', 3),
(6.50, 'Achei o ritmo um pouco rápido.', 4),
(10.00, 'Simplesmente perfeito. Recomendo!', 5);

-- top
UPDATE Alunos
SET Alunos.nome_aluno =  "Victor Hugo"
WHERE Alunos.id_aluno = 1;
SELECT * FROM Alunos;

UPDATE Alunos
SET Alunos.email_aluno = 'victor.h07@dominio.com'
WHERE Alunos.id_aluno = 1;

UPDATE Cursos
SET Cursos.carga_horaria = 90
WHERE Cursos.id_curso = 3;

UPDATE Nota
SET Cursos.carga_horaria = 90
WHERE Cursos.id_curso = 3;

UPDATE Cursos
SET Cursos.status_curso = 'inativo'
WHERE Cursos.id_curso = 4;

UPDATE Avaliacoes
SET Avaliacoes.nota = 10.0
WHERE Avaliacoes.id_avaliacao = 2;

-- Delete
SELECT * FROM Cursos;

-- Procura inscricoes de cursos inativos
SELECT * FROM Inscricoes;

-- Procura avaliações de inscrições de cursos inativos
SELECT * FROM Avaliacoes;


DELETE FROM Avaliacoes WHERE Avaliacoes.id_avaliacao =5 ;
DELETE FROM Inscricoes WHERE Inscricoes.id_inscricao = 5;

DELETE FROM Cursos WHERE Cursos.id_curso = 5;

SELECT * FROM Alunos;
DELETE FROM Alunos WHERE Alunos.id_aluno =5;

-- select
SELECT *
FROM Alunos;

SELECT nome_aluno, email_aluno
FROM Alunos;

SELECT titulo_curso, carga_horaria
FROM Cursos
WHERE carga_horaria > 30;

SELECT titulo_curso, status_curso
FROM Cursos
WHERE status_curso= 'inativo';

SELECT nome_aluno, data_nascimento
FROM Alunos
WHERE data_nascimento > '1995-12-31';


SELECT id_avaliacao, nota, comentario
FROM Avaliacoes
WHERE nota > 9.0;

SELECT COUNT(*) AS total_cursos
FROM Cursos;

SELECT titulo_curso, carga_horaria
FROM Cursos
ORDER BY carga_horaria DESC
LIMIT 3;

CREATE INDEX idx_email_aluno
ON Alunos (email_aluno);