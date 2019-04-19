<?php
  if(isset($_POST['submit']))
  {
      $err ="";
      $name = $_POST['txt_name'];
      if ($_FILES['avatar']['error'] > 0)
      {
          $err =  'File Upload Bị Lỗi';
      }else if(empty($name)){
         $err ="Vui Lòng Nhập Tên Danh Mục !!!";
      }else{
        move_uploaded_file($_FILES['avatar']['tmp_name'], '../images/categories/'.$_FILES['avatar']['name']);
        $hinh = 'images/categories/'.$_FILES['avatar']['name'];
        $sql = "INSERT INTO `table_category`(`category_name`, `category_img`) VALUES ('".$name."','".$hinh."')"; 
        $result = mysqli_query($conn,$sql);   
        if($result == true){
          $err = "Thêm Category Thành Công";
        }else{
          $err="Thêm Category Thất Bại";
        }
      }
  }
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

          <h4 class="panel-title">Thêm Danh Mục</h4>

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
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter Name Product">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Image (*)</label>
            <input type="file" name="avatar" class="form-control">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Create</button>
        </form>
      </div>
  </div>
</div>