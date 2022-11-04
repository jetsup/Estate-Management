<?php
include("est_connection.php");

$username = $_POST['username']; // the name to the input text box
$password = $_POST['password']; // the name to the input password textbox

// echo $username,"<br>";
// echo $password;

if (strlen($username) != 0 || strlen($password) != 0) {
	$query = "SELECT * FROM logins WHERE username = '$username' AND password = '$password';";

	$result = mysqli_query($connection, $query);
	$counter = mysqli_fetch_object($result);
	if (mysqli_num_rows($result) > 0) {
		// take the user to the homepage
		header("Location: realest.html");
		die();
	} else {
		// return the user to the login page
		header("Location: login.html");
		die();
	}
} else {
	header("Location: login.html");
	// echo "<script>alert('The fields are required');</sctript>";
}
