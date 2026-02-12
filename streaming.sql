-- CRIANDO O BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS streaming;

-- USANDO O BANCO DE DADOS
USE streaming;

-- CRIANDO A TABELA DE USUÁRIO
CREATE TABLE IF NOT EXISTS usuario(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE
);

-- CRIANDO A TABELA DE PLANOS
CREATE TABLE IF NOT EXISTS planos(
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(100) NOT NULL,
    valor_mensal DECIMAL(10, 2) NOT NULL
); 

-- CRIANDO A TABELA DE CONTEÚDO
CREATE TABLE IF NOT EXISTS conteudo(
    id_conteudo INT AUTO_INCREMENT PRIMARY KEY,
    titulo_conteudo VARCHAR(100) NOT NULL,
    tipo_conteudo VARCHAR(100) NOT NULL,
    duracao INT
);

-- CRIANDO A TABELA DE ASSINATURA
CREATE TABLE IF NOT EXISTS assinatura(
    id_assinatura INT AUTO_INCREMENT PRIMARY KEY,
    usuario_assinante INT,
    plano_escolhido INT,
    data_inicio DATE,
    data_fim DATE NULL,
    Foreign Key (usuario_assinante) REFERENCES usuario(id_usuario),
    Foreign Key (plano_escolhido) REFERENCES planos(id_plano)
);

-- CRIANDO A TABELA DE VISUALIZAÇÃO
CREATE TABLE IF NOT EXISTS visualizacao(
	id_visualizacao INT AUTO_INCREMENT PRIMARY KEY,
    usuario_assistiu INT,
    conteudo_assistiu INT,
    data_visualizacao DATE NULL,
    progresso_assistido INT,
    FOREIGN KEY (usuario_assistiu) REFERENCES usuario(id_usuario),
    FOREIGN KEY (conteudo_assistiu) REFERENCES conteudo(id_conteudo)
);

-- INSERÇÃO DE DADOS
INSERT IGNORE INTO planos (nome_plano, valor_mensal) VALUES ('Netflix', '90.00'), ('Amazon Prime', '70.00');
INSERT IGNORE INTO conteudo (titulo_conteudo, tipo_conteudo, duracao) VALUES ('Ainda estou aqui', 'Filme', '2:02:00'), ('Agente Secreto', 'Filme', '2:10:00'),
                                                                             ('Central do Brasil', 'Filme', '2:30:10');
INSERT IGNORE INTO usuario (nome_usuario, email_usuario, data_cadastro) VALUES ('Arthur', 'email1@gmail.com', '2026-02-11'), ('Jorge', 'email2@gmail.com', '2026-02-12');
INSERT IGNORE INTO assinatura (usuario_assinante, plano_escolhido, data_inicio, data_fim) VALUES (1, 1, '2026-02-11', '2026-03-11'), (2, 2, '2026-02-12', '2026-03-12');
INSERT IGNORE INTO visualizacao (usuario_assistiu, conteudo_assistiu, data_visualizacao, progresso_assistido) VALUES (1, 1, '2026-02-15', '1:30:10'), (2, 2, '2026-03-09', '59:00:00');

SELECT
    usuario.nome_usuario,
    planos.nome_plano,
    conteudo.titulo_conteudo,
    conteudo.tipo_conteudo,
    visualizacao.data_visualizacao
FROM visualizacao
JOIN usuario ON usuario.id_usuario = visualizacao.usuario_assistiu
JOIN conteudo ON conteudo.id_conteudo = visualizacao.conteudo_assistiu
JOIN assinatura ON assinatura.usuario_assinante = usuario.id_usuario
JOIN planos ON planos.id_plano = assinatura.plano_escolhido;