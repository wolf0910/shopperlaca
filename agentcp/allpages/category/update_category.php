<?php
$id=$_GET['edit'];
  if(isset($_POST['submit']))
  {
      $err ="";
      $name = $_POST['txt_name'];
      if(empty($name)){
        $err = "Vui Lòng Nhập Tên";
      }else if(empty($_FILES['avatar']['name']))
      {
          $sql = "UPDATE `table_category` SET `category_name`='".$name."' WHERE `id_category` = '".$id."'"; 
          $result = mysqli_query($conn,$sql);   
          if($result == true){
            $err = "Update Category Thành Công";
          }else{
            $err="Update Category Thất Bại";
          }
      }else{
        move_uploaded_file($_FILES['avatar']['tmp_name'], '../images/categories/'.$_FILES['avatar']['name']);
        $hinh = 'images/categories/'.$_FILES['avatar']['name'];
        $sql = "UPDATE `table_category` SET `category_name`='".$name."',`category_img`='".$hinh."' WHERE `id_category` = '".$id."'"; 
        $result = mysqli_query($conn,$sql);   
        if($result == true){
          $err = "Update Category Thành Công";
        }else{
          $err="Update Category Thất Bại";
        }
      }
  }
  $sql = "SELECT * FROM `table_category` WHERE `id_category` = '".$id."'";
  $result3 = mysqli_query($conn,$sql);
  $ley = mysqli_fetch_assoc($result3);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Category</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Update Category</h4>

          <div class="panel-options">
              <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
              <a onclick="reload()" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
             <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
          </div>
      </div>
      <div class="table-responsive" style="padding: 50px">
          <h3 style="text-align: center; color: red"><?php if(isset($err))echo $err?></h3>
          <form action="" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="exampleInputEmail1">Category Name (*)</label>
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['category_name'] ?>" placeholder="Enter Name Product">
          </div>
          <div class="form-group"><a><img src="../<?php echo $ley['category_img']?>" alt="" height="150px"/></a></div>
          <div class="form-group">
            <label for="exampleInputPassword1">Image (*)</label>
            <input type="file" name="avatar" class="form-control">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Update</button>
        </form>
      </div>
  </div>
</div>