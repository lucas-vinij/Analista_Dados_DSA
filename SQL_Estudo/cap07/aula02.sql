# Instrucao perigoso - Somente utilize se souber oq está fazendo
SET SQL_SAFE_UPDATES = 0;

UPDATE cap07.covid_mortes
SET date = str_to_date(date, "%d/%m/%y");

UPDATE cap07.covid_vacinacao
SET date = str_to_date(date, "%d/%m/%y");

SET SQL_SAFE_UPDATES = 1;
