# Retorne o gerente, o escritorio regional, o cliente, o numero de vendas
# e os sub-totais de vendas. Faca isso apenas para as vendas concluidas com sucesso
SELECT * FROM cap08.TB_VENDEDORES;
SELECT * FROM cap08.TB_PIPELINE_VENDAS;

SELECT 	COALESCE(V.Manager,"Total") as Manager,
		COALESCE(V.Regional_Office, "Total") as Regional_Office,
        COALESCE(P.Account,"Total") as Clientes,
        COUNT(P.Close_Value) AS numeroVendas
FROM cap08.TB_VENDEDORES V, cap08.TB_PIPELINE_VENDAS P 
WHERE V.Sales_Agent = P.Sales_Agent
AND Deal_Stage = 'Won'
GROUP BY Manager, Regional_Office, Account WITH ROLLUP;
 

# Nivel ninja das galaxias 
# Retorne o gerente, o escritorio regional, o cliente, o numero de vendas
# e os sub-totais de vendas. Faca isso apenas para as vendas concluidas com sucesso
# Use CTE
  
WITH temp_table AS 
( 
SELECT 	A.Manager,
		A.Regional_office,
        B.Account,
        B.Deal_Stage
FROM cap08.TB_VENDEDORES AS A, cap08.TB_PIPELINE_VENDAS AS B
WHERE (B.Sales_Agent = A.Sales_Agent)
)
SELECT 	COALESCE(Manager, "Total") AS Gerente,
		COALESCE(Regional_Office, "Total") AS "Escritorio Regional",
        COALESCE(Account, "Total") AS Cliente,
        COUNT(*) AS numero_Vendas
FROM temp_table
WHERE Deal_stage = 'Won'
GROUP BY Manager, Regional_Office, Account WITH ROLLUP;