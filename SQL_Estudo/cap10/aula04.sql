# Funções são normalmente usadadas para calculos,
# enquanto os procedimentos armazenados são normalmente
# usados para executar a lógica de negócios.

CREATE PROCEDURE proc_name([parametros])
BEGIN
corpo_da_procedure
END

CREATE FUNCTION func_name {[parametros]}
RETURNS data_type
BEGIN 
corpo_da_funcao
END

# Uma função deterministica sempre retorna o mesmo resutladao
# com os mesmos parametros de entrada no mesmo estado
# do banco de dados. Por exemplo POW, SUBSTR(), UCASE()
# Uma funcao nao deterministica nao retorna necessariamente
# sempre o mesmo resultado com os mesmos parametros
# de entrada no mesmo estado do banco de dados

DELIMITER //

CREATE FUNCTION func_name (numero INT)
RETURNS INT
DETERMINISTIC 
BEGIN

END 
// 
DELIMITER ;