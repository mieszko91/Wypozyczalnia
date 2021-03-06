-- Generated by Oracle SQL Developer Data Modeler 4.0.1.836
--   at:        2014-04-04 13:44:50 CEST
--   site:      SQL Server 2008
--   type:      SQL Server 2008




CREATE
  TABLE Cz��
  (
    Nazwa VARCHAR (100) NOT NULL ,
    Cena FLOAT (2) ,
    Status_cz�ci_Status_cz�ci_ID NUMERIC (28) NOT NULL ,
    Statek_Statek_ID               NUMERIC (28) ,
    Zam�wienie_Zam�wienie_ID       NUMERIC (28) NOT NULL
  )
  ON "default"
GO

CREATE
  TABLE Funkcja
  (
    Nazwa_funkcji VARCHAR (50) NOT NULL ,
    Funkcja_ID    NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    CONSTRAINT Funkcja_PK PRIMARY KEY CLUSTERED (Funkcja_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default" ,
  CONSTRAINT Funkcja__UN UNIQUE NONCLUSTERED (Nazwa_funkcji) ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Klient
  (
    Imi�      VARCHAR (50) NOT NULL ,
    Nazwisko  VARCHAR (50) NOT NULL ,
    Nr_dowodu VARCHAR (20) NOT NULL ,
    Klient_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    CONSTRAINT Klient_PK PRIMARY KEY CLUSTERED (Klient_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Pracownik
  (
    Imi�              VARCHAR (50) NOT NULL ,
    Nazwisko          VARCHAR (50) NOT NULL ,
    Data_urodzenia    DATE NOT NULL ,
    Miejsce_urodzenia VARCHAR (100) NOT NULL ,
    Pensja FLOAT (2) NOT NULL ,
    Pracownik_ID       NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    Funkcja_Funkcja_ID NUMERIC (28) NOT NULL ,
    CONSTRAINT Pracownik_PK PRIMARY KEY CLUSTERED (Pracownik_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Rezerwacja
  (
    Data_wypo�yczenia DATE NOT NULL ,
    Data_zwrotu       DATE ,
    Rezerwacja_ID     NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    Statek_Statek_ID  NUMERIC (28) NOT NULL ,
    Klient_Klient_ID  NUMERIC (28) NOT NULL ,
    CONSTRAINT Rezerwacja_PK PRIMARY KEY CLUSTERED (Rezerwacja_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Statek
  (
    Silnik        VARCHAR (100) NOT NULL ,
    Rok_produkcji INTEGER NOT NULL ,
    Cena_za_dob� FLOAT (2) NOT NULL ,
    Statek_ID                NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    Typ_statku_Typ_statku_ID NUMERIC (28) NOT NULL ,
    CONSTRAINT Statek_PK PRIMARY KEY CLUSTERED (Statek_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Status_cz�ci
  (
    Status           VARCHAR (50) NOT NULL ,
    Status_cz�ci_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    CONSTRAINT Status_cz�ci_PK PRIMARY KEY CLUSTERED (Status_cz�ci_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default" ,
  CONSTRAINT Status_cz�ci__UN UNIQUE NONCLUSTERED (Status) ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Typ_statku
  (
    Nazwa_typu    VARCHAR (100) NOT NULL ,
    Typ_statku_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    CONSTRAINT Typ_statku_PK PRIMARY KEY CLUSTERED (Typ_statku_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default" ,
  CONSTRAINT Typ_statku__UN UNIQUE NONCLUSTERED (Nazwa_typu) ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Zam�wienie
  (
    Data_zam�wienia DATE NOT NULL ,
    Data_odbioru    DATE ,
    Zam�wienie_ID   NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION ,
    CONSTRAINT Zam�wienie_PK PRIMARY KEY CLUSTERED (Zam�wienie_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE jest_serwisowany
  (
    Pracownik_Pracownik_ID NUMERIC (28) NOT NULL ,
    Statek_Statek_ID       NUMERIC (28) NOT NULL ,
    CONSTRAINT jest_serwisowany__IDX PRIMARY KEY CLUSTERED (
    Pracownik_Pracownik_ID, Statek_Statek_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE pilotuje
  (
    Pracownik_Pracownik_ID   NUMERIC (28) NOT NULL ,
    Rezerwacja_Rezerwacja_ID NUMERIC (28) NOT NULL ,
    CONSTRAINT pilotuje__IDX PRIMARY KEY CLUSTERED (Pracownik_Pracownik_ID,
    Rezerwacja_Rezerwacja_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

ALTER TABLE Cz��
ADD CONSTRAINT Cz��_Statek_FK FOREIGN KEY
(
Statek_Statek_ID
)
REFERENCES Statek
(
Statek_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Cz��
ADD CONSTRAINT Cz��_Status_cz�ci_FK FOREIGN KEY
(
Status_cz�ci_Status_cz�ci_ID
)
REFERENCES Status_cz�ci
(
Status_cz�ci_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Cz��
ADD CONSTRAINT Cz��_Zam�wienie_FK FOREIGN KEY
(
Zam�wienie_Zam�wienie_ID
)
REFERENCES Zam�wienie
(
Zam�wienie_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE jest_serwisowany
ADD CONSTRAINT FK_ASS_3 FOREIGN KEY
(
Pracownik_Pracownik_ID
)
REFERENCES Pracownik
(
Pracownik_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE jest_serwisowany
ADD CONSTRAINT FK_ASS_4 FOREIGN KEY
(
Statek_Statek_ID
)
REFERENCES Statek
(
Statek_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE pilotuje
ADD CONSTRAINT FK_ASS_7 FOREIGN KEY
(
Pracownik_Pracownik_ID
)
REFERENCES Pracownik
(
Pracownik_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE pilotuje
ADD CONSTRAINT FK_ASS_8 FOREIGN KEY
(
Rezerwacja_Rezerwacja_ID
)
REFERENCES Rezerwacja
(
Rezerwacja_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Pracownik
ADD CONSTRAINT Pracownik_Funkcja_FK FOREIGN KEY
(
Funkcja_Funkcja_ID
)
REFERENCES Funkcja
(
Funkcja_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Rezerwacja
ADD CONSTRAINT Rezerwacja_Klient_FK FOREIGN KEY
(
Klient_Klient_ID
)
REFERENCES Klient
(
Klient_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Rezerwacja
ADD CONSTRAINT Rezerwacja_Statek_FK FOREIGN KEY
(
Statek_Statek_ID
)
REFERENCES Statek
(
Statek_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Statek
ADD CONSTRAINT Statek_Typ_statku_FK FOREIGN KEY
(
Typ_statku_Typ_statku_ID
)
REFERENCES Typ_statku
(
Typ_statku_ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
