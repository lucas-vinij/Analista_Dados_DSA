# Exercicios corrigidos
#1
SELECT * FROM cap06.TB_BIKES2;

SELECT 
	tipo_membro,
	AVG(duracao_segundos) AS Media
FROM cap06.TB_BIKES2
GROUP BY tipo_membro;

#2
SELECT 
	tipo_membro,
    estacao_fim,
	AVG(duracao_segundos)
FROM cap06.TB_BIKES2
GROUP BY tipo_membro, estacao_fim;

#3
#minha solucao
SELECT 
	numero_bike,
	DATE_FORMAT(data_inicio, "%H") as Data_inicio,
	ROW_NUMBER() OVER (PARTITION BY numero_bike ORDER BY Data_inicio) as Alugueis
FROM cap06.TB_BIKES2
WHERE numero_bike = 'W01182'
ORDER BY Alugueis DESC;

#professor
SELECT 
	EXTRACT(HOUR FROM data_inicio) AS hora,
	COUNT(duracao_segundos) AS num_alugueis
FROM cap06.TB_BIKES2
WHERE numero_bike = 'W01182'
GROUP BY hora
ORDER BY num_alugueis DESC;

# 4
SELECT 
	tipo_membro,
    estacao_fim,
	AVG(duracao_segundos) OVER (PARTITION BY tipo_membro ORDER BY CAST(data_inicio) AS media
FROM cap06.TB_BIKES2;

# 5
SELECT 
	numero_bike,
    CAST(data_inicio as date) AS data_inicio,
	COUNT(duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS Alugueis
FROM cap06.TB_BIKES2
WHERE numero_bike = 'W01182';

# 6
# MINHA 
SELECT 
	estacao_fim,
    data_fim,
    duracao_segundos,
    COUNT(duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS Alugueis
FROM cap06.TB_BIKES2
WHERE DATE_FORMAT(data_inicio, '%m') = 4;

# PROFESSOR
SELECT 
	estacao_fim,
	data_fim,
    duracao_segundos,
	COUNT(duracao_segundos) OVER (ORDER BY data_fim) AS numero_alugueis
FROM cap06.TB_BIKES2
WHERE EXTRACT(MONTH FROM data_fim) = 04;

# 7 
SELECT 
	estacao_fim,
    data_fim,
    duracao_segundos,
    DATE_FORMAT(data_fim, "%d/%M/%Y %H:%i:%S") AS data_editada,
    DENSE_RANK () OVER (PARTITION BY estacao_fim ORDER BY data_fim) AS ordem
FROM cap06.TB_BIKES2
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 07 AND 11;

# 8
# MINHA 
SELECT 
	DATE_FORMAT(data_inicio, "%D/%M/%Y %T") AS data_inicio,
    COUNT(duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY data_fim) as alugueis
FROM cap06.TB_BIKES2
WHERE EXTRACT(HOUR FROM data_inicio) BETWEEN 01 AND 03;

# PROFESSOR 
 SELECT 
	DATE_FORMAT(data_inicio, "%a/%y %H:%i:%S") AS data_inicio,
    duracao_segundos,
    duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS diferenca
FROM cap06.TB_BIKES2
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 01 AND 03;

# 9
SELECT 
	estacao_fim,
    data_fim,
    duracao_segundos,
    DATE_FORMAT(data_fim, "%d/%M%Y %T") Data_fim,
	NTILE(4) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) as Particao
FROM cap06.TB_BIKES2
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 8 AND 10;

# 10
SELECT * 
FROM 
(SELECT 
	estacao_fim,
	CAST(data_fim as date) AS data_fim,
    SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) AS tempo_total_horas
FROM cap06.TB_BIKES2
WHERE data_fim BETWEEN '2012-04-01' AND '2012-04-02') resultado
WHERE resultado.tempo_total_horas > 35
ORDER BY resultado.estacao_fim;
 
	
