<?php 
if(isset($_REQUEST['id_product']))
{
  if($_REQUEST['id_product']==''){
    unset($_REQUEST['id_product']);
  }
}

if(isset($_REQUEST['id_user']))
{
  if($_REQUEST['id_user']==''){
    unset($_REQUEST['id_user']);
  }
}


if ( !isset($_REQUEST['id_product']) )
{
   echo json_encode(
          array('success' => 'false','message' => 'id_product  not found')
        );
   exit();
}

  $id_product=$_REQUEST['id_product'];

  // Category read query
   $sql = "SELECT * FROM `table_product`,table_product_detail WHERE table_product.id_product=table_product_detail.id_product AND table_product_detail.is_avatar='yes' AND table_product.id_product='".$id_product."' ";   
  $result = $conn->query($sql);
  // Get row count
  $num = mysqli_num_rows($result);
  // Check if have atleast 1 result
  if($num > 0) {
        // Cat array
        $product_arr = array();
        $product_arr['success'] = 'true';
        $product_arr['data'] = array();


  while($row = $result->fetch_assoc()) {

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
              $tmp = array("id_product_detail" => $row2['id_product_detail'],"photo" => $row2['photo_link']);
              $product_photo_item[$count] = $tmp;
              $count++;
              $count_image++;
            }
     }

    $product_item['count_image']=$count_image;     
    $product_item['product_photo']= $product_photo_item;
    // Push to "data"
    array_push($product_arr['data'], $product_item);
}


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




        // Turn to JSON & output
        echo json_encode($product_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success' => 'false','message' => 'Product doesnt exist ! check id_product ! ')
        );
  }

