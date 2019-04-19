<?php

if(isset($_REQUEST['id_customer']))
{
  if($_REQUEST['id_customer']==''){
    unset($_REQUEST['id_customer']);
  }
}

if(isset($_REQUEST['delivery_status']))
{
  if($_REQUEST['delivery_status']==''){
    unset($_REQUEST['delivery_status']);
  }
}


if(!isset($_REQUEST['id_customer']))
{
  // No Categories
  echo json_encode(
    array('success' => 'false','message' => 'id_customer not found !')
  );
  exit();
}

  $product_arr = array();
  // query
  $sql = "SELECT * FROM `table_order` WHERE id_customer = ".$_REQUEST['id_customer']." ORDER BY id_order DESC ";
  
  $result = $conn->query($sql);  
  // Get row count
  $num = mysqli_num_rows($result);

// Check if any categories
if($num > 0) {
    // Cat array   
    $product_arr['success'] = 'true';
    $product_arr['data'] = array();
while($row = $result->fetch_assoc()) 
{        
	$product_item['order_detail']=array();
    $product_item = array(
      'id_order' => $row['id_order'],
      'id_customer' => $row['id_customer'],
      'receiver_name' => $row['receiver_name'],
      'receiver_address' => $row['receiver_address'],
      'receiver_phone' => $row['receiver_phone'],
      'delivery_status' => $row['delivery_status'],      
      'date_created' => $row['date_created']
    );

  // get order detail
  $sql2='
  SELECT * FROM table_order_detail,table_product,table_product_detail WHERE id_order="'.$row['id_order'].'"  AND table_product_detail.id_product=table_product.id_product AND table_order_detail.id_product=table_product.id_product AND table_product_detail.is_avatar="yes"
  ';
  $result2 = $conn->query($sql2);  
  // Get row count
  $num2 = mysqli_num_rows($result2);
  if($num2 > 0) 
  {
    $count=0;        
    while($row2= $result2->fetch_assoc()) 
    { 
      $tmp = array(
        "id_order_detail" => $row2['id_order_detail'],
        "id_product" => $row2['id_product'],
        "product_description" => changeLineBreak(stripCKeditor($row2['product_description'])),
        "product_additional_information" => changeLineBreak(stripCKeditor($row2['product_additional_information'])),
        "quantity" => $row2['quantity'],
        "photo_link" => $row2['photo_link'],
        "product_name" => $row2['product_name'],
        "unit_price" => $row2['unit_price']
      );
      $order_detail_item[$count] = $tmp;
      $count++;
    }
  }
  $product_item['order_detail']= $order_detail_item;
  // Push to "data"
  array_push($product_arr['data'], $product_item);
    

  }



// filter result if delivery_status is received
  if( isset($_REQUEST['delivery_status'])){
    
  // turn delivery_status into array
  $delivery_status= explode(',', $_REQUEST['delivery_status']);

//    var_dump($delivery_status);


    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    foreach ($product_arr['data'] as $value)
    {     
      if( in_array($value['delivery_status'], $delivery_status) )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with delivery_status

//start paging result

$limit=10;
$page=1;
$product_arr['total']=count($product_arr['data']);
if ( isset($_REQUEST['limit']) && $_REQUEST['limit']!='' ){
    $limit=(int)$_REQUEST['limit'];
  }
if ( isset($_REQUEST['page']) && $_REQUEST['page']!='' ){
    $page=(int)$_REQUEST['page'];
  }

  $product_arr['total_page']=ceil($product_arr['total']/$limit);
  $start=($page-1)*$limit;
  $end=$page*$limit;
  // create tmp_array
  $product_arr2 = array();
  $product_arr2['success'] = 'true';
  $product_arr2['total'] = $product_arr['total'];
  $product_arr2['limit']=$limit;
  $product_arr2['total_page']=$product_arr['total_page'];
  $product_arr2['page']=$page;  
  $product_arr2['data'] = array();
  $count_for_paging=0;
  
    foreach ($product_arr['data'] as $value)
    {
      if( $count_for_paging>= $start && $count_for_paging<$end )
      {
        array_push($product_arr2['data'],$value);       
      }
      $count_for_paging++;
    }
    // assign new result
    $product_arr=$product_arr2;
  
// end paging result

   

if($product_arr['total']==0){
  $product_arr['message']='Không tìm thấy kết quả phù hợp !';
}
//end paging result

        // Turn to JSON & output
        echo json_encode($product_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success' => 'true','message' => 'Customer has no order ! ')
        );
  }

?>






