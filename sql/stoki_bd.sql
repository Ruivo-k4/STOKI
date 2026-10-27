CREATE DATABASE stoki_bd;
USE stoki_bd;

CREATE TABLE adms(
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100),
empresa VARCHAR(100),
senha VARCHAR(100),

tel VARCHAR(14) UNIQUE,
email VARCHAR(100) UNIQUE,
cnpj VARCHAR(18) UNIQUE,
cpf VARCHAR(14) UNIQUE,
nib VARCHAR(13) UNIQUE, /*esse não*/

data_cad DATETIME DEFAULT current_timestamp
);

delimiter $$
create procedure cad_adm(
in
$nome varchar(100),$empresa varchar(100),
$tel VARCHAR(100),$email varchar(100),
$cpf varchar(14),$cnpj varchar(18),
$senha VARCHAR(100),$nib varchar(13)
) begin
insert into adms(nome, empresa, tel, email, cpf, cnpj, senha, nib)
values ($nome,$empresa, $tel,$email, $cpf,$cnpj, $senha,$nib);
end $$  delimiter $$
create procedure upd_adm(
in
$nome varchar(100),$empresa varchar(100),
$tel VARCHAR(100),$email varchar(100),
$cpf varchar(14),$cnpj varchar(18),
$senha VARCHAR(100),$nib varchar(13)
) begin
update adms
set nome = $nome, empresa =$empresa, tel = $tel, email =$email, cpf = $cpf, cnpj =$cnpj, senha = $senha, nib =$nib
where email = $email; end $$

#CALL cad_adm('nome', 'empresa', 'tel', 'email', 'cpf', 'cnpj', 'senha', 'nob');
SELECT*FROM adms;

CREATE TABLE funcionarios (
id INT NOT NULL primary KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100),

email VARCHAR(100) UNIQUE,
cpf VARCHAR(14) UNIQUE,
senha varchar(100) UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

delimiter $$
create procedure cad_fun(
in
$nome varchar(100),
$email varchar(100),$senha varchar(100),
$cpf varchar(14),$adms_id int
) begin
insert into funcionarios(nome, email, senha, cpf, adms_id)
values ($nome, $email,$senha, $cpf,$adms_id);
end $$  delimiter $$
create procedure upd_fun(
in
$nome varchar(100),
$email varchar(100),$senha varchar(100),
$cpf varchar(14),$adms_id int
) begin
update funcionarios
set nome = $nome, email =$email, senha = $senha, adms_id =$adms_id
where email = $email; end $$

#CALL cad_fun('nume', 'email', 'senha', 'cpf', 1);
SELECT*FROM funcionarios;


CREATE TABLE clientes (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100),

tel VARCHAR(13) UNIQUE,
cnpj VARCHAR(18) UNIQUE,
cpf VARCHAR(14) UNIQUE,
email varchar(250) UNIQUE,

cep VARCHAR(8),

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

delimiter $$
create procedure cad_cliente(
in
$nome varchar(100),
$tel VARCHAR(13),
$email VARCHAR(250),
$cnpj varchar(18),
$cpf varchar(14),
$cep varchar(8),
$adms_id int
) begin
INSERT INTO clientes(nome, tel, email, cnpj, cpf, cep, adms_id)
VALUES ($nome, $tel, $email, $cnpj, $cpf, $cep, $adms_id);
end $$  

delimiter $$
create procedure upd_cliente(
in
$nome varchar(100),
$tel VARCHAR(13),$cnpj varchar(18),
$cpf varchar(14),$adms_id int
) begin
update clientes
set nome = $nome, tel = $tel, cnpj =$cnpj, cpf = $cpf, adms_id =$adms_id
where cpf = $cpf; end $$

#CALL cad_cliente('nome', 'tel', 'email', 'cnpj', 'cpf', 1);
SELECT*FROM clientes;

CREATE TABLE fornecedores (
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100),
tel VARCHAR(13) UNIQUE,
email VARCHAR(100) UNIQUE,
cnpj VARCHAR(100),
cpf VARCHAR(14) UNIQUE,
cep VARCHAR(9),

data_cad datetime DEFAULT current_timestamp
);

delimiter $$
CREATE PROCEDURE cad_forn (
IN
$nome varchar(100),$tel varchar(13),
$email varchar(100),$cnpj varchar(14),
$cpf varchar(14),$cep varchar(9)
) BEGIN
INSERT INTO fornecedores(nome, tel, email, cnpj, cpf, cep)
VALUES ($nome,$tel, $email,$cnpj, $cpf,$cep);
end $$  delimiter $$
create procedure upd_forn(
in
$nome varchar(100),
$tel VARCHAR(13),$cnpj varchar(18),
$cpf varchar(14),$adms_id int
) begin
update fornecedores
set nome = $nome, tel = $tel, cnpj =$cnpj, cpf = $cpf, adms_id =$adms_id
where cpf = $cpf; end $$

#CALL cad_forn('nome', 'tel', 'email', 'cnpj', 'cpf', 'cep');
SELECT*FROM fornecedores;

CREATE TABLE insumos ( /* materia prima*/
id INT NOT NULL PRIMARY KEY auto_increment,
id_forn INT NOT NULL,

nome VARCHAR(100),
marca VARCHAR(100),
descricao varchar(1000),

qntd INT,
valor_compra DECIMAL(18,2),

peso DECIMAL(18,2),
lote INT,

qnt_min_repor INT,
qnt_max_repor INT,

gtin VARCHAR(14) UNIQUE,

date_cad DATETIME DEFAULT current_timestamp,

FOREIGN KEY (id_forn) REFERENCES fornecedores(id)
);

delimiter $$
CREATE PROCEDURE cad_insumo (
IN
$nome VARCHAR(100),
$marca VARCHAR(100),$descricao varchar(1000),
$qntd INT,$valor_compra DECIMAL(18,2),
$peso DECIMAL(18,2),$lote INT,
$qnt_min_repor INT,$qnt_max_repor INT,
$gtin VARCHAR(14),$id_forn int
) BEGIN
INSERT INTO insumos(nome, marca, descricao, qntd, valor_compra, peso, lote, qnt_min_repor, qnt_max_repor, gtin, id_forn)
VALUES ($nome, $marca,$descricao, $qntd,$valor_compra, $peso,$lote, $qnt_min_repor,$qnt_max_repor, $gtin,$id_forn);
end $$  delimiter $$
CREATE PROCEDURE upd_insumo (
IN
$nome VARCHAR(100),
$marca VARCHAR(100),$descricao varchar(1000),
$qntd INT,$valor_compra DECIMAL(18,2),
$peso DECIMAL(18,2),$lote INT,
$qnt_min_repor INT,$qnt_max_repor INT,
$gtin VARCHAR(14),$id_forn int
) BEGIN
update insumos
set nome = $nome, marca = $marca, descricao =$descricao, qntd = $qntd, valor_compra =$valor_compra, peso = $peso, lote =$lote, qnt_min_repor = $qnt_min_repor, qnt_max_repor =$qnt_max_repor, gtin = $gtin, id_forn =$id_forn
where id_forn = $id_forn; end $$

#CALL cad_insumo('nome', 'marca', 'desc', 0, 0.00, 0.00, 0, 0, 0, 'gtin', 1);
SELECT*FROM insumos;

CREATE TABLE compras (
id INT NOT NULL PRIMARY KEY auto_increment,

id_fornecedor INT NOT NULL,
fornecedor VARCHAR(100),

val_total DECIMAL(18,2),
estado VARCHAR(50),

date_com DATETIME DEFAULT current_timestamp,

foreign key (id_fornecedor) REFERENCES fornecedores(id)
);

delimiter $$
CREATE PROCEDURE cad_compra (
IN
$fornecedor VARCHAR(100),$val_total DECIMAL(18,2),
$estado VARCHAR(50),$id_fornecedor INT
) BEGIN
INSERT INTO compras(fornecedor, val_total, estado, id_fornecedor)
VALUES ($fornecedor,$val_total, $estado,$id_fornecedor);
end $$  delimiter $$
CREATE PROCEDURE upd_compra (
IN
$fornecedor VARCHAR(100),$val_total DECIMAL(18,2),
$estado VARCHAR(50),$id_fornecedor INT
) BEGIN
update compras
set fornecedor = $fornecedor, val_total =$val_total, estado = $estado, id_fornecedor =$id_fornecedor
where id_fornecedor = $id_fornecedor; end $$

#CALL cad_compra('fornecedor', 0.00, 'estado', 1);
SELECT*FROM compras;

CREATE TABLE item_compra (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,

id_compra INT NOT NULL,

id_insumo INT NOT NULL,
insumo VARCHAR(100),

qnt INT,
val_unitario DECIMAL(18,2),
val_total DECIMAL(18,2),

date_comp DATETIME DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (id_compra) REFERENCES compras(id),
FOREIGN KEY (id_insumo) REFERENCES insumos(id)
);

delimiter $$
CREATE PROCEDURE cad_item_compra (
IN
$id_compra INT,$id_insumo INT,
$insumo VARCHAR(100),$qnt INT,
$val_unitario DECIMAL(18,2),$val_total DECIMAL(18,2)
) BEGIN
INSERT INTO item_compra(id_compra, id_insumo, insumo, qnt, val_unitario, val_total)
VALUES ($id_compra,$id_insumo, $insumo,$qnt, $val_unitario,$val_total);
end $$  delimiter $$
CREATE PROCEDURE upd_item_compra (
IN
$id_compra INT,$id_insumo INT,
$insumo VARCHAR(100),$qnt INT,
$val_unitario DECIMAL(18,2),$val_total DECIMAL(18,2)
) BEGIN
update item_compra
set id_compra = $id_compra, id_insumo =$id_insumo, insumo = $insumo, qnt =$qnt, val_unitario = $val_unitario, val_total =$val_total
where id_compra = $id_compra; end $$

#CALL cad_item_compra(1, 1, 'produto', 0, 0.00, 0.00);
SELECT*FROM item_compra;

CREATE TABLE produtos (
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100),
marca VARCHAR(100),
descricao varchar(1000),

qntd INT,
valor_unitario DECIMAL(18,2),
valor_venda DECIMAL(18,2),
valor_compra DECIMAL(18,2),

peso DECIMAL(18,2),
lote INT,

qnt_min_repor INT,
qnt_max_repor INT,

gtin VARCHAR(14) UNIQUE,

date_cad DATETIME DEFAULT current_timestamp
);

delimiter $$
CREATE PROCEDURE cad_prod (
in
$nome VARCHAR(100),$marca VARCHAR(100),
$descricao varchar(1000),$qntd INT,
$valor_unitario DECIMAL(18,2),$valor_venda DECIMAL(18,2),
$valor_compra DECIMAL(18,2),$peso DECIMAL(18,2),
$lote INT,$qnt_min_repor INT,
$qnt_max_repor INT,$gtin VARCHAR(14)
) BEGIN
INSERT INTO produtos(nome, marca, descricao, qntd, valor_unitario, valor_venda, valor_compra, peso, lote, qnt_min_repor, qnt_max_repor, gtin)
VALUES ($nome,$marca, $descricao,$qntd, $valor_unitario,$valor_venda, $valor_compra,$peso, $lote,$qnt_min_repor, $qnt_max_repor,$gtin);
end $$  delimiter $$

delimiter $$
CREATE PROCEDURE upd_prod (
in
$nome VARCHAR(100),$marca VARCHAR(100),
$descricao varchar(1000),$qntd INT,
$valor_unitario DECIMAL(18,2),$valor_venda DECIMAL(18,2),
$valor_compra DECIMAL(18,2),$peso DECIMAL(18,2),
$lote INT,$qnt_min_repor INT,
$qnt_max_repor INT,$gtin VARCHAR(14)
) BEGIN
update produtos
set nome = $nome, marca =$marca, descricao = $descricao, qntd =$qntd, valor_unitario = $valor_unitario, valor_venda =$valor_venda, valor_compra = $valor_compra, peso =$peso, lote = $lote, qnt_min_repor =$qnt_min_repor, qnt_max_repor = $qnt_max_repor, gtin =$gtin
where gtin = $gtin;
end $$  

#CALL cad_prod('nome', 'marca', 'desc', 0, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 'gtin'); 
SELECT*FROM produtos;  

CREATE TABLE vendas ( 
id INT NOT NULL primary KEY auto_increment, 
cliente_id INT NOT NULL, produto_id INT NOT NULL, 
adm_id INT NOT NULL, adm VARCHAR(100),  

val_tot DECIMAL(18,2), 
form_pag VARCHAR(50), 
estado VARCHAR(100),  

data_venda DATETIME DEFAULT current_timestamp,  
FOREIGN KEY (cliente_id) REFERENCES clientes(id), 
FOREIGN KEY (adm_id) REFERENCES adms(id), 
FOREIGN KEY (produto_id) REFERENCES produtos(id) 

); 
 
delimiter $$
CREATE PROCEDURE cad_venda (
IN
$cliente_id INT,
$adm_id INT,$adm VARCHAR(100),
$produto_id INT,$val_tot DECIMAL(18,2),
$form_pag VARCHAR(25),$estado VARCHAR(50),
OUT venda_id INT
) BEGIN
INSERT INTO vendas(cliente_id, produto_id, adm_id, adm, val_tot, form_pag, estado)
VALUES ($cliente_id, $produto_id,$adm_id, $adm,$val_tot, $form_pag,$estado);
SET venda_id = last_insert_id();
end $$  

delimiter $$
CREATE PROCEDURE upd_venda (
IN
$cliente_id INT,
$adm_id INT,$adm VARCHAR(100),
$produto_id INT,$val_tot DECIMAL(18,2),
$form_pag VARCHAR(25),$estado VARCHAR(50)
) BEGIN
update vendas
set clientes_id = $clientes_id, adm_id = $adm_id, adm =$adm, produtos_id = $produtos_id, val_tot =$val_tot, form_pag = $form_pag, estado =$estado
where produto_id = $produto_id; 
end $$

#CALL cad_venda(1, 1, 'adm', 1, 0.00, 'forma', 'estado');
SELECT*FROM vendas;

CREATE TABLE item_venda (
id INT NOT NULL PRIMARY KEY auto_increment,
venda_id INT NOT NULL,
produto_id INT NOT NULL,
produto varchar(100),
val_unitario DECIMAL(18,2),
qntd INT,

foreign key (produto_id) REFERENCES produtos(id),
foreign key (venda_id) REFERENCES vendas(id)
);

delimiter $$
CREATE PROCEDURE cad_item_venda (
IN
$produto_id INT,
$venda_id INT,$produto VARCHAR(100),
$quantidade INT,$val_unitario DECIMAL(18,2)
) BEGIN
INSERT INTO item_venda(produto_id, venda_id, produto, quantidade, val_unitario)
VALUES ($produto_id, $venda_id,$produto, $quantidade,$val_unitario);
end $$  delimiter $$
CREATE PROCEDURE upd_item_venda (
IN
$produto_id INT,
$venda_id INT,$produto VARCHAR(100),
$quantidade INT,$val_unitario DECIMAL(18,2)
) BEGIN
update item_venda
set produto_id = $produto_id, venda_id = $venda_id, produto =$produto, quantidade = $quantidade, val_unitario =$val_unitario
where venda_id = $venda_id; end $$

#CALL cad_item_venda(1, 1, 'produto', 0, 0.00);
SELECT*FROM item_venda;

CREATE TABLE mov_estoque (
id INT NOT NULL PRIMARY KEY auto_increment,

id_produto INT NOT NULL,
local_produto VARCHAR(100),
qntd_produto INT,

val_tot_prod DECIMAL(18, 2),
val_tot_venda DECIMAL(18, 2),

data_mov DATETIME DEFAULT current_timestamp,

FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

SELECTFROM adms;
SELECTFROM funcionarios;
SELECTFROM produtos;
SELECTFROM clientes;
SELECT*FROM vendas;

/* fazer - Clilia

compra - fornecedor
venda-cliente
estoque- entrada(compra) i-saida(venda) estoque
100          2          98
27/10 01:11*/