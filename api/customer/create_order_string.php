<?php 

if(isset($_REQUEST['id_user']))
{
  if($_REQUEST['id_user']==''){
    unset($_REQUEST['id_user']);
  }
}
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
if(isset($_REQUEST['id_product']))
{
  if($_REQUEST['id_product']==''){
    unset($_REQUEST['id_product']);
  } else {
    $id_product=explode(',', $_REQUEST['id_product']);
  }
}
// check input array quantity 
if(isset($_REQUEST['quantity']))
{
  if($_REQUEST['quantity']==''){
    unset($_REQUEST['quantity']);
  }else{
    $quantity=explode(',', $_REQUEST['quantity']);
  }
}


if( count($id_product) != count($quantity)){
  echo json_encode( array('success'   => 'false','message' => 'array quantity and array id_product not match !!') );
   exit();
}


if( isset($_REQUEST['id_user']) && isset($_REQUEST['customer_name']) && isset($_REQUEST['customer_address']) && isset($_REQUEST['customer_phone']) && isset($quantity) && isset($id_product) )
{
  // insert into table_order
  $sql = ' INSERT INTO table_order SET customer_name = "'.$_REQUEST['customer_name'].'", customer_address = "'.$_REQUEST['customer_address'].'", customer_phone = '.$_REQUEST['customer_phone'].', id_user="'.$_REQUEST['id_user'].'" ';

  $result=mysqli_query($db_connection,$sql);
  // insert into table_order_detail

  $id_order=mysqli_insert_id($db_connection); 

  for( $i=0; $i<count($id_product); $i++ )
  {
    $sql_tmp='SELECT * FROM table_product WHERE id_product='.$id_product[$i].' ';
    $result_tmp=mysqli_query($db_connection,$sql_tmp);
    $unit_price_tmp=0;
    while($row=mysqli_fetch_array($result_tmp) ){
      $unit_price_tmp=$row['product_price'];
    }

    $sql2=' INSERT INTO table_order_detail SET id_order = "'.$id_order.'", id_product = "'.$id_product[$i].'", quantity = '.$quantity[$i].', unit_price="'.$unit_price_tmp.'"  ';
    $result2=mysqli_query($db_connection,$sql2);

  }

  // get all order info just created

  $sql3='SELECT * FROM table_order WHERE id_order='.$id_order.' ';
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
  exit();

} else {
	echo json_encode( array('success' => 'false','message' => 'missing parameter input') );
	exit();
}

?>