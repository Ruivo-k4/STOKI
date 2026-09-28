/*28/29 15:26*/
CREATE DATABASE stoki_bd;
USE stoki_bd;

CREATE TABLE adms(
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100) NOT NULL,
empresa VARCHAR(100) NOT NULL,
senha VARCHAR(100) NOT NULL,

tel VARCHAR(14) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
nib VARCHAR(13) NOT NULL UNIQUE, /*esse não*/

data_cad DATETIME DEFAULT current_timestamp
); 

delimiter $$
create procedure cad_adm(
in
$nome varchar(100),
$empresa varchar(100),
$tel VARCHAR(100),
$email varchar(100),
$cpf varchar(14),
$cnpj varchar(18),
$senha VARCHAR(100),
$nib varchar(13)
) begin
insert into adms(nome, empresa, tel, email, cpf, cnpj, senha, nib)
values ($nome, $empresa, $tel, $email, $cpf, $cnpj, $senha, $nib); 
end $$

CALL cad_adm('nome', 'empresa', 'tel', 'email', 'cpf', 'cnpj', 'senha', 'nib');
SELECT*FROM adms;

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

delimiter $$
create procedure cad_fun(
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

CALL cad_fun('nome', 'email', 'senha', 'cpf', 1);
SELECT*FROM funcionarios;

CREATE TABLE clientes (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,

tel VARCHAR(13) NOT NULL UNIQUE,
cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

delimiter $$
create procedure cad_cliente(
in
$nome varchar(100),
$tel VARCHAR(13),
$cnpj varchar(18),
$cpf varchar(14),
$adms_id int
) begin
INSERT INTO clientes(nome, tel, cnpj, cpf, adms_id)
VALUES ($nome, $tel, $cnpj, $cpf, $adms_id);
end $$

CALL cad_cliente('nome', 'tel', 'cnpj', 'cpf', 1);

CREATE TABLE fornecedores (
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100),
tel VARCHAR(13) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
cnpj VARCHAR(100),
cpf VARCHAR(14) UNIQUE,
cep VARCHAR(9),

data_cad datetime DEFAULT current_timestamp
);

delimiter $$
CREATE PROCEDURE cad_forn (
IN
$nome varchar(100),
$tel varchar(13),
$email varchar(100),
$cnpj varchar(14),
$cpf varchar(14),
$cep varchar(9)
) BEGIN
INSERT INTO fornecedores(nome, tel, email, cnpj, cpf, cep)
VALUES ($nome, $tel, $email, $cnpj, $cpf, $cep);
end $$

CALL cad_forn('nome', 'tel', 'email', 'cnpj', 'cpf', 'cep');
SELECT*FROM fornecedores;

CREATE TABLE compras (
id INT NOT NULL PRIMARY KEY auto_increment,

id_fornecedor INT NOT NULL,
fornecedor VARCHAR(100),

produto VARCHAR(100),
qnt_produto INT,
val_unitario DECIMAL(18,2),

val_total DECIMAL(18,2),

date_cad DATETIME DEFAULT current_timestamp,

foreign key (id_fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE item_compra (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,

date_comp DATETIME DEFAULT CURRENT_TIMESTAMP
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
lote INT NOT NULL,

qnt_min_repor INT NOT NULL,
qnt_max_repor INT NOT NULL,

gtin VARCHAR(14) NOT NULL UNIQUE,

date_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE vendas (
id INT NOT NULL primary KEY auto_increment,
cliente_id INT NOT NULL,

adm_id INT,
adm VARCHAR(100),

produto_id INT NOT NULL,
produto VARCHAR(100),

val_unitario DECIMAL(18,2),
qntd_produto INT,
valor_total DECIMAL(18,2) NOT NULL,
forma_pagamento VARCHAR(25) NOT NULL,
situacao VARCHAR(50) NOT NULL,

data_venda DATETIME DEFAULT current_timestamp,

FOREIGN KEY (cliente_id) REFERENCES clientes(id),
FOREIGN KEY (adm_id) REFERENCES adms(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE item_venda (
id INT NOT NULL PRIMARY KEY auto_increment,

produto_id INT NOT NULL,
venda_id INT NOT NULL,

produto VARCHAR(100),
quantidade INT NOT NULL,
val_unitario DECIMAL(18,2) NOT NULL,

foreign key (produto_id) REFERENCES produtos(id),
foreign key (venda_id) REFERENCES vendas(id)
);

CREATE TABLE estoque (
id INT NOT NULL PRIMARY KEY auto_increment,

);

CREATE TABLE mov_estoque (
id INT NOT NULL PRIMARY KEY auto_increment,

id_produto INT NOT NULL,
local_produto VARCHAR(100) NOT NULL,
qntd_produto INT NOT NULL,

val_tot_prod DECIMAL(18, 2),
val_tot_venda DECIMAL(18, 2),

data_mov DATETIME DEFAULT current_timestamp,

FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

SELECT*FROM adms;
SELECT*FROM funcionarios;
SELECT*FROM produtos;
SELECT*FROM clientes;
SELECT*FROM vendas;

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

delimiter $$
CREATE TRIGGER trg_valor_unitario_produto
BEFORE INSERT ON item_venda 
FOR EACH ROW
BEGIN
	SET NEW.val_unitario = (
		SELECT valor_unitario FROM produtos WHERE id = NEW.produto_id
	);
END $$


/* fazer - Clilia

compra - fornecedor
venda-cliente
estoque- entrada(compra) i-saida(venda) estoque
            100             2            98
*/