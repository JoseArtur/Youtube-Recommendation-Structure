--7. video recomendado de acordo com cada tipo de conteudo e o nome do respectivo canal
SELECT TipoConteudo.tipo,Video.titulo, Canal.nome
FROM TipoConteudo,Recomendado,Video,Canal
WHERE TipoConteudo.idTC = Video.idTC AND Recomendado.idVideo = Video.idVideo AND Video.idCanal = Canal.idCanal
GROUP BY TipoConteudo.tipo,Canal. idCanal
