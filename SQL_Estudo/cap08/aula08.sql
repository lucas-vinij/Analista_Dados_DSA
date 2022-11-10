SELECT * FROM cap08.TB_GESTORES;

SELECT
	id, 
	GROUP_CONCAT(if(colID = 1, nome, NULL)) AS 'nome',
    GROUP_CONCAT(if(colID = 2, nome, NULL)) AS 'sobrenome',
    GROUP_CONCAT(if(colID = 3, nome, NULL)) AS 'titulo'
FROM cap08.TB_GESTORES
GROUP BY id;

