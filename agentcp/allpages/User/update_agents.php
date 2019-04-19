<?php
  if(isset($_POST['submit']))
  {
    $edit = $_GET['edit'];
    $sql = "SELECT * FROM `table_agent` WHERE `id_agent` = '".$edit."'";
    $result = mysqli_query($conn,$sql);
    $rows = mysqli_fetch_assoc($result);

      $err ="";
      $name = $_POST['txt_name'];
      $pass = $_POST['txt_pass'];
      $pass_new = md5($_POST['txt_pass_new']);
      $phone = $_POST['txt_phone'];
      $email = $_POST['txt_email'];
      $address = $_POST['txtaddress'];
      if(empty($name)){
         $err ="Vui Lòng Nhập Tên !!!";
      }else if(empty($phone)){
        $err ="Vui Lòng Nhập Số Điện Thoại !!!";
      }else if(empty($email)){
        $err ="Vui Lòng Nhập Email";
      }else if(empty($address)){
        $err =" Vui Lòng Nhập Địa Chỉ";
      }else{
        if(md5($pass) == $rows['agent_password'])
        {
          $sql = "UPDATE `table_agent` SET `agent_name`='".$name."',`agent_phone`='".$phone."',`agent_email`='".$email."',`agent_password`='".$pass_new."',`agent_address`='".$address."' WHERE `id_agent` = '".$edit."'";
           $results = mysqli_query($conn,$sql);
            mysqli_close($conn);
            if($results == true){
              $err = "Update Thành Công !!!";
            }else{
              $err = "Update Thất Bại !!!";
            }
        }else if(empty($pass)){
          $sql = "UPDATE `table_agent` SET `agent_name`='".$name."',`agent_phone`='".$phone."',`agent_email`='".$email."',`agent_address`='".$address."' WHERE `id_agent` = '".$edit."'";
           $results = mysqli_query($conn,$sql);
            mysqli_close($conn);
            if($results == true){
              $err = "Update Thành Công !!!";
            }else{
              $err = "Update Thất Bại !!!";
            }
        }else{
          $err = "Mật khẩu Cũ Không Chính Xác !!!";
        }
      }
  }else{
    $edit = $_GET['edit'];
    $sql = "SELECT * FROM `table_agent` WHERE `id_agent` = '".$edit."'";
    $result = mysqli_query($conn,$sql);
    $rows = mysqli_fetch_assoc($result);
  }
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Quản lý Tài Khoản</a></li>
    </ol>
</div>
<div class="container-fluid-md">
  <div class="panel panel-default">
      <div class="panel-heading">

          <h4 class="panel-title">Update Agents</h4>

          <div class="panel-options">
              <!-- <a href="#" data-rel="collapse"><i class="fa fa-fw fa-minus"></i></a> -->
              <a onclick="reload()" data-rel="reload"><i class="fa fa-fw fa-refresh"></i></a>
             <!--  <a href="#" data-rel="close"><i class="fa fa-fw fa-times"></i></a> -->
          </div>
      </div>
      <div class="table-responsive" style="padding: 50px">
          <h3 style="text-align: center; color: red"><?php if(isset($err))echo $err?></h3>
          <form action="" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">Agents Name (*)</label>
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" value="<?php
             echo $rows['agent_name']?>" placeholder="Enter Name">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">password</label>
            <input type="password" name="txt_pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">password new</label>
            <input type="password" name="txt_pass_new" class="form-control" id="exampleInputPassword1" placeholder="Password new">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Phone (*)</label>
            <input type="text" name="txt_phone" class="form-control" id="exampleInputEmail1" value="<?php
             echo $rows['agent_phone'] ?>" placeholder="Enter Phone">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">email (*)</label>
            <input type="text" name="txt_email" class="form-control" id="exampleInputEmail1" value="<?php
             echo $rows['agent_email']?>" placeholder="Enter email">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Address (*)</label>
            <input type="text" name="txtaddress" class="form-control" id="exampleInputEmail1" value="<?php
             echo $rows['agent_address']?>" placeholder="Enter Address">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Update</button>
        </form>
      </div>
  </div>
</div>