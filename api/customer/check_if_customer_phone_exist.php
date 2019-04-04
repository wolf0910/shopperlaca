<?php

if(isset($_REQUEST['customer_phone']))
{
  if($_REQUEST['customer_phone']==''){
    unset($_REQUEST['customer_phone']);
  }
}

if(!isset($_REQUEST['customer_phone']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'customer_phone missing !!!')
    );
    exit();
}

// check if customer_phone exist in table_user
  $sql_tmp='SELECT * FROM table_customer WHERE customer_phone= '.$_REQUEST['customer_phone'].' ';
  $rs=mysqli_query($conn,$sql_tmp);
  if(mysqli_num_rows($rs)<1){
    echo json_encode(
      array('success'   => 'false','message' => 'customer_phone doesnt exist in DB !!!')
    );
    exit();
  }
// end check if customer_phone exist in table_user


 echo json_encode(
      array('success'   => 'true','message' => 'customer_phone exist in DB !!!')
    );
    exit();


?>






