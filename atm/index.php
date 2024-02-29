<!DOCTYPE html>
<html>
<head>
    <title>Simple XAMPP Project</title>
</head>
<body>
    <h1>Simple XAMPP Project</h1>

    <?php
    $servername = "DESKTOP-QNBIA7M";
    $username = "abc";
    $password = "abc"; // No password by default
    $database = "sample";

    // Create a connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    echo "Connected to the database successfully!";
$query="insert into sam values('abhi',7978779789)";
$query_result=mysqli_query($conn,$query) or die(msqli_error($conn));
    ?>

</body>
</html>
