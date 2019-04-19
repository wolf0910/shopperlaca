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

if(isset($_REQUEST['addition_address']))
{
  if($_REQUEST['addition_address']==''){
    unset($_REQUEST['addition_address']);
  }
}
if(!isset($_REQUEST['addition_address']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'addition_address missing !!!')
    );
    exit();
}
 
  // start check customer_phone
  $sql = "
    SELECT * FROM table_customer_addition_address WHERE addition_address= '".$_REQUEST['addition_address']."'
   ";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) 
  {
    echo json_encode(
      array('success'   => 'false','message' => 'addition_address already exist. create fail !!!')
    );
    exit();
  }
  // end check customer_phone

  // Create query insert into user

  $sql = "
    INSERT INTO table_customer_addition_address 
    SET id_customer = '".$_REQUEST['id_customer']."', addition_address = '".$_REQUEST['addition_address']."', id_district = '".$_REQUEST['id_district']."'
    ";
  
  // Return customer info just created
  if($conn->query($sql)) {

    $id_created=mysqli_insert_id($conn);
    $user_arr = array();

    $user_arr['success'] = 'true';
    $user_arr['data'] = array();
    // get all info of created user
      $sql = "SELECT * FROM table_customer_addition_address WHERE id_customer= '".$_REQUEST['id_customer']."'  ";
      $result = $conn->query($sql);
      while($row = $result->fetch_assoc()) {
          
          $user_item = array(
            'id_customer' => $row['id_customer'],
            'addition_address' => $row['addition_address'],
            'id_district' => $row['id_district'],
            'message' => 'addition address created'            
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

