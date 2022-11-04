<?php
$host = "localhost"; // replace this with the your host {localhost if you are using it on a local machine}
$dbm_user = "root"; // username for your database
$dbm_pass = "toor"; // password for the above user used to log into the database
$db = "estate"; // databse name

$connection = mysqli_connect($host, $dbm_user, $dbm_pass, $db);
if (!$connection) {
    die("The logins were incorrect");
}