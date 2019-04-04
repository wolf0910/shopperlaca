<?php 

if(isset($_REQUEST['customer_fullname']))
{
  if($_REQUEST['customer_fullname']==''){
    unset($_REQUEST['customer_fullname']);
  }
}

if(!isset($_REQUEST['customer_fullname']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'customer_fullname missing !!!')
    );
    exit();
}

if(isset($_REQUEST['customer_password']))
{
  if($_REQUEST['customer_password']==''){
    unset($_REQUEST['customer_password']);
  }
}

if(!isset($_REQUEST['customer_password']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'customer_password missing !!!')
    );
    exit();
}

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

if(isset($_REQUEST['customer_address']))
{
  if($_REQUEST['customer_address']==''){
    unset($_REQUEST['customer_address']);
  }
}

if(!isset($_REQUEST['customer_address']))
{
  echo json_encode(
      array('success'   => 'false','message' => 'customer_address missing !!!')
  );
  exit();
}

  // Get raw posted data
  $customer_fullname = $_REQUEST['customer_fullname'];
  $customer_password = md5($_REQUEST['customer_password']);
  $customer_phone = $_REQUEST['customer_phone'];
  $customer_address = $_REQUEST['customer_address'];
 
  // start check customer_phone
  $sql = "
    SELECT * FROM table_customer WHERE customer_phone= '".$customer_phone."'
   ";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) 
  {
    echo json_encode(
      array('success'   => 'false','message' => 'customer_phone already exist. create fail !!!')
    );
    exit();
  }
  // end check customer_phone

  // Create query insert into user

  $sql = "
    INSERT INTO table_customer 
    SET customer_fullname = '".$customer_fullname."', customer_password = '".$customer_password."', customer_phone = '".$customer_phone."', customer_address = '".$customer_address."'
    ";

  if( isset($_REQUEST['fcm_token']) ){    
    $sql.=','. $_REQUEST['fcm_token'];
  } 

  //check if customer_phone exist
  
  // Return customer info just created
  if($conn->query($sql)) {

    $id_created=mysqli_insert_id($conn);
    $user_arr = array();

    $user_arr['success'] = 'true';
    $user_arr['data'] = array();
    // get all info of created user
      $sql = "SELECT * FROM table_customer WHERE id_customer= '".$id_created."'  ";
      $result = $conn->query($sql);
      while($row = $result->fetch_assoc()) {
          
          $user_item = array(
            'id_customer' => $row['id_customer'],
            'customer_fullname' => $row['customer_fullname'],
            'customer_password' => $row['customer_password'],   
            'customer_phone' => $row['customer_phone'],
            'customer_address' => $row['customer_address'],
            'message' => 'user created'            
          );

          // Push to "data"
          $user_arr['data']=$user_item;
      }

    echo json_encode(
      $user_arr
    );


  } else {
    echo json_encode(
      array('success'   => 'false','message' => 'create fail')
    );
  }




?>

