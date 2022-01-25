--9. para todos os pares de utilizadores, quais os videos que eles assisitram em similaridade, ou o numero de videos similares - 
SELECT 
  id1, id2, 
  sum(case when t2.idUtilizador is null then 0 else 1 end) as similar_video
from (
  select distinct 
    t1.idUtilizador id1, 
    t2.idUtilizador id2 
  from Recomendado t1,Recomendado t2 
  where t1.idUtilizador > t2.idUtilizador
) COMPARACAO
join Recomendado t1 on COMPARACAO.id1 = t1.idUtilizador 
left join Recomendado t2 on t1.idVideo = t2.idVideo 
                   and COMPARACAO.id2 = t2.idUtilizador 
                   and t1.idUtilizador != t2.idUtilizador
group by id1, id2
order by similar_video DESC
LIMIT 5