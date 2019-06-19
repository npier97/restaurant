<?php

class UserModel {
    
    function addUser(array $formFields) {
        if(isset($formFields['submit'])) {
            $name = $formFields['name'];
            $firstname = $formFields['firstname'];
            $email = $formFields['email'];
            $password = $formFields['password'];
            $date = $formFields['date'];
            $address = $formFields['address'];
            $city = $formFields['city'];
            $zipcode = $formFields['zipcode'];
            $country = $formFields['country'];
            $phone = $formFields['phone'];
            $hash = password_hash($password, PASSWORD_BCRYPT);

            $sql = 'INSERT INTO user (`FirstName`, `LastName`, `Email`, `Password`, `BirthDate`, `Address`, `City`, `ZipCode`, `Country`, `Phone`, `CreationTimestamp`)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())';

            $db = new Database();
            $addToDb = $db->executeSql($sql, [$firstname, $name, $email, $hash, $date, $address, $city, $zipcode, $country, $phone]);
        }
    }

    static function getAllUsers() {
        $sql = 'SELECT * FROM user';
        $db = new Database();
        $result = $db->query($sql);
        return $result; 
    }

    static function getUserById($id) {
        $sql = 'SELECT * FROM user WHERE `Id` = ?';
        $db = new Database();
        $result = $db->queryOne($sql, [$id]);
        return $result; 
    }
    
    static function getUserByEmail($email) {
        $sql = 'SELECT * FROM user WHERE Email = ?';

        $db = new Database();
        $result = $db->queryOne($sql, [$email]);
        return $result;     
    }

    static function updateUserContacts(array $formFields) {
        if(isset($formFields['submitUpdates'])) {
            $id = $_SESSION['user']['Id'];
            $name = $formFields['name'];
            $firstname = $formFields['firstname'];
            $email = $formFields['email'];
            $password = $formFields['password'];
            $date = $formFields['date'];
            $address = $formFields['address'];
            $city = $formFields['city'];
            $zipcode = $formFields['zipcode'];
            $country = $formFields['country'];
            $phone = $formFields['phone'];
            $hash = password_hash($password, PASSWORD_BCRYPT);

            $sql = 'UPDATE user
            SET FirstName = ?, LastName = ?, Email = ?, Password = ?, BirthDate = ?, Address = ?, City = ?, ZipCode = ?, Country = ?, Phone = ?
            WHERE Id = ?';

            $db = new Database();
            $addToDb = $db->executeSql($sql, [$firstname, $name, $email, $hash, $date, $address, $city, $zipcode, $country, $phone, $id]);
        };
    }

    static function updateUserRole(array $formFields){
        if(isset($formFields['submitUpdatedRole'])) {
            $selectedRole = $formFields['role'];

            $sql = 'UPDATE user SET `Admin` = ?';

            $db = new Database();
            $addToDb = $db->executeSql($sql, [$selectedRole]);
        };
    }
}

?>