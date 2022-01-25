-- videos mais recomendados
SELECT Recomendado.idVideo, Video.titulo, COUNT(Recomendado.idVideo) as views
FROM Recomendado, Video
WHERE Recomendado.idVideo = Video.idVideo
GROUP BY Recomendado.idVideo
ORDER BY  COUNT(Recomendado.idVideo)  DESC
