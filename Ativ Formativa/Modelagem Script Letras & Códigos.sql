-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Livros+Vendas (
cod_livro int auto increment,
editora Texto(1),
titulo_livro varchar (255),
preco decimal (5,2),
genero varchar (100),
autor varchar (255),
qtde_livro int not null,
valor_total decimal (5,2),
data_venda datatime,
qtde_venda int,
cod_venda int auto increment,
PRIMARY KEY(cod_livro,cod_venda)
)

CREATE TABLE Autores+Editoras (
cod_autor int auto increment,
data_nasc datatime,
nacionalidade varchar (100),
nome_autor varchar (255),
cod_cnpj int auto increment,
telefone varchar (20),
nome_editora varchar (255),
contato varchar (100),
cidade varchar (100),
endereco varchar (255),
PRIMARY KEY(cod_autor,cod_cnpj)
)

CREATE TABLE Clientes (
nome_cliente int auto increment PRIMARY KEY,
cpf varchar (14),
data_nasc datatime,
email varchar (255),
telefone varchar (20)
)

CREATE TABLE Tem (
cod_autor int auto increment,
cod_livro int auto increment,
FOREIGN KEY(cod_autor) REFERENCES Autores+Editoras (cod_autor,cod_cnpj),
FOREIGN KEY(cod_livro) REFERENCES Livros+Vendas (cod_livro,cod_venda)
)

CREATE TABLE Geram (
cod_venda int auto increment,
nome_cliente int auto increment,
FOREIGN KEY(cod_venda) REFERENCES Livros+Vendas (cod_livro,cod_venda),
FOREIGN KEY(nome_cliente) REFERENCES Clientes (nome_cliente)
)

