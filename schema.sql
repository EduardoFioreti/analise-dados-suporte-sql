-- Projeto de Modelagem de Dados - Eduardo Fioreti
-- Simulação de um banco de dados para gestão de manutenção

-- 1. Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- 2. Tabela de Equipamentos (Experiência técnica aplicada)
CREATE TABLE Equipamentos (
    id_equipamento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    tipo_aparelho VARCHAR(50), -- Ex: Smartphone, Notebook
    marca VARCHAR(50),
    modelo VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 3. Tabela de Ordens de Serviço (Foco em Análise de Dados)
CREATE TABLE Ordens_Servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_equipamento INT,
    data_entrada DATE,
    servico_realizado VARCHAR(255),
    valor_total DECIMAL(10,2),
    status_os VARCHAR(20), -- 'Concluído' ou 'Pendente'
    FOREIGN KEY (id_equipamento) REFERENCES Equipamentos(id_equipamento)
);

-- Query de Exemplo: Calcular faturamento por Marca (Pensamento Analítico)
-- SELECT marca, SUM(valor_total) FROM Equipamentos 
-- JOIN Ordens_Servico ON Equipamentos.id_equipamento = Ordens_Servico.id_equipamento
-- GROUP BY marca;
