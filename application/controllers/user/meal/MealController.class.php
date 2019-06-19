<?php

class MealController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	$meals = MealModel::getMealList();
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */

		//Charger la carte du restaurant
		//=>Créer un model qui va contenir les produits proposés
		return [
			'meals' => $meals
		];
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
        if(isset($formFields['submitDeletion'])){
			$ids = $formFields['selected'];
            foreach($ids as $key => $value){
                $deleteMeal = MealModel::deleteMeal($value);
            }
		}
		
		$addNewMeal = MealModel::addNewMeal($formFields);
		$http->redirectTo('/');
    }
}