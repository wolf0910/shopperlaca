<?php
  $delivery = $_SESSION['id_agent'];
  $sql = "SELECT * FROM table_order A 
INNER JOIN table_customer B ON A.id_customer = B.id_customer WHERE A.delivery_status = 2 AND `id_agent` = '".$delivery."'";
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

          <h4 class="panel-title">Manage Delivery</h4>

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
                  <th scope="col">date created</th>
                  <th scope="col">delivery status</th>
                  <th scope="col">customer phone</th>
                  <th scope="col">customer email</th>
                  <th scope="col">customer address</th>
                  <th scope="col">Detail order</th>
                  <th scope="col">completed order</th>
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
                    <td style="text-align: center"><a onclick="return ConfirmDelete(<?php echo $key['id_order']?>)" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i></a></td> 
                  </tr>
                <?php } ?>
              </tbody>
            </table>
      </div>
  </div>
</div>
<script type="text/javascript">
    function ConfirmDelete(a)
    {
        if (confirm("Bạn Chắc Chắc Hoàn Tất Đơn Hàng Không ?")){
            window.location="?page=completed_order&purchase="+a;
        }
    }
</script>