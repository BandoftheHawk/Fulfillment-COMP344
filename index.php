<?php
// Include DB Conection
include("./phpincludes/db.php");
// User Query String to determine pagination
if (isset($_GET['pageno'])) {
  $pageno = $_GET['pageno'];
} else {
  $pageno = 1;
}
// Set number of recrods to display in pagination
$no_of_records_per_page = 3;
// Set records to query from
$offset = ($pageno-1) * $no_of_records_per_page;
?>

<!DOCTYPE html>
<html lang="en">
<?php
// CSS, Javascript and Page Title files
include("./phpincludes/header.php");
?>

<body>
  <?php
  // Header Navigation
  include("./phpincludes/nav.php");
  ?>
  <!-- Page Content -->
  <div class="container-fluid">
    <div class="table-nav">
      <div>
        <h1>Orders Needing Fulfillment</h1>
      </div>
      <div><button id="process">Process Marked as Fulfilled</button></div>
    </div>

    <?php
    // Get Total number of rows that are unfilfilled
    $total_pages_sql = "SELECT COUNT(*) FROM Shipment WHERE status = 'not_shipped'";
    $result = mysqli_query($conn, $total_pages_sql);
    $total_rows = mysqli_fetch_array($result)[0];
    // Get total pages
    $total_pages = ceil($total_rows / $no_of_records_per_page);
    ?>
    <nav class="pagination-nav">
      <div>
        <span class="total-rows"><?php echo $total_rows . " Unfulfilled Orders Found" ?></span>
      </div>
      <div class="flex">
        <!-- Number of pages render !-->
        <span>Page: <?php echo $pageno . " of " . $total_pages ?>&nbsp;</span>
        <!-- Pagination buttons !-->
        <ul class="pagination justify-content-end">
          <li class="<?php if ($pageno <= 1) {
                        echo 'disabled';
                      } ?> page-item">
            <a href="<?php if ($pageno <= 1) {
                        echo '#';
                      } else {
                        echo "?pageno=" . ($pageno - 1);
                      } ?>" class="page-link">&laquo;</a>
          </li>
          <li class="<?php if ($pageno >= $total_pages) {
                        echo 'disabled';
                      } ?>" class="page-item">
            <a href="<?php if ($pageno >= $total_pages) {
                        echo '#';
                      } else {
                        echo "?pageno=" . ($pageno + 1);
                      } ?>" class="page-link">&raquo;</a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Table Header !-->
    <table class="table table-hover table-bordered ">
      <thead>
        <tr>
          <th scope="col">Shipment ID</th>
          <th scope="col">Order ID</th>
          <th scope="col">Shopper ID</th>
          <th scope="col">Shopper Address</th>
          <th scope="col">Delivery Company ID</th>
          <th scope="col">Delivery Company Name</th>
          <th scope="col">Pick Up Date</th>
          <th scope="col">Expected Delivery Date</th>
          <th scope="col">Shopper Notified</th>
          <th scope="col">Mark as Fulfilled</th>
          <th scope="col">View Print Label</th>
        </tr>
    </thead>
  <tbody>
    <?php
    // Get unfilled shipment items with related data, including delivery company, address and order id
    $sql = "SELECT Shipment.*, DeveliveryCompany.company_name, Shopper.sh_username, CONCAT(Shaddr.sh_street1, ' ' , Shaddr.sh_city,' ',Shaddr.sh_state, ' ' ,Shaddr.sh_postcode, ' ', Shaddr.sh_country) as user_address, ShipmentItems.Order_id FROM Shipment left join Shopper on Shipment.Shopper_id = Shopper.shopper_id  left join Shaddr  on Shipment.Shaddr_id = Shaddr.shaddr_id  left join DeveliveryCompany on Shipment.Delivery_Company_id = DeveliveryCompany.id left join ShipmentItems on ShipmentItems.Shipment_id = Shipment.id where status = 'not_shipped' LIMIT $offset, $no_of_records_per_page";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // render each row data with relted data
            while($row = $result->fetch_assoc()) {
                echo "<tr>". "<th class='shipment-id-row'>" . $row["id"] . "</th> " .
                "<td>" . $row["Order_id"] . "</td>" . 
                "<td>" . $row["Shopper_id"] . "</td>" . 
                "<td>" . $row["user_address"] . "</td>" .
                "<td>" . $row["Delivery_Company_id"] . "</td>" .
                "<td>" . $row["company_name"] . "</td>" .
                "<td>" . $row["picked_up_at"] . "</td>" .
                "<td>" . $row["expected_delivery_date"] . "</td>" .
                "<td>" . $row["shopper_notified"] . "</td>" .
                "<td>" . " <div class='form-check'><input class='form-check-input fulfillable-checkbox' type='checkbox' ></div>" . "</td>" .
                "<td>" . "<a class='print-icon' href='#'><i class='fa fas fa-print'></i></a>" . "</td>" .
                
                "</tr>";
            }
        } else {
          echo "0 results";
        }
        $conn->close();
        ?>
      </tbody>
    </table>

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; COMP344 Fulfillment</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="javascript/fulfillment.js"></script>
<div style="display: none;" id="shipment"></div>

</body>

</html>