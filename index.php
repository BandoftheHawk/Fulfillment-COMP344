<?php
include("./phpincludes/db.php");
if (isset($_GET['pageno'])) {
    $pageno = $_GET['pageno'];
} else {
    $pageno = 1;
}
$no_of_records_per_page = 2;
$offset = ($pageno-1) * $no_of_records_per_page;
?>

<!DOCTYPE html>
<html lang="en">
<?php
include("./phpincludes/header.php");
?>

<body>
<?php
include("./phpincludes/nav.php");
?>
    <!-- Page Content -->
    <div class="container-fluid">
            <div class="table-nav">
                <div><h1>Orders Needing Fulfillment</h1></div>
                <div><button id="process">Process Marked as Fulfilled</button></div>
            </div>
           
    <?php
        $total_pages_sql = "SELECT COUNT(*) FROM shipment WHERE status = 'not_shipped'";
        $result = mysqli_query($conn,$total_pages_sql);
        $total_rows = mysqli_fetch_array($result)[0];
        $total_pages = ceil($total_rows / $no_of_records_per_page);
    ?>
    <nav class="pagination-nav">
        <div>
            <span class="total-rows"><?php echo $total_rows . " Unfulfilled Orders Found" ?></span>
        </div>
        <div class="flex">
            <span>Page: <?php echo $pageno . " of " . $total_pages ?>&nbsp;</span>
            <ul class="pagination justify-content-end">
                <li class="<?php if($pageno <= 1){ echo 'disabled'; } ?> page-item">
                    <a href="<?php if($pageno <= 1){ echo '#'; } else { echo "?pageno=".($pageno - 1); } ?>" class="page-link">&laquo;</a>
                </li>
                <li class="<?php if($pageno >= $total_pages){ echo 'disabled'; } ?>" class="page-item">
                    <a href="<?php if($pageno >= $total_pages){ echo '#'; } else { echo "?pageno=".($pageno + 1); } ?>" class="page-link">&raquo;</a>
                </li>
            </ul>
        </div>
    </nav>
    
    <table class="table table-hover table-bordered ">
    <thead>
        <tr>
            <th scope="col">Shipment ID</th>
            <th scope="col">Order ID</th>
            <th scope="col">Shopper ID</th>
            <th scope="col">Shopper Address</th>
            <!--         <th scope="col">Timestamp</th> -->
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
        $sql = "SELECT * FROM shipment WHERE status = 'not_shipped' LIMIT $offset, $no_of_records_per_page";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "<tr>". "<th class='shipment-id-row'>" . $row["id"] . "</th> " .
                "<td>" . $row["Shopper_id"] . "</td>" . 
                "<td>" . $row["Shopper_id"] . "</td>" . 
                "<td>" . $row["Shopper_id"] . "</td>" .
                "<td>" . $row["Shopper_id"] . "</td>" .
                "<td>" . $row["Shopper_id"] . "</td>" .
                "<td>" . $row["Shopper_id"] . "</td>" .
                "<td>" . $row["Shopper_id"] . "</td>" .
                "<td>" . $row["Shopper_id"] . "</td>" .
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

</body>

</html>