# Sumarizacao

# Use as tabelas TB_PIPELINE_VENDAS E TB_VENDEDORES
# Retorne o total do valor de todos os agentes de vendas
# e TB_ALUNOS os sub-totais por escritorio regional 
# Retorne o resultado somente das vendas concluidas com sucesso

# Sub-totais = ROLLUP 



# Certo 
SELECT 	COALESCE(B.Regional_Office, "Total") AS "Escritorio Regional",
		C OALESCE(A.Sales_Agent, "Total") AS "Agente de vendas",
		SUM(A.Close_Value) AS total
FROM cap08.TB_PIPELINE_VENDAS AS A, cap08.TB_VENDEDORES AS B
WHERE A.Sales_Agent = B.Sales_Agent
AND A.Deal_Stage = "Won"
GROUP BY B.Regional_Office, A.Sales_Agent WITH ROLLUP;