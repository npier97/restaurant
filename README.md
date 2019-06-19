# Projet 3W Restaurant

## Objectif

Construire le site de e-commerce d'un restaurant permettant de réserver en ligne une table et d'acheter (puis se faire livrer) des produits alimentaires.

Le site sert autant aux clients qu'aux salariés du restaurant qui, quand ils se connecteront, pourront suivre les commandes, les réservations, le catalogue de produits alimentaires.

## Framework

Un framework est un ensemble cohérent de composants logiciels, qui sert à créer les fondations ainsi que les grandes lignes de tout ou d’une partie d'un logiciel (architecture).

Suivre l'architecture proposé par le framework et organier le code autour de celui-ci permet d'augmenter la productivité du développeur et donc d'accélérer le développement.

## Organisation des dossiers et fichiers

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

D'autres dossiers et fichiers vont apparaître au fur et à mesure dans le dossier "application".

**Cette organisation doit être scrupuleusement respéctée !**

### Exemple d'ajout d'une page

Si nous voulons ajouter une page de création de compte utilisateur (*register* en anglais) qui sera accessible via l'URL `/user/register`, les étapes à suivre sont les suivantes :

- Ajout / mise à jour du modèle :
  - Création d'un modèle pour les utilisateurs (si il n'existe pas) dans le répertoire `application/models`
  - Le nom du modèle sera `UserModel.class.php`
  - Une méthode pour ajouter un utilisateur devra être ajoutée à cette classe
- Ajout du controlleur :
  - Création du répertoire `application/controllers/user/register` pour contenir le controlleur
  - Le nom du controlleur sera `RegisterController.class.php`
  - Il devra contenir les méthodes `httpGetMethod` et `httpPostMethod`
- Ajout de la vue :
  - Création du répertoire `application/www/user/register` pour contenir la vue
  - La nom de la vue sera `RegisterView.phtml`

## Fonctionnement

Dans les exercices précédents, chaque URL menait vers une page PHP. Dans le Blog par exemple, en entrant l'URL `http://localhost/blog/edit_post.php?id=1>`, la page `edit_post.php` est exécutée et affiche la vue contenant un formulaire pré-rempli avec les données de l'article passé en paramètre `id=1`. Une URL entrée ainsi dans le navigateur est toujours de type `GET`. Lorsque l'article est modifié, les données du formulaire sont envoyés à la même page, dans une requête de type `POST`. Les données sont alors traitées et nous sommes redirigé sur la page d'administration.

En faisant ainsi, plusieurs problèmes se posent :

1. La présentation (la vue) et la logique (le controlleur) sont réunis dans un seul et même fichier (on dit qu'ils sont couplés)
2. Il nous faut un nouveau fichier par action, ce qui démultiplie le nombre de fichier
3. Dans chaque fichier, il faut souvent répéter les mêmes choses
4. Cette méthode n'est pas très adaptée à l'orienté objet

Pour répondre à ces problématiques, l'idée est de centraliser les requêtes vers `index.php`. Cette page devient donc le *point d'entré* de notre application (ou *entry point*). Chaque requête sur notre serveur passera par ce script.

Mais alors, comment faire alors pour accéder aux différentes fonctionnalités ?

Notre application dispose d'un *routeur*. Le rôle d'un routeur est d'analyser la requête réçue par le script et d'en extraite toutes les informations nécéssaires. Ces informations sont ensuites traitées et envoyées au controlleur correspondant.

> Pour fonctionner, le routeur utilise la variable superglobale [\$_SERVEUR](https://www.php.net/manual/fr/reserved.variables.server.php).
> Celle-ci contient des infomations comme `REQUEST_METHOD`, qui permet de récupérer la méthode utilisée pour accéder à la page, ou encore `PATH_INFO`, qui permet de récupérer le chemin situé après le script. Par exemple, si le script est exécuté via l'URL `http://www.example.com/php/path_info.php/some/stuff?foo=bar`, alors la variable `$_SERVER['PATH_INFO']` contiendra `/some/stuff`.
> `/some/stuff` est alors appelé une *route* dans notre application.

Exemple :

En effectuant une requête `GET` à l'URL `http://locahost/restaurant/index.php/user/register`, le routeur va déterminer la route `/user/register`. Il ira alors chercher le controller `RegisterController` situé dans le répertoire `/application/controllers/user`. Comme la requête est de type `GET`, la méthode `httpGetMethod` du controlleur sera appellée.

Si la requête était de type `POST`, c'est la méthode `httpPostMethod` du controlleur qui serait appellée.

Le routeur s'occupe ensuite de charger la vue correspondante, c'est à dire `RegisterView.phtml`.

Un serveur web est généralement configuré pour charger automatiquement le fichier `index.php` par défaut. Si c'est bien le cas, nous pouvons ignorer le `/index.php` et écrire simplement `http://locahost/restaurant/user/register`, ce qui est bien plus élégant !

> Dans toutes les vues, les variables `$requestUrl` et `$wwwUrl` sont injectées automatiquement et toujours accessibles. La première donne le chemin de l'application, par exemple `http://locahost/restaurant/index.php`, la deuxième donne le chemin vers les fichiers statiques.

### Détails de "Library"

#### Configuration.class.php

Cette classe est utilisée dans l'application pour lire et charger les différents fichiers de configurations situés dans le dossier `application/config`.

#### Database.class.php

Encapsule PDO pour faciliter son utilisation. Elle contient plusieurs méthodes qui nous seront utiles :

- executeSql("LaRequeteSQL", [Le tableau des variables à lier])
  - Sert exclusivement aux requêtes d'exécution : UPDATE, DELETE ou INSERT
- query("LaRequeteSQL", [Le tableau des variables à lier])
  - Sert exclusivement aux requetes SELECT, récupère plusieurs éléments
- queryOne("LaRequeteSQL", [Le tableau des variables à lier])
  - Sert exclusivement aux requetes SELECT, récupère un seul élément

```php
// UserModel.php
class UserModel {
    // ...
    function register($email, $password) {
        $db = new Database();
        // Exemple factice
        $hashedPassword = $this->hashPassword($password);
        $db->executeSql('INSERT INTO users (email, password, createdAt) VALUE (?, ?, NOW())', [$email, $hashedPassword]);
    }
    // ...
}
```

Il faut bien entendu configurer correctement la base de données dans le fichier `application/config/database.php`.

#### ErrorView.phtml

La vue qui est affichée en cas d'erreur.

#### FlashBag.class.php

Un message "flash" est un petit message d'information (une sorte de notification) destiné à l'utilisateur. La classe `FlashBag` permet de gérer ce type de messages.

```php
// RegisterController.php
class RegisterController {
    // ...
    function httpPostMethod(Http $http, array $formFields) {
        // Ajout de l'utilisateur
        // Si l'ajout s'est bien passé
        $flashBag = new FlashBag();
        $flashBag->add('Votre compte utilisateur a bien été créé.');
    }
    // ...
}

Pour afficher les messages, la vue `HomeView.phtml` contient un exemple. Le code est le suivant :

```html
<?php if($flashBag->hasMessages() == true): ?>
    <aside id="notice" class="notice">
        <?php foreach($flashBag->fetchMessages() as $message): ?>
            <p><?= $message ?></p>
        <?php endforeach ?>
    </aside>
<?php endif; ?>
```

#### Form.class.php

Une classe de base (c'est à dire destinée à être héritée) pour faciliter la gestion des formulaires.

#### FrontController.class.php

Le routeur.

#### Http.class.php

Encapsule toutes les informations de la requête HTTP dont nous aurons besoin. Une instance de cette classe est passée en paramètre aux méthodes `httpGetMethod` et `httpPostMethod` des controlleurs.

Liste des méthodes :

| Méthode                      | Description                                              |
| ---------------------------- | -------------------------------------------------------- |
| getRequestFile()             | Donne le nom de la route actuelle                        |
| getRequestMethod()           | Donne la méthode de votre requete (GET ou POST)          |
| getRequestPath()             | Donne le chemin de la route                              |
| getUploadedFile()            | Récupère un fichier téléversé                            |
| hasUploadedFile(name)        | Renvoie true si la requête contient un fichier téléversé |
| moveUploadedFile(name, path) | Déplace un fichier téléversé vers le chemin spécifié     |
| redirectTo(url)              | Redirige vers l'url spécifiée                            |

#### InterceptingFilter.interface.php

Une interface permettant de mettre en place le pattern d'[intercepting filters](https://en.wikipedia.org/wiki/Intercepting_filter_pattern). C'est un système permettant d'ajouter facilement de nouvelles fonctionnalités au framework sans avoir à toucher le code du MicroKernel ou du FrontController.

> Une interface est similaire à une classe abstraite, dans le sens où elle contient des méthodes sans les définir. En revanche, les interface ne peuvent pas contenir de propriétés. De ce fait, elles n'ont pas de constructeur. Les classes qui réalisent une interface doivent définir ces méthodes, elle doivent respecter le contrat qu'on leur impose ! Enfin, pour déclarer qu'une classe réalise une interface, ce pas avec le mot-clé `extend` mais avec le mot-clé `implements`. Il est possible de combiner les deux !

#### MicroKernel.class.php

Le coeur de l'application.

## Liens intéressants

- [Les sessions - Utilisation simple](https://www.php.net/manual/fr/session.examples.basic.php)
- [Gestion des sessions](https://www.php.net/manual/fr/book.session.php)
- [Hachage des mots de passes](https://www.php.net/manual/fr/function.password-hash.php)
- [Les interfaces en PHP](https://www.php.net/manual/fr/language.oop5.interfaces.php)
- [Upload de fichiers en PHP](http://www.php.net/manual/fr/features.file-upload.post-method.php)
- [Veille Intégration HTML/CSS et JavaScript](https://uptodate.frontendrescue.org/)
- [OWASP](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project)

## Rappel syntaxe SQL

```sql
INSERT INTO NomTable (NomColonne1, NomColonne2, ...)
    VALUES (ValeurColonne1, ValeurColonne2, ...);

UPDATE NomTable
    SET NomColonne1 = ValeurColonne1, NomColonne2 = ValeurColonne2, ...
    WHERE Condition;

DELETE FROM NomTable
    WHERE Condition;
```