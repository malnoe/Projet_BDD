-- 4-clinique-dml.sql

-- 1. Ajouter un nouveau vétérinaire.
INSERT INTO VETERINAIRES (nomV,prenomV,adresseV,telephoneV,specialiteV)
VALUES ("Le Ru","Lili","28, Rue des Chênes, 29280 Plouzané","06 17 49 56 45","Lieu jaune")
;

-- 2. Ajouter un nouveau client.
INSERT INTO CLIENTS (nomC, prenomC, adresseC, telephoneC)
VALUES ("Blanc","Hubert","3, rue porte de la mort, 66600 Bord-du-Styx","06 66 13 42 07")
;

-- 3. Ajouter un nouvel animal pour le client précédemment ajouté.
INSERT INTO ANIMAUX (nomA, dateNaissanceA, especeA, proprietaire)
VALUES ("Zorg","2010-09-08","Poissons", (SELECT numC FROM CLIENTS WHERE nomC = "Blanc"))
;

-- 4. Ajouter un nouveau soin pour le vétérinaire et l'animal précédemment ajoutés.
INSERT INTO SOINS (dateS, veterinaireS, animalS, diagnosticS, traitementS)
VALUES ("2019-12-22",(SELECT numV FROM VETERINAIRES WHERE nomV = "Le Ru"),(SELECT numA FROM ANIMAUX WHERE nomA = "Zorg"), "Assez vieux, nécessite une attention particulière pour un développement des arômes optimal","1. Préparer un beurre blanc et le garder au chaud. 2. Préparer le poisson et le faire cuire à feu doux. 3. Faire cuire des patates. 4. Dégustez.")
;

-- 5. Modifier le nom du vétérinaire numéro 1
UPDATE VETERINAIRES
SET nomV = 'Carnav'
WHERE numV = 1
;

-- 6. Supprimer le client numéro 1
DELETE FROM CLIENTS
WHERE CLIENTS.numC = 1
;