# Qual o percentual da população com pelo menos 1 dose da vacina ao longo do tempo?
# Considere apenas os dados do Brasil

WITH PopvsVac (Continet, location, date, population, new_vaccination, TotalMovelVacinacao) AS 
(
SELECT 
	mortos.continent,
    mortos.location,
    mortos.date,
    mortos.population,
    vacinados.new_vaccinations,
    SUM(CAST(vacinados.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY mortos.location ORDER BY mortos.date) AS TotalMovelVacinacao
FROM cap07.covid_mortes mortos
JOIN cap07.covid_vacinacao vacinados
ON mortos.location = vacinados.location
AND mortos.date = vacinados.date
WHERE mortos.location = 'Brazil'
)
SELECT *,(TotalMovelVacinacao / population) * 100 AS Percentual_1_dose FROM PopvsVac;