DROP TABLE IF EXISTS Utilizador;
DROP TABLE IF EXISTS Visualizacao;
DROP TABLE IF EXISTS Video;
DROP TABLE IF EXISTS Canal;
DROP TABLE IF EXISTS Comentario;
DROP TABLE IF EXISTS Interacao;
DROP TABLE IF EXISTS TipoConteudo;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Curte;
DROP TABLE IF EXISTS Gosta;
DROP TABLE IF EXISTS Denuncia;
DROP TABLE IF EXISTS VerMaisTarde;
DROP TABLE IF EXISTS VideoTag;
DROP TABLE IF EXISTS Subscreve;
DROP TABLE IF EXISTS Recomendado;
DROP TABLE IF EXISTS Interacao;

PRAGMA foreign_keys = ON;

CREATE TABLE Utilizador (  
        idUtilizador INTEGER,
        email TEXT NOT NULL UNIQUE ,     
        nome TEXT NOT NULL,
        dataNasc DATE NOT NULL,
        morada TEXT,
        nacionalidade TEXT NOT NULL,
        genero CHAR(1) DEFAULT('?'),
        CONSTRAINT UtilizadorPK PRIMARY KEY (idUtilizador)
 );
CREATE TABLE Canal(    
      idCanal INTEGER,
      nome TEXT UNIQUE NOT NULL,
      dataCriacao DATE NOT NULL,
      idioma TEXT,
      idUtilizador INTEGER NOT NULL,
       CONSTRAINT CanalPK PRIMARY KEY (idCanal),
       CONSTRAINT CanalUtilizadorFK FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Visualizacao(
    idVideo INTEGER NOT NULL,
    idVisualizacao  INTEGER NOT NULL,
    dataVisualizacao  DATE NOT NULL ,
    duracaoAssistida TEXT,  
    origem  TEXT CHECK(origem = 'recomendacao' OR origem = 'pesquisa'),
    idUtilizador INTEGER NOT NULL,
    CONSTRAINT VisualizacaoPK PRIMARY KEY (idVisualizacao),
        CONSTRAINT VisualizacaoVideoFK FOREIGN KEY (idVideo)  REFERENCES Video(idVideo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT VisualizacaoUtilizadorFK FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Video(
    idVideo INTEGER,
    titulo TEXT NOT NULL,
    descricao TEXT,
    dataPublicacao DATE NOT NULL,
    duracao TEXT, 
    idCanal INTEGER NOT NULL,
    idTC TEXT ,
    CONSTRAINT VideoPK PRIMARY KEY (idVideo),
    CONSTRAINT VideoCanalFK FOREIGN KEY (idCanal)  REFERENCES Canal(idCanal) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT VideoTipoConteudoFK FOREIGN KEY (idTC)  REFERENCES TipoConteudo(idTC) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Comentario(
    idComentario INTEGER ,
    texto TEXT NOT NULL,
    dataComentario  DATE NOT NULL,
     idVideo INTEGER NOT NULL,
    idUtilizador INTEGER NOT NULL,
    CONSTRAINT ComentarioPK PRIMARY KEY (idComentario),
    CONSTRAINT ComentarioUtilizadorFK FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ComentarioVideoFK FOREIGN KEY (idVideo)  REFERENCES Video(idVideo) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Interacao(
     idComentarioOriginal INTEGER NOT NULL ,
     idResposta  INTEGER NOT NULL,
    CONSTRAINT Interacao PRIMARY KEY (idResposta),
    CONSTRAINT InteracaoFK1 FOREIGN KEY (idComentarioOriginal)  REFERENCES Comentario(idComentario) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT InteracaoFK2 FOREIGN KEY (idResposta)  REFERENCES Comentario(idComentario) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Recomendado (
    idUtilizador INTEGER NOT NULL ,
    idVideo INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idUtilizador,idVideo),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (idVideo)  REFERENCES Video(idVideo)
    ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE TipoConteudo(
    idTC INTEGER,
    tipo TEXT DEFAULT ('NONE') CHECK(
    tipo ='desportos' 
     OR tipo ='jogos' 
     OR  tipo ='musica'  
     OR  tipo = 'noticias'),
    CONSTRAINT TipoConteudoPK PRIMARY KEY (idTC)
);
CREATE TABLE Tag(
    nome TEXT DEFAULT ('NONE'),
    CONSTRAINT TagPK PRIMARY KEY (nome)
);
CREATE TABLE Gosta (
    idUtilizador INTEGER NOT NULL ,
    idVideo INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idUtilizador,idVideo),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (idVideo)  REFERENCES Video(idVideo)
    ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE Denuncia (
   idUtilizador INTEGER NOT NULL ,
    idVideo INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idUtilizador,idVideo),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (idVideo)  REFERENCES Video(idVideo)
    ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE VerMaisTarde (
    idUtilizador INTEGER NOT NULL ,
    idVideo INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idUtilizador,idVideo),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (idVideo)  REFERENCES Video(idVideo)
    ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE Curte (
   idUtilizador INTEGER NOT NULL ,
    idComentario INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idUtilizador,idComentario),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (idComentario)  REFERENCES Comentario(idComentario)
    ON UPDATE CASCADE ON DELETE CASCADE
    );


CREATE TABLE VideoTag (
    nome TEXT   ,
    idVideo INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idVideo,nome),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idVideo)  REFERENCES Video(idVideo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (nome)  REFERENCES Tag(nome) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE Subscreve (
   idUtilizador INTEGER NOT NULL ,
    idCanal INTEGER NOT NULL,
    CONSTRAINT RecomendadoPK PRIMARY KEY (idUtilizador,idCanal),
    CONSTRAINT RecomendadoFK1 FOREIGN KEY (idUtilizador)  REFERENCES Utilizador(idUtilizador) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RecomendadoFK2 FOREIGN KEY (idCanal)  REFERENCES Canal(idCanal)
    ON UPDATE CASCADE ON DELETE CASCADE
    );

