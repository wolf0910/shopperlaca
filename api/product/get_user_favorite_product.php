<?php


if(isset($_REQUEST['id_user']))
{
  if($_REQUEST['id_user']==''){
    unset($_REQUEST['id_user']);
  }
}

if(!isset($_REQUEST['id_user']))
{
   echo json_encode(
      array('success'   => 'false','message' => 'id_user missing !!!')
    );
    exit();
}


  $product_arr = array();

  // query
  $sql = "SELECT * FROM `table_product`,table_product_detail,table_user_favorite WHERE table_product.id_product=table_product_detail.id_product AND table_product_detail.is_avatar='yes' AND table_user_favorite.id_product=table_product.id_product AND table_user_favorite.id_user=".$_REQUEST['id_user']." ";
  
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

    // handle count comment
    
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
      if( preg_match('/'.stripUnicode($_REQUEST['product_name']).'/i',stripUnicode($value['product_name'])) )
      {
        array_push($product_arr2['data'],$value);
        $product_arr2['total']++;
      }
    }
    // assign new result
    $product_arr=$product_arr2;
  }
// end filter with product_name

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
          array('success' => 'true','message' => 'User doest have any favorited product yet !')
        );
  }

?>






