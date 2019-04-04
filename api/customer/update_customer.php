<?php 

if(isset($_REQUEST['id_customer']))
{
  if($_REQUEST['id_customer']==''){
    unset($_REQUEST['id_customer']);
  }
}

if(!isset($_REQUEST['id_customer']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'id_customer missing !!!')
    );
    exit();
}

if(isset($_REQUEST['customer_fullname']))
{
  if($_REQUEST['customer_fullname']==''){
    unset($_REQUEST['customer_fullname']);
  }
}

if(isset($_REQUEST['customer_address']))
{
  if($_REQUEST['customer_address']==''){
    unset($_REQUEST['customer_address']);
  }
}

if(isset($_REQUEST['customer_password']))
{
  if($_REQUEST['customer_password']==''){
    unset($_REQUEST['customer_password']);
  }
}
if(isset($_REQUEST['old_customer_password']))
{
  if($_REQUEST['old_customer_password']=='')
  {
    unset($_REQUEST['old_customer_password']);
  } 
  else 
  {
    $sql='SELECT * FROM table_customer WHERE id_customer='.$_REQUEST['id_customer'].' ';
    $result=mysqli_query($conn,$sql);
    while ($row=mysqli_fetch_array($result)) {
      if($row['customer_password'] !=md5($_REQUEST['old_customer_password']) ){
        echo json_encode(
        array('success' => 'false','message' => 'old customer_password not match !')
      );
        exit();
      }
    }
  }
}

$check=1;

if (isset($_REQUEST['customer_fullname']))         
  { 
    $query = "UPDATE table_customer SET ";
    $query .= "customer_fullname  = '" .mysqli_real_escape_string($conn, $_REQUEST['customer_fullname'])."' "; 
    $query .= "WHERE id_customer = '" .mysqli_real_escape_string($conn, $_REQUEST['id_customer'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
        $check=0;
      }
  }
  
  if (isset($_REQUEST['customer_address']))         
  { 
     $query = "UPDATE table_customer SET ";
      if (isset($_REQUEST['customer_address']))
      { 
        $query .= "customer_address  = '" . mysqli_real_escape_string($conn, $_REQUEST['customer_address'])         . "' "; 
      }
      $query .= "WHERE id_customer = '" .mysqli_real_escape_string($conn, $_REQUEST['id_customer'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
        $check=0;
      }
  }
  
  
  if (isset($_REQUEST['customer_password']) )         
  { 
    $query = "UPDATE table_customer SET ";
    $query .= "customer_password  = '" . md5(mysqli_real_escape_string($conn, $_REQUEST['customer_password']))        . "' "; 
    $query .= "WHERE id_customer = '" .mysqli_real_escape_string($conn, $_REQUEST['id_customer'])."'"; 
    // check execute query
    if($conn->query($query)) {
      
    } else {
      $check=0;
    }
  }

// get all user new info

  $sql = "
    SELECT * FROM table_customer WHERE id_customer= '".$_REQUEST['id_customer']."'
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

  if( $check==0)
  {
    echo json_encode(
        array('success' => 'false','message' => 'update error !!!')
    );
  } else 
  {
      echo json_encode($user_arr);
  } 
}
 

  
?>