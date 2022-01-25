
SELECT 
  id1, id2, 
  sum(case when t2.idUtilizador is null then 0 else 1 end) as similar_video
from (
  select distinct 
    t1.idUtilizador id1, 
    t2.idUtilizador id2 
  from Visualizacao t1,Visualizacao t2 
  where t1.idUtilizador >t2.idUtilizador
) COMPARACAO
join Visualizacao t1 on COMPARACAO.id1 = t1.idUtilizador 
left join Visualizacao t2 on t1.idVideo = t2.idVideo 
                   and COMPARACAO.id2 = t2.idUtilizador 
                   and t1.idUtilizador != t2.idUtilizador
group by id1, id2
order by similar_video DESC
LIMIT 5