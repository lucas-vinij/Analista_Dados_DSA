# 1.
-- SELECT 
-- 	CASE
-- 		WHEN A.Name IS NULL THEN 'Sem Nome'
-- 			ELSE A.Name 
-- 		END AS name_athlet
-- ,A.NOC, A.Discipline, 
-- 	CASE
-- 		WHEN C.Name IS NULL THEN 'Sem Nome' 
-- 			ELSE C.Name
-- 		END AS name_coach,
-- C.NOC, C.Discipline Event 
-- FROM projeto_tokyo.Athletes AS A
-- INNER JOIN projeto_tokyo.Coaches AS C
-- ON A.Discipline = C.Discipline
-- WHERE A.Discipline = 'Handball';


