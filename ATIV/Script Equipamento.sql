create database reserva_equipamento;
use reserva_equipamento;

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

create table if not exists Reserva (
Cod_Reserva  int not null,
Tipo_Reserva varchar(100),
Observacao varchar(255),
Agendamento decimal not null,
primary key (Cod_Reserva)
);
