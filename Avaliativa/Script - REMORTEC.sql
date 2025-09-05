CREATE DATABASE REMOTERC;
USE REMOTERC;

CREATE TABLE PRODUTOS (
    CProd INT PRIMARY KEY,
    Descricao VARCHAR(255),
    Peso VARCHAR(10),
    ValorUnit DECIMAL(10, 2)
);

INSERT INTO PRODUTOS (CProd, Descricao, Peso, ValorUnit)
VALUES (1, 'Teclado', 'KG', 35.00),
(2, 'Mouse', 'KG', 25.00),
(3, 'HD', 'KG', 350.00);

--- VENDEDOR
CREATE TABLE VENDEDOR (
    CVend INT PRIMARY KEY,
    Nome VARCHAR(255),
    Salario DECIMAL(10, 2),
    FSalario INT
);

INSERT INTO VENDEDOR (CVend, Nome, Salario, FSalario) 
VALUES (1, 'Ronaldo', 3512.00, 1),
(2, 'Robertson', 3225.00, 2),
(3, 'Clodoaldo', 4350.00, 3);

--- CLIENTE
CREATE TABLE CLIENTE (
    CCli INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Cidade VARCHAR(255),
    UF VARCHAR(2)
);

INSERT INTO CLIENTE (CCli, Nome, Endereco, Cidade, UF) 
VALUES (11, 'Bruno', 'Rua 1 456', 'Rio Claro', 'SP'),
(12, 'Cláudio', 'Rua Quadrada 234', 'Campinas', 'SP'),
(13, 'Cremilda', 'Rua das Flores 666', 'São Paulo', 'SP');

UPDATE VENDEDOR
SET Salario = 3150.00
WHERE FSalario = 1;

UPDATE VENDEDOR
SET Salario = Salario * 1.10
WHERE FSalario = 2;

UPDATE VENDEDOR
SET Salario = 3500.00
WHERE FSalario = 3;