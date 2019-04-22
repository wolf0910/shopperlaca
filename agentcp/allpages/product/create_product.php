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
          $err =  'Vui Lòng Chọn File Hình';
      }else if(empty($name)){
         $err ="Please Enter The Name products !!!";
      }else if(empty($mota)){
        $err ="Please Enter The describe !!!";
      }else if(empty($Category)){
        $err ="Please Enter The Category !!!";
      }else if(empty($price)){
        $err ="Please Enter The Price !!!";
      }else if(empty($lazada)){
        $err ="Please Enter the price lazada";
      }else if(empty($tiki)){
        $err ="Please Enter the price tiki";
      }else if(empty($soppee)){
        $err ="Please Enter the price Soppee";
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
              $err = "Create Product Thành Công";
            }else{
              $err="Insert Image Thất Bại";
            }
           }else{
            $err="Create Product Thất Bại";
           }
        }else{
          $err ="Create Product Thất Bại";
        }
      }
  }
  $sql="SELECT * FROM `table_category` WHERE 1=1";
  $result = mysqli_query($conn,$sql);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Product</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Create Product</h4>

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
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" value="<?php if(isset($_POST['submit'])){
               echo $_POST['txt_name'];
            }?>" placeholder="Enter Name Product">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Image (*)</label>
            <input type="file" name="avatar" class="form-control">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea2">Describe (*)</label>
            <div class="panel-body">
              <textarea id="wysiwyg" name="txt_mota" class="form-control" placeholder="Enter message ..." rows="25"><?php if(isset($_POST['submit'])){
               echo $_POST['txt_mota'];
            }?></textarea>
            </div>
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
            <label for="exampleInputEmail1">Product Price (*)</label>
            <input type="text" name="txt_price" class="form-control" id="exampleInputEmail1" value="<?php if(isset($_POST['submit'])){
               echo $_POST['txt_price'];
            }?>" placeholder="Enter price">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Price Lazada (*)</label>
            <input type="text" name="txt_lazada" class="form-control" id="exampleInputEmail1" value="<?php if(isset($_POST['submit'])){
               echo $_POST['txt_lazada'];
            }?>" placeholder="Enter price Lazada">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Price Tiki (*)</label>
            <input type="text" name="txt_tiki" class="form-control" id="exampleInputEmail1" value="<?php if(isset($_POST['submit'])){
               echo $_POST['txt_tiki'];
            }?>" placeholder="Enter price Tiki">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Price Shopee (*)</label>
            <input type="text" name="txt_soppee" class="form-control" id="exampleInputEmail1" value="<?php if(isset($_POST['submit'])){
               echo $_POST['txt_soppee'];
            }?>" placeholder="Enter price Shopee">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Create</button>
        </form>
      </div>
  </div>
</div>