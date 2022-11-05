SELECT date,
	   location,
       total_cases,
       new_cases,
       total_deaths,
       population
FROM cap07.covid_mortes
ORDER BY 2,1;


# Analise Univariada | Quando você analisar uma unica variavel
# Qual a media de mortos por pais?
SELECT location,
		AVG(total_deaths) AS MediaMortos
FROM cap07.covid_mortes
GROUP BY location
ORDER BY MediaMortos DESC;




