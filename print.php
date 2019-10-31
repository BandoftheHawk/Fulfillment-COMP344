<?php include("./phpincludes/db.php"); ?>
<?PHP
$shipment = "select distinct
       Shipment.*,
       Product.*,
       DeveliveryCompany.company_name,
       Shopper.sh_email,
       Shopper.sh_username,
       Shopper.sh_phone,
       OrderProduct.OP_qty,
       Order.Order_Total,
      Shaddr.*
from Shipment
left join Shopper on Shipment.Shopper_id = Shopper.shopper_id
left join Shaddr  on Shipment.Shaddr_id = Shaddr.shaddr_id
left join DeveliveryCompany on Shipment.Delivery_Company_id = DeveliveryCompany.id
left join ShipmentItems on Shipment.id = ShipmentItems.Shipment_id
left join `Order` on `Order`.Order_id = ShipmentItems.Order_id
left join OrderProduct on `Order`.Order_id = OrderProduct.OP_Order_id
left join Product on OrderProduct.OP_prod_id = Product.prod_id
where Shipment_id = " + $_GET['shipmentId'];


$data = $conn->query($shipment);
$s = $conn->query($shipment)->fetch_assoc();
?>
<html>

<head>
  <link rel="stylesheet" href="css/print.css">
</head>

<body>
  <div class="printable">
    <div class="header">
      <h1>Merchant Server</h1>
      <div class="meta"> Delivery To <?php echo $s['sh_title'] . ' ' . $s['sh_firstname'] . ' ' . $s['sh_lastname'] ?></div>
    </div>
    <div class="info">
      <div class="recipient">
        <h2>Recipient</h2>
        <ul>
          <li>
            <div>Street Name</div>
            <div> <?php echo $s['sh_street1'] ?> </div>
          </li>
          <li>
            <div>City</div>
            <div> <?php echo $s['sh_city'] ?> </div>
          </li>
          </li>
          <li>
            <div>Country</div>
            <div> <?php echo $s['sh_country'] ?> </div>
          </li>
          <li>
            <div>Postcode</div>
            <div> <?php echo $s['sh_postcode'] ?> </div>
          </li>
        </ul>
      </div>

      <div class="contact">
        <h2>Contact</h2>
        <ul>
          <li>
            <div>Name</div>
            <div>
              <?php echo $s['sh_title'] . ' ' . $s['sh_firstname'] . ' ' . $s['sh_lastname'] ?>
            </div>
          </li>
          <li>
            <div>Email</div>
            <div> <?php echo $s['sh_email'] ?> </div>
          </li>
          </li>
          <li>
            <div>Phone Number</div>
            <div> <?php echo $s['sh_phone'] ?> </div>
          </li>
        </ul>
      </div>
    </div>

    <div class="tear">
      Tear below line and pack into parcel
    </div>

    <table>
      <tr>
        <th>#SKU</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        </th>
      </tr>
      <?php
      while ($row = $data->fetch_assoc()) {
        echo "<tr>" .
          "<td>" . $row["prod_sku"] . "</td>" .
          "<td>" . $row["prod_name"] . "</td>" .
          "<td>" . $row["Order_Total"] . "</td>" .
          "<td>" . $row["OP_qty"] . "</td>" .
          "</tr>";
      }
      ?>
    </table>
  </div>
  </div>
</body>

</html>