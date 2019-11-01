<?php

header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");

include("../phpincludes/db.php");

$data = json_decode(file_get_contents('php://input'), true);
$orders = $data["shipmentIds"];
print_r($data["shipmentIds"][0]);

   for ($x = 0; $x < count($orders); $x++) {
     $string = $data["shipmentIds"][$x];
     
       $sql = "UPDATE `Shipment` SET `status` = 'shipped' WHERE id = $string";
          if (mysqli_query($conn, $sql) === TRUE) {
            // Send OK message if 200 is okay
            http_response_code(200);
          }else {
            echo("Error description: " . mysqli_error($conn));
            http_response_code(404);
          }
    }

?>
