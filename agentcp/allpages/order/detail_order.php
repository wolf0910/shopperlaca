<?php
  $id = $_GET['edit'];
  $sql = "SELECT * FROM `table_order_detail` A INNER JOIN table_product B ON A.`id_product` = B.id_product INNER JOIN table_product_detail C ON A.id_product = C.id_product WHERE A.id_order = '".$id ."'";
  $result = mysqli_query($conn,$sql);
  mysqli_close($conn);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý Đơn Hàng</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Quản lý Đơn Hàng Mới</h4>

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
                  <th scope="col">Quantity</th>
                  <th scope="col">unit price</th>
                  <th scope="col">total price</th>
                  <th scope="col">Image Product</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($result as $key) { ?>
                  <tr>
                    <th scope="row"><?php echo $key['id_order_detail']?></th>
                    <td><?php echo $key['product_name']?></td>
                    <td><?php echo $key['quantity']?></td>
                    <td><?php echo $key['unit_price']?></td>
                    <td><?php echo ($key['unit_price'] * $key['quantity'])  ?></td>
                    <td><a><img src="../<?php echo $key['photo_link']?>" alt="" height="150px"/></a></td>
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
        if (confirm("Bạn Chắc Chắc Chãn Nhận Đơn Hàng Này Không ?")){
            window.location="?page=purchase_order&purchase="+a;
        }
    }
</script>