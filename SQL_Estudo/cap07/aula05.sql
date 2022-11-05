# Quais os paises com o maior número de mortes?
# Convertendo valor TEXT em NUMERICO
SELECT location,
		MAX(total_deaths * 1) as total_mortes 
FROM cap07.covid_mortes
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_mortes DESC;

# Convertendo usando CAST
SELECT location,
		MAX(CAST(total_deaths AS UNSIGNED)) AS Maior_Contagem_Mortes
FROM cap07.covid_mortes
WHERE continent IS NOT NULL
GROUP BY location 
ORDER BY Maior_Contagem_Mortes DESC;

