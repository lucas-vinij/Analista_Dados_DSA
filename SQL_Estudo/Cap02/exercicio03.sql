# Exercicios 

1 
SELECT DISTINCT menopausa FROM cap03.TB_DADOS2;

SELECT 
	CASE
		WHEN menopausa = 'premeno' THEN 1
        WHEN menopausa = 'ge40' THEN 2
        WHEN menopausa = 'lt40' THEN 3
	END as menopausa
FROM TB_DADOS2;

-- -- 2
SELECT CONCAT(inv_nodes,  '-', quadrante) AS posicao_tumor
FROM TB_DADOS2;

-- 3
SELECT * FROM cap03.TB_DADOS2;

SELECT 
CASE WHEN deg_malig = 3 THEN 1 ELSE 0 END AS cap3,
CASE WHEN deg_malig = 2 THEN 1 ELSE 0 END AS cap2,
CASE WHEN deg_malig = 1 THEN 1 ELSE 0 END AS cap1
FROM cap03.TB_DADOS2;

-- 4
CREATE TABLE cap03.TB_DADOS4
AS
SELECT 
classe,
idade,
CASE
	WHEN menopausa = 'premeno' THEN 1 
    WHEN menopausa = 'ge40' THEN 2
    WHEN menopausa = 'lt40' THEN 3
END AS menopausa,
inv_nodes,
node_caps,
CONCAT(inv_nodes, '-', quadrante) AS posicao_tumor,
CASE WHEN deg_malig = 3 THEN 1 ELSE 0 END AS malig3,
CASE WHEN deg_malig = 2 THEN 1 ELSE 0 END AS malig2,
CASE WHEN deg_malig = 1 THEN 1 ELSE 0 END AS malig1,
seio, 
quadrante
FROM cap03.TB_DADOS2;