<?php

  $product_arr = array();

  // query
  $sql = "SELECT * FROM `table_storage`,table_product,table_product_detail WHERE table_product.id_product=table_storage.id_product AND table_product.id_product=table_product_detail.id_product AND table_product_detail.is_avatar='yes' ";
  
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
      $count_image=0;
      $product_photo=array();
      $product_photo_item=array();
     
          $product_item = array(
            'id_product' => $row['id_product'],            
            'product_name' => $row['product_name'],
            'product_price' => $row['product_price'],
            'quantity' => $row['quantity'],
            'photo_link' => $row['photo_link'],
            'safe_quantity' => $row['safe_quantity'], 
            'time_updated' => $row['time_updated'],         
            'is_alert' => $row['is_alert']
          );
     
      // Push to "data"
      array_push($product_arr['data'], $product_item);
    

  }



// filter result if id_producer is received
  if( isset($_REQUEST['is_alert'])){
    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();
    foreach ($product_arr['data'] as $value)
    {     
      if( $value['is_alert']==$_REQUEST['is_alert'] )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with id_district

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
          array('success' => 'true','message' => 'Categories has no product ! check id_category !')
        );
  }

?>






