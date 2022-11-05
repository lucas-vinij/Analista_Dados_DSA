-- SELECT 	
-- 	ano_fiscal,
--     nome_funcionario,
--     valor_venda,
--     SUM(valor_venda) OVER (PARTITION BY ano_fiscal) total_vendas_ano
--     FROM cap06.TB_VENDAS
--     ORDER BY ano_fiscal;
    
# Total de vendas por ano, por funcionario de vendas do funcionario
-- SELECT
-- 	ano_fiscal,
--     nome_funcionario,
--     valor_venda,
--     SUM(valor_venda) OVER (PARTITION BY nome_funcionario) total_funcionario
--     FROM cap06.TB_VENDAS
--     order by ano_fiscal;