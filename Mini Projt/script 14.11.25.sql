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

ALTER TABLE VEICULO ADD FOREIGN KEY(id_cliente) REFERENCES CLIENTE (id_cliente);

-- 1. Adicionar campos de status e data à tabela principal que representa a Ordem de Serviço (ordem_servico)
ALTER TABLE ordem_servico
ADD COLUMN data_abertura DATE,
ADD COLUMN status_os ENUM('Aberta', 'Em Execução', 'Aguardando Peça', 'Concluída', 'Cancelada');

-- 2. Adicionar o campo especialidade à tabela MECANICOS
ALTER TABLE MECANICOS
ADD COLUMN especialidade VARCHAR(100);

-- 3. Adicionar campos de custo e venda à tabela ESTOQUE para o Desafio (Tabela Pecas)
ALTER TABLE ESTOQUE
ADD COLUMN preco_custo DECIMAL(7,2),
ADD COLUMN preco_venda DECIMAL(7,2);

-- 1. Adicionar campos de status, datas e valor_total na tabela ordem_servico
ALTER TABLE ordem_servico
ADD COLUMN data_conclusao DATE,
ADD COLUMN valor_total_os DECIMAL(8,2) DEFAULT 0.00;


-- Adicionar 'diagnostico_entrada' a ORDEM_SERVICO para que possamos REMOVÊ-LA
ALTER TABLE ordem_servico
ADD COLUMN diagnostico_entrada VARCHAR(255);

