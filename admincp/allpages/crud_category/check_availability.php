<?php
ob_start();
// Database details
include ('../../../config/db_config.php');

$query='';

if(!empty($_POST["category_name"]) ) {
  $query = "SELECT * FROM table_category WHERE UPPER(category_name)=UPPER('" . $_POST["category_name"] . "') ";
  
}

if(!empty($_POST["category_name"]) && !empty($_POST["id_category"]) ) {
  $query = "SELECT * FROM table_category WHERE id_category != '".$_POST["id_category"]."' AND UPPER(category_name)=UPPER('" . $_POST["category_name"] . "') ";
}



if(!empty($_POST["category_name"]) ){
$result = mysqli_query($conn,$query);  


$user_count = $result->num_rows;
  if($user_count>0) {
     echo "Tên danh mục đã tồn tại! hãy chọn tên khác";
     echo ' <script>     $("#button_submit").prop("disabled", true);     </script>  ';
  }else{
      echo "";
      echo ' <script>     $("#button_submit").prop("disabled", false);     </script>  ';
  }
}


?>