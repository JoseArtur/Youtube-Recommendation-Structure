DROP TABLE IF EXISTS Utilizador;
 DROP TABLE IF EXISTS Canal;
  DROP TABLE IF EXISTS Comentario;
 DROP TABLE IF EXISTS Video;
 DROP TABLE IF EXISTS Tag;
 DROP TABLE IF EXISTS TipoConteudo;
 DROP TABLE IF EXISTS Visualizacao;
PRAGMA foreign_keys = ON;
CREATE TABLE Utilizador (  
        ID INTEGER  PRIMARY KEY,
        email VARCHAR(255) NOT NULL ,     
        nome CHAR(30) NOT NULL,
        dataNasc DATE NOT NULL,
        nacionalidade CHAR(30) NOT NULL,
        morada VARCHAR(255),
        genero CHAR(1) DEFAULT('?')
 );

CREATE TABLE Canal(    
idCanal INTEGER PRIMARY KEY,
      nome CHAR(30) UNIQUE,
      dataCriacao DATE NOT NULL,
      numeroSubscritores INTEGER CHECK(NumeroSubscritores>=0),
      idioma CHAR(30),
      Video INTEGER REFERENCES Video
);
CREATE TABLE Comentario(
    ID INTEGER PRIMARY KEY,
    Comentario VARCHAR(255) NOT NULL,
    dataComentario  DATE,
    Video INTEGER REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,
    Utilizador INTEGER REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    Comentario1 VARCHAR(255) REFERENCES Comentario,
    UNIQUE( Video, Comentario, Utilizador)
);
CREATE TABLE Video(
ID INTEGER PRIMARY KEY,
    titulo CHAR(30) NOT NULL,
    descricao VARCHAR(255),
    dataPublicacaoDATE,
    numeroGostos INTEGER CHECK(numeroVisualizacoes>=NumeroGostos),
    numeroComentarios INTEGER,
    numeroVisualizacoes INTEGER,
    duracao TIME, 
    TipoConteudo CHAR(30) REFERENCES TipoConteudo(tipo)
);
CREATE TABLE Tag(
    ID INTEGER PRIMARY KEY,
    nome CHAR(30) 
);
CREATE TABLE TipoConteudo(
    tipo CHAR(30) NOT NULL DEFAULT ('NONE')
);
CREATE TABLE Visualizacao(
    ID  INTEGER PRIMARY KEY,
    dataVisualizacao  DATE ,
    Duracao TIME,  
    origem  CHAR(30)
);
CREATE TABLE VisualizacaoVideo(
    Visualizacao INTEGER  PRIMARY KEY,
    Video INTEGER NOT NULL REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,
    quantidade INTEGER NOT NULL CHECK(quantidade>=0),
    FOREIGN KEY (Visualizacao) REFERENCES Visualizacao ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Gosta (
    Utilizador INTEGER NOT NULL,
    Video INTEGER NOT NULL,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Denuncia (
    Utilizador INTEGER NOT NULL,
    Video INTEGER NOT NULL,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VerMaisTarde (
    Utilizador INTEGER NOT NULL,
    Video INTEGER NOT NULL,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Recomendado (
    Utilizador INTEGER NOT NULL,
    Video INTEGER NOT NULL,
    PRIMARY KEY(Utilizador, Video),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Curte (
    Utilizador INTEGER NOT NULL,
    Comentario INTEGER NOT NULL,
    PRIMARY KEY(Utilizador, Comentario),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Comentario) REFERENCES Comentario ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Subscreve (
    Utilizador INTEGER NOT NULL,
    Canal INTEGER NOT NULL,
    PRIMARY KEY(Utilizador, Canal),
    FOREIGN KEY (Utilizador) REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Canal) REFERENCES Canal ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VideoTag (
    Tag INTEGER NOT NULL,
    Video INTEGER NOT NULL,
    PRIMARY KEY(Tag, Video),
    FOREIGN KEY (Tag) REFERENCES Tag ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Video) REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);