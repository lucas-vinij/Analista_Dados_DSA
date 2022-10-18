# Exercicios 
-- 1- Quais embarcações possuem pontuação de risco igual a 310?
-- SELECT *
-- FROM cap02.TB_NAVIOS
-- WHERE pontuacao_risco = 310

-- 2- Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?
-- SELECT *
-- FROM cap02.TB_NAVIOS
-- WHERE classificacao_risco = 'A' AND indice_conformidade >= 95
-- ORDER BY indice_conformidade

-- 3- Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?
-- SELECT *
-- FROM cap02.TB_NAVIOS
-- WHERE classificacao_risco IN ('C','D') AND indice_conformidade <= 95
-- ORDER BY indice_conformidade

-- 4- Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?
-- SELECT *
-- FROM cap02.TB_NAVIOS
-- WHERE classificacao_risco = 'A' AND pontuacao_risco = 0
-- ORDER BY nome_navio

-- [DESAFIO] Quais embarcações foram inspecionadas em Dezembro de 2016?
-- SELECT *
-- FROM cap02.TB_NAVIOS
-- WHERE mes_ano = '12/2016'
-- ORDER BY nome_navio