# 1- Total de vendas
SELECT COUNT(Account) as 'Total vendas' FROM cap08.TB_PIPELINE_VENDAS;

# 2- Valor total vendido
SELECT SUM(CAST(Close_Value AS UNSIGNED)) as 'Total vendido' FROM cap08.TB_PIPELINE_VENDAS;

# 3- Número de vendas concluídas com sucesso
SELECT COUNT(Account) as 'Vendas concluidas' FROM cap08.TB_PIPELINE_VENDAS WHERE Deal_Stage = 'Won';

# 4- Média do valor das vendas concluídas com sucesso
SELECT ROUND(AVG(CAST(Close_Value AS UNSIGNED)),2) AS 'Media Vendas' FROM cap08.TB_PIPELINE_VENDAS WHERE Deal_Stage = 'Won';

# 5- Valos máximo vendido
SELECT MAX(CAST(Close_Value AS unsigned)) as 'Valor Maximo' FROM cap08.TB_PIPELINE_VENDAS;

# 6- Valor mínimo vendido entre as vendas concluídas com sucesso
SELECT MIN(CAST(Close_Value AS UNSIGNED)) as 'Venda Minima' FROM cap08.TB_PIPELINE_VENDAS WHERE Deal_Stage = 'Won';

# 7- Valor médio das vendas concluídas com sucesso por agente de vendas
SELECT A.Sales_Agent, ROUND(AVG(CAST(Close_Value AS UNSIGNED)),2) as valor_medio
FROM cap08.TB_PIPELINE_VENDAS  A
WHERE Deal_Stage = 'Won'
GROUP BY A.Sales_Agent
ORDER BY valor_medio DESC;

SELECT tbl.Sales_Agent, ROUND(AVG(CAST(tbl.Close_Value AS UNSIGNED)),2) AS valor_medio
FROM cap08.TB_PIPELINE_VENDAS AS tbl
WHERE tbl.Deal_Stage = 'Won'
GROUP BY Sales_Agent
ORDER BY valor_medio DESC;

# 8- Valor médio das vendas concluídas com sucesso por gerente do agente de vendas
SELECT Manager, ROUND(AVG(CAST(Close_Value AS UNSIGNED)),2) as 'Media venda' 
FROM cap08.TB_VENDEDORES A
LEFT JOIN cap08.TB_PIPELINE_VENDAS B
ON A.Sales_Agent = B.Sales_Agent
WHERE Deal_Stage = 'Won'
GROUP BY Manager;

# 9- Total do valor de fechamento da venda por agente de venda e por conta das vendas concluídas com sucesso
SELECT A.Sales_Agent, SUM(CAST(Close_Value AS unsigned)) AS Total_vendas
FROM cap08.TB_VENDEDORES A
LEFT JOIN cap08.TB_PIPELINE_VENDAS B
ON A.Sales_Agent = B.Sales_Agent
WHERE Deal_Stage = 'Won' 
GROUP BY Sales_Agent;


SELECT Sales_agent, Account, SUM(CAST(Close_Value AS UNSIGNED)) AS TOTAL
FROM cap08.TB_PIPELINE_VENDAS AS tbl
WHERE tbl.Deal_Stage  = 'Won'
GROUP BY Sales_Agent, Account
ORDER BY Sales_Agent, Account;

# 10- Número de vendas por agente de venda para as vendas concluídas com sucesso e valor de venda superior a 1000
SELECT A.Sales_Agent,
COUNT(CAST(B.Account AS UNSIGNED)) AS vendas,
B.Close_Value
FROM cap08.TB_VENDEDORES A
LEFT JOIN cap08.TB_PIPELINE_VENDAS B
ON A.Sales_Agent = B.Sales_Agent
WHERE Deal_Stage = 'Won' 
and Close_Value > 1000
GROUP BY Sales_Agent, Close_Value;

SELECT 	Sales_Agent,
		COUNT(tbl.Close_Value) AS total
FROM cap08.TB_PIPELINE_VENDAS AS tbl
WHERE tbl.Deal_Stage = 'Won'
AND tbl.Close_Value > 1000
GROUP BY tbl.Sales_Agent;

# 11- Número de vendas e a média do valor de venda por agente de vendas
SELECT A.Sales_Agent, 
COUNT(B.Account) as vendas,
ROUND(AVG(CAST(Close_Value AS UNSIGNED)),2) as Media_Venda
FROM cap08.TB_VENDEDORES A
LEFT JOIN cap08.TB_PIPELINE_VENDAS B
ON A.Sales_Agent = B.Sales_Agent
GROUP BY Sales_Agent
ORDER BY vendas DESC;

# 12- Quais agentes de vendas tiveram mais de 30 vendas?
SELECT A.Sales_Agent, COUNT(B.Account) AS VENDAS 
FROM cap08.TB_VENDEDORES A
LEFT JOIN cap08.TB_PIPELINE_VENDAS B
ON A.Sales_Agent = B.Sales_Agent
GROUP BY Sales_Agent
HAVING VENDAS > 30
ORDER BY VENDAS DESC;