--insertes para teste nos arquivos cli, nenhum deles é o dado de uma pessoa real

-- ===========================
-- USUÁRIOS
-- ===========================
INSERT INTO usuarios (nome, email, senha, id_cargo) VALUES
('Ana Souza', 'ana@acib.com', '123456', 1),
('Carlos Lima', 'carlos@acib.com', '123456', 2),
('Mariana Alves', 'mariana@acib.com', '123456', 3);

-- ===========================
-- ASSOCIADOS
-- ===========================
INSERT INTO associados 
(nome, cpf_cnpj, tipo, endereco, email, telefone, data_entrada, valor_mensalidade, situacao) VALUES
('João Pereira', '123.456.789-00', 'PF', 'Rua A, 100', 'joao@email.com', '11999999999', '2024-01-10', 150.00, 'adimplente'),
('Empresa Alpha LTDA', '12.345.678/0001-90', 'PJ', 'Av. Central, 500', 'contato@alpha.com', '1133334444', '2023-11-01', 500.00, 'adimplente'),
('Maria Oliveira', '987.654.321-00', 'PF', 'Rua B, 45', 'maria@email.com', '1188887777', '2024-02-05', 150.00, 'inadimplente');

-- ===========================
-- PAGAMENTOS
-- ===========================
INSERT INTO pagamentos 
(id_associado, data_pagamento, valor, metodo, tipo) VALUES
(1, '2024-03-10', 150.00, 'pix', 'mensalidade'),
(2, '2024-03-05', 500.00, 'boleto', 'mensalidade'),
(1, '2024-04-10', 150.00, 'credito', 'mensalidade');

-- ===========================
-- NOTIFICAÇÕES
-- ===========================
INSERT INTO notificacoes 
(id_associado, tipo, mensagem, canal, data_envio) VALUES
(3, 'atraso', 'Sua mensalidade está em atraso.', 'email', NOW()),
(1, 'confirmacao', 'Pagamento recebido com sucesso.', 'whatsapp', NOW()),
(2, 'informativo', 'Novo evento disponível para associados.', 'email', NOW());

-- ===========================
-- FINANCEIRO
-- ===========================
INSERT INTO financeiro 
(tipo, categoria, descricao, valor, data_lancamento, id_usuario) VALUES
('entrada', 'Mensalidade', 'Pagamento João Pereira', 150.00, '2024-03-10', 2),
('entrada', 'Mensalidade', 'Pagamento Empresa Alpha', 500.00, '2024-03-05', 2),
('saida', 'Despesas', 'Compra de materiais de escritório', 200.00, '2024-03-15', 2);

-- ===========================
-- RELATÓRIOS
-- ===========================
INSERT INTO relatorios 
(tipo, categoria, arquivo, caminho_arquivo, data_geracao, id_usuario) VALUES
('Financeiro', 'Mensal', 'financeiro_marco.pdf', '/relatorios/2024/financeiro_marco.pdf', NOW(), 2),
('Associados', 'Anual', 'associados_2024.pdf', '/relatorios/2024/associados_2024.pdf', NOW(), 1);

-- ===========================
-- REGISTROS DE MATERIAIS
-- ===========================
INSERT INTO registros_materiais 
(id_material, volume, id_armazenamento, id_frequencia, data_atualizacao) VALUES
(1, 120.5, 1, 2, '2024-03-01'),
(2, 300.0, 2, 3, '2024-03-05'),
(3, 75.2, 3, 1, '2024-03-10'),
(4, 180.0, 4, 4, '2024-03-12'),
(5, 220.8, 5, 5, '2024-03-15');

