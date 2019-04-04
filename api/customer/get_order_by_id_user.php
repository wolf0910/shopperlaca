<?php

if(isset($_REQUEST['id_user']))
{
  if($_REQUEST['id_user']==''){
    unset($_REQUEST['id_user']);
  }
}

if(isset($_REQUEST['status']))
{
  if($_REQUEST['status']==''){
    unset($_REQUEST['status']);
  }
}


if(!isset($_REQUEST['id_user']))
{
  // No Categories
  echo json_encode(
    array('success' => 'false','message' => 'id_user not found !')
  );
  exit();
}

  $product_arr = array();
  // query
  $sql = "SELECT * FROM `table_order` WHERE id_user=".$_REQUEST['id_user']." ";
  
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
      'id_user' => $row['id_user'],
      'customer_name' => $row['customer_name'],
      'customer_address' => $row['customer_address'],
      'customer_phone' => $row['customer_phone'],
      'status' => $row['status'],      
      'order_date' => $row['order_date']
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



// filter result if status is received
  if( isset($_REQUEST['status'])){

    // turn status into array

    $status= explode(',', $_REQUEST['status']);

//    var_dump($status);


    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    foreach ($product_arr['data'] as $value)
    {     
      if( in_array($value['status'], $status) )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with status

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
          array('success' => 'true','message' => 'user has no order ! ')
        );
  }

?>






