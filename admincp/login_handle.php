<?php
session_start();
ob_start();  
include ('../config/db_config.php');

echo ' <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">';
      
  $query = "SELECT * FROM table_administrator WHERE administrator_phone = '".$_REQUEST['myusername']. "' ";
  // fix loi font tieng viet
  mysqli_set_charset($conn, 'UTF8');
  $result = mysqli_query($conn, $query);
  //echo $query;
  $row = mysqli_fetch_array($result);

  if ($row['administrator_password']==md5($_REQUEST['mypassword'])) {

    // handle disable account
      if($row['status']=='deactive'){
        echo "<script>
        alert('Tài khoản đã bị khóa ! Liên hệ quản trị viên để được hỗ trợ !');
        window.location='index.php';
        </script>";
        exit();
      }
    //end handle disable account

    // gan thong tin nguoi dung vao session
    $_SESSION['id_administrator']=$row['id_administrator'];
    $_SESSION['administrator_name']=$row['administrator_name'];
    $_SESSION['administrator_phone']=$row['administrator_phone'];
    $_SESSION['administrator_email']=$row['administrator_email'];
    $_SESSION['administrator_avatar']=$row['administrator_avatar'];

  	echo "<script>
    alert('Đăng nhập thành công !!!');
    window.location='admincp.php';
		</script>"; 
		
  } else {
  echo "<script>
    alert('Đăng nhập thất bại !!!');
    window.location='index.php';
    </script>";
 
  }

?>