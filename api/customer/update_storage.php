<?php 

if(isset($_REQUEST['id_product']))
{
  if($_REQUEST['customer_name']==''){
    unset($_REQUEST['customer_name']);
  }
}
// check input array product 
if(isset($_REQUEST['quantity']))
{
  if($_REQUEST['quantity']==''){
    unset($_REQUEST['quantity']);
  }
}
if(isset($_REQUEST['safe_quantity']))
{
  if($_REQUEST['safe_quantity']==''){
    unset($_REQUEST['safe_quantity']);
  }
}

if(isset($_REQUEST['time_updated']))
{
  if($_REQUEST['time_updated']==''){
    unset($_REQUEST['time_updated']);
  }
}


if(!isset($_REQUEST['time_updated']))
{
 
    echo json_encode(
        array('success' => 'false','message' => 'time_updated not found !!!')
      );
    exit();
  
}



$check=1;

if (isset($_REQUEST['id_product']) )
{

  if (isset($_REQUEST['quantity']))         
  { 
     $query = "UPDATE table_storage SET ";
      if (isset($_REQUEST['quantity']))         { $query .= "quantity  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['quantity'])         . "' "; }
      $query .= "WHERE id_product = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_product'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
       
        $check=0;
      }
  }

  if (isset($_REQUEST['time_updated']))         
  { 
     $query = "UPDATE table_storage SET ";
      if (isset($_REQUEST['time_updated']))         { $query .= "time_updated  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['time_updated'])         . "' "; }
      $query .= "WHERE id_product = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_product'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
       
        $check=0;
      }
  }
  
  if (isset($_REQUEST['safe_quantity']))         
  { 
     $query = "UPDATE table_storage SET ";
      if (isset($_REQUEST['safe_quantity']))         { $query .= "safe_quantity  = '" . mysqli_real_escape_string($db_connection, $_REQUEST['safe_quantity'])         . "' "; }
      $query .= "WHERE id_product = '" .mysqli_real_escape_string($db_connection, $_REQUEST['id_product'])."'"; 
    // Create post
      if($conn->query($query)) 
      {
        
      } else 
      {
       
        $check=0;
      }
  }
  
  // change is_alert if needed
  $sql3='SELECT * FROM table_storage WHERE id_product='.$_REQUEST['id_product'].' ';
  $result3=mysqli_query($db_connection,$sql3);
  while($row=mysqli_fetch_array($result3)){
    if($row['quantity']<=$row['safe_quantity']){
      $query = "UPDATE table_storage SET is_alert='yes' WHERE id_product=".$_REQUEST['id_product']." ";
      $rs=mysqli_query($db_connection,$query);
    }else{
       $query = "UPDATE table_storage SET is_alert='no' WHERE id_product=".$_REQUEST['id_product']." ";
      $rs=mysqli_query($db_connection,$query);
    }
  }
  // end change is_alert if needed


  // get all user new info
  $sql3='SELECT * FROM table_storage,table_product_detail,table_product WHERE table_product.id_product=table_storage.id_product AND table_storage.id_product=table_product_detail.id_product AND table_product_detail.is_avatar="yes" AND table_storage.id_product='.$_REQUEST['id_product'].' ';
  $result3=mysqli_query($db_connection,$sql3);
  
  $product_arr['success'] = 'true';
  $product_arr['data'] = array();
  
  while($row=mysqli_fetch_array($result3))
  {

    $product_item['order_detail']=array();
    $product_item = array(
      'id_product' => $row['id_product'],
      'quantity' => $row['quantity'],
      'product_name' => $row['product_name'],
      'photo_link' => $row['photo_link'],
      'product_price' => $row['product_price'],
      'safe_quantity' => $row['safe_quantity'],
      'time_updated' => $row['time_updated'],
      'is_alert' => $row['is_alert']
    );
    // Push to "data"
    array_push($product_arr['data'], $product_item);
  }
  
  if($check==0){
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
        array('success' => 'false','message' => 'id_product not found !!!')
      );
  }
  
?>