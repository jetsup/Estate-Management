<?php
include "est_connection.php";
$query = "SELECT * FROM towns";
// global variables (will use them to populate the location combo boxes)
$town_ids = [];
$town_names = array();
$county_ids = array();

if ($result = $connection->query($query)) {
    if ($count = $result->num_rows) {
        $rows = $result->fetch_all(MYSQLI_ASSOC);
        // echo $rows;
        foreach ($rows as $row) {
            array_push($town_ids, $row["town_id"]);
            array_push($town_names, $row["town_name"]);
            array_push($county_ids, $row["county_id"]);
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <script type="text/javascript" src="loginsValidation.js"></script>
</head>

<body>
    <form name="signupForm" onsubmit="return validateSignup()" method="post" action="signup.php">
        <table>
            <tr>
                <td><label for="fname">First name</label></td>
                <td><input type="text" id="fname" name="fname"><br><br></td>
            </tr>
            <tr>
                <td><label for="lname">Last name</label></td>
                <td><input type="text" id="lname" name="lname"><br><br></td>
            </tr>
            <tr>
                <td><label for="idnumber">Id Number</label></td>
                <!-- changed this to text hide the number increament arrows, will find way to go around it later -->
                <td><input type="text" id="idnumber" name="idnumber"><br><br></td>
            </tr>
            <tr>
                <td><label for="phnumber">Phone Number</label></td>
                <td><input type="tel" id="phnumber" name="phnumber"><br><br></td>
            </tr>
            <tr>
                <td><label for="email">Email Address</label></td>
                <td><input type="email" id="email" name="email"><br><br></td>
            </tr>
            <tr>
                <td><label for="county">County:</label></td>
                <td>
                    <select name="county" id="county" name="county" onchange="populateOptions(this.value)">
                        <option id="countydefault" value="0">-- Select County --</option>
                        <?php
                        include "est_connection.php";
                        $query = "SELECT county_id, county_name FROM counties";
                        if ($result = $connection->query($query)) {
                            if ($resCount = $result->num_rows) {
                                $rows = $result->fetch_all(MYSQLI_ASSOC);
                                foreach ($rows as $row) {
                                    echo '<option value=' . $row["county_id"] . '>' . $row["county_name"] . '</option>';
                                }
                            }
                        }
                        ?>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="town">Town:</label></td>
                <td>
                    <select name="town" id="town" name="town">
                        <option id="towndefault" value="0">-- Select County First --</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td> <label for="location">Location:</label></td>
                <td><input type="text" id="location" name="location"></td>
            </tr>
        </table>



        <fieldset>
            <!-- replace the styling in the css file -->
            <legend style="clear: both; color: red;">Account Settings</legend>
            <p style="Color: red;">The content in this panel might be confidential and therefore fill carefully</p>
            <label for="username">Username: </label>
            <input id="username" type="text" name="username" placeholder="Enter your Username or Email" autocomplete="username" style="width: 100mm;">
            <br><br>
            <label for="password">Password: </label>
            <input id="password" type="password" name="password" placeholder="Password" autocomplete="current-password" style="width: 100mm;">
            <br><br>
            <input id="confirm" type="submit" value="Submit" name="button">
            <input id="reset" type="reset">
        </fieldset>



        <input type="checkbox" id="robot" name="robot" value="robot">
        <label for="robot">I am not a robot</label><br>
        <input type="submit" value="Sign up"><br>
        <label>Already have an account? <a href="login.html">Log in</a></label>
    </form>
</body>
<script>
    function populateOptions(index) {
        var county_ids = <?php echo json_encode($county_ids); ?>;
        var town_ids = <?php echo json_encode($town_ids); ?>;
        var town_names = <?php echo json_encode($town_names); ?>;

        var selector = document.getElementById("town");
        var townNameArray = [];
        var townIdArray = [];

        for (var i = 0; i < town_ids.length; i++) {
            if (county_ids[i] == index) {
                townNameArray.push(town_names[i]);
                townIdArray.push(town_ids[i]);
            }
        }
        // delete the existing options menu
        while (selector.firstChild) {
            // console.log("Found a child node");
            selector.removeChild(selector.lastChild)
        }
        var optionObject;
        // populate the newly created option menu
        for (var i = 0; i < townNameArray.length; i++) {
            // console.log(townNameArray[i]);
            optionObject = document.createElement('option');
            optionObject.value = townIdArray[i];
            optionObject.text = townNameArray[i];
            selector.appendChild(optionObject);
        }
        // console.log(index);
    }
    // working on this
    var ele = document.getElementById("username");
    ele.addEventListener('input', check);

    function check() {
        console.log("Changed");
        var c = document.getElementById("username").value;
        document.cookie = "username=" + c;
        console.log("Cookie: " + document.cookie);

        let sendData = {
            "ngichtech": "ngich"
        };

        fetch("sign up.php", {
            method: "POST",
            headers: {
                'Content-Type': 'text/plain'
            },
            body: "mwangangi"
        });

        var taken = [<?php
                        $s = "";
                        foreach ($_POST as $k => $v) {
                            # code...
                            $s = $s.$k;
                        }
                        echo $s; ?>];

        // taken.forEach(element => {
        //     console.log(element);
        // });
        console.log("PHP: " + taken.length);
    }
</script>

</html>