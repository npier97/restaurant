<?php
class MealsController {
    public function httpGetMethod(Http $http, array $queryFields)
    {
		if(isset($queryFields['id'])) {
            $id = $queryFields['id'];
            $result = MealModel::getMealById($id);
        }
        else {
            $result = [];
        }

        return [
            '_raw_template' => true,
            'result' => $result
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
    }
}