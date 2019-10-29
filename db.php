<html>
<body>

<?php

$servername = "ash.science.mq.edu.au:22";
$username = "43236944";
$password = "VGltbyBKYXJ2";
$database = "43236944";

// Create connection
$conn = mysqli_connect($servername, $username, $password);

if (mysqli_connect_errno())
{
 die("Connection failed to database: " . mysqli_connect_error());
}

// Use database
mysqli_select_db($conn, $database);


?>
<!-- COMP344 Assignment 1 2019 Timo Jarvinen 43236944 -->

</body>
</html>