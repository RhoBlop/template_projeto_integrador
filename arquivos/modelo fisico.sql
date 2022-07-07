/* Lógico_1: */

DROP SCHEMA IF EXISTS CONTRATAI;

CREATE DATABASE CONTRATAI;

USE CONTRATAI;

CREATE TABLE Usuario (
    idUsr INT PRIMARY KEY,
    nomUsr varchar(50),
    datNascimentoUsr date,
    numTelefoneUsr varchar(13),
    numCPFUsr char(13),
    dscFotoUsr varchar(50),
    dscEmailUsr varchar(100),
    dscSenhaUsr varchar(100),
    idBairro INT
);

CREATE TABLE Cidade (
    idCidade INT PRIMARY KEY,
    dscCidade varchar(200),
    idEstado INT
);

CREATE TABLE Estado (
    idEstado INT PRIMARY KEY,
    dscEstado varchar(200)
);

CREATE TABLE Bairro (
    idBairro INT PRIMARY KEY,
    dscBairro varchar(200),
    idCidade INT
);

CREATE TABLE Profissao (
    idProf INT PRIMARY KEY,
    dscProf varchar(50)
);

CREATE TABLE Especializacao (
    idEspec INT PRIMARY KEY,
    dscEspec varchar(50),
    idProf INT
);

CREATE TABLE Contato (
    idCont INT PRIMARY KEY,
    dscTopicoCont varchar(100),
    dscMensagemContr varchar(500),
    fk_Usuario_idUsr INT
);

CREATE TABLE Disponibilidade (
    idDisp INT PRIMARY KEY,
    idUsr INT,
    datInicioDisp date,
    datFimDisp date,
    idDiaSemn INT
);

CREATE TABLE Dia_Semana (
    idDiaSemn INT PRIMARY KEY,
    dscDiaSemn varchar(100)
);

CREATE TABLE Avaliacao (
    idAvalia INT PRIMARY KEY,
    idAvaliador INT,
    idAvaliado INT,
    numNotaAvalia integer,
    dscComentarioAvalia varchar(200),
    dscImagemAvalia varchar(100)
);

CREATE TABLE Contrato (
    idContrt INT PRIMARY KEY,
    idContratante INT,
    idContratado INT,
    datInicioContrt date,
    datFimContrt date
);

CREATE TABLE UsrEspec (
    idUsr INT,
    idEspec INT
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (idBairro)
    REFERENCES Bairro (idBairro)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (idEstado)
    REFERENCES Estado (idEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (idCidade)
    REFERENCES Cidade (idCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Especializacao ADD CONSTRAINT FK_Especializacao_2
    FOREIGN KEY (idProf)
    REFERENCES Profissao (idProf)
    ON DELETE CASCADE;
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_2
    FOREIGN KEY (fk_Usuario_idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Disponibilidade ADD CONSTRAINT FK_Disponibilidade_2
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE RESTRICT;
 
ALTER TABLE Disponibilidade ADD CONSTRAINT FK_Disponibilidade_3
    FOREIGN KEY (idDiaSemn)
    REFERENCES Dia_Semana (idDiaSemn)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (idAvaliador)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_3
    FOREIGN KEY (idAvaliado)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_2
    FOREIGN KEY (idContratante)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE Contrato ADD CONSTRAINT FK_Contrato_3
    FOREIGN KEY (idContratado)
    REFERENCES Usuario (idUsr)
    ON DELETE CASCADE;
 
ALTER TABLE UsrEspec ADD CONSTRAINT FK_UsrEspec_1
    FOREIGN KEY (idUsr)
    REFERENCES Usuario (idUsr)
    ON DELETE SET NULL;
 
ALTER TABLE UsrEspec ADD CONSTRAINT FK_UsrEspec_2
    FOREIGN KEY (idEspec)
    REFERENCES Especializacao (idEspec)
    ON DELETE SET NULL;