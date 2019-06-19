# Projet Restaurant

## Objectif

Construire le site de e-commerce d'un restaurant permettant de réserver en ligne une table et d'acheter (puis se faire livrer) des produits alimentaires.

Le site sert autant aux clients qu'aux salariés du restaurant qui, quand ils se connecteront, pourront suivre les commandes, les réservations, le catalogue de produits alimentaires.

## Framework

Framework imposé pour ce projet.

Suivi de l'architecture proposé par le framework et organisation du code autour de celui-ci.

## Organisation des dossiers et fichiers

- Centralisation des requêtes vers `index.php` (*entry point*).

L'application est basée autour d'un mini-framework développé par la 3WA. Les fichiers fournis sont organisés de la manière suivante :

| Dossier / Fichier                 | Description                                                        |
| --------------------------------- | ------------------------------------------------------------------ |
| /application                      | Code source de l'application                                       |
| ···· /config                      | Configuration de l'application                                     |
| ········ database.php             | Configuration base de données (identifiants de connexion)          |
| ···· /controllers                 | Le C de MVC, les chefs d'orchestres de l'application               |
| ········ HomeController.class.php | Contrôleur de la page d'accueil                                    |
| ···· /models                      | Le M de MVC, le coeur de l'application                             |
| ···· /www                         | Le V de MVC, les fichiers statiques (CSS, JS, images, fonts, etc.) |
| ········ /css                     | Feuilles de styles CSS                                             |
| ········ /fonts                   | Polices de caractères                                              |
| ········ /images                  | Images                                                             |
| ········ /js                      | Code source JavaScript                                             |
| ············ /classes             | Classes (code source orienté objet)                                |
| ········ HomeView.phtml           | Template interne de la page d'accueil                              |
| ········ LayoutView.phtml         | Template global                                                    |
| /library                          | Code source générique, réutilisable dans d'autres projets          |
| ···· Database.class.php           | Classe d'accès à la base de données                                |
| index.php                         | Code principal, charge le framework                                |
