<html>
<body>

<?php

$host="localhost";
$port=3306;
$socket="";
$user="root";
$password="";
$dbname="comp344ass2";
// Create connection

$conn = new mysqli($host, $user, $password, $dbname, $port, $socket) or die ('Could not connect to the database server' . mysqli_connect_error());

// Use database
mysqli_select_db($conn, $dbname);


?>

</body>
</html>