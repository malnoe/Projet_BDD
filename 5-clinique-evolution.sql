--5-clinique-evolution.sql

CREATE TABLE FACTURES(
    numF INTEGER PRIMARY KEY AUTOINCREMENT,
    numS INTEGER NOT NULL,
    dateF DATE,
    montantF INTEGER,
    payeeF INTEGER NOT NULL CHECK(payeeF == 0 OR payeeF == 1), --Les booléens n'existe pas en sqlite, on fait donc le choix d'un integer 0 si false, 1 si true.
    
    FOREIGN KEY (numS) REFERENCES SOINS(numS) ON DELETE CASCADE
)
;

