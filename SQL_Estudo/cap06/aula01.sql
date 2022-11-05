# Estacao, data de inicio, duracao em segundos do aluguel e numero de alugueis ao longo do tempo
SELECT 
	estacao_inicio,
	CAST(data_inicio as date) AS data_inicio,
    duracao_segundos,
    ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis,
    DENSE_RANK() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis,
    RANK() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis
    
    
    FROM cap06.TB_BIKES
    WHERE data_inicio <'2012-01-08'
    AND numero_estacao_inicio = 31000;

