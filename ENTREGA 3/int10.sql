.mode columns
.headers on
.nullvalue NULL
--10. video com mais comentarios sem o max
SELECT DISTINCT 
    CASE WHEN TAB1 < TAB2 THEN TAB1 ELSE TAB2 END AS most_commented_video
FROM  
(
    SELECT 
        (select (v1.titulo) AS CNT1 from Comentario c1,Video V1 WHERE V1.IDVIDEO = C1.IDVIDEO group by c1.idvideo order by count(c1.idvideo) DESC)  AS TAB1 ,
        (select (v2.titulo) AS CNT2  from Comentario c2,video V2 WHERE V2.IDVIDEO = C2.IDVIDEO group by c2.idvideo order by count(c2.idvideo) DESC) AS TAB2
) comp;
