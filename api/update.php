<?php

include("./db.php");

// Sanitize
function sanitize($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

$studentnames = $_POST['orderid'];

   for ($x = 0; $x < count($orderid); $x++) {
       $sql2 = "UPDATE SET `shipment` (`status`) VALUES ('shipped') WHERE orderid = '$orderid[$x]'";
          if (mysqli_query($conn, $sql2) === TRUE) {
            // Send OK message if 200 is okay
            http_response_code(200);
          }else {
            // Send error if issue with connection
            http_response_code(500);
           }
    }

?>
