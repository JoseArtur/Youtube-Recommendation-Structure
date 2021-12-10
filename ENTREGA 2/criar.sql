DROP TABLE IF EXISTS Utilizador;
 DROP TABLE IF EXISTS Canal;
  DROP TABLE IF EXISTS Comentario;
 DROP TABLE IF EXISTS Video;
 DROP TABLE IF EXISTS Tag;
 DROP TABLE IF EXISTS TipoConteudo;
 DROP TABLE IF EXISTS Visualizacao;

CREATE TABLE Utilizador (  
    iD INTEGER  NOT NULL PRIMARY KEY
        email VARCHAR(255) NOT NULL ,     
        nome CHAR(30) NOT NULL,
        dataNasc DATE NOT NULL,
        idade INTEGER CHECK (idade = CURRENT_DATE - dataNasc),
        morada VARCHAR(255),
        nacionalidade CHAR(30),
        genero CHAR(1) DEFAULT('?'),
 );

CREATE TABLE Canal
 (    idCanal INTEGER PRIMARY KEY,
      nome CHAR(30) UNIQUE,
      dataCriacao DATE,
      numeroSubscritores INTEGER,
      idioma CHAR(30),
      Video INTEGER REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Comentario(
    ID INTEGER PRIMARY KEY,
    Comentario VARCHAR(255),
    dataComentario  DATE CHECK (DATE<=CURRENT_DATE),
    Video INTEGER REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,
    Utilizador INTEGER REFERENCES Utilizador ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE( Video, Comentario, Utilizador)
)
CREATE TABLE Video(
    titulo CHAR(30),
    descricao VARCHAR(255),
    dataPublicacao DATE,
    numeroGostos INTEGER,
    numeroComentarios INTEGER,
    numeroVisualizacoes INTEGER,
    duracao TIME, //duvida
    TipoConteudo CHAR(30) REFERENCES TIpoConteudo(tipo)

);
CREATE TABLE Tag(
    nome CHAR(30),
)
CREATE TABLE TIpoConteudo(
    tipo CHAR(30) NOT NULL DEFAUTL ('NONE')
    Video INTEGER REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,

);

CREATE TABLE Visualizacao(
    ID  INTEGER PRIMARY KEY,
    dataVisualizacao  DATE CHECK(dataVisualizacao<=CURRENT_DATE),
    HoraInicio TIME NOT NULL,
    HoraFim TIME NOT NULL,
    Duracao TIME,  
    origem = CHAR(30),
    CHECK(HoraInicio < HoraFim),
    CHECK(Duracao = HoraInicio - HoraFim)
)
CREATE TABLE VisualizacaoVideo(
    Visualizacao INTEGER NOT NULL PRIMARY KEY,
    Video INTEGER NOT NULL REFERENCES Video ON UPDATE CASCADE ON DELETE CASCADE,
    quantidade INTEGER NOT NULL CHECK(quantidade=>0),
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