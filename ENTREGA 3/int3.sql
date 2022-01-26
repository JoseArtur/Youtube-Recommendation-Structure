.mode columns
.headers on
.nullvalue NULL
--int3.sql
select X.idCanal , Canal.nome
from Canal,(select idCanal, count(distinct idTC) as cnt 
      from (select Video.idCanal, video.IDTC 
            from Video, Canal where canal.idCanal = video.idCanal and Video.idTC <> 'NONE' and video.idVideo in
                                                    (select distinct Recomendado.idVideo 
                                                     from Recomendado,Visualizacao 
                                                     where recomendado.idVideo = Visualizacao.idVideo)) 
      group by idCanal)X
WHERE Canal.idCanal = X.idCanal 
GROUP BY X.cnt
HAVING cnt >= 4 
