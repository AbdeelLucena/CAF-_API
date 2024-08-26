-- Remover as tabelas, se já existirem
DROP TABLE IF EXISTS tb_produto;
DROP TABLE IF EXISTS tb_categoria;
DROP TABLE IF EXISTS tb_setor;
DROP TABLE IF EXISTS tb_usuario;

-- Criar tabela de usuários
CREATE TABLE tb_usuario (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    nascimento DATE NOT NULL,
    created_at DATE DEFAULT CURRENT_TIMESTAMP,
    deleted_at DATE
);

-- Criar tabela de categorias
CREATE TABLE tb_categoria (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

-- Criar tabela de setores
CREATE TABLE tb_setor (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

-- Criar tabela de produtos
CREATE TABLE tb_produto (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    categoria_id INTEGER NOT NULL,
    setor_id INTEGER NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id),
    CONSTRAINT fk_setor FOREIGN KEY (setor_id) REFERENCES tb_setor(id)
);

-- Inserir dados na tabela de usuários
INSERT INTO tb_usuario (nome, nascimento)
VALUES ('Administrador', '2024-07-23');
