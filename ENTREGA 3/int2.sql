-- 2. Intervalo de duração dos videos mais bem sucedido ( recomendado)

select DISTINCT time(
         CAST(AVG(strftime('%s', Video.duracao) * 1000 + SUBSTR(Video.duracao, -3)) / 1000 AS INTEGER), 
         'unixepoch'
       ) average_time 
 from Video,
(select DISTINCT VIdeo.duracao from Video,Recomendado 
where video.idVideo = Recomendado.idVideo
group by Video.idVideo
order by count(recomendado.idVideo) DESC)
