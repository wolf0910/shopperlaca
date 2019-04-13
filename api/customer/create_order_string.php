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

if(isset($_REQUEST['receiver_name']))
{
  if($_REQUEST['receiver_name']==''){
    unset($_REQUEST['receiver_name']);
  }
}
if(!isset($_REQUEST['receiver_name']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'receiver_name missing !!!')
    );
    exit();
}

if(isset($_REQUEST['receiver_address']))
{
  if($_REQUEST['receiver_address']==''){
    unset($_REQUEST['receiver_address']);
  }
}
if(!isset($_REQUEST['receiver_address']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'receiver_address missing !!!')
    );
    exit();
}


if(isset($_REQUEST['receiver_phone']))
{
  if($_REQUEST['receiver_phone']==''){
    unset($_REQUEST['receiver_phone']);
  }
}
if(!isset($_REQUEST['receiver_phone']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'receiver_phone missing !!!')
    );
    exit();
}

if(isset($_REQUEST['receiver_id_district']))
{
  if($_REQUEST['receiver_id_district']==''){
    unset($_REQUEST['receiver_id_district']);
  }
}
if(!isset($_REQUEST['receiver_id_district']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'receiver_id_district missing !!!')
    );
    exit();
}

// check input array product 
if(isset($_REQUEST['id_product']))
{
  if($_REQUEST['id_product']==''){
    unset($_REQUEST['id_product']);
  } else {
    // turn id_product string into array
    $id_product = explode(',', $_REQUEST['id_product']);
  }
}
if(!isset($_REQUEST['id_product']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'id_product missing !!!')
    );
    exit();
}
if(isset($_REQUEST['id_agent']))
{
  if($_REQUEST['id_agent']==''){
    unset($_REQUEST['id_agent']);
  }
}




// check input array quantity 
if(isset($_REQUEST['quantity']))
{
  if($_REQUEST['quantity']==''){
    unset($_REQUEST['quantity']);
  } else {
    // turn quantity string into array
    $quantity=explode(',', $_REQUEST['quantity']);
  }
}
if(!isset($_REQUEST['quantity']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'quantity missing !!!')
    );
    exit();
}


if( count($id_product) != count($quantity) ){
  echo json_encode( array('success' => 'false','message' => 'array quantity and array id_product not match !!') );
   exit();
}

  // insert into table_order
  $date_created = date( 'Y-m-d H:i:s a', time() );
  $sql = ' INSERT INTO table_order SET receiver_name = "'.$_REQUEST['receiver_name'].'", receiver_address = "'.$_REQUEST['receiver_address'].'", receiver_phone = "'.$_REQUEST['receiver_phone'].'", id_customer="'.$_REQUEST['id_customer'].'", receiver_id_district="'.$_REQUEST['receiver_id_district'].'", date_created="'.$date_created.'" ';

  $delivery_status = 'Chờ tiếp nhận';
  if(isset($_REQUEST['id_agent'])){
    $sql = $sql.' , id_agent="'.$_REQUEST['id_agent'].'" ';
    $delivery_status = 'Chờ giao hàng';
  }
  $sql = $sql.' , delivery_status="'.$delivery_status.'" ';
  $result = mysqli_query($conn,$sql);

  



  // insert into table_order_detail
  $id_order = mysqli_insert_id($conn); 

  for( $i = 0; $i < count($id_product); $i++ )
  {

    $sql_tmp = 'SELECT * FROM table_product WHERE id_product='.$id_product[$i].' ';
    $result_tmp = mysqli_query($conn,$sql_tmp);
    $unit_price_tmp = 0;
    while( $row = mysqli_fetch_array($result_tmp) ){
      $unit_price_tmp = $row['product_price'];
      $id_category_tmp= $row['id_category'];
    }
    $sql2 = ' INSERT INTO table_order_detail SET id_order = "'.$id_order.'", id_product = "'.$id_product[$i].'", quantity = "'.$quantity[$i].'", unit_price="'.$unit_price_tmp.'"  ';
    $result2 = mysqli_query($conn,$sql2);

// check if category of product in suggestion yet, if not add it
    $sql_check_suggestion="SELECT * FROM table_suggestion WHERE id_customer = '".$_REQUEST['id_customer']."' AND id_category = '".$id_category_tmp."' ";
    $result_check_suggestion = mysqli_query($conn,$sql_check_suggestion);

  if ( mysqli_num_rows($result_check_suggestion)==0 ){
    $sql_insert_suggestion = "
    INSERT INTO table_suggestion 
    SET id_customer = '".$_REQUEST['id_customer']."', id_category = '".$id_category_tmp."'
    ";
    $rs_insert_suggestion=mysqli_query($conn,$sql_insert_suggestion);
  }

// end check


  }

  // get all order info just created

  $sql3='SELECT * FROM table_order WHERE id_order='.$id_order.' ';
  $result3=mysqli_query($conn,$sql3);
  
  $product_arr['success'] = 'true';
  $product_arr['data'] = array();
  
  while($row=mysqli_fetch_array($result3))
  {
    $product_item['order_detail']=array();
    $product_item = array(
      'id_order' => $row['id_order'],
      'id_customer' => $row['id_customer'],
      'receiver_name' => $row['receiver_name'],
      'receiver_address' => $row['receiver_address'],
      'receiver_phone' => $row['receiver_phone'],
      'receiver_id_district' => $row['receiver_id_district'],
      'delivery_status' => $row['delivery_status'], 
      'id_agent' => $row['id_agent'],     
      'date_created' => $row['date_created']
    );

  // get order detail
  $sql2='SELECT * FROM table_order_detail WHERE id_order="'.$id_order.'" ';
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
  
  // Turn to JSON & output
  echo json_encode($product_arr);







// check if address is in table_customer_addition_address. if it not in yet, add it
  $sql_tmp1=' SELECT * FROM table_customer_addition_address WHERE id_customer="'.$_REQUEST['id_customer'].'" AND addition_address="'.$_REQUEST['receiver_address'].'" ';
  $rs = mysqli_query($conn,$sql_tmp1);
  if ( mysqli_num_rows($rs) == 0 ){
     $sql_insert='INSERT INTO table_customer_addition_address SET id_customer = "'.$_REQUEST['id_customer'].'", addition_address="'.$_REQUEST['receiver_address'].'" ';
     $rs_insert=mysqli_query($conn,$sql_insert);
   } 
// end check table_customer_addition_address

exit();

?>