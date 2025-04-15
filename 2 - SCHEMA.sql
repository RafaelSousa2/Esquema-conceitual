-- Eliminar o banco de dados se já existir
DROP DATABASE IF EXISTS mecanica;

-- Criar o banco de dados e usá-lo
CREATE DATABASE mecanica;
USE mecanica;

-- Tabela Cliente
CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Telefone VARCHAR(45),
    Email VARCHAR(45),
    Endereco VARCHAR(45)
);

-- Tabela Funcionário
CREATE TABLE Funcionario (
    IdFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Cargo VARCHAR(45),
    Telefone VARCHAR(45),
    Email VARCHAR(45)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    IdVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    ClienteId INT,
    Placa VARCHAR(10) UNIQUE,
    Modelo VARCHAR(45),
    Ano INT,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(IdCliente)
);

-- Tabela Ordem de Serviço
CREATE TABLE OrdemServico (
    IdOrdemServico INT PRIMARY KEY AUTO_INCREMENT,
    DataEmissao DATE NOT NULL,
    DataConclusao DATE,
    Status ENUM('Aguardando', 'Em andamento', 'Concluído') DEFAULT 'Aguardando',
    VeiculoId INT,
    AutorizacaoCliente BOOLEAN,
    FuncionarioId INT,
    FOREIGN KEY (VeiculoId) REFERENCES Veiculo(IdVeiculo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (FuncionarioId) REFERENCES Funcionario(IdFuncionario) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Mecânico
CREATE TABLE Mecanico (
    IdMecanico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45),
    Especialidade VARCHAR(45)
);

-- Tabela Serviço
CREATE TABLE Servico (
    IdServico INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
    ValorMaoDeObra DECIMAL(10,2),
    MecanicoId INT,
    FOREIGN KEY (MecanicoId) REFERENCES Mecanico(IdMecanico) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Equipe
CREATE TABLE Equipe (
    IdEquipe INT PRIMARY KEY AUTO_INCREMENT,
    NomeEquipe VARCHAR(45) NOT NULL
);

-- Tabela de junção Ordem de Serviço e Serviço
CREATE TABLE OrdemServico_Servico (
    OrdemServicoId INT,
    ServicoId INT,
    PRIMARY KEY (OrdemServicoId, ServicoId),
    FOREIGN KEY (OrdemServicoId) REFERENCES OrdemServico(IdOrdemServico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ServicoId) REFERENCES Servico(IdServico) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de junção Ordem de Serviço e Mecânico
CREATE TABLE OrdemServico_Mecanico (
    OrdemServicoId INT,
    VeiculoId INT,
    MecanicoId INT,
    PRIMARY KEY (OrdemServicoId, VeiculoId, MecanicoId),
    FOREIGN KEY (OrdemServicoId) REFERENCES OrdemServico(IdOrdemServico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (VeiculoId) REFERENCES Veiculo(IdVeiculo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MecanicoId) REFERENCES Mecanico(IdMecanico) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Peça
CREATE TABLE Peca (
    IdPeca INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Descricao VARCHAR(45),
    QuantidadeEstoque INT,
    PrecoUnitario DECIMAL(10,2)
);

-- Tabela de junção Ordem de Serviço e Peça
CREATE TABLE OrdemServico_Peca (
    OrdemServicoId INT,
    PecaId INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (OrdemServicoId, PecaId),
    FOREIGN KEY (OrdemServicoId) REFERENCES OrdemServico(IdOrdemServico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PecaId) REFERENCES Peca(IdPeca) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de junção Mecânico e Equipe
CREATE TABLE Mecanico_Equipe (
    MecanicoId INT,
    EquipeId INT,
    PRIMARY KEY (MecanicoId, EquipeId),
    FOREIGN KEY (MecanicoId) REFERENCES Mecanico(IdMecanico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EquipeId) REFERENCES Equipe(IdEquipe) ON DELETE CASCADE ON UPDATE CASCADE
);