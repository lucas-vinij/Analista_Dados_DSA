# Retornar:
#Estacao de inicio, data de inicio de cada aluguel de bike e duracao de cada aluguel em segundos
#Numero de alugueis de bikes (independente da estacao) ao longo do tempo
#Somente os registros quando a data de inicio for inferior a '2012-01-08'

# Solucao 1
SELECT 
	estacao_inicio,
    data_inicio,
    duracao_segundos,
	COUNT(*) OVER (ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';

# Solucao 2
SELECT 
	estacao_inicio,
	data_inicio,
    duracao_segundos,
    ROW_NUMBER () OVER (ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';

# E se quisermos o mesmo resultado anterior, mas a contagem por estaca?
SELECT 
	estacao_inicio,
    data_inicio,
    duracao_segundos,
    ROW_NUMBER () OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS numeros_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';
