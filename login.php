<?php
include("est_connection.php");

$username = $_POST['username']; // the name to the input text box
$password = $_POST['password']; // the name to the input password textbox

if (strlen($username) != 0 || strlen($password) != 0) {
	$query = "SELECT * FROM logins WHERE username = '$username' AND password = '$password';";

	$result = mysqli_query($connection, $query);
	$counter = mysqli_fetch_object($result);
	if (mysqli_num_rows($result) > 0) {
		// take the user to the homepage later, it should return the user the previous page before ligin
		// the name should also be coockied and later be used to set the username details throughout the sessions
		header("Location: realest.html");
		die();
	} else {
		// return the user to the login page
		header("Location: login.html");
		die();
	}
} else {
	header("Location: login.html");
}