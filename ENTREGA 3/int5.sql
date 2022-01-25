--5. tipo mais recomendaado

SELECT best_tipo
FROM (SELECT tipos AS best_tipo, MAX(count_tipo)
FROM (SELECT TipoConteudo.tipo AS tipos, COUNT(TipoConteudo.tipo) AS count_tipo
FROM TipoConteudo, Video, Recomendado
WHERE (TipoConteudo.idTC = Video.idTC  AND Recomendado.idVideo = Video.idVideo)
GROUP BY tipos))
