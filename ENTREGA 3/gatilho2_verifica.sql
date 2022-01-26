INSERT INTO Utilizador  VALUES
 (998, 'emailficticio@gmail.com', 'Utilizador Teste', '2000-04-25', 'Local Ficticio', 'LF', 'F');
  INSERT INTO Canal  VALUES 
  (999, '	Canal ficticio', '2006-08-21', 'LF', 998);
   INSERT INTO Video VALUES
 (999, 'Video Ficticio','nao foi facil', '2016-12-12', '00:08:05.3', 999,1);
 INSERT INTO VIDEOTAG VALUES('#+18',999);
  -- o utilizador de id 999 visualizou o video de id 999 EM 2016 quando tinha 16 anos
 INSERT INTO Visualizacao VALUES (999, 999, '2016-12-22', '00:07:04', 'pesquisa', 998);
select * from Visualizacao WHERE idVisualizacao = 999;

DELETE FROM UTILIZADOR WHERE IDUTILIZADOR = 998;
DELETE FROM VIDEOTAG WHERE IDVIDEO = 999;
DELETE FROM VIDEO WHERE IDVIDEO = 999;
DELETE FROM CANAL WHERE IDCANAL = 999;
DELETE FROM UTILIZADOR WHERE IDUTILIZADOR = 998;

