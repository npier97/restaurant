<?php

class MealModel {
    
    static function getMealList(){
    //connexion db
    $db = new Database();
    //requete sql
    $sql = 'SELECT `Id`,`Name`,`Photo`, `Description`, `SalePrice` FROM `meal`';

    $result = $db->query($sql);

    return $result; //return $db->query($sql);
    }

    static function getMealById($id){
        //connexion db
        $db = new Database();
        //requete sql
        $sql = 'SELECT `Id`,`Name`,`Photo`, `Description`, `SalePrice` FROM `meal` WHERE `Id` = ?';
    
        $result = $db->queryOne($sql, [$id]);
    
        return $result; //return $db->query($sql);
        }

    static function addNewMeal(array $formFields) {
        if(isset($formFields['submitNewMeal'])) {
            $name = $formFields['name'];
            $photo = $formFields['file'];
            $description = $formFields['description'];
            $stock = $formFields['stock'];
            $buyprice = $formFields['buyPrice'];
            $saleprice= $formFields['salePrice'];

            $sql = 'INSERT INTO meal (`Name`, `Photo`, `Description`, `QuantityInStock`, `BuyPrice`, `SalePrice`)
            VALUES (?, ?, ?, ?, ?, ?)';

            $db = new Database();
            $addToDb = $db->executeSql($sql, [$name, $photo, $description, $stock, $buyprice, $saleprice]);
        };
    }

    static function deleteMeal($id) {
            $sql = 'DELETE FROM meal WHERE `meal`.`Id` = ?';

            $db = new Database();
            $deleteFromDb = $db->executeSql($sql, [$id]);
    }
}

?>