/*1.Trouvez des films qui commencent par le mot « the »*/

SELECT titre
FROM FILMS
WHERE titre LIKE 'The%' ;

/*Fonctionnement :Cette requête demande d'afficher uniquement la colonne `titre` de la table `FILMS`. La clause `WHERE` filtre les résultats en utilisant l'opérateur `LIKE`.

Concept clé : Le symbole `%` est un joker qui remplace "zéro ou plusieurs caractères".
Ainsi, le motif `'The%'` va trouver tous les titres de films qui commencent par "The", peu importe ce qui suit (par exemple "The Matrix" ou "Thelma et Louise" seront trouvés).*/

/*2. Le film le plus long.*/

SELECT titre, duree
FROM FILMS
WHERE duree = (
	SELECT MAX(duree) 
	FROM FILMS);

/*Fonctionnement : Il s'agit d'une requête imbriquée (ou sous-requête). Le système exécute d'abord la requête interne entre parenthèses `(SELECT MAX(duree) FROM FILMS)` 
pour trouver la valeur maximale absolue de la colonne durée parmi tous les films. 
Ensuite, la requête externe récupère le `titre` et la `duree` du ou des films dont la durée est exactement égale à cette valeur maximale.

Concept clé : L'utilisation d'une sous-requête est essentielle ici, car on ne peut pas utiliser une fonction d'agrégation comme `MAX()` directement dans une clause `WHERE` standard pour filtrer des lignes.*/

	
/*3.Requête permettant de trouver une liste de films 
correspondant au producteur et au genre .*/

SELECT FILMS.titre, REALISATEURS.nom AS director_lastname, GENRES.nom_genre
FROM FILMS 
LEFT JOIN REALISATEURS 
	ON FILMS.id_realisateur = REALISATEURS.id_realisateur
JOIN GENRES 
	ON FILMS.id_genre = GENRES.id_genre;

/*Fonctionnement : Cette requête combine les données de trois tables (`FILMS`, `REALISATEURS`, `GENRES`) 
en utilisant des jointures pour faire correspondre les clés primaires et étrangères. 
Elle renomme temporairement la colonne `nom` du réalisateur en `director_lastname` grâce au mot-clé `AS` (un alias) pour plus de clarté.

Concept clé :La requête utilise un `LEFT JOIN` avec la table `REALISATEURS`. Cela signifie qu'elle affichera **tous** les films de la table de gauche (`FILMS`), 
même si le film n'a pas de réalisateur assigné (valeur NULL). En revanche, le simple `JOIN` (qui est un `INNER JOIN` par défaut) avec `GENRES` signifie que seuls 
les films ayant un genre associé seront conservés dans le résultat.*/

	
/*4.Nombre de films par genre*/
SELECT g.nom_genre, COUNT(*) AS total_films
FROM FILMS f
JOIN GENRES g 
    ON f.id_genre = g.id_genre
GROUP BY g.nom_genre
ORDER BY total_films DESC;

/*Fonctionnement : Cette requête crée des groupes en rassemblant les films qui partagent le même genre via la clause `GROUP BY g.nom_genre`. 
Pour chaque groupe, elle compte le nombre total de lignes avec 'COUNT(*)'.

Concept clé : La clause ORDER BY total_films DESC' à la fin permet de trier le résultat final du genre contenant le plus de films vers celui en contenant le moins (ordre décroissant).
Les lettres `f` et `g` sont des alias de tables utilisés pour raccourcir l'écriture de la requête.*/

/*5.Réalisateur a plus de 1 film*/

SELECT r.nom, COUNT(f.id_film) AS nb_films
FROM REALISATEURS r
JOIN FILMS f 
	ON r.id_realisateur = f.id_realisateur
GROUP BY r.nom
HAVING COUNT(f.id_film) > 1;

/*Fonctionnement : Comme la requête précédente, elle lie les réalisateurs à leurs films et crée des groupes par nom de réalisateur (`GROUP BY r.nom`). 
Elle compte ensuite le nombre de films (`id_film`) par groupe.

Concept clé :L'utilisation de la clause `HAVING`. Contrairement à `WHERE` (qui filtre les lignes individuelles *avant* le regroupement), `HAVING` permet de filtrer des résultats *après* qu'ils aient été regroupés.
Ici, `HAVING COUNT(f.id_film) > 1` permet de ne garder que les groupes (réalisateurs) qui ont réalisé strictement plus d'un film.*/


/*6.Historique des locations de clients*/
SELECT c.nom, c.prenom, f.titre, l.date_location
FROM CLIENTS c
JOIN LOCATIONS l 
	ON c.id_client = l.id_client
JOIN FILMS f 
	ON l.id_film = f.id_film
ORDER BY l.date_location DESC;

/*Fonctionnement :Cette requête rassemble les données de trois tables (`CLIENTS`, `LOCATIONS`, `FILMS`) pour recréer l'historique lisible d'un client.
La table `LOCATIONS` sert de pont (table de jonction) pour lier un client à un film.

Concept clé : Elle affiche le nom, prénom, titre du film loué et la date de la location, puis trie ces enregistrements de manière chronologique inversée grâce à `ORDER BY l.date_location DESC`, 
ce qui placera les locations les plus récentes tout en haut de la liste.
*/

/*7.Amende totale par client*/
SELECT c.nom, SUM(r.penalite) AS total_penalty
FROM CLIENTS c
JOIN LOCATIONS l 
	ON c.id_client = l.id_client
JOIN RETOURS r 
	ON l.id_location = r.id_location
GROUP BY c.nom
ORDER BY total_penalty DESC;
/*Fonctionnement : Cette requête traverse quatre tables en effectuant des jointures entre `CLIENTS`, `LOCATIONS` et `RETOURS`. 
Elle regroupe les données par nom de client (`GROUP BY c.nom`).

Concept clé : La fonction d'agrégation `SUM(r.penalite)` additionne toutes les pénalités financières enregistrées pour chaque client. 
Le résultat est renommé `total_penalty` grâce à un alias `AS`, et la liste finale est affichée du client ayant payé le plus d'amendes au client en ayant payé le moins (`ORDER BY ... DESC`).*/








