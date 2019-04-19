<?php
  $customer = $_GET['edit'];
  $sql = "SELECT * FROM  `table_order` WHERE  `id_customer` = '".$customer."' ORDER BY  `table_order`.`delivery_status` ASC";
  $result = mysqli_query($conn,$sql);
  mysqli_close($conn);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Order By Customer/a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Manage Order By Customer</h4>

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
                  <th scope="col">date created</th>
                  <th scope="col">delivery status</th>
                  <th scope="col">Detail order</th>
                </tr>
              </thead>
              <tbody>
                <?php $a =1;  foreach($result as $key) { ?>
                  <tr>
                    <th scope="row"><?php echo $a?></th>
                    <td><?php echo $key['date_created']?></td>
                    <td><?php echo $key['delivery_status']?></td>
                     <td><a href="?page=detail_order&edit=<?php echo $key['id_order'] ?>" class="btn btn-primary">Detail</a></td>
                  </tr>
                <?php $a++;} ?>
              </tbody>
            </table>
      </div>
  </div>
</div>