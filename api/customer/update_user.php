<?php 

if(isset($_REQUEST['id_user']))
{
  if($_REQUEST['id_user']==''){
    unset($_REQUEST['id_user']);
  }
}

if(isset($_REQUEST['fullname']))
{
  if($_REQUEST['fullname']==''){
    unset($_REQUEST['fullname']);
  }
}

if(isset($_REQUEST['password']))
{
  if($_REQUEST['password']==''){
    unset($_REQUEST['password']);
  }
}
if(isset($_REQUEST['old_password']))
{
  if($_REQUEST['old_password']==''){
    unset($_REQUEST['old_password']);
  } else {
    $sql='SELECT * FROM table_users WHERE id_user='.$_REQUEST['id_user'].' ';
    $result=mysqli_query($db_connection,$sql);
    while ($row=mysqli_fetch_array($result)) {
      if($row['password'] !=md5($_REQUEST['old_password']) ){
        echo json_encode(
        array('success' => 'false','message' => 'old password not match !')
      );
        exit();
      }
    }
  }
}


if(isset($_REQUEST['address']))
{
  if($_REQUEST['address']==''){
    unset($_REQUEST['address']);
  }
}


$check=1;

if (isset($_REQUEST['id_user']) )
{

  if (isset($_REQUEST['fullname']))         
  { 
     $query = "UPDATE table_users SET ";
      if (isset($_REQUEST['fullname']))         { $query .= "fullname  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['fullname'])         . "' "; }
      $query .= "WHERE id_user = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_user'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
       
        $check=0;
      }
  }
  
  if (isset($_REQUEST['address']))         
  { 
     $query = "UPDATE table_users SET ";
      if (isset($_REQUEST['address']))         { $query .= "address  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['address'])         . "' "; }
      $query .= "WHERE id_user = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_user'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
       
        $check=0;
      }
  }
  
  
  if (isset($_REQUEST['password']) )         
  { 
    $query = "UPDATE table_users SET ";
    $query .= "password  = '" . md5(mysqli_real_escape_string($db_connection, $_REQUEST['password']))        . "' "; 
    $query .= "WHERE id_user = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_user'])."'"; 
    // check execute query
    if($conn->query($query)) {
      
    } else {
      $check=0;
    }
  }

// get all user new info

  $sql = "
    SELECT * FROM table_users WHERE id_user= '".$_REQUEST['id_user']."'
   ";
   $result = $conn->query($sql);
   $user_arr=array();
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) 
    {                  
      $user_item = array(
              'id_user' => $row['id_user'],
              'fullname' => $row['fullname'],
              'address' => $row['address'],
              'password' => $row['password'],            
              'phone' => $row['phone']             
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
} else 
  {
    echo json_encode(
        array('success' => 'false','message' => 'id_user not found !!!')
      );
  }
  
?>