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
  $sql = "SELECT * FROM table_customer_search_history WHERE id_customer= '".$_REQUEST['id_customer']."' ";
  $result = $conn->query($sql);
  
  // Get row count
  $num = mysqli_num_rows($result);

  // Check if any categories
  if($num > 0) {
        // Cat array
        $category_arr = array();
        $category_arr['success'] = 'true';
        $category_arr['data'] = array();

        while($row = $result->fetch_assoc()) {
          
          $category_item = array(
            'id_customer_search_history' => $row['id_customer_search_history'],
            'id_customer' => $row['id_customer'],
            'search_txt' => $row['search_txt']
          );

          // Push to "data"
          array_push($category_arr['data'], $category_item);
        }

        // Turn to JSON & output
        echo json_encode($category_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success'   => 'false','message' => 'category not found ?')
        );
  }


?>