CREATE DATABASE stoki_bd;
USE stoki_bd;

CREATE TABLE adms(
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100) NOT NULL,
empresa VARCHAR(100) NOT NULL,

email VARCHAR(100) NOT NULL UNIQUE,
cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
nib VARCHAR(13) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp
); 

CREATE TABLE funcionarios (
id INT NOT NULL primary KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,

email VARCHAR(100) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
senha varchar(100) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE produtos (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,
marca VARCHAR(100) NOT NULL,
descricao varchar(1000) not null,
qntd INT NOT NULL,
valor_unitario DECIMAL(18,2) NOT NULL,
valor_venda DECIMAL(18,2) NOT NULL,
valor_compra DECIMAL(18,2) NOT NULL,
peso DECIMAL(18,2) NOT NULL,
lote INT NOT NULL UNIQUE,

gtin VARCHAR(14) NOT NULL UNIQUE,

date_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE clientes (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,

cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE vendas (
id INT NOT NULL primary KEY auto_increment,
cliente_id INT NOT NULL,

adm_id INT NOT NULL,
adm VARCHAR(100),

produto_id INT NOT NULL,
produto VARCHAR(100),
qntd_produto INT NOT NULL,
val_produto DECIMAL(18,2),

desconto DECIMAL(5,2),

valor_total DECIMAL(18,2) NOT NULL,

data_venda DATETIME DEFAULT current_timestamp,

FOREIGN KEY (cliente_id) REFERENCES clientes(id),
FOREIGN KEY (adm_id) REFERENCES adms(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

SELECT*FROM adms;
SELECT*FROM funcionarios;
SELECT*FROM produtos;
SELECT*FROM clientes;
SELECT*FROM vendas;

delimiter $$
create procedure cadastro_adm(
in
$nome varchar(100),
$empresa varchar(100),
$email varchar(100),
$cpf varchar(14),
$cnpj varchar(18),
$nib varchar(13)
) begin
insert into adms(nome, empresa, email, cpf, cnpj, nib)
values ($nome, $empresa, $email, $cpf, $cnpj, $nib); 
end $$
call cadastro_adm("fernando", "FerDnando", "Fernando@gmail.com", "111.111.111-11", "11111111111111", "10409261234");

delimiter $$
create procedure cadastro_funcionario(
in
$nome varchar(100),
$email varchar(100),
$senha varchar(100),
$cpf varchar(14),
$adms_id int
) begin
insert into funcionarios(nome, email, senha, cpf, adms_id)
values ($nome, $email, $senha, $cpf, $adms_id);
end $$
call cadastro_funcionario("wesley", "wesley@gmail.com", "wesley123", "111.111.111-11", 1);

delimiter $$
create procedure cadastro_cliente(
in
$nome varchar(100),
$cnpj varchar(18),
$cpf varchar(14),
$adms_id int
) begin
insert into clientes(nome, cnpj, cpf, adms_id)
values($nome, $cnpj, $cpf, $adms_id);
end $$
call cadastro_cliente("niara", "111111111111", "111.111.111-11", 1);

delimiter $$
create procedure cadastro_produto(
in
$nome varchar(100),
$marca varchar(100),
$descricao varchar(1000),
$qntd int,
$valor_unitario decimal(18,2),
$valor_compra decimal(18,2),
$valor_venda decimal(18,2),
$peso decimal(12,3),
$gtin varchar(18),
$lote int,
$adms_id int
) begin
insert into produtos(nome, marca, descricao, qntd, valor_unitario, valor_compra, valor_venda, peso, gtin, lote, adms_id)
values ($nome, $marca, $descricao, $qntd, $valor_unitario, $valor_compra, $valor_venda, $peso, $gtin, $lote, $adms_id);
end $$
CALL cadastro_produto('Teclado Mecânico RGB', 'Logitech', 'Teclado switch blue abnt2', 50, 299.90, 180.00, 349.99, 0.850, '7891234567890', 10, 1);

/* fazer - Clilia

compra - fornecedor
venda-cliente
estoque- entrada(compra) i-saida(venda) estoque
            100             2            98
*/CREATE DATABASE stoki_bd;
USE stoki_bd;

CREATE TABLE adms(
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100) NOT NULL,
empresa VARCHAR(100) NOT NULL,

email VARCHAR(100) NOT NULL UNIQUE,
cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
nib VARCHAR(13) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp
); 

CREATE TABLE funcionarios (
id INT NOT NULL primary KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,

email VARCHAR(100) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
senha varchar(100) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE produtos (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,
marca VARCHAR(100) NOT NULL,
descricao varchar(1000) not null,
qntd INT NOT NULL,
valor_unitario DECIMAL(18,2) NOT NULL,
valor_venda DECIMAL(18,2) NOT NULL,
valor_compra DECIMAL(18,2) NOT NULL,
peso DECIMAL(18,2) NOT NULL,
lote INT NOT NULL UNIQUE,

gtin VARCHAR(14) NOT NULL UNIQUE,

date_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE clientes (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,

cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE vendas (
id INT NOT NULL primary KEY auto_increment,
cliente_id INT NOT NULL,

adm_id INT NOT NULL,
adm VARCHAR(100),

produto_id INT NOT NULL,
produto VARCHAR(100),
qntd_produto INT NOT NULL,
val_produto DECIMAL(18,2),

desconto DECIMAL(5,2),

valor_total DECIMAL(18,2) NOT NULL,

data_venda DATETIME DEFAULT current_timestamp,

FOREIGN KEY (cliente_id) REFERENCES clientes(id),
FOREIGN KEY (adm_id) REFERENCES adms(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

SELECT*FROM adms;
SELECT*FROM funcionarios;
SELECT*FROM produtos;
SELECT*FROM clientes;
SELECT*FROM vendas;

delimiter $$
create procedure cadastro_adm(
in
$nome varchar(100),
$empresa varchar(100),
$email varchar(100),
$cpf varchar(14),
$cnpj varchar(18),
$nib varchar(13)
) begin
insert into adms(nome, empresa, email, cpf, cnpj, nib)
values ($nome, $empresa, $email, $cpf, $cnpj, $nib); 
end $$
call cadastro_adm("fernando", "FerDnando", "Fernando@gmail.com", "111.111.111-11", "11111111111111", "10409261234");

delimiter $$
create procedure cadastro_funcionario(
in
$nome varchar(100),
$email varchar(100),
$senha varchar(100),
$cpf varchar(14),
$adms_id int
) begin
insert into funcionarios(nome, email, senha, cpf, adms_id)
values ($nome, $email, $senha, $cpf, $adms_id);
end $$
call cadastro_funcionario("wesley", "wesley@gmail.com", "wesley123", "111.111.111-11", 1);

delimiter $$
create procedure cadastro_cliente(
in
$nome varchar(100),
$cnpj varchar(18),
$cpf varchar(14),
$adms_id int
) begin
insert into clientes(nome, cnpj, cpf, adms_id)
values($nome, $cnpj, $cpf, $adms_id);
end $$
call cadastro_cliente("niara", "111111111111", "111.111.111-11", 1);

delimiter $$
create procedure cadastro_produto(
in
$nome varchar(100),
$marca varchar(100),
$descricao varchar(1000),
$qntd int,
$valor_unitario decimal(18,2),
$valor_compra decimal(18,2),
$valor_venda decimal(18,2),
$peso decimal(12,3),
$gtin varchar(18),
$lote int,
$adms_id int
) begin
insert into produtos(nome, marca, descricao, qntd, valor_unitario, valor_compra, valor_venda, peso, gtin, lote, adms_id)
values ($nome, $marca, $descricao, $qntd, $valor_unitario, $valor_compra, $valor_venda, $peso, $gtin, $lote, $adms_id);
end $$
CALL cadastro_produto('Teclado Mecânico RGB', 'Logitech', 'Teclado switch blue abnt2', 50, 299.90, 180.00, 349.99, 0.850, '7891234567890', 10, 1);

/* fazer - Clilia

compra - fornecedor
venda-cliente
estoque- entrada(compra) i-saida(venda) estoque
            100             2            98
*/