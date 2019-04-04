<?php 

if(isset($_REQUEST['customer_name']))
{
  if($_REQUEST['customer_name']==''){
    unset($_REQUEST['customer_name']);
  }
}
if(isset($_REQUEST['customer_address']))
{
  if($_REQUEST['customer_address']==''){
    unset($_REQUEST['customer_address']);
  }
}
if(isset($_REQUEST['customer_phone']))
{
  if($_REQUEST['customer_phone']==''){
    unset($_REQUEST['customer_phone']);
  }
}
// check input array product 
if(isset($_REQUEST['id_order']))
{
  if($_REQUEST['id_order']==''){
    unset($_REQUEST['id_order']);
  }
}
if(isset($_REQUEST['status']))
{
  if($_REQUEST['status']==''){
    unset($_REQUEST['status']);
  }
}


$check=1;

if (isset($_REQUEST['id_order']) )
{

  if (isset($_REQUEST['customer_name']))         
  { 
     $query = "UPDATE table_order SET ";
      if (isset($_REQUEST['customer_name']))         { $query .= "customer_name  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['customer_name'])         . "' "; }
      $query .= "WHERE id_order = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_order'])."'"; 
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
     $query = "UPDATE table_order SET ";
      if (isset($_REQUEST['customer_address']))         { $query .= "customer_address  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['customer_address'])         . "' "; }
      $query .= "WHERE id_order = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_order'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
       
        $check=0;
      }
  }
  
  
  if (isset($_REQUEST['customer_phone']) )         
  { 
    $query = "UPDATE table_order SET ";
    $query .= "customer_phone  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['customer_phone'])        . "' "; 
    $query .= "WHERE id_order = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_order'])."'"; 
    // check execute query
    if($conn->query($query)) {
      
    } else {
      $check=0;
    }
  }

  if (isset($_REQUEST['status']) )         
  { 
    $query = "UPDATE table_order SET ";
    $query .= "status  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['status'])        . "' "; 
    $query .= "WHERE id_order = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_order'])."'"; 
    // check execute query
    if($conn->query($query)) {
      
    } else {
      $check=0;
    }
  }

// get all user new info
$sql3='SELECT * FROM table_order WHERE id_order='.$_REQUEST['id_order'].' ';
  $result3=mysqli_query($db_connection,$sql3);
  
  $product_arr['success'] = 'true';
  $product_arr['data'] = array();
  
  while($row=mysqli_fetch_array($result3))
  {
    $product_item['order_detail']=array();
    $product_item = array(
      'id_order' => $row['id_order'],
      'id_user' => $row['id_user'],
      'customer_name' => $row['customer_name'],
      'customer_address' => $row['customer_address'],
      'customer_phone' => $row['customer_phone'],
      'status' => $row['status'],      
      'order_date' => $row['order_date']
    );

  // get order detail
  $sql2='SELECT * FROM table_order_detail WHERE id_order="'.$_REQUEST['id_order'].'" ';
  $result2 = $conn->query($sql2);  
  // Get row count
  $num2 = mysqli_num_rows($result2);
  if($num2 > 0) 
  {
    $count=0;        
    while($row2= $result2->fetch_assoc()) 
    { 
      $tmp = array("id_order_detail" => $row2['id_order_detail'],"id_product" => $row2['id_product'],"quantity" => $row2['quantity'],"unit_price" => $row2['unit_price']);
      $order_detail_item[$count] = $tmp;
      $count++;
    }
  }
  $product_item['order_detail']= $order_detail_item;
  // Push to "data"
  array_push($product_arr['data'], $product_item);
  }
  
 


  if( $check==0){
      echo json_encode(
        array('success' => 'false','message' => 'update error !!!')
      );
    }else{
       // Turn to JSON & output
      echo json_encode($product_arr);
    } 
  
} else 
  {
    echo json_encode(
        array('success' => 'false','message' => 'id_order not found !!!')
      );
  }
  
?>