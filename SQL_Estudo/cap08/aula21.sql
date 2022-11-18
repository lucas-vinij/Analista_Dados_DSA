SELECT 	IncidntNum,
		SUBSTR(IncidntNum, 1,4) AS local_code,
        SUBSTR(IncidntNum, -4,4) AS nacional_code
FROM cap08.TB_INCIDENTES;

SELECT 	IncidntNum,
		SUBSTRING(IncidntNum, 1, 4) as local_code,
        SUBSTRING(IncidntNum, -4,4) as nacional_code
FROM cap08.TB_INCIDENTES;