<?php
  $sql = "SELECT * FROM `table_category` WHERE 1=1";
  $result = mysqli_query($conn,$sql);
  mysqli_close($conn);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý Danh Mục</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Dạm Sách Danh Mục</h4>

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
                  <th scope="col">category name</th>
                  <th scope="col">category image</th>
                  <th scope="col">Edit</th>
                  <th scope="col">Delete</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($result as $key) { ?>
                  <tr>
                    <th scope="row"><?php echo $key['id_category']?></th>
                    <td><?php echo $key['category_name']?></td>
                    <td><a><img src="../<?php echo $key['category_img']?>" alt="" height="150px"/></a></td>
                    <td style="text-align: center"><a href="?page=update_category&edit=<?php echo $key['id_category'] ?>" class="btn btn-primary"><i class="fa fa-edit"></i></a></td>
                    <td style="text-align: center"><a onclick="return ConfirmDelete(<?php echo $key['id_category']?>)" class="btn btn-primary"><i class="fa fa-times" aria-hidden="true"></i></a></td> 
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
            window.location="?page=delete_category&delete="+a;
        }
    }
</script>