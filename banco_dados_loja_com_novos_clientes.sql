
-- Criar base de dados
CREATE DATABASE LojaDB;
USE LojaDB;

-- Criar tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Criar tabela Produtos
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Criar tabela Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Criar tabela ItensPedido
CREATE TABLE ItensPedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (nome, email) 
VALUES 
('João Silva', 'joao.silva@email.com'),
('Maria Oliveira', 'maria.oliveira@email.com');

-- Inserir dados na tabela Produtos
INSERT INTO Produtos (nome_produto, preco) 
VALUES 
('Notebook', 3500.00),
('Mouse', 50.00),
('Teclado', 100.00);

-- Inserir dados na tabela Pedidos
INSERT INTO Pedidos (id_cliente, data_pedido) 
VALUES 
(1, '2024-10-22'),
(2, '2024-10-23');

-- Inserir dados na tabela ItensPedido
INSERT INTO ItensPedido (id_pedido, id_produto, quantidade) 
VALUES 
(1, 1, 1),  -- João Silva comprou 1 Notebook
(1, 2, 2),  -- João Silva comprou 2 Mouses
(2, 3, 1);  -- Maria Oliveira comprou 1 Teclado

-- Consulta de pedidos e seus respectivos clientes
SELECT p.id_pedido, c.nome, p.data_pedido
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente;

-- Consulta de itens de pedidos com informações dos produtos
SELECT ip.id_pedido, pr.nome_produto, ip.quantidade
FROM ItensPedido ip
JOIN Produtos pr ON ip.id_produto = pr.id_produto;

-- Consulta de todos os dados dos pedidos, clientes e produtos
SELECT c.nome AS Cliente, p.data_pedido, pr.nome_produto, ip.quantidade
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN ItensPedido ip ON p.id_pedido = ip.id_pedido
JOIN Produtos pr ON ip.id_produto = pr.id_produto;

-- Criar tabela NovosClientes
CREATE TABLE NovosClientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Inserir dados na tabela NovosClientes
INSERT INTO NovosClientes (nome, email) 
VALUES 
('Carol Mendes', 'carol.mendes@email.com'),
('Ricardo Alves', 'ricardo.alves@email.com'),
('Luis Pereira', 'luis.pereira@email.com'),
('Vanessa Costa', 'vanessa.costa@email.com');
