-- 6-clinique-triggers.sql

-- 1. Vue qui permet d'afficher les animaux soignés par le vétérinaire numéro 1
CREATE VIEW animaux_veto1 AS
SELECT A.*
FROM ANIMAUX A, SOINS S, VETERINAIRES V
WHERE
S.animalS = A.numA AND S.veterinaireS = V.numV AND V.numV = 1
;

-- 2 Procédure stockée qui permet de générer une ligne de facture pour tous les soins qu n'ont pas encore été facturés.
-- DELIMITER //
-- CREATE PROCEDURE creation_facture()
-- BEGIN
INSERT INTO FACTURES (numS, dateF, montantF, payeeF)
SELECT S.numS, S.dateS, 50, 0
FROM SOINS S
WHERE S.numS NOT IN (SELECT F.numS FROM FACTURES F)
;
-- END//
-- DELIMITER ;

-- 3 Trigger montant de la chirurgie
-- Code du trigger :
-- CREATE TRIGGER chirurgie
-- AFTER INSERT ON FACTURES
-- FOR EACH ROW
-- BEGIN
--    UPDATE FACTURES
--    SET montantF = 1000
--    WHERE numS IN (
--       SELECT numS
--       FROM SOINS
--       WHERE traitementS LIKE "%chirurgie%"
--    );
--END;


INSERT INTO SOINS (dateS,veterinaireS,animalS,diagnosticS,traitementS)
VALUES (current_date,3,4,"Pâte brisée","chirurgie de la pate");

INSERT INTO FACTURES (numS, dateF, montantF, payeeF)
SELECT S.numS, S.dateS, 50, 0
FROM SOINS S
WHERE S.numS NOT IN (SELECT F.numS FROM FACTURES F)
;