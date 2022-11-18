SELECT Address,
		POSITION(" " IN Address) as posicao_espaco
FROM cap08.TB_INCIDENTES;

SELECT 	Address,
		SUBSTR(Address, 1, POSITION(" " IN Address)) AS desc_final
FROM cap08.TB_INCIDENTES;

# Replace
SELECT * FROM cap08.TB_MAP_ANIMAL_ZOO;

SELECT REPLACE(id_zoo, 1001, 1007) FROM cap08.TB_MAP_ANIMAL_ZOO;