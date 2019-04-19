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

  $customer_phone = $_REQUEST['customer_phone'];
  $customer_password = $_REQUEST['customer_password'];
  $customer_arr=array();

  //check if customer_phone exist in table_customer
  $sql = "
    SELECT * FROM table_customer WHERE customer_phone= '".$customer_phone."'
   ";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {

  while($row = $result->fetch_assoc()) {                   
  if( $row['customer_password']==md5($customer_password) ) 
  {

  // if users account banned
  if( $row['status']=='deactive' ){
    echo json_encode(
      array('success' => 'false','message' => 'account deactived !!!')
    );
    exit();
  }
       
  $sql = "
    SELECT * FROM table_customer,table_district WHERE table_customer.id_district = table_district.id_district AND customer_phone= '".$customer_phone."'
   ";
  $result = $conn->query($sql);
  $row = $result->fetch_assoc();
        
  $user_item = array(
      'id_customer' => $row['id_customer'],
      'customer_fullname' => $row['customer_fullname'],
      'customer_phone' => $row['customer_phone'],
      'customer_address' => $row['customer_address'],
      'customer_password' => $row['customer_password'],
      'id_district' => $row['id_district'],
      'id_city' => $row['id_city'],
      'status' => $row['status'],
    );

    $customer_arr['success']='true';
    $customer_arr['data']=$user_item;

    echo json_encode($customer_arr);
    exit();

  } else {
        echo json_encode(array('success' => 'false','message' => 'invalid customer_password!!!'));
        exit();
     }        
  }   
    

} else{
  echo json_encode(array('success' => 'false','message' => 'phone doesnt exist!!!'));
  exit();
} 