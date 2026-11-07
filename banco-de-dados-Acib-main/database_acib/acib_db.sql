-- ===========================
-- TABELA: cargos
-- ===========================
CREATE TABLE cargos (
    id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

-- ===========================
-- TABELA: permissoes
-- ===========================
CREATE TABLE permissoes (
    id_permissao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

-- ===========================
-- TABELA DE RELAÇÃO: cargo_permissao
-- ===========================
CREATE TABLE cargo_permissao (
    id_cargo INT,
    id_permissao INT,
    PRIMARY KEY (id_cargo, id_permissao),
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo),
    FOREIGN KEY (id_permissao) REFERENCES permissoes(id_permissao)
);

-- ===========================
-- TABELA: usuarios
-- ===========================
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255),
    id_cargo INT,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);

-- ===========================
-- TABELA: financeiro
-- ===========================
CREATE TABLE financeiro (
    id_lancamento INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('entrada','saida'),
    categoria VARCHAR(255),
    descricao VARCHAR(255),
    valor DECIMAL(10,2),
    data_lancamento DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- ===========================
-- TABELA: relatorios
-- ===========================
CREATE TABLE relatorios (
    id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    data_geracao DATETIME,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- ===========================
-- TABELA: associados
-- ===========================
CREATE TABLE associados (
    id_associado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf_cnpj VARCHAR(50),
    tipo ENUM('PF','PJ'),
    endereco VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(50),
    data_entrada DATE,
    valor_mensalidade DECIMAL(10,2),
    situacao ENUM('adimplente','inadimplente')
);

-- ===========================
-- TABELA: pagamentos
-- ===========================
CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_associado INT,
    data_pagamento DATE,
    valor DECIMAL(10,2),
    metodo ENUM('credito','debito','pix','boleto'),
    tipo ENUM('mensalidade','extra'),
    FOREIGN KEY (id_associado) REFERENCES associados(id_associado)
);

-- ===========================
-- TABELA: notificacoes
-- ===========================
CREATE TABLE notificacoes (
    id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
    id_associado INT,
    tipo ENUM('atraso','confirmacao','informativo'),
    mensagem TEXT,
    canal ENUM('email','whatsapp','sms'),
    data_envio DATETIME,
    FOREIGN KEY (id_associado) REFERENCES associados(id_associado)
);


-- Tabela de Materiais
CREATE TABLE IF NOT EXISTS materiais (
  id_material INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL UNIQUE,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Frequências
CREATE TABLE IF NOT EXISTS frequencias (
  id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL UNIQUE,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Armazenamentos (Seções)
CREATE TABLE IF NOT EXISTS armazenamentos (
  id_armazenamento INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL UNIQUE,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Registros de Materiais (Core do sistema de controle)
CREATE TABLE IF NOT EXISTS registros_materiais (
  id_registro INT PRIMARY KEY AUTO_INCREMENT,
  id_material INT NOT NULL,
  volume FLOAT NOT NULL,
  id_armazenamento INT NOT NULL,
  id_frequencia INT NOT NULL,
  data_atualizacao DATE NOT NULL,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_material) REFERENCES materiais(id_material) ON DELETE CASCADE,
  FOREIGN KEY (id_armazenamento) REFERENCES armazenamentos(id_armazenamento) ON DELETE CASCADE,
  FOREIGN KEY (id_frequencia) REFERENCES frequencias(id_frequencia) ON DELETE CASCADE,
  INDEX idx_material (id_material),
  INDEX idx_armazenamento (id_armazenamento),
  INDEX idx_frequencia (id_frequencia)
);

-- Tabela de Configurações Globais
CREATE TABLE IF NOT EXISTS configuracoes (
  id_configuracao INT PRIMARY KEY AUTO_INCREMENT,
  chave VARCHAR(100) NOT NULL UNIQUE,
  valor VARCHAR(255) NOT NULL
);

-- Tabela de Relatórios já existe, vamos alterá-la para incluir novos campos
ALTER TABLE relatorios
ADD categoria ENUM('Mensal', 'Semanal', 'Anual'),
ADD arquivo VARCHAR(255),
ADD caminho_arquivo VARCHAR(500),
ADD data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


-- Dados iniciais - Materiais padrão
INSERT IGNORE INTO materiais (nome) VALUES 
('Papel'),
('Plástico'),
('Vidro'),
('Metal'),
('Papelão');

-- Dados iniciais - Frequências padrão
INSERT IGNORE INTO frequencias (nome) VALUES 
('Diária'),
('Semanal'),
('Mensal'),
('Semestral'),
('Quinzenal');

-- Dados iniciais - Armazenamentos padrão
INSERT IGNORE INTO armazenamentos (nome) VALUES 
('Seção A'),
('Seção B'),
('Seção C'),
('Seção D'),
('Seção E');

-- Dados iniciais - Configurações
INSERT IGNORE INTO configuracoes (chave, valor) VALUES 
('capacidade_total', '10000');


INSERT INTO cargos (nome) VALUES
('Secretaria Executiva'),
('Gerente Financeiro'),
('Assistente Administrativo');

INSERT INTO permissoes (nome) VALUES
('Cadastrar associados'),
('Editar associados'),
('Ver associados'),

('Registrar entradas'),
('Registrar saídas'),
('Ver financeiro'),

('Gerar relatórios avançados'),
('Gerar relatórios básicos'),

('Enviar notificações'),
('Visualizar notificações');



-- SECRETÁRIA
INSERT INTO cargo_permissao VALUES
(1, 1), (1, 2), (1, 3),  -- cadastros
(1, 9), (1, 10);         -- notificações

-- GERENTE FINANCEIRO
INSERT INTO cargo_permissao VALUES
(2, 4), (2, 5), (2, 6),  -- financeiro
(2, 7);                 -- relatórios avançados

-- ASSISTENTE ADMINISTRATIVO
INSERT INTO cargo_permissao VALUES
(3, 3),  -- ver associados
(3, 6),  -- ver financeiro
(3, 8);  -- relatórios básicos