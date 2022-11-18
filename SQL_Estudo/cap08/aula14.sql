SELECT * FROM cap08.TB_ANIMAIS;

SELECT * FROM cap08.TB_ZOOS;

SELECT * FROM cap08.TB_MAP_ANIMAL_ZOO;

SELECT animais.nome, zoo.nome
FROM cap08.TB_MAP_ANIMAL_ZOO tudo
JOIN cap08.TB_ANIMAIS animais
ON animais.id = tudo.id_animal
JOIN cap08.TB_ZOOS zoo 
ON zoo.id = tudo.id_zoo
ORDER BY animais.nome;

SELECT A.nome AS animal, COALESCE(C.nome, 'Sem zoo') AS Zoo
FROM cap08.TB_ANIMAIS AS A
LEFT JOIN (cap08.TB_MAP_ANIMAL_ZOO AS B INNER JOIN cap08.TB_ZOOS AS C ON C.id = B.id_zoo)
ON B.id_animal = A.id
ORDER BY animal;

