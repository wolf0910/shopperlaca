<?php
$id=$_GET['edit'];
$agetns = $_SESSION['id_agent'];
  if(isset($_POST['submit']))
  {
      $err ="";
      $tonkho = $_POST['txt_tonkho'];
      $tonkhoantoan = $_POST['txt_antoan'];
      if(empty($tonkho)){
        $err = "Please enter inventory";
      }else if(empty($tonkhoantoan))
      {
          $err = "Please enter sale inventory";
      }else{
        $sql="SELECT * FROM `table_storage` WHERE `id_product` = '".$id."'";
        $result = mysqli_query($conn,$sql);
        $row = mysqli_num_rows($result);
        if($row > 0){
            $sql = "UPDATE `table_storage` SET `quantity`='".$tonkho."',`safe_quantity`='".$tonkhoantoan."' WHERE `id_product` = '".$id."'"; 
             $result1 = mysqli_query($conn,$sql);   
            if($result1 == true){
              $err = "Update inventory True";
            }else{
              $err="Update inventory False";
            }
        }else{
            $sql = "INSERT INTO `table_storage`(`id_agent`, `id_product`, `quantity`, `safe_quantity`) VALUES ('".$agetns."','".$id."','".$tonkho."','".$tonkhoantoan."')"; 
            $result1 = mysqli_query($conn,$sql);   
            if($result1 == true){
              $err = "Create inventory true";
            }else{
              $err="Create inventory False";
            }
        }
        
      }
  }
  $sql = "SELECT * FROM `table_product` WHERE `id_product` = '".$id."'";
  $result3 = mysqli_query($conn,$sql);
  $ley = mysqli_fetch_assoc($result3);
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage Inventory</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Update Inventory</h4>

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
            <label for="exampleInputEmail1">Product Name</label>
            <input type="text" readonly name="txt_name" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['product_name'] ?>">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Product Price</label>
            <input type="text" readonly name="txt_name" class="form-control" id="exampleInputEmail1" value="<?php echo $ley['product_price'] ?>">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Inventory (*)</label>
            <input type="text" name="txt_tonkho" class="form-control" id="exampleInputEmail1" value="" placeholder="Nhập Tồn Kho">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Inventory Safe (*)</label>
            <input type="text" name="txt_antoan" class="form-control" id="exampleInputEmail1" value="" placeholder="Nhập Tồn Kho An Toàn">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Update</button>
        </form>
      </div>
  </div>
</div>