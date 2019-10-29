<?php
session_start();

include("./db.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Product Comparison Page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark pbg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">COMP 344</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <i class="fa fa-home" style="font-size:28px;color: whitesmoke; margin-top: 5px;"></i>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <i class="fa fa-user" style="font-size:28px;color: whitesmoke; margin-top: 5px;"></i>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Profile
                        </a>
                    </li>
                    <li class="nav-item">
                        <i class="fa fa-desktop" style="font-size:28px;color: whitesmoke; margin-top: 5px;"></i>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <i class="fa fa-cogs" style="font-size:28px;color: whitesmoke; margin-top: 5px;"></i>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Settings</a>
                    </li>
                    <li class="nav-item">
                        <i class="fa fa-shopping-cart" style="font-size:28px;color: whitesmoke; margin-top: 5px;"></i>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Cart</a>
                    </li>
                    <li class="nav-item">
                        <i class="fa fa-sign-out" style="font-size:28px;color: whitesmoke; margin-top: 5px;"></i>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Logout</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container-fluid">

            <h1>Orders Needing Fulfillment</h1>
            <div id="table-scroll" class="table-scroll">
                <table id="main-table" class="main-table">
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
                            <th scope="col">Print</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    
                   
                            $sql = "SELECT * FROM shipment WHERE status = 'not_shipped'";
                            $result = $conn->query($sql);
                           
                            if ($result->num_rows > 0) {
                                // output data of each row
                                while($row = $result->fetch_assoc()) {
                                    echo "<tr>". "<th>" . $row["id"] . "</th> " . "<td>" . $row["Shopper_id"] . "</td>" . "</tr>";
                                }
                            } else {
                                echo "0 results";
                            }
                            $conn->close();

                        ?>
                        
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>


                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>

                        <tr>
                            <th>111189</th>
                            <td>342432</td>
                            <td>242393</td>
                            <td>123 Fake St, Sydney, NSW 2000</td>
                            <td>8329232</td>
                            <td>Yeet Express</td>
                            <td>2019-10-08</td>
                            <td>2019-10-14</td>
                            <td style="text-align:center;"><input type="checkbox" checked></td>
                            <td style="text-align:center;"><input class="form-control" type="checkbox"></td>
                            <td><a class="print-icon" href="#"><i class="fa fas fa-print"></i></a></td>
                        </tr>
                    </tbody>

                </table>
            </div>



    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="javascript/fulfillment.js"></script>
</body>

</html>