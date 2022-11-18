# ERRO
SELECT A.nome_cliente, A.localidade_sede AS localidade_sede
FROM cap08.TB_CLIENTES_INT AS A
UNION 
SELECT B.nome_cliente
FROM cap08.TB_CLIENTES_LOC AS B;

# CERTO
SELECT A.nome_cliente, A.localidade_sede AS localidade_sede
FROM cap08.TB_CLIENTES_INT AS A
UNION
SELECT B.nome_cliente, "USA" AS localidade_sede
FROM cap08.TB_CLIENTES_LOC AS B;


# O cliente 'Ganjaflex' aparece nas duas tabelas de clientes?
SELECT A.nome_cliente,A.faturamento, A.localidade_sede
FROM cap08.TB_CLIENTES_INT A
WHERE A.nome_cliente = 'Ganjaflex'
UNION 
SELECT B.nome_cliente,B.faturamento, "USA" localidade_sede
FROM cap08.TB_CLIENTES_LOC B
WHERE B.nome_cliente = 'Ganjaflex';


# Quais as clientes internacionais que aparecem na tabela de cliente locais? 
SELECT nome_cliente
FROM cap08.TB_CLIENTES_INT
WHERE TRIM(nome_cliente) IN (SELECT TRIM(nome_cliente) FROM cap08.TB_CLIENTES_LOC);

# Qual a media de faturamento por localidade?
# Clientes = EUA. Resultado deve ser organizado pela media de faturamento 
SELECT ROUND(AVG(A.faturamento),2) AS media_faturamento, A.localidade_sede AS localidade_sede
FROM cap08.TB_CLIENTES_INT AS A
GROUP BY localidade_sede
UNION 
SELECT ROUND(AVG(B.faturamento),2) AS media_faturamento, "USA" AS localidade_sede
FROM cap08.TB_CLIENTES_LOC AS B
GROUP BY localidade_sede
ORDER BY media_faturamento;