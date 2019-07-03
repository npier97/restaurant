<?php

class BookModel {
    
    function addBooking(array $formFields) {
        if(isset($formFields['submit'])) {
            $date = $formFields['date'];
            $time = $formFields['time'];
            $dish = $formFields['dish'];
            $id = $_SESSION['user']['Id'];

            $sql = 'INSERT INTO booking (`BookingDate`, `BookingTime`, `NumberOfSeats`, `User_Id`,`CreationTimestamp`)
            VALUES (?, ?, ?, ?, NOW())';

            $db = new Database();
            $addToDb = $db->executeSql($sql, [$date, $time, $dish, $id]);
        }
    }
}
?>