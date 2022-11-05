# Qual a media de tempo (em horas) de aluguel de bike por estacao de inicio 31017?
# Media movel
SELECT 
	estacao_inicio,
    AVG(duracao_segundos /60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS media_tempo
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = '31017';

# Media fixa
SELECT estacao_inicio, 
AVG(duracao_segundos /60/60)
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31017
GROUP BY estacao_inicio;