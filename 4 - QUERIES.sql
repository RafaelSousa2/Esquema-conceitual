-- -----------------------------------------------------
-- Consultas SQL 
-- -----------------------------------------------------

-- Clientes cadastrados
SELECT * FROM Cliente;

-- Veículos e seus donos
SELECT V.Placa, V.Modelo, C.Nome AS NomeCliente
FROM Veiculo V
JOIN Cliente C ON V.ClienteId = C.IdCliente;

-- Ordens de serviço em andamento
SELECT * FROM OrdemServico WHERE Status = 'Em andamento';

-- Mecânicos especializados em "Freios"
SELECT * FROM Mecanico WHERE Especialidade = 'Freios';

-- Custo total por peça em cada OS
SELECT OSP.OrdemServicoId, P.Nome, OSP.Quantidade, P.PrecoUnitario,
       (OSP.Quantidade * P.PrecoUnitario) AS CustoTotal
FROM OrdemServico_Peca OSP
JOIN Peca P ON OSP.PecaId = P.IdPeca;

-- Serviços ordenados por valor decrescente
SELECT * FROM Servico ORDER BY ValorMaoDeObra DESC;

-- Mecânicos que participaram de mais de uma OS
SELECT M.IdMecanico, M.Nome, COUNT(*) AS TotalOrdens
FROM OrdemServico_Mecanico OSM
JOIN Mecanico M ON OSM.MecanicoId = M.IdMecanico
GROUP BY M.IdMecanico
HAVING COUNT(*) > 1;

-- Detalhamento de ordens com cliente, veículo e serviços
SELECT OS.IdOrdemServico, C.Nome AS Cliente, V.Modelo, S.Descricao AS Servico,
       S.ValorMaoDeObra, M.Nome AS Mecanico
FROM OrdemServico OS
JOIN Veiculo V ON OS.VeiculoId = V.IdVeiculo
JOIN Cliente C ON V.ClienteId = C.IdCliente
JOIN OrdemServico_Servico OSS ON OS.IdOrdemServico = OSS.OrdemServicoId
JOIN Servico S ON OSS.ServicoId = S.IdServico
JOIN Mecanico M ON S.MecanicoId = M.IdMecanico;