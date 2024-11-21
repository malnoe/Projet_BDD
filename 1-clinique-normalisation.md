# 1 Normalisation
## 1 Identifiez les dépendances fonctionnelles de ce schéma
Les dépendances fonctionelles de ce schéma sont :
SOINS -> ANIMAL
SOINS -> VETERINAIE
ANIMAL -> CLIENT

## 2 Est-ce que le schéma proposé est en 2NF ? en 3NF ?
Les attributs adresseV et adresseC ne sont pas atomatiques car elles contiennent le numéro de rue, le type de voie, la ville, le code postal, etc. Le schéma n'est donc pas 1NF. Or, être 1NF est une condition pour être 2NF et 3NF, le schéma n'est ni 2NF ni 3NF.

## 3 Proposez une décomposition en 3NF de cette relation
VETERINAIRES(<u>numV</u>,nomV,prenomV,numeroV,rueV,CPV,villeV,telephoneV,specialiteV)

CLIENTS(<u>numC</u>,nomC,prenomC,numeroC,rueC,CPC,villeC,telephoneC)

ANIMAUX(<u>numA</u>,nomA,especeA,dateNaissanceA,proprietaire\*)

SOINS(<u>numS</u>,dateS,veterinaireS\*,animalS\*,diagnosticS,traitementS)

Remarque : pour la véritable implémentation avec SQLite, on garde les adresses dans une seule variable adresseV ou adresseC.

