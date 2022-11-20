# UPDATE = sobrescreve dados # DELETE = deleta os dados 

SET SQL_SAFE_UPDATES = 0;

UPDATE cap10.TB_PRODUTO
SET nm_marca_produto = 'LG'
WHERE sk_produto = 4 ;

SELECT * FROM cap10.TB_PRODUTO;

SET SQL_SAFE_UPDATES = 1;

# DELETE 

DELETE FROM cap10.TB_PRO DUTO
WHERE sk_produto = 10;

SELECT * FROM cap10.TB_CLIENTE;

INSERT INTO cap10.TB_CLIENTE (nk_id_cliente, nm_cliente, nm_cidade_cliente, by_aceita_campanha, desc_cep)
VALUES( 'A10984EDCF10092', 'Bob Marley', 'Rio de Janeiro', '1', '72132900');

DELETE FROM cap10.TB_CLIENTE
WHERE sk_cliente = 11;

SELECT * FROM cap10.TB_CLIENTE;