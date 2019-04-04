<?php

if(isset($_REQUEST['fullname']))
{
  if($_REQUEST['fullname']==''){
    unset($_REQUEST['fullname']);
  }
}

if(isset($_REQUEST['phone']))
{
  if($_REQUEST['phone']==''){
    unset($_REQUEST['phone']);
  }
}



  $product_arr = array();
  // query
  $sql = "SELECT * FROM `table_users` ";
  
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

      $product_photo=array();
      $product_photo_item=array();
    
          $product_item = array(
            'id_user' => $row['id_user'],
            'fullname' => $row['fullname'],
            'address' => $row['address'],
            'password' => $row['password'],
            'phone' => $row['phone']
          );


  
    // Push to "data"
      array_push($product_arr['data'], $product_item);
    

  }

// filter result if product_name is received
  if( isset($_REQUEST['fullname'])){
    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    foreach ($product_arr['data'] as $value)
    {     
      if( preg_match('/'.stripUnicode($_REQUEST['fullname']).'/i',stripUnicode($value['fullname'])) )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with product_name


// filter result if phone is received
  if( isset($_REQUEST['phone'])){
    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    foreach ($product_arr['data'] as $value)
    {     
      if( $_REQUEST['phone']==$value['phone'] )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with phone


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
          array('success' => 'true','message' => 'DB has no users yet !')
        );
  }

?>






