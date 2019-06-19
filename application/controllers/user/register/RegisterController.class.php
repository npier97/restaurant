<?php

class RegisterController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
			if(isset($_SESSION['user'])){
				$http->redirectTo('/');
			}

		//Charger la carte du restaurant
		//=>Créer un model qui va contenir les produits proposés
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
			$u = new UserModel();
			$newUser = $u->addUser($formFields);
			$flashBag = new FlashBag();
			$flashBag->add('Votre compte utilisateur a bien été créé.');

    }
}