# Qual sera o valor pago ao funcionario de empID 1 se a comissao for igual a 15%?
# errado 
SELECT 
	empID,
	ROUND(SUM(valor_venda * 15) /100,0) as comissao
FROM cap08.TB_VENDAS
WHERE empID = 1
GROUP BY empID;

SELECT empID, ROUND((valor_venda * GREATEST (15, comissao))/100,0) as comissao
FROM cap08.TB_VENDAS
WHERE empID = 1;

SELECT empID, LEAST(2, comissao) as comissao
FROM cap08.TB_VENDAS
WHERE empID = 1;

SELECT empID, ROUND((valor_venda * LEAST(2, comissao)) /100, 0) as valor_comissao
FROM cap08.TB_VENDAS
WHERE empID = 1;
