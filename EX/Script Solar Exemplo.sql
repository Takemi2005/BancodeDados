create database solar;
use solar;

create table if not exists Clientes (
Cod_Cliente int not null,
Nome_Cliente varchar(100),
CPF varchar(14) not null,
Endreco varchar(100),
Celular varchar(19),
primary key (Cod_Cliente)
);

create table if not exists Produtos (
Cod_Produto int auto_increment primary key not null,
Nome_Produto varchar(100) not null,
Descricao varchar(100),
Qtde int not null,
Valor decimal(5,2) not null
);

create table if not exists Fornecedor (
Id_Fornecedor int not null,
Nome_Fornecedor varchar(255),
CNPJ varchar(18) not null,
Enderco varchar(100) not null,
Estado char(2) default'SP'not null,
Cidade varchar(100) not null,
Celular varchar(14),
primary key (id_Fornecedor)
);

create table Venda (
Cod_venda int primary key auto_increment not null ,
Cod_Produto int not null,
ID_Fornecedor int not null,
foreign key (Cod_Produto) references Produtos (Cod_Produto),
foreign key (ID_Fornecedor) references Fornecedor (ID_Fornecedor)
);

create table if not exists Compra (
Cod_Compra int primary key auto_increment not null ,
Cod_Cliente  int not null,
Cod_Produto  int not null,
foreign key (Cod_Produto) references Produtos (Cod_Produto),
foreign key (Cod_Cliente) references Clientes (Cod_Cliente)
);

create table Funcionarios (
Cod_Funcionario int auto_increment primary key not null,
Nome_Funcionario varchar(100) not null,
CPF_Funcionario varchar(14) not null,
Endereco_Funcionario varchar(100) not null,
Data_Nascimento datetime not null,
Data_Admissao datetime not null,
Data_Recisao datetime not null,
Salario decimal(7,2) not null,
Cod_Departamento int not null,
foreign key (Cod_Departamento) references Departamento (Cod_Departamento)
);

create table Departamento (
Cod_Departamento int auto_increment primary key not null,
Nome_Departamento varchar(20) not null,
Responsavel varchar(100) not null,
Setor varchar(50) not null
); 

alter table Funcionarios 
add sexo char(1);

alter table Funcionarios 
drop column sexo;

alter table Funcionarios
rename to Empregado;

alter table Empregado
modify column Nome_Funcionario varchar(200);

alter table Fornecedor
modify column Estado char(2) default 'MG';

-- alterar chave primária
alter table Empregado modify Cpf_Funcionario int not null;
alter table Empregado drop primary key;

alter table empregado
add primary key (Cod_Funcionari,Cpf_Funcionario);


