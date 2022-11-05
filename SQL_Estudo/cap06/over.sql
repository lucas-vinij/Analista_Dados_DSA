# Total de vendas por ano, por funcionario e total de vendas geral
SELECT 
	ano_fiscal,
    nome_funcionario,
    valor_venda,
    SUM(valor_venda) OVER () total_vendas_geral
    FROM cap06.TB_VENDAS
    ORDER BY ano_fiscal;
    
# Numero de vendas por ano, por funcionario e o numero total de vendas em todos os anos
SELECT 
	ano_fiscal,
    nome_funcionario,
	COUNT(*) num_vendas_ano,
    COUNT(*) OVER () num_vendas_geral
    FROM cap06.TB_VENDAS
    GROUP BY ano_fiscal, nome_funcionario
    ORDER BY ano_fiscal;

# Reescrever a query anterior usando subquery 