# Supondo que a comissao de cada vendedor seja 10%, quanto cada vendedor ganhou de comissao nas vendas no estado do ceara?
# Retorne 0 se nao houver ganho comissao
SELECT
	CASE
		WHEN ROUND(SUM(valor_pedido * 10),2) IS NULL THEN 0 
			ELSE ROUND(SUM(valor_pedido * 10),2)
		END AS comissao,
        
	nome_vendedor,
	CASE 
		WHEN estado_cliente IS NULL THEN 'Não é do CE' 
			ELSE estado_cliente
		END AS estado_cliente
FROM cap05.TB_PEDIDOS P INNER JOIN cap05.TB_CLIENTES C RIGHT JOIN cap05.TB_VENDEDOR V
ON P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
AND estado_cliente = 'CE'
GROUP BY nome_vendedor, estado_cliente
ORDER BY estado_cliente;