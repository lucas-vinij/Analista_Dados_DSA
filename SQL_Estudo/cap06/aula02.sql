# NTILE
# é funcao de janela que distribui linhas de uma particao ordenada em um numero em um numero predefinido
# de grupos aproximadamente iguais. A funcao atribui a cada grupo um numero a partir de 1.
SELECT
	estacao_inicio,
    CAST(duracao_segundos as date) AS data_inicio,
    ROW_NUMBER () OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_alugueis,
    NTILE(2) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_dois,
	NTILE(4) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_quatro,
	NTILE(5) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_cinco,
	NTILE(16) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_dezesseis
FROM cap06.TB_BIKES
WHERE data_inicio <'2012-01-08'
AND numero_estacao_inicio = 31000;