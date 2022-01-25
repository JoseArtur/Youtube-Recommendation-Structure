 --o canal com mais videos recomendados de acordo com a faixa etária dos visualizadores - 
 WITH 
GroupAge AS
(
  SELECT Age,
         CASE
			 WHEN AGE BETWEEN 0 AND 10 THEN '0 - 10' 
             WHEN AGE BETWEEN 10 AND 20 THEN '10- 20'
             WHEN AGE BETWEEN 20 AND 30 THEN '20 - 30'
             WHEN AGE BETWEEN 30 AND 40 THEN '30 - 40'
			 WHEN AGE BETWEEN 40 AND 50 THEN '40 - 50'
             WHEN AGE > 50 THEN 'Over 50'
             ELSE 'ERROR DATE '
         END AS [Age Groups]
  FROM ( 
  SELECT
 DISTINCT (cast ( strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', Utilizador.dataNasc) as int) )as  age

 from Canal,Video, Recomendado,Visualizacao,Utilizador
where Canal.idCanal = video.idCanal
and video.idVideo = recomendado.idVideo
and  utilizador.idUtilizador = recomendado.idUtilizador)
)
SELECT  [Age Groups],COUNT(*) AS users
FROM GroupAge
GROUP BY [Age Groups];