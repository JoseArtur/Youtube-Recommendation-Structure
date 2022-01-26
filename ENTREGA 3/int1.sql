.mode columns
.headers on
.nullvalue NULL
-- videos mais recomendados

SELECT Recomendado.idVideo, Video.titulo, COUNT(Recomendado.idVideo) as recomendations
FROM Recomendado, Video
WHERE Recomendado.idVideo = Video.idVideo
GROUP BY Recomendado.idVideo
ORDER BY  COUNT(Recomendado.idVideo)  DESC
