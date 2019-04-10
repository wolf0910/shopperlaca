<?php
ob_start();
// Database details
include ('../../../config/db_config.php');

$check=1;

if(!empty($_POST["agent_phone"]) ) {
  $query = "SELECT * FROM table_administrator WHERE UPPER(administrator_phone)=UPPER('" . $_POST["agent_phone"] . "') ";
  $result = mysqli_query($conn,$query);
  $count = $result->num_rows;
  if($count>0) $check=0;

  $query = "SELECT * FROM table_agent WHERE UPPER(agent_phone)=UPPER('" . $_POST["agent_phone"] . "') ";
  $result = mysqli_query($conn,$query);
  $count = $result->num_rows;
  if($count>0) $check=0;

  $query = "SELECT * FROM table_customer WHERE UPPER(customer_phone)=UPPER('" . $_POST["agent_phone"] . "') ";
  $result = mysqli_query($conn,$query);
  $count = $result->num_rows;
  if($count>0) $check=0;


}

if(!empty($_POST["agent_phone"]) && !empty($_POST["id_agent"]) ) {
  $query = "SELECT * FROM table_agent WHERE id_agent != '".$_POST["id_agent"]."' AND UPPER(agent_phone)=UPPER('" . $_POST["agent_phone"] . "') ";
  $result = mysqli_query($conn,$query);
  $count = $result->num_rows;
  if($count>0) $check=0;

  $query = "SELECT * FROM table_administrator WHERE UPPER(administrator_phone)=UPPER('" . $_POST["agent_phone"] . "') ";
  $result = mysqli_query($conn,$query);
  $count = $result->num_rows;
  if($count>0) $check=0;

  $query = "SELECT * FROM table_customer WHERE UPPER(customer_phone)=UPPER('" . $_POST["agent_phone"] . "') ";
  $result = mysqli_query($conn,$query);
  $count = $result->num_rows;
  if($count>0) $check=0;

}



if(!empty($_POST["agent_phone"]) ){
$result = mysqli_query($conn,$query);  

  if($check!=1) {
     echo "Số điện thoại đã tồn tại! hãy chọn số khác";
     echo ' <script>     $("#button_submit").prop("disabled", true);     </script>  ';
  }else{
      echo "";
      echo ' <script>     $("#button_submit").prop("disabled", false);     </script>  ';
  }
}


?>