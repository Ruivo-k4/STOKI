CREATE DATABASE IF NOT EXISTS stoki_bd;
USE stoki_bd;

CREATE TABLE IF NOT EXISTS adms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    empresa VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tel VARCHAR(20),
    email VARCHAR(150) NOT NULL UNIQUE,
    cnpj VARCHAR(18) UNIQUE,
    cpf VARCHAR(14) UNIQUE,

    data_cad DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    adm_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tel VARCHAR(20),
    data_cad DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (adm_id) REFERENCES adms(id)
);


CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    adm_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tel VARCHAR(20),
    cnpj VARCHAR(18) UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(150),
    cep VARCHAR(9),
    data_cad DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (adm_id) REFERENCES adms(id)
);

CREATE TABLE IF NOT EXISTS fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    adm_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tel VARCHAR(20),
    email VARCHAR(150),
    cnpj VARCHAR(18) UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    cep VARCHAR(9),
    data_cad DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (adm_id) REFERENCES adms(id)
);

CREATE TABLE IF NOT EXISTS insumos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(80),
    descricao VARCHAR(255),
    qntd INT NOT NULL DEFAULT 0,
    valor_compra DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    peso DECIMAL(10,3),
    lote VARCHAR(50),
    qnt_min_repor INT NOT NULL DEFAULT 0,
    qnt_max_repor INT,
    data_cad DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

CREATE TABLE IF NOT EXISTS compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

CREATE TABLE IF NOT EXISTS item_compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    insumo_id INT NOT NULL,
    qntd INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (compra_id) REFERENCES compras(id),
    FOREIGN KEY (insumo_id) REFERENCES insumos(id)
);

CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(80),
    descricao VARCHAR(255),
    qntd INT NOT NULL DEFAULT 0,
    valor_unitario DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    valor_venda DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    valor_compra DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    peso DECIMAL(10,3),
    lote VARCHAR(50),
    qnt_min_repor INT NOT NULL DEFAULT 0,
    qnt_max_repor INT,
    gtin VARCHAR(30) UNIQUE,
    local_produto VARCHAR(100),
    data_cad DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    adm_id INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    forma_pagamento VARCHAR(30),
    estado VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (adm_id) REFERENCES adms(id)
);

CREATE TABLE IF NOT EXISTS item_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    qntd INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE IF NOT EXISTS mov_estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    tipo_mov ENUM('entrada', 'saida', 'ajuste') NOT NULL,
    qntd_produto INT NOT NULL,
    local_produto VARCHAR(100),
    valor_unitario DECIMAL(10,2),
    data_mov DATETIME DEFAULT CURRENT_TIMESTAMP,
    observacao VARCHAR(255),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

DELIMITER $$  CREATE PROCEDURE cad_adm( IN p_nome VARCHAR(100), IN p_empresa VARCHAR(100), IN p_senha VARCHAR(255), IN p_tel VARCHAR(20), IN p_email VARCHAR(150), IN p_cnpj VARCHAR(18), IN p_cpf VARCHAR(14) ) BEGIN INSERT INTO adms (nome, empresa, senha, tel, email, cnpj, cpf) VALUES (p_nome, p_empresa, p_senha, p_tel, p_email, p_cnpj, p_cpf); END $$

CREATE PROCEDURE cad_funcionario(
    IN p_adm_id INT,
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(150),
    IN p_cpf VARCHAR(14),
    IN p_senha VARCHAR(255),
    IN p_tel VARCHAR(20)
)
BEGIN
    INSERT INTO funcionarios (adm_id, nome, email, cpf, senha, tel)
    VALUES (p_adm_id, p_nome, p_email, p_cpf, p_senha, p_tel);
END $$ 

delimiter $$
CREATE PROCEDURE cad_cliente( IN p_adm_id INT, IN p_nome VARCHAR(100), IN p_tel VARCHAR(20), IN p_cnpj VARCHAR(18), IN p_cpf VARCHAR(14), IN p_email VARCHAR(150), IN p_cep VARCHAR(9) ) BEGIN INSERT INTO clientes (adm_id, nome, tel, cnpj, cpf, email, cep) VALUES (p_adm_id, p_nome, p_tel, p_cnpj, p_cpf, p_email, p_cep); END $$

CREATE PROCEDURE cad_fornecedor(
    IN p_adm_id INT,
    IN p_nome VARCHAR(100),
    IN p_tel VARCHAR(20),
    IN p_email VARCHAR(150),
    IN p_cnpj VARCHAR(18),
    IN p_cpf VARCHAR(14),
    IN p_cep VARCHAR(9)
)
BEGIN
    INSERT INTO fornecedores (adm_id, nome, tel, email, cnpj, cpf, cep)
    VALUES (p_adm_id, p_nome, p_tel, p_email, p_cnpj, p_cpf, p_cep);
END $$  CREATE PROCEDURE cad_insumo( IN p_fornecedor_id INT, IN p_nome VARCHAR(100), IN p_marca VARCHAR(80), IN p_descricao VARCHAR(255), IN p_qntd INT, IN p_valor_compra DECIMAL(10,2), IN p_peso DECIMAL(10,3), IN p_lote VARCHAR(50), IN p_qnt_min_repor INT, IN p_qnt_max_repor INT ) BEGIN INSERT INTO insumos (fornecedor_id, nome, marca, descricao, qntd, valor_compra, peso, lote, qnt_min_repor, qnt_max_repor) VALUES (p_fornecedor_id, p_nome, p_marca, p_descricao, p_qntd, p_valor_compra, p_peso, p_lote, p_qnt_min_repor, p_qnt_max_repor); END $$

CREATE PROCEDURE cad_produto(
    IN p_nome VARCHAR(100),
    IN p_marca VARCHAR(80),
    IN p_descricao VARCHAR(255),
    IN p_qntd INT,
    IN p_valor_unitario DECIMAL(10,2),
    IN p_valor_venda DECIMAL(10,2),
    IN p_valor_compra DECIMAL(10,2),
    IN p_peso DECIMAL(10,3),
    IN p_lote VARCHAR(50),
    IN p_qnt_min_repor INT,
    IN p_qnt_max_repor INT,
    IN p_gtin VARCHAR(30),
    IN p_local_produto VARCHAR(100)
)
BEGIN
    INSERT INTO produtos
        (nome, marca, descricao, qntd, valor_unitario, valor_venda, valor_compra, peso, lote, qnt_min_repor, qnt_max_repor, gtin, local_produto)
    VALUES
        (p_nome, p_marca, p_descricao, p_qntd, p_valor_unitario, p_valor_venda, p_valor_compra, p_peso, p_lote, p_qnt_min_repor, p_qnt_max_repor, p_gtin, p_local_produto);
END $$

CREATE PROCEDURE cad_compra(
    IN p_fornecedor_id INT,
    IN p_estado VARCHAR(30)
)
BEGIN
    INSERT INTO compras (fornecedor_id, estado)
    VALUES (p_fornecedor_id, p_estado);
END $$

CREATE PROCEDURE cad_item_compra(
    IN p_compra_id INT,
    IN p_insumo_id INT,
    IN p_qntd INT,
    IN p_valor_unitario DECIMAL(10,2)
)
BEGIN
    INSERT INTO item_compra (compra_id, insumo_id, qntd, valor_unitario, valor_total)
    VALUES (p_compra_id, p_insumo_id, p_qntd, p_valor_unitario, p_qntd * p_valor_unitario);

    UPDATE compras
    SET valor_total = (
        SELECT COALESCE(SUM(valor_total), 0)
        FROM item_compra
        WHERE compra_id = p_compra_id
    )
    WHERE id = p_compra_id;
END $$

CREATE PROCEDURE cad_venda(
    IN p_cliente_id INT,
    IN p_adm_id INT,
    IN p_forma_pagamento VARCHAR(30),
    IN p_estado VARCHAR(30),
    OUT p_venda_id INT
)
BEGIN
    INSERT INTO vendas (cliente_id, adm_id, forma_pagamento, estado)
    VALUES (p_cliente_id, p_adm_id, p_forma_pagamento, p_estado);

    SET p_venda_id = LAST_INSERT_ID();
END $$

CREATE PROCEDURE cad_item_venda(
    IN p_venda_id INT,
    IN p_produto_id INT,
    IN p_qntd INT,
    IN p_valor_unitario DECIMAL(10,2)
)
BEGIN
    INSERT INTO item_venda (venda_id, produto_id, qntd, valor_unitario, valor_total)
    VALUES (p_venda_id, p_produto_id, p_qntd, p_valor_unitario, p_qntd * p_valor_unitario);

    UPDATE vendas
    SET valor_total = (
        SELECT COALESCE(SUM(valor_total), 0)
        FROM item_venda
        WHERE venda_id = p_venda_id
    )
    WHERE id = p_venda_id;
END $$

CREATE PROCEDURE registrar_mov_estoque(
    IN p_produto_id INT,
    IN p_tipo_mov VARCHAR(10),
    IN p_qntd INT,
    IN p_local_produto VARCHAR(100),
    IN p_valor_unitario DECIMAL(10,2),
    IN p_observacao VARCHAR(255)
)
BEGIN
    DECLARE v_qntd_atual INT DEFAULT 0;

    IF p_qntd < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quantidade nao pode ser negativa.';
    END IF;

    SELECT qntd INTO v_qntd_atual
    FROM produtos
    WHERE id = p_produto_id;

    IF p_tipo_mov = 'entrada' THEN
        UPDATE produtos
        SET qntd = qntd + p_qntd,
            local_produto = COALESCE(p_local_produto, local_produto)
        WHERE id = p_produto_id;

    ELSEIF p_tipo_mov = 'saida' THEN
        IF p_qntd > v_qntd_atual THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Estoque insuficiente para essa saida.';
        END IF;

        UPDATE produtos
        SET qntd = qntd - p_qntd,
            local_produto = COALESCE(p_local_produto, local_produto)
        WHERE id = p_produto_id;

    ELSEIF p_tipo_mov = 'ajuste' THEN
        UPDATE produtos
        SET qntd = p_qntd,
            local_produto = COALESCE(p_local_produto, local_produto)
        WHERE id = p_produto_id;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo invalido: use entrada, saida ou ajuste.';
    END IF;

    INSERT INTO mov_estoque
        (produto_id, tipo_mov, qntd_produto, local_produto, valor_unitario, observacao)
    VALUES
        (p_produto_id, p_tipo_mov, p_qntd, p_local_produto, p_valor_unitario, p_observacao);
END $$

DELIMITER ;

SELECT * FROM adms;
SELECT * FROM funcionarios;
SELECT * FROM clientes;
SELECT * FROM fornecedores;
SELECT * FROM insumos;
SELECT * FROM compras;
SELECT * FROM item_compra;
SELECT * FROM produtos;
SELECT * FROM vendas;
SELECT * FROM item_venda;
SELECT * FROM mov_estoque;