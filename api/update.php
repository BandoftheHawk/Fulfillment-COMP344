<?php

header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include("../phpincludes/db.php");

function sanitize($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

echo $_POST['orderids'];

   for ($x = 0; $x < count($data); $x++) {
       $sql2 = "UPDATE SET `shipment` (`status`) VALUES ('shipped') WHERE orderid = '$data[$x]'";
          if (mysqli_query($conn, $sql2) === TRUE) {
            // Send OK message if 200 is okay
            http_response_code(200);
          }else {
            // Send error if issue with connection
            http_response_code(404);
          }
    }

?>
