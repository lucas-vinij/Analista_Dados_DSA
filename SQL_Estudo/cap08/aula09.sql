SELECT * FROM cap08.TB_RECURSOS;
SELECT 
	emp,
    SUM(IF(recurso = 'email', quantidade, 0) ) AS 'emails',
    SUM(IF(recurso = 'print', quantidade, 0 ) ) AS 'printings',
    SUM(IF(recurso = 'sms', quantidade, 0 ) ) AS 'sms msgs'
FROM cap08.TB_RECURSOS
GROUP BY emp;

# Outra forma 

SELECT
	emp,
    GROUP_CONCAT(IF(recurso = 'email', quantidade, 0) ) AS 'emails',
    GROUP_CONCAT(IF(recurso = 'print', quantidade, 0) ) AS 'printings',
    GROUP_CONCAT(IF(recurso = 'sms', quantidade, 0 ) ) AS 'sms msgs'
FROM cap08.TB_RECURSOS
GROUP BY emp;

