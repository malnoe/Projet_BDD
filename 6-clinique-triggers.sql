-- 6-clinique-triggers.sql

-- 1. Vue qui permet d'afficher les animaux soignés par le vétérinaire numéro 1
CREATE VIEW animaux_veto1 AS
SELECT A.*
FROM ANIMAUX A, SOINS S, VETERINAIRES V
WHERE
S.animalS = A.numA AND S.veterinaireS = V.numV AND V.numV = 1
;

-- 2 Procédure stockée qui permet de générer une ligne de facture pour tous les soins qu n'ont pas encore été facturés.
