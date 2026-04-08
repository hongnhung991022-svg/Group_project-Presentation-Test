CREATE TABLE REALISATEURS (
    id_realisateur INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT,
    date_naissance DATE,
    nationalite TEXT
);

CREATE TABLE FILMS (
    id_film INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    annee_sortie INTEGER,
    duree INTEGER, 
    id_realisateur INTEGER,
	id_genre INTEGER,
    
    FOREIGN KEY (id_realisateur) 
        REFERENCES REALISATEURS(id_realisateur)
        ON DELETE SET NULL,
	FOREIGN KEY (id_genre) 
        REFERENCES GENRES(id_genre)
        ON DELETE SET NULL
);

CREATE TABLE GENRES (
    id_genre INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_genre TEXT NOT NULL UNIQUE
);

CREATE TABLE CLIENTS (
    id_client INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT,
    email TEXT UNIQUE,
    telephone TEXT
);

CREATE TABLE LOCATIONS (
    id_location INTEGER PRIMARY KEY AUTOINCREMENT,
    id_client INTEGER,
    id_film INTEGER,
    date_location DATE NOT NULL,
    date_retour_prevue DATE,
    
    FOREIGN KEY (id_client) 
        REFERENCES CLIENTS(id_client)
        ON DELETE CASCADE,
        
    FOREIGN KEY (id_film) 
        REFERENCES FILMS(id_film)
        ON DELETE CASCADE
);

CREATE TABLE RETOURS (
    id_retour INTEGER PRIMARY KEY AUTOINCREMENT,
    id_location INTEGER UNIQUE,
    date_retour_reelle DATE,
    penalite REAL DEFAULT 0,
    
    FOREIGN KEY (id_location) 
        REFERENCES LOCATIONS(id_location)
        ON DELETE CASCADE
);