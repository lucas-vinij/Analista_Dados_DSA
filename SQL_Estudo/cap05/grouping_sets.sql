# Modificadores do GROUP BY
# Faturamento total por ano
SELECT 
	CASE
		WHEN ano IS NULL THEN 2023
			ELSE ano
		END AS ano,
SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano WITH ROLLUP
HAVING faturamento > 13000;
