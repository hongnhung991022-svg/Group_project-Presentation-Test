## Modèle Conceptuel : Entités et Relations



### Relation entre les tables du schéma 
Le diagramme présenté illustre une base de données relationnelle pour un système de location de films. Les relations entre les tables sont définies par les lignes de connexion (souvent appelées notation en patte-d'oie) :

Entre REALISATEURS et FILMS :** Il existe une relation de type **un-à-plusieurs**. Un réalisateur peut réaliser plusieurs films, mais chaque film est associé à un seul réalisateur.

Entre GENRES et FILMS :** De la même manière, c'est une relation **un-à-plusieurs**. Un genre spécifique peut regrouper plusieurs films.

Entre CLIENTS, FILMS et LOCATIONS :** La table `LOCATIONS` agit comme une **table de jonction** (ou table intermédiaire) qui crée une relation **plusieurs-à-plusieurs** entre les clients et les films. Un client peut louer de multiples films, et un film peut être loué par de multiples clients à différents moments. 

Entre LOCATIONS et RETOURS :** La table `RETOURS` est directement liée à une location spécifique pour enregistrer la date de retour réelle et l'éventuelle pénalité.
