# Qual o numero de novos vacinados e a media movel de novos vacinados ao longo do tempo por localicade?
# Considere apenas os dados da América do Sul

SELECT mortos.continent,
		mortos.location,
        mortos.date,
        vacinados.new_vaccinations,
        AVG(CAST(vacinados.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY mortos.location ORDER BY mortos.date) as MediaMovelVacinados
FROM cap07.covid_mortes mortos
JOIN cap07.covid_vacinacao vacinados
ON mortos.location = vacinados.location
AND mortos.date = vacinados.date
WHERE mortos.continent = 'South America'
ORDER BY 2,3;
