<?php 

  if(isset($_REQUEST['customer_phone']))
  {
    if($_REQUEST['customer_phone']==''){
      unset($_REQUEST['customer_phone']);
    }
  }

  if(isset($_REQUEST['new_password']))
  {
    if($_REQUEST['new_password']==''){
      unset($_REQUEST['new_password']);
    }
  }

  if(!isset($_REQUEST['customer_phone']))
  {
    echo json_encode(
        array('success'   => 'false','message' => 'customer_phone missing !!!')
      );
    exit();
  }

  if(!isset($_REQUEST['new_password']))
  {
    echo json_encode(
        array('success'   => 'false','message' => 'new_password missing !!!')
      );
    exit();
  }

  if (isset($_REQUEST['new_password']) )         
  { 
    $query = "UPDATE table_customer SET ";
    $query .= "customer_password = '" . md5(mysqli_real_escape_string($db_connection, $_REQUEST['new_password']))        . "' "; 
    $query .= "WHERE customer_phone = '" .mysqli_real_escape_string($db_connection, $_REQUEST['customer_phone'])."'"; 
    // check execute query
    if($conn->query($query)) {
      $check=1;
    } else {
      $check=0;
    }
  }

// get all user new info

  $sql = "
    SELECT * FROM table_customer WHERE customer_phone= '".$_REQUEST['customer_phone']."'
   ";
   $result = $conn->query($sql);
   $user_arr=array();
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) 
    {                  
      $user_item = array(
              'id_customer' => $row['id_customer'],
              'customer_fullname' => $row['customer_fullname'],
              'customer_address' => $row['customer_address'],
              'customer_password' => $row['customer_password'],            
              'customer_phone' => $row['customer_phone']             
            );   
    }
    $user_arr['success']='true';
    $user_arr['data']=$user_item;
  // end get all user new info

  if( $check==0){
      echo json_encode(
        array('success' => 'false','message' => 'update error !!!')
      );
    }else{
      echo json_encode($user_arr);
    } 
  }

  
?>