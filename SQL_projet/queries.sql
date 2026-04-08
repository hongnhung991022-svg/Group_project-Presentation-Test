/*Ajouter un nouveau film*/
INSERT INTO FILMS (titre, annee_sortie, duree, id_realisateur, id_genre)
VALUES ('Interstellar', 2014, 169, 1, 5);

/*Ajouter un nouveau client*/
INSERT INTO CLIENTS (nom, prenom, email, telephone)
VALUES ('Dupont', 'Marie', 'marie.dupont@mail.com', '0612345678');

/*Mise à jour de la date de paiement réelle et pénalité*/
UPDATE RETOURS
SET date_retour_reelle = '2024-02-07',
    penalite = 2.5
WHERE id_location = 3;

/*Supprimer un film*/
DELETE FROM FILMS
WHERE id_film = 10;

