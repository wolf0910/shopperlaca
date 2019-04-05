<?php 

  // Category read query
   $sql = "SELECT * FROM table_slider ";

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
            'id_slider' => $row['id_slider'],
            'content1' => $row['content1'],
            'content2' => $row['content2'],
            'photo_link' => $row['photo_link']
          );

          // Push to "data"
          array_push($category_arr['data'], $category_item);
        }

        // Turn to JSON & output
        echo json_encode($category_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success'   => 'true','message' => 'There is no slider here?')
        );
  }


?>