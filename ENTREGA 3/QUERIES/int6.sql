--6. total de videos recomendados que nao tem tag nem tipo de conteudo definido
select COUNT(DISTINCT video.idVideo)
from Video, Tag,VideoTag,Recomendado,TipoConteudo
where video.idVideo = recomendado.idVideo and videotag.idVideo= video.idVideo 
and Tag.nome = NULL and TipoConteudo.tipo = NULL
