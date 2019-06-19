<?php

class OrderModel {
 
    static function getAllOrders() {
        $db = new Database();

        $sql = 'SELECT * FROM `order`';
        
        $query = $db->query($sql);
        
        return $query;
    }

    static function getCurrentOrder() {
        $db = new Database();

        $sql = 'SELECT `QuantityOrdered`, `Name`, `PriceEach`, `PriceEach`*`QuantityOrdered` AS total 
        FROM orderline AS o 
        INNER JOIN meal AS m 
        ON o.Meal_Id = m.Id';

        $query = $db->query($sql);
                
        return $query;
    }
}