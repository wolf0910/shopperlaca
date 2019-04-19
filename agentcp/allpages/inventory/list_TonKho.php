<?php
  $sql = "SELECT * FROM `table_storage` A INNER JOIN table_product B ON A.`id_product` = B.id_product 
INNER JOIN table_product_detail C ON A.`id_product` = C.id_product WHERE 1=1 ORDER BY `A`.`id_storage` DESC";
  $result = mysqli_query($conn,$sql);
  mysqli_close($conn);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý Tồn Kho</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Dạm Sách Tồn Kho</h4>

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
                  <th scope="col">Image</th>
                  <th scope="col">Product Name</th>
                  <th scope="col" style="width: 120px;">Tồn Kho</th>
                  <th scope="col" style="width: 150px;">Tồn Kho An Toàn</th>
                  <th scope="col">Edit</th>
                  <th scope="col">Delete</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($result as $key) { ?>
                  <tr>
                    <th scope="row"><?php echo $key['id_product']?></th>
                    <td><a><img src="../<?php echo $key['photo_link']?>" alt="" height="150px"/></a></td>
                    <td><?php echo $key['product_name']?></td>
                    <td><?php echo $key['quantity']?></td>
                    <td><?php echo $key['safe_quantity']?></td>
                    <td style="text-align: center"><a href="?page=enter_inventory&edit=<?php echo $key['id_product'] ?>" class="btn btn-primary"><i class="fa fa-edit"></i></a></td>
                    <td style="text-align: center"><a onclick="return ConfirmDelete(<?php echo $key['id_storage']?>)" class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></a></td>
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
        if (confirm("Bạn Chắc Chắc Chãn Muốn Xóa Không ?")){
            window.location="?page=delete_tonkho&delete="+a;
        }
    }
</script>