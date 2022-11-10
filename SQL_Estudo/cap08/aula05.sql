# Identificando os registros duplicados (e retornando uma linha para duplicidade)

SELECT PdId, Category, COUNT(*) AS vezes 
FROM cap08.TB_INCIDENTES_DUP
GROUP BY PdId, Category
HAVING vezes > 1;

# Identificando os registros duplicados (e retornando cada linha em duplicidade)

SELECT PdId, Category
FROM cap08.TB_INCIDENTES_DUP
WHERE 
PdID in (SELECT PdId FROM cap08.TB_INCIDENTES_DUP GROUP BY PdId HAVING COUNT(*) > 1)
ORDER BY PdID;

# Identificando os registros duplicados (e retornando uma linha para duplicidade) com funcao windows 

SELECT *
FROM ( 
	SELECT primeiro_resultado.*,
		ROW_NUMBER() OVER (PARTITION BY PdId, Category ORDER BY PdId) AS numero
	FROM cap08.TB_INCIDENTES_DUP AS primeiro_resultado) AS segundo_resultado
    WHERE numero > 1;
    
# Usando CTE 

SET SQL_SAFE_UPDATES = 0;

WITH cte_table
AS 
(
	SELECT 
		PdId, Category, 
		ROW_NUMBER() OVER (PARTITION BY PdId, Category ORDER BY PdId) AS contagem
	FROM cap08.TB_INCIDENTES_DUP
)
DELETE FROM cap08.TB_INCIDENTES_DUP
USING cap08.TB_INCIDENTES_DUP
JOIN cte_table 
ON cap08.TB_INCIDENTES_DUP.PdId = cte_table.PdId
WHERE cte_table.contagem > 1;

SET SQL_SAFE_UPDATES = 1;


