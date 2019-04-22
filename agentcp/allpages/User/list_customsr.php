<?php
  $sql = "SELECT * FROM `table_order` A INNER JOIN table_customer B ON A.`id_customer` = B.id_customer WHERE 1=1 ORDER BY `B`.`total_point` DESC";
  $result = mysqli_query($conn,$sql);
  mysqli_close($conn);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Customer</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Manage Customer Close</h4>

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
                  <th scope="col">Phone</th>
                  <th scope="col">Email</th>
                  <th scope="col">Address</th>
                  <th scope="col">Total Point</th>
                  <th scope="col">Order History</th>
                </tr>
              </thead>
              <tbody>
              <?php $a = 1; 
              foreach($result as $key) { ?>
                  <tr>
                    <th scope="row"><?php echo $a ?></th>
                    <td><?php echo $key['customer_fullname']?></td>
                    <td><?php echo $key['customer_phone']?></td>
                    <td><?php echo $key['customer_email']?></td>
                    <td><?php echo $key['customer_address']?></td>
                    <td><?php echo $key['total_point']?></td>
                    <td><a href="?page=order_history&edit=<?php echo $key['id_customer'] ?>" class="btn btn-primary">Detail</a></td>
                  </tr>
                <?php $a++; } ?>
              </tbody>
            </table>
      </div>
  </div>
</div>
<script type="text/javascript">
    function ConfirmDelete(a)
    {
        if (confirm("Bạn Chắc Chắc Chãn Muốn Xóa Không ?")){
            window.location="?page=delete_agents&delete="+a;
        }
    }
</script>