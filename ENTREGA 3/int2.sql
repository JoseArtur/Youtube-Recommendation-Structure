.mode columns
.headers on
.nullvalue NULL
-- 2. Intervalo de duração dos videos mais bem sucedido ( recomendado)

select DISTINCT time(
         CAST(AVG(strftime('%s', duracao) * 1000 + SUBSTR(duracao, -3)) / 1000 AS INTEGER), 
         'unixepoch'
       ) average_time 
 from (select DISTINCT VIdeo.duracao as duracao from Video,Recomendado 
where video.idVideo = Recomendado.idVideo
group by Video.idVideo
order by count(recomendado.idVideo) DESC
LIMIT 3)
