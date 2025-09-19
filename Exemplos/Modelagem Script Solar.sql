-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE EMPRESA_SOLAR;
use EMPRESA_SOLAR;
SELECT DATABASE ();



CREATE TABLE Clientes (
ID_Cliente int auto_increment PRIMARY KEY,
Nome_Cliente varchar (100)
);

CREATE TABLE Produtos (
Nome_Produto int auto_increment PRIMARY KEY,
ID_Produto varchar (100)
);

CREATE TABLE Compra (
ID_Compra int auto_increment PRIMARY KEY not null,
ID_Produto int,
ID_Cliente int,
FOREIGN KEY(ID_Produto) REFERENCES Produtos (ID_Produto),
FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE VENDEDORES (
id_Vendedor int auto_increment PRIMARY KEY,
Nome_Vendedor varchar(100),
Salario decimal(5,2),
fsalarial char(1)
);

DROP TABLE VENDEDOR;

INSERT INTO CLIENTES (Nome_Cliente) VALUES ('Luiza');
INSERT INTO PRODUTOS VALUES (2, 'Fone');
INSERT INTO VENDEDORES (Nome_Vendedor, Salario, fsalarial) VALUES ('Luiza','5.000', 1);
INSERT INTO VENDEDORES (Nome_Vendedor, Salario, fsalarial) VALUES ('Roberto','5.000', 2);
INSERT INTO VENDEDORES (Nome_Vendedor, Salario, fsalarial) VALUES ('Amanda','5.000', 1);
INSERT INTO VENDEDORES (Nome_Vendedor, Salario, fsalarial) VALUES ('Henrique','5.000', 1);

UPDATE PRODUTOS SET Nome_Produto = 'Mouse'
WHERE ID_Produto = 1;

UPDATE VENDEDORES SET salario = 3150
WHERE fsalarial = 1;

SELECT * FROM PRODUTOS;
SELECT * FROM VENDEDORES;
