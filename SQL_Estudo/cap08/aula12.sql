SELECT *
FROM cap08.TB_VENDAS;

# Vendedores devem ser seperados em categorias
# De 3 a 5 de comissao = Categoria 1
# De 5.1 a 7.9 = Categoria 2
# Igual ou acima de 8 = Categoria 3

SELECT empID, ano, valor_venda,
	CASE 
		WHEN comissao BETWEEN 3 AND 5 THEN 1
		ELSE 0
        END AS Categoria_1,
	CASE 
		WHEN comissao BETWEEN 5.1 AND 7.9 THEN 1
        ELSE 0
        END AS Categoria_2,
	CASE
		WHEN comissao >= 8 THEN 1
        ELSE 0 
        END AS Categoria_3
FROM cap08.TB_VENDAS;


# Separar os dados em 3 categorias
# Queremos registros por dia 
# Se o valor_acao for entre 0 e 10 queremos o maior num_vendas desse range e chamaremos de Grupo 1
# Se o valor_acao for entre 10 e 100 queremos o maior num_vendas desse range e chamaremos de Grupo 2
# Se o valor_acao for  > 100 queremos o maior num_vendas desse range e chamaremos de Grupo 3

# meu 
SELECT 
	MAX(num_vendas) OVER (ORDER BY valor_acao BETWEEN 0 and 10) as grupo_1,
	MAX(num_vendas) OVER (ORDER BY valor_acao BETWEEN 10 and 100) as grupo_2,
	MAX(num_vendas) OVER (ORDER BY valor_acao > 100) as grupo_3
FROM cap08.TB_ACOES;


# prof 
SELECT dia,
	MAX(CASE WHEN valor_acao BETWEEN 0 AND 9 THEN num_vendas ELSE 0 END) AS 'Groupo 1',
	MAX(CASE WHEN valor_acao BETWEEN 10 AND 99 THEN num_vendas ELSE 0 END) AS 'Groupo 2',
	MAX(CASE WHEN valor_acao > 100 THEN num_vendas ELSE 0 END) AS 'Groupo 3'
FROM cap08.TB_ACOES
GROUP BY dia;


