        -- Création des tables --
-- Création de la table VETERINAIRES :
CREATE TABLE VETERINAIRES (
    numV INTEGER PRIMARY KEY AUTOINCREMENT,
    nomV TEXT,
    prenomV TEXT,
    adresseV TEXT,
    telephoneV TEXT,
    specialiteV TEXT
    )
;


-- Création de la table CLIENTS :
CREATE TABLE CLIENTS (
    numC INTEGER PRIMARY KEY AUTOINCREMENT,
    nomC TEXT,
    prenomC TEXT,
    adresseC TEXT,
    telephoneC TEXT
    )
;


-- Création de la table ANIMAUX :
CREATE TABLE ANIMAUX (
    numA INTEGER PRIMARY KEY AUTOINCREMENT,
    nomA TEXT,
    dateNaissanceA DATE,
    especeA TEXT,
    proprietaire INTEGER NOT NULL,
    FOREIGN KEY (proprietaire) REFERENCES CLIENTS(numC) ON DELETE CASCADE
    )
;


-- Création de la table SOINS :
CREATE TABLE SOINS (
    numS INTEGER PRIMARY KEY AUTOINCREMENT,
    dateS DATE, 
    veterinaireS INTEGER,
    animalS INTEGER NOT NULL,
    diagnosticS TEXT,
    traitementS TEXT,
    FOREIGN KEY (veterinaireS) REFERENCES VETERINAIRES(numV) ON DELETE SET NULL,
    FOREIGN KEY (animalS) REFERENCES ANIMAUX(numA) ON DELETE CASCADE
    )
;



        -- Insertion des données dans les tables créées --
INSERT INTO VETERINAIRES
SELECT DISTINCT numV, nomV, prenomV, adresseV, telephoneV, specialiteV
FROM CLINIQUE
;

INSERT INTO CLIENTS
SELECT DISTINCT numC, nomC, prenomC, adresseC, telephoneC
FROM CLINIQUE
;

INSERT INTO ANIMAUX
SELECT DISTINCT numA, nomA, dateNaissanceA, especeA, numC
FROM CLINIQUE
;

INSERT INTO SOINS
SELECT DISTINCT numS, dateS, numV, numA, diagnosticS, traitementS
FROM CLINIQUE
;