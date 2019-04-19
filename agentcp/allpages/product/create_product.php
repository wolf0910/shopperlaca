<?php
  if(isset($_POST['submit']))
  {
      $ngay = date('y-m-d');
      $err ="";
      $mota = $_POST['txt_mota'];
      $Category = $_POST['txt_Category'];
      $price = $_POST['txt_price'];
      $lazada = $_POST['txt_lazada'];
      $tiki = $_POST['txt_tiki'];
      $soppee = $_POST['txt_soppee'];
      $name = $_POST['txt_name'];
      if ($_FILES['avatar']['error'] > 0)
      {
          $err =  'File Upload Bị Lỗi';
      }else if(empty($name)){
         $err ="Vui Lòng Nhập Tên Sản Phẩm !!!";
      }else if(empty($mota)){
        $err ="Vui Lòng Nhập Mô Tả !!!";
      }else if(empty($Category)){
        $err ="Vui Lòng Nhập Danh Mục !!!";
      }else if(empty($price)){
        $err ="Vui Lòng Nhập Gía !!!";
      }else if(empty($lazada)){
        $err =" Vui Lòng Nhập Gía lazada";
      }else if(empty($tiki)){
        $err ="Vui Lòng Nhập Gía tiki";
      }else if(empty($soppee)){
        $err =" Vui Lòng Nhập Gía Soppee";
      }else{
        move_uploaded_file($_FILES['avatar']['tmp_name'], '../images/products/'.$_FILES['avatar']['name']);
        $hinh = 'images/products/'.$_FILES['avatar']['name'];
        $sql = "INSERT INTO table_product(id_category,product_name,product_description,product_price,date_created,product_price_4compare1,product_price_4compare2,product_price_4compare3) 
        VALUES('".$Category."','".$name."','".$mota."','".$price."','".$ngay."','".$lazada."','".$tiki."','".$soppee."')"; 
        $result = mysqli_query($conn,$sql);   
        if($result == true){
          $sql="SELECT * FROM `table_product` WHERE `product_name` = '".$name."' AND`date_created` = '".$ngay."'";
           $result1 = mysqli_query($conn,$sql);
           $rows = mysqli_fetch_assoc($result1);
           if($result1 == true){
            $sql="INSERT INTO `table_product_detail`( `id_product`, `photo_link`) VALUES ('".$rows['id_product']."','".$hinh."')";
            $result2 = mysqli_query($conn,$sql);
            if($result2 == true){
              $err = "Thêm Sản Phẩm Thành Công";
            }else{
              $err="Insert Hình Không Thành Công";
            }
           }else{
            $err="Thêm Sản Phẩm Thất Bại";
           }
        }else{
          $err ="Thêm Sản Phẩm Thất Bại";
        }
      }
  }
  $sql="SELECT * FROM `table_category` WHERE 1=1";
  $result = mysqli_query($conn,$sql);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý Sản Phẩm</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Thêm Sản Phẩm</h4>

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
            <label for="exampleInputEmail1">Product Name (*)</label>
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter Name Product">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Image (*)</label>
            <input type="file" name="avatar" class="form-control">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea2">Mô Tả (*)</label>
            <textarea class="form-control rounded-0" name="txt_mota" id="exampleFormControlTextarea2" rows="3"></textarea>
          </div>
          <div class="form-group">
            <label for="txtHoTen">Category</label>
              <select name="txt_Category" class="form-control">
                  <?php foreach($result as $key){ ?>
                      <option value='<?php echo $key['id_category'] ?>'> <?php echo $key['category_name'] ?></option>
                  <?php } ?>
              </select>                                                                             
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Product price (*)</label>
            <input type="text" name="txt_price" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter price">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">price Lazada (*)</label>
            <input type="text" name="txt_lazada" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter price Lazada">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">price Tiki (*)</label>
            <input type="text" name="txt_tiki" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter price Tiki">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">price Shopee (*)</label>
            <input type="text" name="txt_soppee" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter price Shopee">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Create</button>
        </form>
      </div>
  </div>
</div>