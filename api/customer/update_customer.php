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
if(isset($_REQUEST['customer_old_password']))
{
  if($_REQUEST['customer_old_password']=='')
  {
    unset($_REQUEST['customer_old_password']);
  } 
  else 
  {
    $sql='SELECT * FROM table_customer WHERE id_customer='.$_REQUEST['id_customer'].' ';
    $result=mysqli_query($conn,$sql);
    while ($row=mysqli_fetch_array($result)) {
      if($row['customer_password'] !=md5($_REQUEST['customer_old_password']) ){
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

//handle change avatar

$query_image='';
if( isset($_FILES['customer_avatar']) && is_uploaded_file($_FILES['customer_avatar']['tmp_name'])  )
{
  // check file size
  if ( $_FILES['customer_avatar']['size'] >= 5242880 ) 
  {
    echo json_encode(
      array('success' => 'false','message' => 'only accept file size < 5MB!')
    );
    exit();
  }

  // check file type
  $allowedTypes = array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF);
  $detectedType = exif_imagetype($_FILES['customer_avatar']['tmp_name']);
  $error = !in_array($detectedType, $allowedTypes);

  if($error){   
    echo json_encode(
          array('success' => 'false','message' => 'only accept PNG, JPEG, GIF !!!')
        );
    exit();
  }



$query = "UPDATE table_customer SET ";
//start handle upload and save
// xu ly file hinh dai dien
    // do this, upload file
    $target_dir = 'images/avatar/';    
    $target_dir_4_upload = '../images/avatar/';
    $final_name=basename($_FILES["customer_avatar"]["name"]);
    //check if file exists

    // handle new way to rename   

    $path = $_FILES['customer_avatar']['name'];
    $ext = pathinfo($path, PATHINFO_EXTENSION);
    $final_name = generateRandomString(60).'.'.$ext;

    // end handle way to rename

    while (file_exists($target_dir_4_upload.$final_name)) {
      // doi ten file
      $final_name = generateRandomString(60).'.'.$ext;
    }
        
    //upload file toi folder icon
    $target_file_upload = $target_dir_4_upload . $final_name;
    $target_file = $target_dir . $final_name;
    
    move_uploaded_file($_FILES["customer_avatar"]["tmp_name"], $target_file_upload);

    $sql_tmp = "SELECT * FROM table_customer WHERE id_customer= '".$_REQUEST['id_customer']."' ";

    $result_tmp = mysqli_query($conn,$sql_tmp);
    while ( $row_tmp = mysqli_fetch_array($result_tmp) ){
      $customer_avatar=$row_tmp['customer_avatar'];
    }

    // unlink old file avatar if exist and it not the place holder file
    if (file_exists('../'.$customer_avatar) && ($customer_avatar!='images/avatar/user-placeholder.png') )
    { 
      unlink('../'.$customer_avatar);
    }

    // end handle unlink old file avatar if exist and it not the place holder file

    
  // get link tu file upload for query database
  $query .= " customer_avatar = '".$target_file."' ";  
  // end xu ly file hinh dai dien  
    $query .= "WHERE id_customer = '" .mysqli_real_escape_string($conn, $_REQUEST['id_customer'])."'"; 
    // Create post
    if($conn->query($query)) 
    {
      
    } else 
    {
      $check=0;
    }



}  
// end handle change avatar


  
  
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
      'customer_avatar' => $row['customer_avatar'],            
      'customer_phone' => $row['customer_phone']             
    );   
  }
  $user_arr['success']='true';
  $user_arr['data']=$user_item;
  // end get all user new info

  if( $check == 0 )
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