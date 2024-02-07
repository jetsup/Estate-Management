<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Users</title>
</head>

<body>
    <form action="#" method="post">
        <label for="userName">User Name:</label>
        <!-- set the value of the text box same as that clicked on the previous page -->
        <input type="text" name="userName" id="userName" placeholder="Username">
        <br><br>
        <label for="userType">User Type:</label>
        <select name="userType" id="userType">
            <option value="o">-- User Type --</option>
            <!-- Populate them from the database -->
        </select>
        <br><br>
        <label for="accessLevel">Access Level:</label>
        <select name="accessLevel" id="accessLevel">
            <option value="0">-- Select User Type --</option>
            <!-- Populate from database based on the selected user type -->
        </select>
        <br><br>
        <label>Account Active</label>
        <br>
        <!-- Deactivate or (re)activate a user account // add this active option to the SQL database script -->
        <input type="radio" id="userActive" name="active">
        <label for="userActive">Yes</label>
        <input type="radio" id="userDeactivated" name="active">
        <label for="userDeactivated">No</label>
        <br><br>
        <!-- On reset send the page to the users view table -->
        <input type="reset" value="Discard">
        <input type="submit" value="Update User Details">
    </form>
</body>

</html>