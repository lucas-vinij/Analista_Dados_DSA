# Duracao total do aluguel das bikes (horas)
-- SELECT * FROM cap06.TB_BIKES;
-- SELECT 
--     SUM(duracao_segundos / 3600) OVER ()
-- FROM cap06.TB_BIKES;

# Duracao total do aluguel das bikes (em horas), ao longo do tempo
-- SELECT 
-- 	duracao_segundos,
--     SUM(duracao_segundos / 3600) OVER (ORDER BY data_inicio) AS duracao_total_horas
-- FROM cap06.TB_BIKES;

# Duracao total do aluguel das bikes (em horas), ao longo do
# tempo, por estacao do alugel da bike, quando a data inicio
# for inferior a '2012-01-08'
SELECT 
	estacao_inicio,
    duracao_segundos,
    SUM(duracao_segundos / 3600) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS tempo_total_horas
FROM cap06.TB_BIKES
WHERE data_inicio <'2012-01-08'