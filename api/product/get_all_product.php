<?php

if(isset($_REQUEST['id_producer']))
{
  if($_REQUEST['id_producer']==''){
    unset($_REQUEST['id_producer']);
  }
}
if(isset($_REQUEST['id_category']))
{
  if($_REQUEST['id_category']==''){
    unset($_REQUEST['id_category']);
  }
}
if(isset($_REQUEST['price_range']))
{
  if($_REQUEST['price_range']==''){
    unset($_REQUEST['price_range']);
  }
}
if(isset($_REQUEST['product_name']))
{
  if($_REQUEST['product_name']==''){
    unset($_REQUEST['product_name']);
  }
}

  $product_arr = array();

  // query
  $sql = "SELECT * FROM `table_product`,table_product_detail WHERE table_product.id_product=table_product_detail.id_product AND table_product_detail.is_avatar='yes'  ORDER BY table_product.date_created DESC ";
  
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
      $product_item['product_photo']=array();
          $product_item = array(
            'id_product' => $row['id_product'],
            'id_category' => $row['id_category'],
            'id_producer' => $row['id_producer'],
            'product_name' => $row['product_name'],
            'product_description' => changeLineBreak(stripCKeditor($row['product_description'])),
            'product_price' => $row['product_price'],
            'product_additional_information' => changeLineBreak(stripCKeditor($row['product_additional_information'])),
            'date_created' => $row['date_created'],
            'product_price_4compare1' => $row['product_price_4compare1'],
            'product_price_4compare2' => $row['product_price_4compare2'],
            'product_price_4compare3' => $row['product_price_4compare3'],
            'customer_point' => $row['customer_point'],
            'agent_point' => $row['agent_point'],
            'avatar_link' => $row['photo_link']
          );
      $count_image++;

    $sql2='SELECT * FROM table_product_detail WHERE id_product="'.$row['id_product'].'" AND is_avatar="no" ';
    $result2 = $conn->query($sql2);  
    // Get row count
    $num2 = mysqli_num_rows($result2);
     if($num2 > 0) {
        $count=0;        
        while($row2= $result2->fetch_assoc()) 
            { 
              $tmp = array("photo" => $row2['photo_link']);
              $product_photo_item[$count] = $tmp;
              $count++;
              $count_image++;
            }
     }

    // handle count
    
      $product_item['count_image']=$count_image;
     
      $product_item['product_photo']= $product_photo_item;
      
      // Push to "data"
      array_push($product_arr['data'], $product_item);
    

  }



// filter result if product_name is received
  if( isset($_REQUEST['product_name'])){
    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    foreach ($product_arr['data'] as $value)
    {     
      if(!(strpos(strtoupper(stripUnicode($value['product_name'])),strtoupper(stripUnicode($_REQUEST['product_name'])))===FALSE) )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with product_name

// filter result if id_category is received
if( isset($_REQUEST['id_category'])){
  // create tmp_array
  $product_arr2 = array();
  $product_arr2['success'] = 'true';
  $product_arr2['total'] = 0;  
  $product_arr2['data'] = array();

  foreach ($product_arr['data'] as $value)
  {     
    if($value['id_category']==$_REQUEST['id_category'] )
    {
      array_push($product_arr2['data'],$value);
      $product_arr2['total']++;
    }
  }
  // assign new result
  $product_arr=$product_arr2;
}
// end filter with id_category

// filter result if id_producer is received
  if( isset($_REQUEST['id_producer'])){
    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();
    foreach ($product_arr['data'] as $value)
    {     
      if( $value['id_producer']==$_REQUEST['id_producer'] )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with id_producer

// filter result if price is received
  if( isset($_REQUEST['price_range'])){
    if($_REQUEST['price_range']=='1') { $price_min=0; $price_max=1000000;}
    elseif($_REQUEST['price_range']=='2') { $price_min=1000000; $price_max=4000000;}
    elseif($_REQUEST['price_range']=='0') { $price_min=0; $price_max=9999999999999999999999999999999999999999999999999999999999999999999999999;}
    elseif($_REQUEST['price_range']=='3') { $price_min=4000000; $price_max=10000000;}
    elseif($_REQUEST['price_range']=='4') { $price_min=10000000; $price_max=999999999999999999999999999999999999999999999999999999999999;} else{
      $price_min=0;$price_max=999999999999999999999999999999999999999999999999999999999999;
    }

    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    foreach ($product_arr['data'] as $value)
    {     
      if( $value['product_price'] >= $price_min &&  $value['product_price'] <= $price_max )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }

    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with price

// filter result if id_user is received to determite if product is in user favorited list
  if( isset($_REQUEST['id_user'])){
    // create tmp_array
    $product_arr2 = array();
    $product_arr2['success'] = 'true';
    $product_arr2['total'] = 0;  
    $product_arr2['data'] = array();

    // get user favorited product list
    $sql="SELECT * FROM table_user_favorite WHERE id_user=".$_REQUEST['id_user']." ";
    $result=mysqli_query($db_connection,$sql);
    while($row=mysqli_fetch_array($result)){
      $id_product_favorited[]=$row['id_product'];
    }
    // end get user favorited product list

// check if each product is in favorited list
    foreach ($product_arr['data'] as $value)
    {     
      if( in_array($value['id_product'], $id_product_favorited) )
      {
        $value['is_favorited']="yes";
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;

      } else{
        $value['is_favorited']="no";
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }

    }
//end check if each product is in favorited list
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with id_user

//start paging result

  $limit=20;
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






