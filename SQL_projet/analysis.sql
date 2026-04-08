/*1.Trouvez des films qui commencent par le mot « the »*/

SELECT titre
FROM FILMS
WHERE titre LIKE 'The%' ;


/*2. Le film le plus long.*/

SELECT titre, duree
FROM FILMS
WHERE duree = (
	SELECT MAX(duree) 
	FROM FILMS);
	
/*3.Requête permettant de trouver une liste de films 
correspondant au producteur et au genre .*/

SELECT FILMS.titre, REALISATEURS.nom AS director_lastname, GENRES.nom_genre
FROM FILMS 
LEFT JOIN REALISATEURS 
	ON FILMS.id_realisateur = REALISATEURS.id_realisateur
JOIN GENRES 
	ON FILMS.id_genre = GENRES.id_genre;
	
	
/*4.Nombre de films par genre*/
SELECT g.nom_genre, COUNT(*) AS total_films
FROM FILMS f
JOIN GENRES g 
    ON f.id_genre = g.id_genre
GROUP BY g.nom_genre
ORDER BY total_films DESC;

/*5.Réalisateur a plus de 1 film*/
SELECT r.nom, COUNT(f.id_film) AS nb_films
FROM REALISATEURS r
JOIN FILMS f 
	ON r.id_realisateur = f.id_realisateur
GROUP BY r.nom
HAVING COUNT(f.id_film) > 1;

/*6.Historique des locations de clients*/
SELECT c.nom, c.prenom, f.titre, l.date_location
FROM CLIENTS c
JOIN LOCATIONS l 
	ON c.id_client = l.id_client
JOIN FILMS f 
	ON l.id_film = f.id_film
ORDER BY l.date_location DESC;

/*7.Amende totale par client*/
SELECT c.nom, SUM(r.penalite) AS total_penalty
FROM CLIENTS c
JOIN LOCATIONS l 
	ON c.id_client = l.id_client
JOIN RETOURS r 
	ON l.id_location = r.id_location
GROUP BY c.nom
ORDER BY total_penalty DESC;








