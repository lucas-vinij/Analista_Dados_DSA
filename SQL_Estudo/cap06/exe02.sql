# Retornar:
# Estacao de inicio, data de inicio e duracao de cada aluguel de bike em segundos.
# Duracao total de aluguel das bikes ao longo do tempo por estação de inicio. 
# Duracao media do aluguel de bikes ao longo do tempo por estacao de inicio.
#  Numero de alugueis de bike por estacao ao longo do tempo. 
# Somente os registros quando a data de inicio for inferior a '2012-01-08'


SELECT 
	estacao_inicio, data_inicio, duracao_segundos,
    SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio)AS soma_total,
    AVG(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio)AS Media_total,
    COUNT(*) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio)AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';