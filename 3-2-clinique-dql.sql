-- 3-2-clinique-dql.sql
-- 1. Afficher les noms et prénoms des vétérinaires.
SELECT nomV, prenomV 
FROM VETERINAIRES
;

-- 2. Afficher le nom des animaux ainsi que le nom et prénom de leur propriétaire.
SELECT nomA, nomC, prenomC 
FROM ANIMAUX A, CLIENTS C
WHERE A.proprietaire = C.numC
;

-- 3. Afficher les animaux soignés par le vétérianire numéro 1, ainsi que les informations du vétérinaire et du soin prodigué.
SELECT A.*, S.numS, S.dateS, S.diagnosticS, S.traitementS, V.*
FROM ANIMAUX A, SOINS S, VETERINAIRES V
WHERE (S.animalS = A.numA AND S.veterinaireS = V.numV AND V.numV = 1)
;

-- 4. Afficher les animaux qui ont plus de 5 ans.
SELECT *
FROM ANIMAUX
WHERE dateNaissanceA <= '2019-11-21' -- remplacer par la date actuelle - 5ans.
;

-- 5. Afficher les noms et prénoms des vétérinaires qui ont soigné tous les animaux.
SELECT V.nomV, V.prenomV, V.numV
FROM VETERINAIRES V
WHERE 
    (SELECT COUNT(DISTINCT S.animalS) FROM SOINS S WHERE S.veterinaireS = V.numV) -- nombre d'animaux soignés par le vétérinaire
    =
    (SELECT COUNT(*) FROM ANIMAUX) -- nombre d'animaux
;

-- 6. Afficher le nombre d'animaux soignés par chaque vétérinaire.
SELECT S.veterinaireS AS "numero du vétérinaire", COUNT(DISTINCT S.animalS) AS "nombre animaux soignés"
FROM SOINS S 
GROUP BY S.veterinaireS
;

-- 7. Afficher les clients qui ont plus de 1 animal.
SELECT C.*
FROM CLIENTS C
WHERE (SELECT COUNT(A.numA) FROM ANIMAUX A WHERE A.proprietaire=C.numC) > 1
;

-- 8. Afficher le nombre de soins effectués pour chaque animal.
SELECT S.animalS AS "numero de l'animal", COUNT(S.numS) AS "nombre de soins" 
FROM SOINS S 
GROUP BY (S.animalS)
;

-- 9. Afficher le nombre d'animaux par espèce.
SELECT A.especeA AS "espèce", COUNT(A.numA) AS "nombre animaux" 
FROM ANIMAUX A
GROUP BY (A.especeA)
;

-- 10. Afficher les vétérinaires qui ont soignés au moins un chien et un chat.
SELECT V.*
FROM VETERINAIRES V
WHERE (
    SELECT COUNT(S.numS) 
    FROM SOINS S, ANIMAUX A
    WHERE S.veterinaireS = V.numV AND S.animalS = A.numA AND A.especeA = 'Chats'
    ) >= 1 AND (
    SELECT COUNT(S.numS) 
    FROM SOINS S, ANIMAUX A
    WHERE S.veterinaireS = V.numV AND S.animalS = A.numA AND A.especeA = 'Chiens'
    ) >= 1
;