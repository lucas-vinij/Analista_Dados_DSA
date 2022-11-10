# NULL é o tipo unknown no banco de dados e empty (vazio)
# é o nulo em uma coluna do tipo string.
# O empty tambe e chamado de blank 

#A principal diferenca entre nulo e vazio e que o nulo é 
# usado para se referir a nada, enquanto o vazio e usado
# para se referir a uma string unica com comprimento certo

SELECT COUNT(*)
FROM cap08.TB_INCIDENTES
WHERE Resolution IS NULL;

SELECT COUNT(*)
FROM cap08.TB_INCIDENTES
WHERE Resolution = ' ';

# certa 
SELECT COUNT(*)
FROM cap08.TB_INCIDENTES
WHERE Resolution = '';

# outra alternativa
SELECT COUNT(*)
FROM cap08.TB_INCIDENTES
WHERE NULLIF(Resolution, '') IS NULL;

# outra alternativa
SELECT COUNT(*)
FROM cap08.TB_INCIDENTES 
WHERE TRIM(COALESCE(Resolution,''))='';

# outra alternativa
SELECT COUNT(*)
FROM cap08.TB_INCIDENTES
WHERE LENGTH(RTRIM(LTRIM(Resolution))) = 0;

# outra alternativa
SELECT ISNULL(NULLIF(Resolution, '')) total
FROM cap08.TB_INCIDENTES) total_nulo
