SELECT 
	id_fornecedor,
	COUNT(IF(id_funcionario = 250, id_pedido, NULL)) AS Emp250,
    COUNT(IF(id_funcionario = 251, id_pedido, NULL)) AS Emp251,
    COUNT(IF(id_funcionario = 252, id_pedido, NULL)) AS Emp252,
    COUNT(IF(id_funcionario = 253, id_pedido, NULL)) AS Emp253,
    COUNT(IF(id_funcionario = 254, id_pedido, NULL)) AS Emp254

FROM cap08.TB_PEDIDOS p 
WHERE 
p.id_funcionario BETWEEN 250 AND 254
GROUP BY 
id_fornecedor;

