# NTILE 
SELECT 
	estacao_inicio,
    CAST(data_inicio as date) AS data_inicio,
    duracao_segundos,
    NTILE(2) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_dois,
    NTILE(4) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_quatro,
    NTILE(5) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_cinco
FROM cap06.TB_BIKES
WHERE data_inicio <'2012-01-08'
WINDOW ntile_window AS (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date))
	ORDER BY estacao_inicio;
    