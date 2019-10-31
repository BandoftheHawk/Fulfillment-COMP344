<?php

$host="mq.ck5iokhw5uys.ap-southeast-2.rds.amazonaws.com";
$port=3306;
$socket="";
$user="admin";
$password="wearegood";
$dbname="comp344ass2";
// Create connection

$conn = new mysqli($host, $user, $password, $dbname, $port, $socket) or die ('Could not connect to the database server' . mysqli_connect_error());

// Use database
mysqli_select_db($conn, $dbname);


?>
