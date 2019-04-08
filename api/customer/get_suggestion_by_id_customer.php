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


  // Category read query
  $sql = "SELECT * FROM table_suggestion WHERE id_customer= '".$_REQUEST['id_customer']."' ";
  $result = $conn->query($sql);
  
  // Get row count
  $num = mysqli_num_rows($result);

  // Check if any categories
  if($num > 0) {
      // init product array
      $product_arr = array();
      $product_arr['success'] = 'true';
      $product_arr['data'] = array();

      while($row = $result->fetch_assoc()){

        // with each category - get 3 newest product of it
        $sql_tmp = " SELECT * FROM table_product,table_product_detail WHERE table_product.id_product=table_product_detail.id_product AND table_product_detail.is_avatar='yes' AND table_product.id_category = '".$row['id_category']."' ORDER BY table_product.id_product DESC limit 3  ";
        $result_tmp = mysqli_query($conn,$sql_tmp);
        while( $row3 = mysqli_fetch_array($result_tmp) ){
            // add to return result
            $product_item = array(
            'id_product' => $row3['id_product'],
            'id_category' => $row3['id_category'],
            'id_producer' => $row3['id_producer'],
            'product_name' => $row3['product_name'],
            'product_description' => changeLineBreak(stripCKeditor($row3['product_description'])),
            'product_price' => $row3['product_price'],
            'product_additional_information' => changeLineBreak(stripCKeditor($row3['product_additional_information'])),
            'date_created' => $row3['date_created'],
            'product_price_4compare1' => $row3['product_price_4compare1'],
            'product_price_4compare2' => $row3['product_price_4compare2'],
            'product_price_4compare3' => $row3['product_price_4compare3'],
            'customer_point' => $row3['customer_point'],
            'agent_point' => $row3['agent_point'],
            'avatar_link' => $row3['photo_link']
          );

          // Push to "data"
          array_push($product_arr['data'], $product_item);
        }
      }

      // Turn to JSON & output
      echo json_encode($product_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success'   => 'true','message' => 'Customer has no suggestion yet !')
        );
  }


?>