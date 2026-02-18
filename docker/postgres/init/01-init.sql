CREATE SCHEMA IF NOT EXISTS src;

CREATE TABLE IF NOT EXISTS src.individu (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(255),
    sexe CHAR(1),
    date_naissance DATE,
    date_deces DATE,
    navs VARCHAR(20),
    numero_individu VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS src.dossier (
    id INTEGER PRIMARY KEY,
    numero_dossier VARCHAR(20) NOT NULL,
    numero_individu VARCHAR(20) NOT NULL,
    date_debut DATE,
    date_fin DATE,
    CONSTRAINT fk_dossier_individu
        FOREIGN KEY (numero_individu)
        REFERENCES src.individu (numero_individu)
);

CREATE TABLE IF NOT EXISTS src.permis (
    id INTEGER PRIMARY KEY,
    numero_individu VARCHAR(20) NOT NULL,
    permis VARCHAR(10),
    date_debut DATE,
    date_fin DATE,
    CONSTRAINT fk_permis_individu
        FOREIGN KEY (numero_individu)
        REFERENCES src.individu (numero_individu)
);

CREATE TABLE IF NOT EXISTS src.prestation (
    id INTEGER PRIMARY KEY,
    numero_individu VARCHAR(20) NOT NULL,
    date_debut_prestation DATE,
    date_prestation DATE,
    type_prestation VARCHAR(100),
    montant_prestation INTEGER,
    date_fin_prestation DATE,
    CONSTRAINT fk_prestation_individu
        FOREIGN KEY (numero_individu)
        REFERENCES src.individu (numero_individu)
);

COPY src.individu (id, nom, prenom, email, sexe, date_naissance, date_deces, navs, numero_individu)
FROM '/seed-data/data-individu.csv'
WITH (FORMAT csv, HEADER true, NULL 'NULL');

COPY src.dossier (id, numero_dossier, numero_individu, date_debut, date_fin)
FROM '/seed-data/data-dossier.csv'
WITH (FORMAT csv, HEADER true, NULL 'NULL');

COPY src.permis (id, numero_individu, permis, date_debut, date_fin)
FROM '/seed-data/data-permis.csv'
WITH (FORMAT csv, HEADER true, NULL 'NULL');

COPY src.prestation (id, numero_individu, date_debut_prestation, date_prestation, type_prestation, montant_prestation, date_fin_prestation)
FROM '/seed-data/data-prestation.csv'
WITH (FORMAT csv, HEADER true, NULL 'NULL');
