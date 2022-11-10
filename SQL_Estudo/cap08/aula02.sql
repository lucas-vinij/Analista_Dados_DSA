# alterando, para um valor temporario

SELECT
	CASE 
		WHEN Resolution = '' THEN 'OTHER'
		ELSE Resolution
	END AS Resolution
FROM cap08.TB_INCIDENTES;

# alterando direto na fonte

SET SQL_SAFE_UPDATES =0;

UPDATE cap08.TB_INCIDENTES
SET Resolution = 'OTHER'
WHERE Resolution = '';

SET SQL_SAFE_UPDATES = 1;

SELECT Resolution FROM cap08.TB_INCIDENTES;

# Sempre que possivel tente resolver o problema na fonte, 
# pois CASE pode diminuir a velocidade

