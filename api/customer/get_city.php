<?php 

  // Category read query
   $sql = "SELECT * FROM table_city ";

   $result = $conn->query($sql);
  
  // Get row count
  $num = mysqli_num_rows($result);

  // Check if any categories
  if($num > 0) {
    // Cat array
    $city_arr = array();
    $city_arr['success'] = 'true';
    $city_arr['data'] = array();

    while($row = $result->fetch_assoc()) {
      
      $city_item = array(
        'id_city' => $row['id_city'],
        'city_name' => $row['city_name'],
        'map_location' => $row['map_location']
      );

      // Push to "data"
      array_push($city_arr['data'], $city_item);
    }

    // Turn to JSON & output
    echo json_encode($city_arr);

  } else {
        // No Categories
        echo json_encode(
          array('success' => 'true','message' => 'city  not found')
        );
  }


?>