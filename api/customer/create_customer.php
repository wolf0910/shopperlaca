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

if(isset($_REQUEST['id_district']))
{
  if($_REQUEST['id_district']==''){
    unset($_REQUEST['id_district']);
  }
}

if(!isset($_REQUEST['id_district']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'id_district missing !!!')
    );
    exit();
}






$query_image='';
if( isset($_FILES['customer_avatar']) && is_uploaded_file($_FILES['customer_avatar']['tmp_name'])  )
{
  // check file size
  if ( $_FILES['customer_avatar']['size'] >= 1048576 ) 
  {
    echo json_encode(
      array('success' => 'false','message' => 'only accept file size < 1MB!')
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

//start handle upload and save

// xu ly file hinh dai dien
    // do this, upload file
    $target_dir = 'images/avatar/';    
    $target_dir_4_upload = '../images/avatar/';
    $final_name=basename($_FILES["customer_avatar"]["name"]);
    //check if file exists
    $i=0;
    while (file_exists($target_dir_4_upload.$final_name)) {
      $i++;
    // doi ten file
      $final_name=$i.basename($_FILES["customer_avatar"]["name"]);
    }

    //upload file toi folder 
    $target_file_upload = $target_dir_4_upload . $final_name;
    $target_file = $target_dir . $final_name;    
    move_uploaded_file($_FILES["customer_avatar"]["tmp_name"], $target_file_upload);
    
  // get link tu file upload for query database
  $query_image .= " , customer_avatar = '".$target_file."' ";  
// end xu ly file hinh dai dien   


} else { $query_image .= " , customer_avatar = 'images/avatar/user-placeholder.png' ";}    


  // Get raw posted data
  $customer_fullname = $_REQUEST['customer_fullname'];
  $customer_password = md5($_REQUEST['customer_password']);
  $customer_phone = $_REQUEST['customer_phone'];
  $customer_address = $_REQUEST['customer_address'];
  $id_district = $_REQUEST['id_district'];
 
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
    SET customer_fullname = '".$customer_fullname."', customer_password = '".$customer_password."', customer_phone = '".$customer_phone."', customer_address = '".$customer_address."', id_district = '".$id_district."'
    ";
  $sql .= $query_image;

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
            'customer_avatar' => $row['customer_avatar'],
            'id_district' => $row['id_district'],
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

