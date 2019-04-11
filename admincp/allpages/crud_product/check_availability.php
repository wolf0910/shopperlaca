<?php
ob_start();
// Database details
include ('../../config/Database_mysqli.php');

$query='';

if(!empty($_POST["email"]) ) {
  $query = "SELECT * FROM table_users WHERE UPPER(email)=UPPER('" . $_POST["email"] . "') ";
  
}

if(!empty($_POST["email"]) && !empty($_POST["id_user"]) ) {
  $query = "SELECT * FROM table_users WHERE id_user != '".$_POST["id_user"]."' AND UPPER(email)=UPPER('" . $_POST["email"] . "') ";
}



if(!empty($_POST["email"]) ){
$result = mysqli_query($db_connection,$query);  


$user_count = $result->num_rows;
  if($user_count>0) {
     echo "Email đã tồn tại! hãy chọn tên khác";
     echo ' <script>     $("#button_submit").prop("disabled", true);     </script>  ';
  }else{
      echo "";
      echo ' <script>     $("#button_submit").prop("disabled", false);     </script>  ';
  }
}


?>