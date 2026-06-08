-- ============================================
-- LOJA DE GAMES — adicionar ao banco sistema_mvc
-- ============================================

USE sistema_mvc;

-- Categorias de jogos
CREATE TABLE IF NOT EXISTS game_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    icone VARCHAR(10) DEFAULT '🎮'
);

-- Jogos
CREATE TABLE IF NOT EXISTS jogos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    slug VARCHAR(160) NOT NULL UNIQUE,
    descricao TEXT,
    descricao_curta VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    preco_promocional DECIMAL(10,2) DEFAULT NULL,
    plataforma VARCHAR(80) DEFAULT 'PC',
    categoria_id INT,
    imagem_url VARCHAR(255) DEFAULT '',
    destaque TINYINT(1) DEFAULT 0,
    ativo TINYINT(1) DEFAULT 1,
    estoque INT DEFAULT 999,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES game_categorias(id) ON DELETE SET NULL
);

-- Carrinho (persistido no banco)
CREATE TABLE IF NOT EXISTS carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    jogo_id INT NOT NULL,
    quantidade INT DEFAULT 1,
    adicionado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_carrinho (usuario_id, jogo_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (jogo_id) REFERENCES jogos(id) ON DELETE CASCADE
);

-- Pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    status ENUM('pendente','pago','cancelado') DEFAULT 'pendente',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Itens do pedido
CREATE TABLE IF NOT EXISTS pedido_itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    jogo_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (jogo_id) REFERENCES jogos(id)
);

-- Dados de exemplo
INSERT INTO game_categorias (nome, slug, icone) VALUES
('Ação', 'acao', '⚔️'),
('RPG', 'rpg', '🧙'),
('Aventura', 'aventura', '🗺️'),
('Esportes', 'esportes', '⚽'),
('Terror', 'terror', '👻'),
('Corrida', 'corrida', '🏎️');

INSERT INTO jogos (nome, slug, descricao_curta, descricao, preco, preco_promocional, plataforma, categoria_id, imagem_url, destaque) VALUES
('CyberStrike 2077', 'cyberstrike-2077', 'FPS futurista em mundo aberto', 'Mergulhe num mundo distópico e cheio de ação. Customize seu personagem, explore a cidade e destrua seus inimigos em combates intensos.', 199.90, 99.90, 'PC / PS5 / Xbox', 1, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co4jni.jpg', 1),
('Dragon Quest Nexus', 'dragon-quest-nexus', 'RPG épico com mundo vasto', 'Uma aventura de RPG com mais de 100 horas de conteúdo, sistema de classes profundo e história envolvente.', 249.90, NULL, 'PC / PS5', 2, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1r77.jpg', 1),
('Shadow Realm', 'shadow-realm', 'Aventura sombria e intensa', 'Explore masmorras sombrias e desvende os segredos de um reino amaldiçoado. Combate frenético e atmosfera única.', 159.90, 79.90, 'PC', 3, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2lbd.jpg', 1),
('Turbo Legends Racing', 'turbo-legends', 'O jogo de corrida mais veloz', 'Carros incríveis, pistas emocionantes e modo online com 32 jogadores simultâneos.', 129.90, NULL, 'PC / Xbox', 6, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3wk8.jpg', 0),
('Dead Frequency', 'dead-frequency', 'Terror psicológico perturbador', 'Um jogo de terror que vai te deixar com o coração na boca. Explore uma mansão assombrada e descubra o que aconteceu.', 89.90, 44.90, 'PC', 5, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1tmu.jpg', 0),
('Galactic Warriors', 'galactic-warriors', 'Batalhas espaciais épicas', 'Comande frotas estelares em batalhas estratégicas pelo controle da galáxia. Modo campanha e multiplayer online.', 179.90, NULL, 'PC', 1, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co4a7f.jpg', 1),
('Legends of Avalon', 'legends-of-avalon', 'RPG medieval com magia', 'Escolha sua classe, monte seu grupo e enfrente dragões em batalhas táticas por turno. O maior RPG da década.', 219.90, 109.90, 'PC / PS5', 2, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2mjs.jpg', 0),
('Street Fury X', 'street-fury-x', 'Luta de rua sem regras', 'O melhor jogo de luta do mercado. 80 personagens, 40 arenas e história envolvente no modo campanha.', 149.90, NULL, 'PC / PS5 / Xbox', 1, 'https://images.igdb.com/igdb/image/upload/t_cover_big/co6cl5.jpg', 0);
