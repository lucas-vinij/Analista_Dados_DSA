SELECT 
	COALESCE(EmpID, 'Total') AS EmpID,
    SUM(IF(ano=2020, valor_venda, 0)) AS '2020',
    SUM(IF(ano=2021, valor_venda, 0)) AS '2021',
    SUM(IF(ano=2022, valor_venda, 0)) AS '2022'
FROM cap08.TB_VENDAS
GROUP BY EmpID WITH ROLLUP;