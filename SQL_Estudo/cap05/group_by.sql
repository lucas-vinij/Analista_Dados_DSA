# Media do valor dos pedidos
-- SELECT AVG(valor_pedido) AS media FROM cap05.TB_PEDIDOS;
-- SELECT COUNT(valor_pedido) AS media FROM cap05.TB_PEDIDOS;

# Media do valor dos pedidos por cidade
SELECT ROUND(AVG(valor_pedido),2) AS media, cidade_cliente
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

# Media do valor pedidos por cidade com INNER JOIN
SELECT ROUND(AVG(valor_pedido),2) AS media, cidade_cliente
FROM cap05.TB_PEDIDOS P INNER JOIN cap05.TB_CLIENTES C
ON P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

