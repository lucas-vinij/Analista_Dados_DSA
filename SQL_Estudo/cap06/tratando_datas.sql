# Tratando datas 

# Extraindo items especificos da data
SELECT 
	data_inicio,
    DATE(data_inicio),
    TIMESTAMP(data_inicio),
    YEAR(data_inicio),
    MONTH(data_inicio),
    DAY(data_inicio)
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Extraindo o mes da data
SELECT 
	EXTRACT(MONTH FROM data_inicio) AS mes,
	MONTH(data_inicio),
    duracao_segundos
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Diferença entre data_inicio e data_fim 
SELECT data_inicio, data_fim, DATEDIFF(data_inicio, data_fim)
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Adicionando 10 dia à data de inicio
SELECT data_inicio, DATE_ADD(data_inicio, INTERVAL 10 DAY) AS data_inicio, duracao_segundos
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Retornando dados de 10 dias anteriores a data inicio do aluguel da bike
SELECT data_inicio, duracao_segundos
FROM cap06.TB_BIKES
WHERE DATE_SUB("2012-03-31", INTERVAL 10 DAY) <= data_inicio
AND numero_estacao_inicio = 31000;

# Diferenca entre data_inicio e data_fim
SELECT 
	DATE_FORMAT(data_inicio, "%H") AS hora_inicio,
	DATE_FORMAT(data_fim, "%H") AS hora_fim,
    (DATE_FORMAT(data_fim, "%H") - DATE_FORMAT(data_inicio, "%H")) AS diff
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;