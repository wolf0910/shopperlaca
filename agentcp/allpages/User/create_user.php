<?php
  if(isset($_POST['submit']))
  {
      $err ="";
      $name = $_POST['txt_name'];
      $pass = $_POST['txt_pass'];
      $pass_new = $_POST['txt_pass_new'];
      $phone = $_POST['txt_phone'];
      $email = $_POST['txt_email'];
      $address = $_POST['txtaddress'];
      if(empty($name)){
         $err ="Please Enter The Name !!!";
      }else if(empty($pass)){
        $err ="Please Enter The Password !!!";
      }else if(empty($pass_new)){
        $err ="Please Enter The password Retype !!!";
      }else if(empty($phone)){
        $err ="Please Enter The Phone Number !!!";
      }else if(empty($email)){
        $err ="Please Enter The Email";
      }else if(empty($address)){
        $err ="Please Enter The Address";
      }else{
        if($pass == $pass_new){
          $pass_news = md5($pass_new);
          $sql="INSERT INTO `table_agent`(`agent_name`, `agent_phone`, `agent_email`, `agent_password`,`agent_address`) VALUES ('".$name."','".$phone."','".$email."','".$pass_news."','".$address."')";
          $result = mysqli_query($conn , $sql);
          mysqli_close($conn);
          if($result == true){
            ?>
              <script>
                alert("Create True");
                window.location="?page=list_user";
              </script>
            <?php
          }else{
            ?>
              <script>
                alert("Create False");
                window.location="?page=list_user";
              </script>
            <?php
          }
        }else{
          $err ="password incorrect";
        }
      }
  }
?>
<div class="page-content">
  <div class="page-subheading page-subheading-md">
    <ol class="breadcrumb">
        <li class="active"><a href="../admin_template/javascript:;">Manage User</a></li>
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
            <input type="text" name="txt_name" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter Name">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">password (*)</label>
            <input type="password" name="txt_pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">password Retype (*)</label>
            <input type="password" name="txt_pass_new" class="form-control" id="exampleInputPassword1" placeholder="Password new">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Phone (*)</label>
            <input type="text" name="txt_phone" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter Phone">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">email (*)</label>
            <input type="text" name="txt_email" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter email">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Address (*)</label>
            <input type="text" name="txtaddress" class="form-control" id="exampleInputEmail1" value="" placeholder="Enter Address">
          </div>
          <button type="submit" name="submit" class="btn btn-primary">Update</button>
        </form>
      </div>
  </div>
</div>