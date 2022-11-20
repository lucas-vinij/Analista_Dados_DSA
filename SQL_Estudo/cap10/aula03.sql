# View materializada é melhor do que a view normal
# é mais rapdido
# quando criamos uma view materialized, estamos criando uma nova
# tabela, o mysql nao tem essa funcao. Portanto vamos 
# criar uma nova tabela

# VIEW MATERIALIZED 
CREATE TABLE cap10.VW_MATERIALIZED (
SELECT COUNT(*) FROM cap10.TB_CLIENTE);

# Para atualizar essa materialized view precisamos alt
# criar um stored_procedures

DELIMITER //
CREATE PROCEDURE cap10.SP_VW_MATERIALIZED (OUT dev INT)
BEGIN
	TRUNCATE TABLE cap10.VW_MATERIALIZED;
    INSERT INTO cap10.VW_MATERIALIZED
		SELECT id_vendedor, data__venda, SUM(valor_venda * 0.10) as comissao
        FROM cap10.TB_VENDAS
        WHERE data_venda
        GROUP BY id_vendedor, data_venda;
END 
//
DELIMITER ;