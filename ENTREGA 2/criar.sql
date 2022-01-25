DROP TABLE IF EXISTS Utilizador;
DROP TABLE IF EXISTS Visualizacao;
DROP TABLE IF EXISTS Video;
DROP TABLE IF EXISTS VisualizacaoVideo;
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
PRAGMA foreign_keys = ON;

CREATE TABLE Utilizador (  
        idUtilizador INTEGER,
        email VARCHAR(255) NOT NULL UNIQUE ,     
        nome CHAR(30) NOT NULL,
        dataNasc DATE NOT NULL,
        nacionalidade CHAR(30) NOT NULL,
        morada VARCHAR(255),
        genero CHAR(1) DEFAULT('?'),
        CONSTRAINT UtilizadorPK PRIMARY KEY (idUtilizador)
 );

CREATE TABLE Visualizacao(
    idVisualizacao  INTEGER,
    dataVisualizacao  DATE ,
    Duracao TIME,  
    origem  CHAR(30),
    CONSTRAINT VisualizacaoPK PRIMARY KEY (idVisualizacao),
    CONSTRAINT VisualizacaoVideoFK FOREIGN KEY (idVideo)  REFERENCES Video(idVideo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Video(
    idVideo INTEGER,
    titulo CHAR(30) NOT NULL,
    descricao VARCHAR(255),
    dataPublicacaoDATE,
    numeroGostos INTEGER CHECK(numeroVisualizacoes>=NumeroGostos),
    numeroComentarios INTEGER,
    numeroVisualizacoes INTEGER,
    duracao TIME, 
     CONSTRAINT VideoPK PRIMARY KEY (idVideo),
    TipoConteudo CHAR(30) REFERENCES TipoConteudo(tipo)
);

CREATE TABLE VisualizacaoVideo(
    Visualizacao INTEGER,
    Video INTEGER NOT NULL REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,
    quantidade INTEGER NOT NULL CHECK(quantidade>=0),
     CONSTRAINT VisualizacaoVideoPK PRIMARY KEY (Visualizacao),
    FOREIGN KEY (Visualizacao) REFERENCES Visualizacao ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Canal(    
      idCanal INTEGER PRIMARY KEY,
      nome CHAR(30) UNIQUE,
      dataCriacao DATE NOT NULL,
      numeroSubscritores INTEGER CHECK(NumeroSubscritores>=0),
      idioma CHAR(30),
      Video INTEGER REFERENCES Video,
       CONSTRAINT CanalPK PRIMARY KEY (idCanal),
    Utilizador INTEGER REFERENCES Utilizador NOT NULL ON UPDATE CASCADE ON DELETE CASCADE

);
CREATE TABLE Comentario(
    ID INTEGER PRIMARY KEY,
    texto VARCHAR(255) NOT NULL,
    dataComentario  DATE,
    Video INTEGER REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,
    Utilizador INTEGER REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    Comentario1 VARCHAR(255) REFERENCES Comentario,
    UNIQUE( Video, Utilizador)
);
CREATE TABLE Recomendado (
    Utilizador INTEGER ,
    Video INTEGER ,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE TipoConteudo(
    
    tipo CHAR(30) PRIMARY KEY DEFAULT ('NONE')
);
CREATE TABLE Tag(
    ID INTEGER PRIMARY KEY,
    nome CHAR(30) 
);

CREATE TABLE Gosta (
    Utilizador INTEGER ,
    Video INTEGER ,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Denuncia (
    Utilizador INTEGER ,
    Video INTEGER ,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VerMaisTarde (
    Utilizador INTEGER ,
    Video INTEGER ,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Curte (
    Utilizador INTEGER ,
    Comentario INTEGER ,
    PRIMARY KEY(Utilizador, Comentario),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Comentario) REFERENCES Comentario ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Subscreve (
    Utilizador INTEGER ,
    Canal INTEGER ,
    PRIMARY KEY(Utilizador, Canal),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Canal) REFERENCES Canal ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VideoTag (
    Tag INTEGER ,
    Video INTEGER ,
    PRIMARY KEY(Tag, Video),
    FOREIGN KEY (Tag) REFERENCES Tag ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);