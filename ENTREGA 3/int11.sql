--11. utilizadores que visualizaram todos os videos recomendados- verificado

select Utilizador.idUtilizador, Utilizador.nome
from (select idUtilizador, count(idUtilizador) as cnt from (select Visualizacao.idUtilizador, Visualizacao.idVideo from Visualizacao, Recomendado where Visualizacao.idUtilizador = Recomendado.idUtilizador and Visualizacao.idVideo = Recomendado.idVideo)group by idUtilizador) T1,
(select idUtilizador, count(idUtilizador) as cnt from Recomendado group by idUtilizador) T2, Utilizador
where T1.idUtilizador = T2.idUtilizador  and T1.cnt = T2.cnt and T1.idUtilizador = Utilizador.idUtilizador
