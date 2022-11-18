SELECT 	Account, 
		CAST(Create_date AS DATE) AS data_pedido,
        AVG(Order_value) OVER (PARTITION BY Account ORDER BY CAST(Create_date AS Date)) AS media_valor_pedido
FROM cap08.TB_PEDIDOS_PRODUTOS
WHERE Account = 'Acme Corporation'
ORDER BY data_pedido;

 
SELECT 	Account, 
		CAST(Create_date AS DATE) AS data_pedido,
        order_value,
        FIRST_VALUE(Order_value) OVER (PARTITION BY Account ORDER BY CAST(Create_date AS Date)) AS media_valor_pedido
FROM cap08.TB_PEDIDOS_PRODUTOS
WHERE Account = 'Acme Corporation'
ORDER BY data_pedido;