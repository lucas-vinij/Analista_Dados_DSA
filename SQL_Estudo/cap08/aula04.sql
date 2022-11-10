SELECT @rowindex := -1;

	SELECT 
		AVG(idade) AS mediana
	FROM
		(SELECT @rowindex :=@rowindex +1 AS rowindex, cap08.TB_CRIANCAS.idade AS idade
        FROM cap08.TB_CRIANCAS
        ORDER BY cap08.TB_CRIANCAS.idade) AS d
	WHERE d.rowindex IN (FLOOR(@rowindex /2), CEIL(@rowindex /2));
    
SELECT @rowindex := -1;

	SELECT 
		AVG(peso) AS mediana
	FROM
		(SELECT @rowindex :=@rowindex +1 AS rowindex, cap08.TB_CRIANCAS.peso AS peso
        FROM cap08.TB_CRIANCAS
        ORDER BY cap08.TB_CRIANCAS.peso) AS d
	WHERE d.rowindex IN (FLOOR(@rowindex /2), CEIL(@rowindex /2));
    

SET SQL_SAFE_UPDATES = 0;

UPDATE cap08.TB_CRIANCAS
SET idade = 3
WHERE idade = 42;

UPDATE cap08.TB_CRIANCAS
SET peso = 15
WHERE peso = 98;

SET SQL_SAFE_UDPATES = 1;

SELECT AVG(idade) idade, STDDEV(idade) desvio_padrao_idade
FROM cap08.TB_CRIANCAS;

SELECT AVG(peso) peso, STDDEV(idade) desvio_padrao_peso
FROM cap08.TB_CRIANCAS;