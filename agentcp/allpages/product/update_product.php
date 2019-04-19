<?php
  $id = $_GET['edit'];
  if(isset($_POST['submit']))
  {
      $file = $_FILES['avatar']['name'];
      $ngay = date('y-m-d');
      $err ="";
      $mota = $_POST['txt_mota'];
      $Category = $_POST['txt_Category'];
      $price = $_POST['txt_price'];
      $lazada = $_POST['txt_lazada'];
      $tiki = $_POST['txt_tiki'];
      $soppee = $_POST['txt_soppee'];
      $name = $_POST['txt_name'];

      if(empty($name)){
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
        $sql = "UPDATE `table_product` SET `id_category`='".$Category."',`product_name`='".$name."',`product_description`='".$mota."',`product_price`='".$price."',`date_created`='".$ngay."',`product_price_4compare1`='".$lazada."',`product_price_4compare2`='".$tiki."',`product_price_4compare3`='".$soppee."' WHERE `id_product` ='".$id."' ";
        $result = mysqli_query($conn,$sql);   
        if($result == true)
        {
          if(empty($file)){
              $err = "Thêm Sản Phẩm Thành Công";
          }else{
            $sql="SELECT * FROM `table_product` WHERE `product_name` = '".$name."' AND`date_created` = '".$ngay."'";
            $result1 = mysqli_query($conn,$sql);
             $rows = mysqli_fetch_assoc($result1);
            if($result1 == true)
            {
               $sql="UPDATE `table_product_detail` SET`photo_link`='".$hinh."'  WHERE `id_product` =  '".$id."'";
               $result2 = mysqli_query($conn,$sql);
               if($result2 == true){
                $err = "Thêm Sản Phẩm Thành Công";
              }else{
                $err="Insert Hình Không Thành Công";
              }
            }
          }
        }
      }
    }
  $sql="SELECT * FROM `table_category` WHERE 1=1";
  $result = mysqli_query($conn,$sql);

  $sql = "SELECT * FROM `table_product` A
  INNER JOIN table_product_detail B ON A.`id_product` = B.id_product
  INNER JOIN table_category C ON A.`id_category` = C.id_category WHERE A.id_product = '".$id."'";
  $result3 = mysqli_query($conn,$sql);
  $ley = mysqli_fetch_assoc($result3);
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

          <h4 class="panel-title">Update Sản Phẩm</h4>

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
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" 
            value="<?php echo $ley['product_name'] ?>" placeholder="Enter Name Product">
          </div>
          <div class="form-group"><a><img src="../<?php echo $ley['photo_link']?>" alt="" height="150px"/></a></div>
          <div class="form-group">
            <label for="exampleInputPassword1">Image (*)</label>
            <input type="file" name="avatar" class="form-control">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea2">Mô Tả (*)</label>
            <textarea class="form-control rounded-0" name="txt_mota" id="exampleFormControlTextarea2" rows="3"><?php echo $ley['product_description'] ?></textarea>
          </div>
          <div class="form-group">
            <label for="txtHoTen">Category</label>
              <select name="txt_Category" class="form-control">
                  <?php foreach($result as $key){
                    if($ley['id_category'] == $key['id_category'] )
                      {
                      ?>
                        <option selected="selected" value='<?php echo $key['id_category'] ?>'> <?php echo $key['category_name'] ?></option>
                      <?php
                      }else{
                      ?>
                        <option value='<?php echo $key['id_category'] ?>'> <?php echo $key['category_name'] ?></option>
                      <?php
                      }
                   } ?>
              </select>                                                                             
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Product price (*)</label>
            <input type="text" name="txt_price" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['product_price'] ?>" placeholder="Enter price">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">price Lazada (*)</label>
            <input type="text" name="txt_lazada" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['product_price_4compare1'] ?>" placeholder="Enter price Lazada">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">price Tiki (*)</label>
            <input type="text" name="txt_tiki" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['product_price_4compare2'] ?>" placeholder="Enter price Tiki">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">price Shopee (*)</label>
            <input type="text" name="txt_soppee" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['product_price_4compare3'] ?>" placeholder="Enter price Shopee">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Create</button>
        </form>
      </div>
  </div>
</div>