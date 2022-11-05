# Qual o numero de novos vacinados e o total de novos vacinados ao longo do tempo por continente?
# Considere apenas os dados da America do Sul
SELECT 	vacinados.continent, 
		vacinados.date,
		CAST(vacinados.new_vaccinations AS unsigned) as novos_vacinados,
		SUM(CAST(vacinados.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY continent ORDER BY date) AS MediaMovelTotalVacinados 
FROM cap07.covid_vacinacao vacinados
WHERE continent = 'South America';


# Qual o numero de novos vacinados e o total de novos vacinados ao longo do tempo por continente?
# Considere apenas os dados da America do Sul
# Considere a data no formato January/2020
SELECT 
	vacinados.continent,
    DATE_FORMAT(vacinados.date, "%Y") as date,
	CAST(vacinados.new_vaccinations AS UNSIGNED) as novos_vacinados,
    SUM(CAST(vacinados.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY vacinados.continent ORDER BY DATE_FORMAT(date, "%Y")) as MediaMovelVacinados
FROM cap07.covid_vacinacao vacinados
WHERE location = 'South America'
ORDER BY 1,2;



