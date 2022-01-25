INSERT INTO Utilizador  VALUES
 (998, 'emailficticio@gmail.com', 'Utilizador Teste', '2000-04-25', 'Local Ficticio', 'LF', 'F'),
 (999, 'emailficticio2@gmail.com', 'Utilizador Teste2 ', '1965-03-02', 'Local Ficticio', 'LF', 'M');
 INSERT INTO Canal  VALUES 
  (999, '	Canal ficticio', '2006-08-21', 'LF', 998),
 (1000, '	Segundo Canal ficticio', '2008-10-02', 'LF', 999);

 INSERT INTO Video VALUES
 (999, 'Video Ficticio','nao foi facil', '2016-12-12', '00:08:05.3', 999,1);
 INSERT INTO Visualizacao VALUES
 -- o utilizador de id 999 visualizou o video de id 999;
 (999, 999, '2018-11-22', '00:07:04', 'pesquisa', 999);
 INSERT INTO Comentario VALUES
 -- o utilizador de id999 comentou o video de id 999;
(999, 'comentario ficticio', '2021-08-23', 999, 999),
-- o utilizador de id998 tentou comentar, mas nao consegue pq nao visualizou o video de id999
(1000, 'Outro comentario', '2021-08-23', 999, 998);
select * from Comentario WHERE idComentario = 998;

DELETE FROM UTILIZADOR WHERE IDUTILIZADOR = 998;
DELETE FROM COMENTARIO WHERE IDCOMENTARIO =999;
DELETE FROM VISUALIZACAO WHERE IDVISUALIZACAO = 999;
DELETE FROM VIDEO WHERE IDVIDEO = 999;
DELETE FROM TIPOCONTEUDO WHERE IDTC =999;
DELETE FROM CANAL WHERE IDCANAL = 999;
DELETE FROM CANAL WHERE IDCANAL = 1000;
DELETE FROM UTILIZADOR WHERE IDUTILIZADOR = 998;
DELETE FROM UTILIZADOR WHERE IDUTILIZADOR = 999;