<?php
  $delivery = $_SESSION['id_agent'];
  $sql = "SELECT * FROM table_order A 
INNER JOIN table_customer B ON A.id_customer = B.id_customer WHERE A.delivery_status = 3 AND `id_agent` = '".$delivery."'";
  $result = mysqli_query($conn,$sql);
  mysqli_close($conn);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Order</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Order Completed</h4>

          <div class="panel-options">
              <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
              <a onclick="reload()" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
             <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
          </div>
      </div>
      <div class="table-responsive" style="padding: 50px">
          <table class="table">
              <thead>
                <tr>
                  <th scope="col">STT</th>
                  <th scope="col">Name</th>
                  <th scope="col">Date Created</th>
                  <th scope="col">Delivery Status</th>
                  <th scope="col">Customer Phone</th>
                  <th scope="col">Customer Email</th>
                  <th scope="col">Customer Address</th>
                  <th scope="col">Detail Order</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($result as $key) { ?>
                  <tr>
                    <th scope="row"><?php echo $key['id_order']?></th>
                    <td><?php echo $key['customer_fullname']?></td>
                    <td><?php echo $key['date_created']?></td>
                    <td><?php echo $key['delivery_status']?></td>
                    <td><?php echo $key['customer_phone']?></td>
                    <td><?php echo $key['customer_email']?></td>
                    <td><?php echo $key['customer_address']?></td>
                     <td style="text-align: center"><a href="?page=detail_order&edit=<?php echo $key['id_order'] ?>" class="btn btn-primary">Detail</a></td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
      </div>
  </div>
</div>