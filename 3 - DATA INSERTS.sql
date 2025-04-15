-- -----------------------------------------------------
-- Inserção de dados para testes
-- -----------------------------------------------------

-- Clientes
INSERT INTO Cliente (Nome, Telefone, Email, Endereco) VALUES
('João da Silva', '11999999999', 'joao@email.com', 'Rua A, 123'),
('Maria Oliveira', '11988888888', 'maria@email.com', 'Rua B, 456');

-- Funcionários
INSERT INTO Funcionario (Nome, Cargo, Telefone, Email) VALUES
('Carlos Mendes', 'Atendente', '11977777777', 'carlos@email.com'),
('Fernanda Lima', 'Gerente', '11966666666', 'fernanda@email.com');

-- Mecânicos
INSERT INTO Mecanico (Nome, Endereco, Especialidade) VALUES
('Pedro Rocha', 'Rua C, 789', 'Motor'),
('Ana Souza', 'Rua D, 321', 'Freios');

-- Equipes
INSERT INTO Equipe (NomeEquipe) VALUES
('Equipe Alfa'),
('Equipe Beta');

-- Associação Mecânico x Equipe
INSERT INTO Mecanico_Equipe (MecanicoId, EquipeId) VALUES
(1, 1),
(2, 2);

-- Veículos
INSERT INTO Veiculo (ClienteId, Placa, Modelo, Ano) VALUES
(1, 'ABC1234', 'Civic', 2018),
(2, 'XYZ9876', 'Corolla', 2020);

-- Ordens de Serviço
INSERT INTO OrdemServico (DataEmissao, DataConclusao, Status, VeiculoId, AutorizacaoCliente, FuncionarioId) VALUES
('2024-04-01', NULL, 'Em andamento', 1, TRUE, 1),
('2024-04-03', '2024-04-05', 'Concluído', 2, TRUE, 2);

-- Serviços
INSERT INTO Servico (Descricao, ValorMaoDeObra, MecanicoId) VALUES
('Troca de óleo', 100.00, 1),
('Reparo no freio', 200.00, 2);

-- OS x Serviço
INSERT INTO OrdemServico_Servico (OrdemServicoId, ServicoId) VALUES
(1, 1),
(2, 2);

-- OS x Mecânico
INSERT INTO OrdemServico_Mecanico (OrdemServicoId, VeiculoId, MecanicoId) VALUES
(1, 1, 1),
(2, 2, 2);

-- Peças
INSERT INTO Peca (Nome, Descricao, QuantidadeEstoque, PrecoUnitario) VALUES
('Filtro de óleo', 'Filtro para motor', 10, 50.00),
('Pastilha de freio', 'Freio dianteiro', 20, 120.00);

-- OS x Peça
INSERT INTO OrdemServico_Peca (OrdemServicoId, PecaId, Quantidade) VALUES
(1, 1, 1),
(2, 2, 2);