-- # LAG e LEAD
SELECT 
	estacao_inicio,
	CAST(data_inicio as date) data_inicio,
    duracao_segundos,
    LAG(duracao_segundos, 2) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS registro_lag,
    LEAD(duracao_segundos, 2) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS registro_lead
FROM cap06.TB_BIKES
WHERE data_inicio <'2012-01-08'
AND numero_estacao_inicio;

# Qual a diferença da duracao do aluguel de bikes ao longo do tempo, de um registro para outro?
SELECT
	estacao_inicio,
	CAST(data_inicio as date) AS data_inicio,
    duracao_segundos, 
    duracao_segundos - LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS diferenca
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# LAG com Subquery
SELECT *
FROM (
	SELECT 
    estacao_inicio,
    CAST(data_inicio as date) AS data_inicio,
    duracao_segundos,
    duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS diferenca
	FROM cap06.TB_BIKES
    WHERE data_inicio < '2012-01-08'
    AND numero_estacao_inicio = 31000) resultado
WHERE resultado.diferenca IS NOT NULL;