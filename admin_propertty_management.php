<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Property</title>
</head>

<body>
    <form action="#" method="post" onsubmit="return validateProperty()">
        <label for="propName">Property Name:</label>
        <input type="text" name="propName" id="propName" placeholder="Property Name">
        <br>
        <label for="propType">Property Type</label>
        <select name="propType" id="propType">
            <option value="0">-- Property Type --</option>
            <!-- PHP to fetch the property_type table -->
        </select>
        <br>
        <label for="propSize">Property Seize</label>
        <select name="propSize" id="propSize">
            <option value="0">-- Select Property Type --</option>
            <!-- PHP to set the options based on the selection of the property type // in JavaScript -->
        </select>
        <br>
        <label for="locCounty">County</label>
        <select name="locCounty" id="locCounty">
            <option value="0">-- Location County --</option>
            <!-- PHP to fetch the counties from the table -->
        </select>
        <br>
        <label for="locTown">Town</label>
        <select name="locTown" id="locTown">
            <option value="0">-- Select Location County --</option>
            <!-- PHP to fetch the towns from the database based on the selected county // in JavaScript -->
        </select>
        <br>
        <!-- image uploader // should add the link to the database -->
        <input type="file" name="propImage" id="propImage">
    </form>
</body>

</html>