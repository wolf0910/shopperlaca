<?php
session_start();
ob_start();  
include ('../config/db_config.php');

echo ' <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">';
  $pass = md5($_REQUEST['mypassword']);
  $query = "SELECT * FROM `table_agent` WHERE `agent_phone` = '".$_REQUEST['myusername']."' AND `agent_password` ='".$pass."' ";
  // fix loi font tieng viet
  mysqli_set_charset($conn, 'UTF8');
  $result = mysqli_query($conn, $query);
  $row = mysqli_fetch_assoc($result);
  //echo $query;
  $rows = mysqli_num_rows($result);
  if($rows > 0) {
    //end handle disable account

    // gan thong tin nguoi dung vao session
    $_SESSION['agent_name']=$row['agent_name'];
    $_SESSION['id_agent']=$row['id_agent'];
    $_SESSION['agent_avatar']=$row['agent_avatar'];
    

  	echo "<script>
    alert('Đăng nhập thành công !!!');
    window.location='agentcp.php';
		</script>"; 
		
  } else {
  echo "<script>
    alert('Đăng nhập thất bại !!!');
    window.location='index.php';
    </script>";
 
  }

?>