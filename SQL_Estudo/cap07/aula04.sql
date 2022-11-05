# Analise Multivariada | Quando analisa considerando o relacionamento entre as variaveis 


# Analise Univariada
SELECT location,
	AVG(total_deaths) AS MediaMortos
FROM cap07.covid_mortes
GROUP BY location
ORDER BY MediaMortos DESC;

SELECT location, # Univariada pq 
	AVG(total_deaths) as MediaMortos,
    AVG(new_cases) as MediaNovosCasos
FROM cap07.covid_mortes
GROUP BY location;

# Qual a proporção de mortes em relação ao total de casos no Brasil?
# Analise Mutivariada
SELECT date,
		location,
        total_cases,
        total_deaths,
        (total_deaths / total_cases) * 100 as Percentual_Mortes
FROM cap07.covid_mortes
WHERE location = "Brazil"
ORDER BY 2,1;
