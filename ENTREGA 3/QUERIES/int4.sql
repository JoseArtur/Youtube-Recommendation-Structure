--4.percentagem *media* de duracao assistida

SELECT  Video.titulo,avg((strftime('%H',Visualizacao.duracaoAssistida)*60*60
+strftime('%M',Visualizacao.duracaoAssistida)*60 +
 STRFTIME('%S', VISUALIZACAO.duracaoAssistida))*1.0
 /(strftime('%H',VIDEO.duracao)*60*60+strftime('%M',VIDEO.duracao)*60 +
 STRFTIME('%S', VIDEO.duracao))*100) AS percentage_watched
FROM Video, Visualizacao
WHERE (Video.idVideo = Visualizacao.idVideo )
group by Video.idVideo
