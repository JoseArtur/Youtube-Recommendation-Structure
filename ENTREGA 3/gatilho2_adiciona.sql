-- impedir um usuario de visualizar um video sendo menor de idade e caso o video possua uma tag #+18
CREATE TRIGGER impedir_visualizacao 
BEFORE INSERT ON VISUALIZACAO
FOR EACH ROW
WHEN NOT EXISTS (
    SELECT * FROM UTILIZADOR, VIDEO,VIDEOTAG
    WHERE UTILIZADOR.IDUTILIZADOR  = NEW.IDUTILIZADOR
    AND  (cast ( strftime('%Y.%m%d', NEW.dataVisualizacao) - strftime('%Y.%m%d', Utilizador.dataNasc) as int) ) >= 18
    AND  VIDEO.IDVIDEO = NEW.IDVIDEO
    AND NEW.IDVIDEO = VIDEOTAG.IDVIDEO
    AND VIDEOTAG.NOME = '#+18'
)
BEGIN
     SELECT RAISE(IGNORE);
END
