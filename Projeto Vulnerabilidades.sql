--View com detalhes das vulnerabilidades
CREATE VIEW vw_VulnerabilidadesDetalhadas AS
SELECT
    v.ID_Vulnerabilidade,
    v.ID_Ativo,
    a.Nome_Ativo,
    a.Tipo,
    a.Localização,
    a.Responsável,
    v.Severidade,
    v.Data_Detectada,
    v.Status_Correção
FROM Vulnerabilidades v
JOIN Ativos a ON v.ID_Ativo = a.ID_Ativo;

--View com total de vulnerabilidades por ativo
CREATE VIEW vw_VulnerabilidadesPorAtivo AS
SELECT 
    v.ID_Ativo,
    a.Nome_Ativo,
    COUNT(v.ID_Vulnerabilidade) AS Total_Vulnerabilidades,
    SUM(CASE WHEN v.Status_Correção = 'Corrigida' THEN 1 ELSE 0 END) AS Corrigidas,
    SUM(CASE WHEN v.Status_Correção != 'Corrigida' THEN 1 ELSE 0 END) AS Nao_Corrigidas
FROM Vulnerabilidades v
JOIN Ativos a ON v.ID_Ativo = a.ID_Ativo
GROUP BY v.ID_Ativo, a.Nome_Ativo;

--View para medir o tempo de correção (quando há patch)
CREATE VIEW vw_TempoDeCorrecao AS
SELECT 
    v.ID_Vulnerabilidade,
    v.ID_Ativo,
    v.Data_Detectada,
    MIN(p.Data_Aplicação) AS Data_Primeiro_Patch,
    DATEDIFF(DAY, v.Data_Detectada, MIN(p.Data_Aplicação)) AS Dias_Para_Correcao
FROM Vulnerabilidades v
JOIN Patches p ON v.ID_Ativo = p.ID_Ativo
GROUP BY v.ID_Vulnerabilidade, v.ID_Ativo, v.Data_Detectada;



--Quantidade de vulnerabilidades por severidade:
SELECT Severidade, COUNT(*) AS Qtde
FROM Vulnerabilidades
GROUP BY Severidade;

--Ativos com mais vulnerabilidades:
SELECT TOP 10 ID_Ativo, COUNT(*) AS Qtde
FROM Vulnerabilidades
GROUP BY ID_Ativo
ORDER BY Qtde DESC;

--Eficiência dos patches:
SELECT Resultado, COUNT(*) AS Qtde
FROM Patches
GROUP BY Resultado;

