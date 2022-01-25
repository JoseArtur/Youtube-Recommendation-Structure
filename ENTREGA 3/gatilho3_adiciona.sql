CREATE TRIGGER numeroSubscritores
AFTER INSERT ON Subscreve
FOR EACH ROW
BEGIN
    UPDATE Canal
    SET numeroSubscritores = (Canal.numeroSubscritores +  1)
    WHERE Canal.idCanal = New.idCanal;
END;