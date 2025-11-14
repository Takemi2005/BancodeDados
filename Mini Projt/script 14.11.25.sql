CREATE DATABASE Oficina;
USE Oficina;


CREATE TABLE VEICULO (
modelo_veiculo varchar(100),
marca_veiculo varchar(100),
placa_veiculo varchar(7) not null,
id_veiculo int not null auto_increment PRIMARY KEY,
descricao_veiculo varchar(256),
id_cliente int not null
);

CREATE TABLE CLIENTE (
nome_cliente varchar(100),
cpf_cliente varchar(14),
endereco_cliente varchar(100),
contato_cliente varchar(10),
id_cliente int not null auto_increment PRIMARY KEY
);

CREATE TABLE ESTOQUE (
qtde_estoque int,
valor_peca decimal(5,2),
nome_peca varchar(100),
local_estoque varchar(10),
id_peca int not null auto_increment PRIMARY KEY
);

CREATE TABLE SERVICO (
valor_servico decimal (5,2),
nome_servico varchar(100),
data_entrega_servico date,
tipo_veiculo varchar(100),
id_servico int not null auto_increment PRIMARY KEY
);

CREATE TABLE MECANICOS (
endereco_mecanico varchar(100),
nome_mecanico varchar(100),
cpf_mecanico varchar(14),
contato_mecanico varchar(10),
id_mecanico int not null auto_increment PRIMARY KEY,
salario_mecanico decimal(5,2)
);

CREATE TABLE requerem (
id_servico int not null ,
id_peca int not null ,
FOREIGN KEY(id_servico) REFERENCES SERVICO (id_servico),
FOREIGN KEY(id_peca) REFERENCES ESTOQUE (id_peca)
);

CREATE TABLE ordem_servico (
id_servico int not null,
id_veiculo int not null ,
FOREIGN KEY(id_servico) REFERENCES SERVICO (id_servico),
FOREIGN KEY(id_veiculo) REFERENCES VEICULO (id_veiculo)
);

CREATE TABLE realiza (
id_servico int not null ,
id_mecanico int not null ,
FOREIGN KEY(id_servico) REFERENCES SERVICO (id_servico),
FOREIGN KEY(id_mecanico) REFERENCES MECANICOS (id_mecanico)
);

ALTER TABLE VEICULO ADD FOREIGN KEY(id_cliente) REFERENCES CLIENTE (id_cliente)
