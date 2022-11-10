# Desafio Durante o mês de MAIO/2021 o percentual de 
# vacinados com pelo menos uma dose aumentou ou diminuiu 
# no Brasil? 
CREATE OR REPLACE VIEW cap07.PercentualPopVac AS 
WITH PopvsVac (continent, location, date, population, new_vaccinations, TotalMovelVacinacao) AS 
(
SELECT 	mortos.continent,
		mortos.location,
        mortos.date,
        mortos.population,
        vacinados.new_vaccinations,
        SUM(CAST(vacinados.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY mortos.location  ORDER BY mortos.date) AS TotalMovelVacinacao
FROM cap07.covid_mortes mortos
JOIN cap07.covid_vacinacao vacinados 
ON mortos.location = vacinados.location
AND mortos.date = vacinados.date
WHERE mortos.location = 'Brazil'
)
SELECT *, (TotalMovelVacinacao / population) * 100 AS Percentual_1_Dose
FROM PopvsVac
WHERE DATE_FORMAT(date, "%M/%Y") = "May/2021"
AND location = 'Brazil';