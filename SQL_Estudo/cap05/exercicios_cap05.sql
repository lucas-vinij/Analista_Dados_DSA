# 01. Qual o número de hubs por cidade?
-- SELECT  
-- IF(GROUPING(hub_city),'Total Cidades',hub_city) AS Cidades,
-- COUNT(hub_id) AS Hubs
-- FROM exec4.hubs
-- GROUP BY hub_city WITH ROLLUP 
-- ORDER BY GROUPING(hub_city ) DESC;


# 02. Qual o número de pedidos (orders) por status?
-- SELECT 
-- IF(GROUPING(order_status),'Total pedidos',order_status) AS Pedidos, 
-- COUNT(order_id) AS Pedidos
-- FROM exec4.orders
-- GROUP BY order_status WITH ROLLUP
-- ORDER BY order_status ASC;

# O3- Qual o número de lojas (stores) por cidade dos hubs?
-- SELECT 
-- IF(GROUPING(hub_city),'Total Cidades',hub_city) AS Cidades,
-- COUNT(store_name) AS lojas
-- FROM exec4.stores S, exec4.hubs H
-- WHERE S.hub_id = H.hub_id 
-- GROUP BY hub_city WITH ROLLUP
-- ORDER BY GROUPING(hub_city) DESC;

# 04- Qual o maior e o menor valor de pagamento (payment_amount) registrado?
-- SELECT MAX(payment_amount) AS Salario_Maximo, 
-- MIN(payment_amount) AS Salario_Minimo,
-- ROUND(AVG(payment_amount)) AS Media_Salario
-- FROM exec4.payments;

# 05- Qual tipo de driver (driver_type) fez o maior número de entregas?
-- SELECT 
-- IF(GROUPING(driver_type),'Total Entregas',driver_type),
-- COUNT(delivery_order_id) AS Entregas
-- FROM exec4.deliveries D, exec4.drivers Di
-- WHERE D.driver_id = Di.driver_id
-- GROUP BY driver_type WITH ROLLUP
-- ORDER BY GROUPING(driver_type) DESC;

# 06- Qual a distância média das entregas por tipo de driver (driver_modal)?
-- SELECT ROUND(AVG(delivery_distance_meters),2) AS Media_Corridas, driver_modal
-- FROM exec4.deliveries D, exec4.drivers Di 
-- WHERE D.driver_id = Di.driver_id
-- GROUP BY driver_modal
-- ORDER BY driver_modal DESC;

# 07- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?
-- SELECT 
-- IF(GROUPING(store_name),'Todas_Lojas',store_name) AS Lojas, 
-- ROUND(AVG(order_amount),2) AS Pedidos_Media
-- FROM exec4.orders O, exec4.stores S
-- WHERE O.store_id = S.store_id
-- GROUP BY store_name WITH ROLLUP
-- ORDER BY Pedidos_Media DESC;

# 08- Existem pedidos que não estão associados a lojas? Se caso positivo, quantos?
-- SELECT 
-- 	CASE
-- 		WHEN store_name IS NULL THEN 'Sem loja'
-- 			ELSE store_name
-- 		END AS Lojas, 
-- 	COUNT(order_id) AS Pedidos
-- FROM exec4.stores S 
-- RIGHT JOIN exec4.orders O
-- ON S.store_id = O.store_id
-- GROUP BY store_name;


# 09 - Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
-- SELECT ROUND(SUM(order_amount),2) AS Total_Pedido, channel_name
-- FROM exec4.orders O, exec4.channels C
-- WHERE O.channel_id = C.channel_id
-- GROUP BY channel_name
-- HAVING channel_name = 'FOOD PLACE';

# 10 Quantos pagamentos foram cancelados (chargeback)?
-- SELECT COUNT(payment_order_id) AS 'Pagamentos',
-- payment_status
-- FROM exec4.payments
-- GROUP BY payment_status
-- HAVING payment_status = 'CHARGEBACK';

# 11- Qual foi o valor médio dos pagamentos cancelados (chargeback)?
-- SELECT ROUND(AVG(payment_amount),2) AS Media_pagamentos, payment_status
-- FROM exec4.payments 
-- GROUP BY payment_status
-- HAVING payment_status = 'CHARGEBACK';

# 12 Qual a média do valor de pagamento por método de pagamento (payment_method) em ordem decrescente?
-- SELECT payment_method, ROUND(AVG(payment_amount),2) AS Media
-- FROM exec4.payments
-- GROUP BY payment_method 
-- ORDER BY Media DESC; 

# 13 Quais métodos de pagamento tiveram valor médio superior a 100?
-- SELECT payment_method, ROUND(AVG(payment_amount),2) AS Media
-- FROM exec4.payments
-- GROUP BY payment_method
-- HAVING Media >= 100
-- ORDER BY Media DESC;

# 14 Qual a média de valor de pedido (order_amount) por estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?
-- SELECT 
-- ROUND(AVG(order_amount),2) AS Media_Pedido,
-- hub_state, store_segment, channel_type
-- 	FROM exec4.orders O 
-- 	INNER JOIN exec4.stores S 
-- 	INNER JOIN exec4.hubs H 
-- 	INNER JOIN exec4.channels C
-- 		ON O.store_id = S.store_id
-- 		AND S.hub_id = H.hub_id
-- 		AND O.channel_id = C.channel_id
-- GROUP BY store_segment, hub_state, channel_type
-- ORDER BY hub_state;

# OU 
-- SELECT hub_state, store_segment, channel_type, ROUND(AVG(order_amount),2) AS media_pedido
-- FROM exec4.orders orders, exec4.stores stores, exec4.channels channels, exec4.hubs hubs
-- WHERE stores.store_id = orders.store_id
-- AND channels.channel_id = orders.channel_id
-- AND hubs.hub_id = stores.hub_id
-- GROUP BY hub_state, store_segment, channel_type
-- ORDER BY hub_state;

# 15 Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
-- SELECT 
-- hub_state,store_segment, channel_type,
-- ROUND(AVG(order_amount),2) AS Media_Pedido
-- FROM exec4.orders O 
-- 	INNER JOIN exec4.stores S
-- 	INNER JOIN exec4.hubs H
-- 	INNER JOIN exec4.channels C
-- 		ON O.store_id = S.store_id
-- 		AND S.hub_id = H.hub_id
-- 		AND O.channel_id = C.channel_id
-- GROUP BY hub_state, store_segment, channel_type
-- HAVING Media_Pedido >= 450;

# 16 Qual o valor total de pedido (order_amount) por estado do hub (hub_state),
#segmento da loja (store_segment) e tipo de canal (channel_type)? Demonstre os totais
#intermediários e formate o resultado.
-- SELECT 
-- IF(GROUPING(hub_state),'Total Estado',hub_state) AS estados,
-- IF(GROUPING(store_segment),'Total Segmentos',store_segment) AS Segmentos,  
-- IF(GROUPING(channel_type),'Total Canais', channel_type) AS tipo_canal,
-- ROUND(SUM(order_amount),2) AS Soma_Total
-- FROM exec4.orders O 
-- INNER JOIN exec4.stores S
-- INNER JOIN exec4.hubs H
-- INNER JOIN exec4.channels C
-- ON O.store_id = S.store_id
-- AND S.hub_id = H.hub_id
-- AND O.channel_id = C.channel_id
-- GROUP BY hub_state, store_segment, channel_type WITH ROLLUP
-- ORDER BY estados DESC;

# 17 - Quando o pedido era do Hub do Rio de Janeiro (hub_state), segmento de loja
#'FOOD', tipo de canal Marketplace e foi cancelado, qual foi a média de valor do pedido
#(order_amount)?
-- SELECT hub_city ,store_segment, 
-- channel_type, order_status,
-- ROUND(AVG(order_amount),2) AS Media_valor
-- FROM exec4.orders O 
-- 	INNER JOIN exec4.stores S
-- 	INNER JOIN exec4.hubs H
-- 	INNER JOIN exec4.channels C
-- 		ON O.store_id = S.store_id
-- 		AND S.hub_id = H.hub_id
-- 		AND O.channel_id = C.channel_id
-- 	WHERE store_segment = 'FOOD' 
-- 	AND hub_city = 'RIO DE JANEIRO' 
-- 	AND channel_type = 'MARKETPLACE'
-- 	AND order_status = 'CANCELED'
-- GROUP BY hub_city, store_segment, channel_type, order_status;

# 18. Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi
# cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
-- SELECT hub_state, store_segment, channel_type, ROUND(SUM(order_amount),2) AS total_pedido
-- FROM exec4.orders orders, exec4.stores stores, exec4.channels channels, exec4.hubs hubs
-- WHERE stores.store_id = orders.store_id
-- AND channels.channel_id = orders.channel_id
-- AND hubs.hub_id = stores.hub_id
-- AND order_status = 'CANCELED'
-- AND store_segment = 'GOOD'
-- AND channel_type = 'MARKETPLACE'
-- GROUP BY hub_state, store_segment, channel_type
-- HAVING total_pedido > 100000;

# 19 Em que data houve a maior média de valor do pedido (order_amount)? Dica:
# Pesquise e use a função SUBSTRING().
--  
-- SELECT ROUND(AVG(order_amount),2)AS Media,
-- SUBSTRING(order_moment_created, 1,9) AS data  
-- FROM exec4.orders
-- GROUP BY data
-- ORDER BY Media DESC;

# 20 20- Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)? Dica:
#Use a função SUBSTRING().

-- SELECT MIN(order_amount) AS Media,
--  SUBSTRING(order_moment_created, 1,9) AS data  
--  FROM exec4.orders
-- GROUP BY data
-- HAVING Media = 0
-- ORDER BY Media ASC;
