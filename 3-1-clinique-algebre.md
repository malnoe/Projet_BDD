# Requêtes algèbre relationnelle

## 1. Afficher les noms et prénoms des vétérinaires.
R = VETERINAIRE[nomV, prenomV]

## 2. Afficher le nom des animaux ainsi que le nom et prénom de leur propriétaire.
R = (ANIMAUX x CLIENTS:(proprietaire == numC))[nomA, nomC, prenomC]

## 3. Afficher les noms des animaux soignés par le vétérinaire numéro 1, ainsi que les informations du vétérinaire et du soin prodigué.
R1 = SOINS:(veterinaireS == 1)
R2 = (R1 x ANIMAUX:(animalS == numA))[numS, dateS, veterinaireS, animalS, diagnosticS, traitementS, nomA]
R3 = R2 x VETERINAIRE:(numV == 1)

## 4. Afficher les animaux qui ont plus de 5 ans.
R = ANIMAUX:(dateNaissanceA <= "2019-11-19").

## 5. Afficher les noms et prénoms des vétérinaires qui ont soigné tous les animaux.
R1 = (VETERINAIRES x SOINS(veterinaireS = numV)) [numV, nomV, prenomV, animalS|numA]
R2 = (R1 / ANIMAUX) [nomV, prenomV]