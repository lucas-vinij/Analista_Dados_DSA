# ANALISE DE NEGOCIOS PROFESSOR 
# 1. Quais poluentes foram considerados na pesquisa?
SELECT DISTINCT pollutant FROM des.TB_POLUICAO;

# 2. Qual foi a media de poluicao ao longo do tempo provocada pelo poluente ground-level ozone (o3)?
SELECT 
		country, pollutant,
		ROUND(AVG(CAST(value AS UNSIGNED)) OVER (PARTITION BY country ORDER BY CAST(timestamp AS DATE)),2) AS MEDIA_POLUICAO,
        CAST(timestamp as DATE) AS data
FROM des.TB_POLUICAO
WHERE pollutant = 'o3'
ORDER BY country, data;


# 3. Qual foi a media de poluicao causada pelo poluente o3 por pais medida em ug/3?
SELECT 	pollutant,
		AVG(CAST(value as UNSIGNED)) AS media_poluicao,
        country,
        unit
FROM des.TB_POLUICAO
WHERE unit = 'µg/m³' AND pollutant = 'o3'
GROUP BY pollutant, country, unit
ORDER BY media_poluicao;

# 4. Considerando o resultado anterior, qual o pais teve maior indice de poluicao geral por o3, Italia ou Espanha? 
SELECT 	country AS Pais, 
		ROUND(AVG(value),2) AS media_poluicao,
        STDDEV(value) AS desvio_padrao,
        MAX(value) AS valor_maximo,
        MIN(value) AS valor_minimo
FROM des.TB_POLUICAO
WHERE pollutant = 'o3'
AND unit = 'µg/m³'
AND country IN ('IT', 'ES')
GROUP BY country
ORDER BY media_poluicao ASC;

# O coeficiente de variacao (CV) é uma medida estatistica da dispersao dos dados
# em uma serie de dados em torno da media, O coeficiente de variação representa
# a razao entre o desvio padrao e a media e é uma estatistica ú til para comparar o grau
# de variacao de uma serie de dados para outra, mesmo que as medias sejam drasticamente
# diferentes umas das outras.
#
# Quanto maior o coeficiente de variacao, maior o nivel de dispersao em torno
# da media, logo, maior variabilidade.
#
# O coeficiente de variacao é calculado da seguinte forma; CV = (Desvio Padrao / Media) * 100
SELECT 	country AS Pais, 
		ROUND(AVG(value),2) AS media_poluicao,
        STDDEV(value) AS desvio_padrao,
        MAX(value) AS valor_maximo,
        MIN(value) AS valor_minimo,
        (STDDEV(value) / ROUND(AVG(value),2)) * 100 AS cv
FROM des.TB_POLUICAO
WHERE pollutant = 'o3'
AND unit = 'µg/m³'
AND country IN ('IT', 'ES')
GROUP BY country
ORDER BY media_poluicao ASC;

# Conclusão: Embora o CV da Espanha seja muito maior, a média da Italia é muito
# alta, com os pontos de dados mais proximos da media
# Os 2 paises tem um alto indice de poluicao geral por o3
# A Italia apresenta maior indice de poluicao geral, pos a média é alta
# e os pontos de dados estão mais proximos da media






# 5. Quais localidades e paises tiveram media de poluicao em 2020 superior 100 ug/3 para o poluente pm25
# Meu resultado 
WITH tempTP (location, country, mediaPoluicao, pollutant, ANO, unit) AS 
(
SELECT 	location, country,
		AVG(CAST(value as UNSIGNED)) AS mediaPoluicao,
        pollutant,
        DATE_FORMAT(timestamp, "%Y") AS ANO,
        unit
FROM des.TB_POLUICAO
GROUP BY location, country, ANO, pollutant, unit
HAVING ANO = 2020 AND mediaPoluicao > 100)
SELECT * FROM tempTP WHERE pollutant = 'pm25' AND unit = 'µg/m³' ORDER BY location,country;

# Professor 
SELECT 	COALESCE(location, "Total") AS localidade,
		COALESCE(country, "Total") AS pais,
        ROUND(AVG(value),2) AS media_poluicao
FROM des.TB_POLUICAO
WHERE pollutant = 'pm25'
AND YEAR(timestamp) = 2020
GROUP BY location, country WITH ROLLUP
HAVING media_poluicao > 100
ORDER BY location, country;