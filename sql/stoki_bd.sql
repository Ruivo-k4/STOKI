CREATE DATABASE stoki_bd;
USE stoki_bd;

CREATE TABLE adms(
id INT NOT NULL PRIMARY KEY auto_increment,

nome VARCHAR(100) NOT NULL,
empresa VARCHAR(100) NOT NULL,

email VARCHAR(100) NOT NULL UNIQUE,
cnpj VARCHAR(18) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,
nib VARCHAR(11) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp
);

CREATE TABLE funcionarios (
id INT NOT NULL primary KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,

email VARCHAR(100) NOT NULL UNIQUE,
cpf VARCHAR(14) NOT NULL UNIQUE,

data_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE produtos (
id INT NOT NULL PRIMARY KEY auto_increment,
adms_id INT NOT NULL,

nome VARCHAR(100) NOT NULL,
qntd INT NOT NULL,
valor_unitario FLOAT NOT NULL,
valor_venda FLOAT NOT NULL,
valor_compra FLOAT NOT NULL,
peso FLOAT NOT NULL,
marca VARCHAR(100) NOT NULL,
lote INT NOT NULL UNIQUE,

gtin VARCHAR(14) NOT NULL UNIQUE,

date_cad DATETIME DEFAULT current_timestamp,

foreign key (adms_id) REFERENCES adms(id)
);

CREATE TABLE cliente (
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
produto_id INT NOT NULL,

valor FLOAT NOT NULL,

data_venda DATETIME DEFAULT current_timestamp,

FOREIGN KEY (cliente_id) REFERENCES cliente(id),
FOREIGN KEY (adm_id) REFERENCES adms(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

SELECT*FROM adms;
SELECT*FROM funcionarios;
SELECT*FROM produtos;
SELECT*FROM cliente;
SELECT*FROM vendas;