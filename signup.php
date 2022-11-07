<?php
include "est_connection.php";
// no need to clean the data since that has already been done in the client side
$fName = strtoupper($_POST["fname"]);
$lName = strtoupper($_POST["lname"]);
$id_pass_number = (int)$_POST["idnumber"];
$phone = $_POST["phnumber"];
$email = strtolower($_POST["email"]);
$countyResidence = (int)$_POST["county"];
$townResidence = (int)$_POST["town"];
$location = strtoupper($_POST["location"]);
echo $fName." ".$lName." ".$id_pass_number." ".$phone." ".$email." ".$countyResidence." ".$townResidence." ".$location;
// first check if the name is in the database
$searchQuery = "SELECT * FROM user_details WHERE id_passport_number = '$id_pass_number'";
// $connection->prepare($searchQuery);
if (!$result = $connection->query($searchQuery)) {
    // tell the user that he/she already have an account and should instead log in
    echo "<br>Found a user with that id result<br>";
} else {
    // insert the user to the database
    $insertQuery = "INSERT INTO user_details(first_name, last_name, id_passport_number, phone_number, user_email, residence_county, residence_town, user_location) VALUES
    ('$fName', '$lName', $id_pass_number, '$phone', '$email', $countyResidence, $townResidence, '$location')";
    
    if ($result = $connection->query($insertQuery)) {
        // header("Location: login.html");
        echo "<br>New data added successfully";
    } else {
        // show a popup explaining the problem
        header("Location: sign up.php");
    }
}