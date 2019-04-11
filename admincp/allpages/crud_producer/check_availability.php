<?php
ob_start();
// Database details
include ('../../../config/db_config.php');

$query='';

if(!empty($_POST["producer_name"]) ) {
  $query = "SELECT * FROM table_producer WHERE UPPER(producer_name)=UPPER('" . $_POST["producer_name"] . "') ";
  
}

if(!empty($_POST["producer_name"]) && !empty($_POST["id_producer"]) ) {
  $query = "SELECT * FROM table_producer WHERE id_producer != '".$_POST["id_producer"]."' AND UPPER(producer_name)=UPPER('" . $_POST["producer_name"] . "') ";
}



if(!empty($_POST["producer_name"]) ){
$result = mysqli_query($conn,$query);  


$user_count = $result->num_rows;
  if($user_count>0) {
     echo "Tên nhà sản xuất đã tồn tại! hãy chọn tên khác";
     echo ' <script>     $("#button_submit").prop("disabled", true);     </script>  ';
  }else{
      echo "";
      echo ' <script>     $("#button_submit").prop("disabled", false);     </script>  ';
  }
}


?>