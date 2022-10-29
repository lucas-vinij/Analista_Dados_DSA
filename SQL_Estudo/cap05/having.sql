# Algum vendedor participou de vendas em que a media do valor_pedido por estado do cliente foi superior a 800?
SELECT nome_vendedor, CEILING(AVG(valor_pedido)) AS media, estado_cliente
FROM cap05.TB_PEDIDOS P INNER JOIN cap05.TB_VENDEDOR V 
INNER JOIN cap05.TB_CLIENTES C
ON P.id_vendedor = V.id_vendedor
AND P.id_cliente = C.id_cliente 
GROUP BY nome_vendedor, estado_cliente
HAVING media > 800

# Qual estado teve mais de 5 pedidos?
SELECT C.estado_cliente, COUNT(P.id_pedido) AS Pedidos 
FROM cap05.TB_CLIENTES C, cap05.TB_PEDIDOS P
WHERE C.id_cliente = P.id_cliente
GROUP BY C.estado_cliente
HAVING Pedidos >= 5