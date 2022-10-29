# Algum vendedor participou de vendas cujo valor pedido tenha sido superior a 600 no estado de SP?
SELECT nome_vendedor, valor_pedido, estado_cliente
FROM cap05.TB_PEDIDOS P INNER JOIN cap05.TB_CLIENTES C
INNER JOIN cap05.TB_VENDEDOR V
ON P.id_vendedor = V.id_vendedor
AND P.id_cliente = C.id_cliente
WHERE estado_cliente = 'SP' AND valor_pedido >= 600


 

