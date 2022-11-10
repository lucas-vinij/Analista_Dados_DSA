SELECT * FROM cap08.TB_CRIANCAS;

SELECT AVG(idade) AS media_idade, STDDEV(idade) AS desvio_padrao_idade
FROM cap08.TB_CRIANCAS;

# MESMA query porem sem outliers 
SELECT AVG(idade) AS media_idade, STDDEV(idade) AS desvio_padrao_idade
FROM cap08.TB_CRIANCAS 
WHERE idade <5;

SELECT AVG(peso) AS media_peso, STDDEV(peso) AS desvio_padrao_peso
FROM cap08.TB_CRIANCAS;

SELECT AVG(peso) AS media_peso, STDDEV(peso) AS desvio_padrao_peso
FROM cap08.TB_CRIANCAS
WHERE idade < 5;
