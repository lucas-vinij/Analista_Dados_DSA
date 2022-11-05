# Exercicios Corrigidos
SELECT * FROM cap06.TB_BIKES2;

SELECT 
	CASE 
		WHEN tipo_membro = 'Unknown' THEN 'Desconhecido'
        ELSE tipo_membro
	END as tipo_membro,
    AVG(duracao_segundos) AS media
FROM cap06.TB_BIKES2
GROUP BY tipo_membro;

SELECT 
	tipo_membro,
	estacao_fim,
    AVG(duracao_segundos) AS media
FROM cap06.TB_BIKES2
GROUP BY tipo_membro, estacao_fim;

SELECT 
	tipo_membro,
    estacao_fim,
	AVG(duracao_segundos) OVER (PARTITION BY tipo_membro, estacao_fim ORDER BY data_inicio) AS MEDIA
FROM cap06.TB_BIKES2;

SELECT 
	numero_bike,
    DATE_FORMAT(data_inicio, "%T") as Data,
    ROW_NUMBER () OVER (PARTITION BY numero_bike ORDER BY data_inicio) as pedidos
FROM cap06.TB_BIKES2
WHERE numero_bike = 'W01182'
ORDER BY pedidos DESC
LIMIT 1;

SELECT 
	estacao_fim, 
	data_fim,
    duracao_segundos,
    DENSE_RANK() OVER (ORDER BY data_inicio) as Alugueis
FROM cap06.TB_BIKES2
WHERE DATE_FORMAT(data_fim, "%m") = 4;

#9
SELECT 
	estacao_fim,
    data_fim,
	duracao_segundos,
    DATE_FORMAT(data_fim, "%d/%M/%y %T") as Data_total,
	NTILE(4) OVER (ORDER BY data_fim) as grupos
FROM cap06.TB_BIKES2
WHERE DATE_FORMAT(data_fim, "%T") > '08:00:00'
AND DATE_FORMAT(data_fim, "%T") < '10:00:00'
ORDER BY Data_total;

#10


    
