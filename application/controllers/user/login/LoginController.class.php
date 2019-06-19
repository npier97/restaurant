<?php

class LoginController
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
        
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
        $email = $formFields['email'];
        $password = $formFields['password'];
        $user = UserModel::getUserByEmail($email);

        if($user != false){
            $hash = $user['Password'];
            $check = password_verify($password, $hash);
            if($check){
                $_SESSION['user'] = $user;
                $http->redirectTo('/');
            }
        }

    }
}