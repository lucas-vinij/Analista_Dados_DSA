SELECT 	Account, 
		CAST(Create_date AS DATE) AS data_pedido,
        order_value,
        LEAD(Order_value, 1,-1) OVER (PARTITION BY Account ORDER BY CAST(Create_date AS Date)) AS media_valor_pedido
FROM cap08.TB_PEDIDOS_PRODUTOS
WHERE Account = 'Acme Corporation'
ORDER BY data_pedido; 

SELECT 	Account, 
		CAST(Create_date AS DATE) AS data_pedido,
        order_value,
        LAG(Order_value, 1,0) OVER (PARTITION BY Account ORDER BY CAST(Create_date AS Date)) AS media_valor_pedido
FROM cap08.TB_PEDIDOS_PRODUTOS
WHERE Account = 'Acme Corporation'
ORDER BY data_pedido; 

# Calcule a diferenca entre o valor pedido do dia e do dia anterior.
WITH temp_table AS 
(
SELECT 	Account,
		CAST(create_date as date) as data_pedido,
        order_value,
        LAG(order_value, 1,0) OVER (PARTITION BY Account ORDER BY CAST(create_date as date)) as lag_valor_pedido
FROM cap08.TB_PEDIDOS_PRODUTOS
WHERE Account = 'Acme Corporation'
ORDER BY data_pedido
)
SELECT 	Account,
		data_pedido,
        order_value,
        lag_valor_pedido,
        (order_value - lag_valor_pedido) as diff
FROM temp_table;