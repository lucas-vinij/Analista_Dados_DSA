# 01. Qual o número de hubs por cidade?
-- SELECT  
-- IF(GROUPING(hub_city),'Total Cidades',hub_city) AS Hub,
-- COUNT(hub_id) AS Hubs
-- FROM proj02.hubs
-- GROUP BY hub_city WITH ROLLUP 
-- ORDER BY GROUPING(hub_city);

# 02. Qual o número de pedidos (orders) por status?
-- SELECT 
-- IF(GROUPING(order_status),'Total pedidos',order_status) AS Pedidos, 
-- COUNT(order_id) AS Pedidos
-- FROM proj02.orders
-- GROUP BY order_status WITH ROLLUP
-- ORDER BY order_status ASC;

# O3- Qual o número de lojas (stores) por cidade dos hubs?
-- SELECT 
-- IF(GROUPING(hub_city),'Total Cidades',hub_city) AS Cidades,
-- COUNT(store_name) AS lojas
-- FROM proj02.stores S, proj02.hubs H
-- WHERE S.hub_id = H.hub_id 
-- GROUP BY hub_city WITH ROLLUP
-- ORDER BY GROUPING(hub_city) DESC;

# 04- Qual o maior e o menor valor de pagamento (payment_amount) registrado?
-- SELECT MAX(payment_amount) AS Salario_Maximo, 
-- MIN(payment_amount) AS Salario_Minimo,
-- ROUND(AVG(payment_amount)) AS Media_Salario
-- FROM proj02.payments;

# 05- Qual tipo de driver (driver_type) fez o maior número de entregas?
-- SELECT 
-- IF(GROUPING(driver_type),'Total Entregas',driver_type),
-- COUNT(delivery_order_id) AS Entregas
-- FROM proj02.deliveries D, proj02.drivers Di
-- WHERE D.driver_id = Di.driver_id
-- GROUP BY driver_type WITH ROLLUP
-- ORDER BY GROUPING(driver_type) DESC;

# 06- Qual a distância média das entregas por tipo de driver (driver_modal)?
-- SELECT ROUND(AVG(delivery_distance_meters),2) AS Media_Corridas, driver_modal
-- FROM proj02.deliveries D, proj02.drivers Di 
-- WHERE D.driver_id = Di.driver_id
-- GROUP BY driver_modal
-- ORDER BY driver_modal DESC;

# 07- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?
-- SELECT 
-- IF(GROUPING(store_name),'Todas_Lojas',store_name) AS Lojas, 
-- ROUND(AVG(order_amount),2) AS Pedidos_Media
-- FROM proj02.orders O, proj02.stores S
-- WHERE O.store_id = S.store_id
-- GROUP BY store_name WITH ROLLUP
-- ORDER BY Pedidos_Media DESC;

# 08- Existem pedidos que não estão associados a lojas? Se caso positivo, quantos?
-- SELECT 
-- 	CASE
-- 		WHEN store_name IS NULL THEN 0
-- 			ELSE store_name
-- 		END AS Lojas, 
-- 	COUNT(order_id) AS Pedidos
-- FROM proj02.stores S 
-- RIGHT JOIN proj02.orders O
-- ON S.store_id = O.store_id
-- GROUP BY store_name
-- HAVING Lojas = '0';

# 09 - Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
-- SELECT ROUND(SUM(order_amount),2) AS Total_Pedido, channel_name
-- FROM proj02.orders O, proj02.channels C
-- WHERE O.channel_id = C.channel_id
-- GROUP BY channel_name
-- HAVING channel_name = 'FOOD PLACE';

# 10 Quantos pagamentos foram cancelados (chargeback)?
-- SELECT COUNT(payment_order_id) AS 'Pagamentos',
-- payment_status
-- FROM proj02.payments
-- GROUP BY payment_status;
-- HAVING payment_status = 'CHARGEBACK';

# 11- Qual foi o valor médio dos pagamentos cancelados (chargeback)?
-- SELECT ROUND(AVG(payment_amount),2) AS Media_pagamentos, payment_status
-- FROM proj02.payments 
-- GROUP BY payment_status
-- HAVING payment_status = 'CHARGEBACK';

# 12 Qual a média do valor de pagamento por método de pagamento (payment_method) em ordem decrescente?
-- SELECT payment_method, ROUND(AVG(payment_amount),2) AS Media
-- FROM proj02.payments
-- GROUP BY payment_method 
-- ORDER BY Media DESC;

# 13 Quais métodos de pagamento tiveram valor médio superior a 100?
-- SELECT payment_method, ROUND(AVG(payment_amount),2) AS Media
-- FROM proj02.payments
-- GROUP BY payment_method
-- HAVING Media >= 100
-- ORDER BY Media DESC;

# 14 Qual a média de valor de pedido (order_amount) por estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?
-- SELECT 
-- ROUND(AVG(order_amount),2) AS Media_Pedido,
-- hub_state, store_segment, channel_type
-- 	FROM proj02.orders O 
-- 	INNER JOIN proj02.stores S 
-- 	INNER JOIN proj02.hubs H 
-- 	INNER JOIN proj02.channels C
-- 		ON O.store_id = S.store_id
-- 		AND S.hub_id = H.hub_id
-- 		AND O.channel_id = C.channel_id
-- GROUP BY store_segment, hub_state, channel_type;

# 15 Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
-- SELECT 
-- hub_state,store_segment, channel_type,
-- ROUND(AVG(order_amount),2) AS Media_Pedido
-- FROM proj02.orders O 
-- 	INNER JOIN proj02.stores S
-- 	INNER JOIN proj02.hubs H
-- 	INNER JOIN proj02.channels C
-- 		ON O.store_id = S.store_id
-- 		AND S.hub_id = H.hub_id
-- 		AND O.channel_id = C.channel_id
-- GROUP BY hub_state, store_segment, channel_type
-- HAVING Media_Pedido >= 450;

# 16 Qual o valor total de pedido (order_amount) por estado do hub (hub_state),
#segmento da loja (store_segment) e tipo de canal (channel_type)? Demonstre os totais
#intermediários e formate o resultado.
-- SELECT hub_state, store_segment, channel_type,
-- ROUND(SUM(order_amount),2) AS Soma_Total
-- FROM proj02.orders O 
-- INNER JOIN proj02.stores S
-- INNER JOIN proj02.hubs H
-- INNER JOIN proj02.channels C
-- ON O.store_id = S.store_id
-- AND S.hub_id = H.hub_id
-- AND O.channel_id = C.channel_id
-- GROUP BY hub_state, store_segment, channel_type;

# 17 - Quando o pedido era do Hub do Rio de Janeiro (hub_state), segmento de loja
#'FOOD', tipo de canal Marketplace e foi cancelado, qual foi a média de valor do pedido
#(order_amount)?
-- SELECT hub_city ,store_segment, 
-- channel_type, order_status,
-- ROUND(AVG(order_amount),2) AS Media_valor
-- FROM proj02.orders O 
-- 	INNER JOIN proj02.stores S
-- 	INNER JOIN proj02.hubs H
-- 	INNER JOIN proj02.channels C
-- 		ON O.store_id = S.store_id
-- 		AND S.hub_id = H.hub_id
-- 		AND O.channel_id = C.channel_id
-- GROUP BY hub_city, store_segment, channel_type, order_status
-- HAVING store_segment = 'FOOD' 
-- 	AND hub_city = 'RIO DE JANEIRO' 
-- 	AND channel_type = 'MARKETPLACE'
-- 	AND order_status = 'CANCELED';

# 18. Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi
# cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
-- SELECT store_segment, channel_type, order_status, hub_state,
-- SUM(order_amount) AS Total_valor 
-- FROM proj02.orders O INNER JOIN proj02.channels C
-- INNER JOIN proj02.stores S
-- INNER JOIN proj02.hubs H
-- ON O.channel_id = C.channel_id
-- AND O.store_id = S.store_id
-- AND S.hub_id = H.hub_id 
-- GROUP BY channel_type,order_status, store_segment, hub_state
-- HAVING channel_type ='MARKETPLACE' 
-- AND order_status = 'CANCELED'
-- AND store_segment = 'GOOD'
-- AND Total_valor >= 100.000

# 19 Em que data houve a maior média de valor do pedido (order_amount)? Dica:
# Pesquise e use a função SUBSTRING().
 
-- SELECT ROUND(AVG(order_amount),2)AS Media, SUBSTRING(order_moment_created, 1,9) AS data  FROM proj02.orders
-- GROUP BY order_moment_created
-- ORDER BY Media DESC;

# 20 20- Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)? Dica:
#Use a função SUBSTRING().

-- SELECT ROUND(AVG(order_amount),2)AS Media, SUBSTRING(order_moment_created, 1,9) AS data  FROM proj02.orders
-- GROUP BY order_moment_created
-- ORDER BY Media ASC;