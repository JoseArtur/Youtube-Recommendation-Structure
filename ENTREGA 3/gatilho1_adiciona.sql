
CREATE TRIGGER verifica_comentario
 BEFORE INSERT ON Comentario
FOR EACH ROW
when not exists (select * from Visualizacao
 where Visualizacao.idUtilizador = NEW.idUtilizador
 AND VISUALIZACAO.idVideo = NEW.IDVIDEO)
BEGIN
    SELECT RAISE(IGNORE);
END;