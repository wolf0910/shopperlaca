<?php 

  // Category read query
  $sql = "SELECT * FROM table_producer";
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
            'id_producer' => $row['id_producer'],
            'producer_name' => $row['producer_name']
          );
          // Push to "data"
          array_push($category_arr['data'], $category_item);
        }

        // Turn to JSON & output
        echo json_encode($category_arr);

  } else {
    // No Categories
    echo json_encode(
      array('success'   => 'false','message' => 'producer not found !')
    );
  }


?>